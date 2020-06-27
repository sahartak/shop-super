<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\UserShop;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Stripe\Charge;
use Stripe\Customer;
use Stripe\Stripe;
use Stripe\StripeClient;


class UserController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        /* @var User $user*/
        $shop = $user->userShop;
        /* @var UserShop $shop*/
        if ($shop && $shop->is_active) {

            if(!$shop->has_setup) {

                $shop->makeSetup();
                $shop->has_setup = 1;
                $shop->save();
            }

            return redirect($shop->shopDashboard());

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

        $invoices = [];
        $charges = [];
        $errorMessage = [];
        if ($user->stripeId()) {
            $stripe = new \Stripe\StripeClient(
                env('STRIPE_SECRET')
            );
            try {
                $invoices = $stripe->invoices->all(['customer' => $user->stripeId()]);
                if ($invoices->data) {
                    $invoices = $invoices->data;
                }
            } catch (\Exeption $ex) {
               $errorMessage[] = $ex->getMessage();
            }
            try {
                $charges = $stripe->charges->all(['customer' => $user->stripeId()]);
                if ($charges->data) {
                    $charges = $charges->data;
                }
            } catch (\Exeption $ex) {
                $errorMessage[] = $ex->getMessage();
            }
        }


        $shop = $user->userShop;
        $subscription = $user->subscription('default');
        $subscriptionQuantity = $subscription ?  $subscription->quantity : 0;

        return view('user.view', compact(['user', 'shop','subscriptionQuantity',
            'errorMessage','invoices','charges']));

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
            /* @var $userShop UserShop*/
            $newDomain = UserShop::filterDomainName($request->get('custom_domain'));

            if($newDomain && !UserShop::is_valid_domain_name($newDomain)){
                return redirect()->back()->withErrors('Domain is not valid');
            }
            if(UserShop::checkDomainExistance($newDomain,$userShop->id)){
                return redirect()->back()->withErrors('Domain already exists');
            }
            if($newDomain && !UserShop::checkDomainIp($newDomain)){
                return redirect()->back()->withErrors('Your domain is not pointing to our server ip address');
            }

            $userShop->domainMappingFiles($newDomain);
            $userShop->shop_name = $request->get('shop_name');
            $userShop->custom_domain = $newDomain;
            $userShop->custom_domain_confirmed = $request->get('custom_domain_confirmed');
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
