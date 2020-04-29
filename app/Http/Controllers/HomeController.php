<?php

namespace App\Http\Controllers;

use App\Models\UserShop;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('user.dashboard');
    }

    public function saveShopName(Request $request)
    {
        $shopName = $request->get('shop_name');
        $shopName = str_replace('.'.str_replace('http://', '',env("APP_URL")),'',$shopName);

        if ($shopName) {

            if (UserShop::where('shop_name', $shopName)->first()){
                return Redirect::to('home')->with('errorMessage', 'Shop name already exists!');
            }
            $user = Auth::user();
            $userShop = UserShop::create([
                'user_id' => $user->id,
                'shop_name' => $shopName,
                'is_active' => 0,
                'plan' => 0
            ]);

            if ($userShop) {
                return redirect()->route('showPlans');
            }
        }

        return back()->withInput();
    }

    public  function plans()
    {
        return view('user.plans');
    }

    public function subscribePlan($plan)
    {
        if ($plan) {
            $user = Auth::user();
            $shop = $user->userShops()->orderBy('created_at','desc')->first();
            $shop->plan = $plan;
            $shop->save();
            return view('user.pay', compact('shop'));
        }

        return back();
    }

    public function payPlan($shop)
    {

        if ($shop) {
            $shop = UserShop::find($shop);
            if ($shop) {
                $shop->is_active = 1;
                $shop->save();
                return redirect()->route('home');
            }
        }

        return back();
    }
}
