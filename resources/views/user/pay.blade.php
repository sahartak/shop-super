@extends('layouts.app',['title' => 'Pay'])

@section('content')
    <div class="container">
        <div class="row justify-content-center">

            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                    <div class="card-header">Dashboard</div>
                    <div class="jumbotron text-center blue-grey lighten-5">

                        <h2 class="card-title h2">Pay</h2>

                        <p class="indigo-text my-4 font-weight-bold">Selected Plan</p>

                        <div class="row d-flex justify-content-center">

                            <div class="col-xl-7 pb-2">

                                <p class="card-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                    Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
                                    when an unknown printer took a galley of type and scrambled it to make a </p>
                            </div>
                        </div>

                        <hr class="my-4 pb-2">

                        <a href="{{route('payPlan', $shop)}}" class="btn btn-primary btn-rounded">Pay<i class="far fa-gem ml-1"></i></a>

                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection