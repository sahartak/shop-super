<?php

namespace App\Console\Commands;

use App\Models\User;
use App\Models\UserShop;
use Illuminate\Console\Command;

class CustomDomainCheck extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'customDomain:check';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Check if Custom domain is pointed to our server';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $shops = UserShop::notConfirmedDomainsShops();
        $envFilePath = dirname(base_path());
        foreach ($shops as $shop) {
            /* @var $shop UserShop*/
            $newDomain = $shop->custom_domain;
            $hostIp = gethostbyname($newDomain);
            if ($hostIp == UserShop::SERVER_IP) {
                $shop->custom_domain_confirmed = UserShop::CUSTOM_DOMAIN_CONFIRMED;
                $shop->save();
                $shopPath = $envFilePath . '/' . env('SHOP_FOLDER');
                file_put_contents($shopPath . "/domain-mapping/{$newDomain}.txt", $shop->shop_name);
                $envFile = '.env-' . $shop->shop_name;
                $path = $shopPath . "/env-files/{$envFile}";
                if (file_exists($path)) {
                    //$appUrl = $shop->shop_name.'.'.env('SHOP_DOMAIN');
                    $appUrl = $shop->matchAppUrlEnv(file_get_contents($path));
                    file_put_contents($path, str_replace(
                        $appUrl, 'http://'.$newDomain, file_get_contents($path)
                    ));
                }
            } else {
                $file = fopen("custom-domains-errors.txt", "a");
                $text = "Custom domain $newDomain for $shop->shop_name is not matching in our server";
                fputs($file, "$text\n");
                fclose($file);

            }
        }
    }
}
