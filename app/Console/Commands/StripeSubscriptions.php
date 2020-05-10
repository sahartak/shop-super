<?php

namespace App\Console\Commands;

use App\Models\User;
use Illuminate\Console\Command;
use Stripe\Plan;
use Stripe\Product;
use Stripe\Stripe;

class StripeSubscriptions extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'stripe:subscriptions';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

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
        Stripe::setApiKey(env('STRIPE_SECRET'));
        $standardProduct = Product::create(['name' => User::STANDARD_PRODUCT]);
        $premiumProduct = Product::create(['name' => User::PREMIUM_PRODUCT]);
        Plan::create(User::SUBSCRIPTION_STANDARD + ['product' => $standardProduct->id]);
        Plan::create(User::SUBSCRIPTION_PREMIUM + ['product' => $premiumProduct->id]);

    }
}
