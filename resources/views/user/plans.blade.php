@extends('layouts.user-dashboard',['title' => 'Plans'])
<?php
use Illuminate\Support\Facades\Auth;
?>
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">

                <div class="card">
                    <h5 class="card-header">Select plan</h5>
                    <div class="card-body">

                        <a class="btn btn-primary" href="{{route('subscribePlan', 10)}}" role="button">
                            @if(Auth::user()->userShop->plan == 10)
                                Selected plan
                            @else
                                Plan 1
                            @endif
                        </a>
                        <a class="btn btn-primary" href="{{route('subscribePlan', 20)}}" role="button">
                            @if(Auth::user()->userShop->plan == 20)
                                Selected plan
                            @else
                                Plan 2
                            @endif

                        </a>
                        <a class="btn btn-primary" href="{{route('subscribePlan', 30)}}" role="button">
                            @if(Auth::user()->userShop->plan == 10)
                                Selected plan
                            @else
                                Plan 3
                            @endif
                        </a>

                    </div>
                </div>

            </div>
        </div>
    </div>
@endsection