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
Route::get('/ru', function () {
    return view('welcome-ru');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home')->middleware('user');
Route::post('/shop-name', 'HomeController@saveShopName');
/*Route::get('/plans', 'HomeController@plans')->name('showPlans');
Route::get('/subscribe-plan/{plan}', 'HomeController@subscribePlan')->name('subscribePlan');
Route::get('/pay-plan/{shop}', 'HomeController@payPlan')->name('payPlan');*/
Route::get('/admin','AdminController@index')->name('admin')->middleware('admin');
Route::get('/users', 'AdminController@users')->name('show-users')->middleware('admin');
Route::get('/user', 'UserController@index')->name('user');
/*Route::get('/cancel-plan/{shop}', 'HomeController@cancelPlan')->name('cancelPlan');*/
Route::get('/user/edit/{id}', 'UserController@edit')->name('user-edit');
Route::get('/user/view/{id}', 'UserController@view')->name('user-view');
Route::get('/user/delete/{id}', 'UserController@destroy')->name('user-delete');
Route::patch('/user/update/{id}', 'UserController@update')->name('user-update');
Route::get('/stripe-payment', 'PaymentController@pay')->name('stripe-payment')->middleware('auth');
Route::post('/make-payment', 'PaymentController@makePayment')->name('make-payment');
Route::any('/add-payment-method', 'PaymentController@addPaymentMethod')->name('add-payment');
Route::any('/decrement-subscription', 'PaymentController@decrementSubscription')->name('decrement-subscription');
Route::post('/refund', 'PaymentController@refund')->name('payment-refund');

