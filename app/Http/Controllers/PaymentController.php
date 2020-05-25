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
        /* @var User $user */


        try {
            $result = $user->createOrGetStripeCustomer() && $user->addPaymentMethod($payment_method);
            $user->has_payment = 1;
            $user->save();
            return response()->json(['status' => 1]);
        } catch (\Exception $ex) {
            return response()->json(['status' => 0, 'message' => $ex->getMessage()]);
        }


    }

    public function addPaymentMethod(Request $request)
    {

        if ($request->has('shopName')) {

            $shop = $request->get('shopName');

            $shop = UserShop::where('shop_name', $shop)->first();

            if ($shop && $user = $shop->user) {

                /* @var $user User */
                if (!empty($user->subscribed('default'))) {
                    if ($user->subscription('default')->incrementQuantity()) {
                        return response()->json([
                            'status' => 1,
                        ]);
                    }

                }
                foreach ($user->paymentMethods() as $paymentMethod) {
                    try {
                        $subscription = $user->newSubscription('default', User::STRIPE_PLAN_STANDARD)->create($paymentMethod->asStripePaymentMethod()->id);
                        if ($subscription) {
                            return response()->json([
                                'status' => 1,
                            ]);
                        }


                    } catch (\Exception $exception) {
                    }
                }


                return response()->json([
                    'status' => 0,
                    'url' => route('stripe-payment')
                ]);

            }

        }
    }

    public function decrementSubscription(Request $request)
    {
        if ($request->has('shopName')) {

            $shop = $request->get('shopName');

            $shop = UserShop::where('shop_name', $shop)->first();

            if ($shop && $user = $shop->user) {

                /* @var $user User */
                try {
                    /*if ($user->boards_created == 2) {
                        $user->subscription('default')->cancel();
                    }else {
                        $user->subscription('default')->decrementQuantity();
                    }*/
                    $user->subscription('default')->decrementQuantity();

                    return response()->json([
                        'status' => 1
                    ]);

                } catch (\Exception $ex) {
                    return response()->json([
                        'status' => 0,
                        'message' => $ex->getMessage()
                    ]);
                }

            }

        }

        return response()->json([
            'status' => 0,
            'message' => 'cccc'
        ]);

    }
}
