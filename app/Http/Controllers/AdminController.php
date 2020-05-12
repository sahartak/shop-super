<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return redirect()->route('show-users');
    }

    public function users()
    {
        $users = User::where('role', 0)
            ->with('userShop')
            ->get()
            ->all();


        return view('admin.users', compact('users'));
    }
}
