<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Encryption\Encrypter;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Str;

class UserShop extends Model
{
    const PLAN_ACTIVE = 1;
    const PLAN_INACTIVE = 0;
    const PLAN_PANDING = 2;

    public static $planStatuses =
        [
            self::PLAN_INACTIVE => 'Inactive',
            self::PLAN_ACTIVE => 'Active',
            self::PLAN_PANDING => 'Pending'
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


    protected function createDatabase($dbName, $dbPassword)
    {
        $shopDb = DB::statement("CREATE DATABASE `{$dbName}` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci");
        if ($shopDb) {
            $currentDb = env('DB_DATABASE');
            DB::statement("CREATE USER '{$dbName}'@'localhost' IDENTIFIED BY '{$dbPassword}' ");
            DB::statement("GRANT ALL PRIVILEGES ON {$dbName} . * TO '{$dbName}'@'localhost'");
            DB::statement("GRANT SELECT ON {$currentDb} . * TO '{$dbName}'@'localhost'");
            $mysqlDumpPath = base_path().'/database/shoptop.sql';
            exec("mysql -u {$dbName} --password={$dbPassword} {$dbName} < {$mysqlDumpPath}");
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

    public function makeSetup()
    {
        $dbName = 'shop_'.$this->id.'_'.time();
        $dbPassword = Str::random(11);

        if(!$this->createDatabase($dbName, $dbPassword)) {
            throw new \Exception('Db Error');
        }

        $http = Request::secure() ? 'https//' : 'http://';

        $key = 'base64:'.base64_encode(
            Encrypter::generateKey(app()['config']['app.cipher'])
        );

        $replacementsData = [
            'SHOP_DOMAIN' => $this->shop_name,
            'APP_URL' => $http.$this->shop_name.'.'.env('SHOP_DOMAIN'),
            'DB_DATABASE' => $dbName,
            'DB_USERNAME' => $dbName,
            'DB_PASSWORD' => $dbPassword,
            'APP_KEY' => $key
        ];

        return $this->writeEnvFile($replacementsData);
    }
}
