<?php

namespace App\Http\Controllers;

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
}
