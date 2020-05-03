<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\UserShop;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        /* @var User $user*/
        $shop = $user->userShop;
        /* @var UserShop $shop*/
        if ($shop->plan && $shop->is_active) {
            if(!$shop->has_setup) {
                $shop->makeSetup();
                $shop->has_setup = 1;
                $shop->save();
            }
            return redirect('http://'.$shop->shop_name.'.'.env('SHOP_DOMAIN').'/dashboard');
        }
        return redirect()->route('home');

    }
}
