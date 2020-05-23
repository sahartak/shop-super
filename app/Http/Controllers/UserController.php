<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\UserShop;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Stripe\Customer;


class UserController extends Controller
{
    public function index()
    {
        $user = Auth::user();

        /* @var User $user*/
        $shop = $user->userShop;
        /* @var UserShop $shop*/
        if ($shop->is_active) {

            if(!$shop->has_setup) {

                $shop->makeSetup();
                $shop->has_setup = 1;
                $shop->save();
            }
            return redirect('http://'.$shop->shop_name.'.'.env('SHOP_DOMAIN').'/dashboard');
        }
        return redirect()->route('home');

    }

    public function edit($id)
    {
        $user = User::findOrFail($id);
        /* @var User $user*/
        $shop = $user->userShop;

        return view('user.edit', compact(['user', 'shop']));

    }

    public function view($id)
    {
        $user = User::findOrFail($id);
        /* @var User $user*/
        $shop = $user->userShop;
        $subscription = $user->subscription('default');

        return view('user.view', compact(['user', 'shop','subscription']));

    }


    public function update(Request $request, $id)
    {
        $request->validate([
            'name'=>'required',
            'email'=>'required|email',
            'shop_name'=>'required',
        ]);

        $user = User::find($id);
        $user->name =  $request->get('name');
        $user->email =  $request->get('email');
        $user->status =  $request->get('status');
        $user->role =  $request->get('role');
        $user->save();

        $userShop = $user->userShop;
        if ($userShop) {
            $userShop->shop_name = $request->get('shop_name');
            $userShop->plan = $request->get('plan');
            $userShop->is_active = $request->get('is_active');
            $userShop->save();
        }

        return redirect()->route('show-users')->with('success', 'User updated!');
    }

    public function destroy($id)
    {
        $user = User::find($id);
        $userShop = UserShop::where('user_id',$id)->first();
        if($userShop) {
            $userShop->delete();
        }
        $user->delete();

        return redirect()->route('show-users')->with('success', 'User deleted!');
    }
}
