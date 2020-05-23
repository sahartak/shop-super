<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class User
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {

        if (!Auth::check()){
            return redirect()->route('login');
        }

        if (Auth::user()->status == 0) {
            Auth::logout();
            return redirect()->route('login')->with('error_login','Your account is deactivated');
        }

        if (!Auth::user()->userShop) {
            return $next($request);

        }

        return redirect()->route('user');

    }
}
