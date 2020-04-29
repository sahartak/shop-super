<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::post('/shop-name', 'HomeController@saveShopName');
Route::get('/plans', 'HomeController@plans')->name('showPlans');
Route::get('/subscribe-plan/{plan}', 'HomeController@subscribePlan')->name('subscribePlan');
Route::get('/pay-plan/{shop}', 'HomeController@payPlan')->name('payPlan');
