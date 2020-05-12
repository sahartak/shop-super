<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\UserShop;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PaymentController extends Controller
{
    public function pay()
    {
        $user = Auth::user();
        return view('user.stripe-payment', [
            'intent' => $user->createSetupIntent()
        ]);
    }

    public function makePayment(Request $request)
    {
        $payment_method = $request->has('payment_method') ? $request->get('payment_method') : null;
        $user = Auth::user();
        /* @var User $user*/
        $stripePlan = UserShop::$planSubscriptions[$user->userShop->plan];

        try {
            $result = $user->createOrGetStripeCustomer() && $user->addPaymentMethod($payment_method) && $user->newSubscription('default', $stripePlan)->create($payment_method);
            $userShop = $user->userShop;
            $userShop->is_active = 1;
            $userShop->save();
            return response()->json(['status' => 1]);
        } catch (\Exception $ex) {
            return response()->json(['status' => 0, 'message' => $ex->getMessage()]);
        }




    }
}
