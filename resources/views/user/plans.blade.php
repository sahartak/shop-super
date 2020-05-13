<?php
/* @var $activePlan*/
/* @var $shop \App\Models\UserShop*/
?>
@extends('layouts.app',['title' => 'Plans'])
@section('parentJs')
    @parent
@stop
<?php
use Illuminate\Support\Facades\Auth;
?>
@section('content')
    <div class="container">
        <div class="row justify-content-center">

            <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
                <h1 class="display-4">Pricing</h1>
                <p class="lead">Quickly build an effective pricing table for your potential customers with this Bootstrap example. It's built with default Bootstrap components and utilities with little customization.</p>
            </div>

            <div class="container">
                <div class="card-deck mb-3 text-center">
                    <div class="card mb-4 box-shadow">
                        <div class="card-header">
                            <h4 class="my-0 font-weight-normal">Plan 1</h4>
                        </div>
                        <div class="card-body">
                            <h1 class="card-title pricing-card-title">$0 <small class="text-muted">/ mo</small></h1>
                            <ul class="list-unstyled mt-3 mb-4">
                                <li>1 shelf in your store</li>
                            </ul>
                            @if($activePlan && $activePlan == \App\Models\UserShop::SHOP_PLAN_FREE)
                                <a href="{{route('cancelPlan', $shop)}}" class="btn btn-lg btn-block btn-outline-primary">Cancel</a>
                            @elseif(!$activePlan)
                                <a href="{{route('subscribePlan', \App\Models\UserShop::SHOP_PLAN_FREE)}}" class="btn btn-lg btn-block btn-outline-primary">Subscribe</a>
                            @endif
                        </div>
                    </div>
                    <div class="card mb-4 box-shadow">
                        <div class="card-header">
                            <h4 class="my-0 font-weight-normal">Plan 2</h4>
                        </div>
                        <div class="card-body">
                            <h1 class="card-title pricing-card-title">$50 <small class="text-muted">/ mo</small></h1>
                            <ul class="list-unstyled mt-3 mb-4">
                                <li> Up to 10 shelves in your store </li>

                            </ul>
                            @if($activePlan && $activePlan == \App\Models\UserShop::SHOP_PLAN_BUSINESS)
                                <a href="{{route('cancelPlan', $shop)}}" class="btn btn-lg btn-block btn-outline-primary">Cancel</a>
                            @elseif(!$activePlan)
                                <a href="{{route('subscribePlan', \App\Models\UserShop::SHOP_PLAN_BUSINESS)}}" class="btn btn-lg btn-block btn-outline-primary">Subscribe</a>
                            @endif
                        </div>
                    </div>
                    <div class="card mb-4 box-shadow">
                        <div class="card-header">
                            <h4 class="my-0 font-weight-normal">Plan 3</h4>
                        </div>
                        <div class="card-body">
                            <h1 class="card-title pricing-card-title">$100 <small class="text-muted">/ mo</small></h1>
                            <ul class="list-unstyled mt-3 mb-4">
                                <li>More than 10 shelves in your store </li>
                            </ul>
                            @if($activePlan && $activePlan == \App\Models\UserShop::SHOP_PLAN_PREMIUM)
                                <a href="{{route('cancelPlan', $shop)}}" class="btn btn-lg btn-block btn-outline-primary">Cancel</a>
                            @elseif(!$activePlan)
                                <a href="{{route('subscribePlan', \App\Models\UserShop::SHOP_PLAN_PREMIUM)}}" class="btn btn-lg btn-block btn-outline-primary">Subscribe</a>
                            @endif                        </div>
                    </div>
                </div>


        </div>
    </div>
@endsection