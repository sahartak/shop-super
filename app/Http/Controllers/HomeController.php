<?php

namespace App\Http\Controllers;

use App\Mail\NewUser;
use App\Models\UserShop;
use App\Rules\Hostname;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
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
        $request->validate([
            'shop_name' => ['required', 'string','min:5', new Hostname],
        ]);

        $shopName = $request->get('shop_name');
        $shopName = str_replace('.'.str_replace('http://', '',env("APP_URL")),'',$shopName);

        $user = Auth::user();
        if ($shopName) {

            if (UserShop::where('shop_name', $shopName)->first()){
                return Redirect::to('home')->with('errorMessage', 'Shop name already exists!');
            }
            if (UserShop::where([['user_id','=',$user->id], ['is_active','=',1]])->first()){
                return Redirect::to('home')->with('errorMessage', 'Sorry, you already have a shop!');
            }

            $userShop = UserShop::create([
                'user_id' => $user->id,
                'shop_name' => $shopName,
                'is_active' => 0,
                'plan' => 0
            ]);

            if ($userShop) {
                Mail::to($user->email)->send(new NewUser($userShop));
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
            $shop = $user->userShop;
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
                return redirect()->route('user');
            }
        }

        return back();
    }

    public function cancelPlan($shop)
    {
        if ($shop) {
            $shop = UserShop::find($shop);
            if ($shop) {
                $shop->plan = 0;
                $shop->is_active = 0;
                $shop->save();
                return redirect()->route('showPlans');
            }
        }

        return back();
    }
}
