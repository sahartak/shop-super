@extends('layouts.user-dashboard',['title'=>'Pay'])

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Dashboard</div>

                    <div class="card-body">
                        Pay

                        <a href="{{route('payPlan', $shop)}}" class="btn"> Pay</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection