<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Encryption\Encrypter;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Str;
use Laravel\Cashier\Billable;

class UserShop extends Model
{

    const PLAN_ACTIVE = 1;
    const PLAN_INACTIVE = 0;
    const PLAN_PENDING = 2;

    const CUSTOM_DOMAIN_NOT_CONFIRMED = 0;
    const CUSTOM_DOMAIN_CONFIRMED = 1;

    public static $custom_domain_statuses = [
        self::CUSTOM_DOMAIN_NOT_CONFIRMED => 'Not active',
        self::CUSTOM_DOMAIN_CONFIRMED => 'Active',

        ];

    public static $planStatuses =
        [
            self::PLAN_INACTIVE => 'Inactive',
            self::PLAN_ACTIVE => 'Active',
            self::PLAN_PENDING => 'Pending'
        ];


    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function planStatus()
    {
        return self::$planStatuses[$this->is_active];
    }

    const SERVER_IP = '172.105.88.59';
    const SERVER_IP_LOCAL = '127.0.0.1';

    public static $domains =
        [
            self::SERVER_IP => 'byllett.com',
            self::SERVER_IP_LOCAL => 'shop-super.loc',
        ];


    protected function createDatabase($dbName, $dbPassword)
    {
        $shopDb = DB::statement("CREATE DATABASE `{$dbName}` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci");
        if ($shopDb) {
            //DB::statement("CREATE USER '{$dbName}'@'localhost' IDENTIFIED BY '{$dbPassword}' ");
            //DB::statement("GRANT ALL PRIVILEGES ON {$dbName} . * TO '{$dbName}'@'localhost'");
           // DB::statement("GRANT SELECT ON {$currentDb} . * TO '{$dbName}'@'localhost'");
            $mysqlDumpPath = base_path().'/database/shoptop.sql';
            $dbUSer = env('DB_USERNAME');
            echo exec("mysql -u {$dbUSer} --password={$dbPassword} {$dbName} < {$mysqlDumpPath}");
            return true;
        }
        return false;
    }

    protected function writeEnvFile($replacementsData)
    {
        $envFilePath = dirname(base_path());

        $envExample = file_get_contents($envFilePath.'/'.env('SHOP_FOLDER').'/.env');
        $replacements = [];
        foreach ($replacementsData as $key => $value) {
            $replacements[$key.'='] = $key.'='.$value;
        }
        $envData = str_replace(array_keys($replacements), array_values($replacements), $envExample);
        $envFile = $envFilePath.'/'.env('SHOP_FOLDER').'/env-files/.env-'.$this->shop_name;

        return file_put_contents($envFile, $envData);
    }

    public function createDomainMappigFile($newDomain)
    {
        $envFilePath = dirname(base_path());
        $mappingFile = $envFilePath.'/'.env('SHOP_FOLDER').'/domain-mapping/'.$newDomain.'.txt';
        if (file_put_contents($mappingFile, $this->shop_name)){
            return true;
        }
        return false;
    }

    public function deleteDomainMappigFile()
    {
        $envFilePath = dirname(base_path());
        $mappingFile = $envFilePath.'/'.env('SHOP_FOLDER').'/domain-mapping/'.$this->custom_domain.'.txt';
        if (file_exists($mappingFile)) {
            unlink($mappingFile);
            return true;
        }
        return false;
    }

    public function domainMappingFiles($newDomain) {

        if ($newDomain && $newDomain != $this->custom_domain) {
            $this->deleteDomainMappigFile();
            $this->createDomainMappigFile($newDomain);
        } elseif ($newDomain != $this->custom_domain && $this->custom_domain) {
            $this->deleteDomainMappigFile();
        }

        return false;

    }

    public function makeSetup()
    {
        $dbName = 'shop_'.$this->id.'_'.time();
        $dbPassword = env('DB_PASSWORD');

        if(!$this->createDatabase($dbName, $dbPassword)) {

            throw new \Exception('Db Error');
        }

        $http = Request::secure() ? 'https://' : 'http://';

        $key = 'base64:'.base64_encode(
            Encrypter::generateKey(app()['config']['app.cipher'])
        );

        $replacementsData = [
            'SHOP_DOMAIN' => $this->shop_name,
            'APP_URL' => $http.$this->shop_name.'.'.env('SHOP_DOMAIN'),
            'DB_DATABASE' => $dbName,
            'DB_USERNAME' => env('DB_USERNAME'),
            'DB_PASSWORD' => $dbPassword,
            'APP_KEY' => $key
        ];

        return $this->writeEnvFile($replacementsData);
    }


    public function shopDashboard()
    {
        if ($this->custom_domain) {
            return 'http://'.$this->custom_domain.'/dashboard';
        }
        return 'http://'.$this->shop_name.'.'.env('SHOP_DOMAIN').'/dashboard';
    }

    public static function is_valid_domain_name($domain_name)
    {
        return (preg_match("/^([a-z\d](-*[a-z\d])*)(\.([a-z\d](-*[a-z\d])*))*$/i", $domain_name) //valid chars check
            && preg_match("/^.{1,253}$/", $domain_name) //overall length check
            && preg_match("/^[^\.]{1,63}(\.[^\.]{1,63})*$/", $domain_name)//length of each label
            &&  (strpos($domain_name, '.') && $domain_name[strlen($domain_name)-1] !=='.' && $domain_name[0] !=='.')
        );
    }
    public static function checkDomainExistance($domain, $shop_id)
    {
        return UserShop::where([['custom_domain', '=', $domain], ['id', '<>', $shop_id]])->first();
    }

    public static function checkDomainIp($domain)
    {
        $hostIp = gethostbyname($domain);

        if ($hostIp == $_SERVER['SERVER_ADDR']) {
            return true;
        }
        return false;
    }

    public static function filterDomainName($domain)
    {
        return trim(str_replace(['http://','https://','www.'], '', $domain));
    }

    /**
     * @return array
     */
    public static function notConfirmedDomainsShops()
    {
        return UserShop::query()
            ->whereNotNull('custom_domain')
            ->where('custom_domain_confirmed', UserShop::CUSTOM_DOMAIN_NOT_CONFIRMED)
            ->get()
            ->all();
    }

    public function matchAppUrlEnv($content)
    {
        preg_match('/APP_URL=(.*?)\r\nSHOP_DOMAIN/s', $content, $match);
        return $match[1];

    }

    /**
     * Deletes mapping file
     * @return bool
     */
    public function deleteMappingFile()
    {
        $shopTopFolder = self::getShopTopPath();
        if (file_exists($shopTopFolder."/domain-mapping/{$this->custom_domain}.txt")) {
            unlink($shopTopFolder."/domain-mapping/{$this->custom_domain}.txt");
        }
        $this->custom_domain = '';
        $this->custom_domain_confirmed = UserShop::CUSTOM_DOMAIN_NOT_CONFIRMED;
        $this->save();

        return true;
    }

    public static function getShopTopPath()
    {
        $envFilePath = dirname(base_path());
        return $envFilePath . '/' . env('SHOP_FOLDER');
    }

}
