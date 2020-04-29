@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Dashboard</div>

                    <div class="card-body">
                        Select plan

                        <a href="{{route('subscribePlan', 10)}}" class="btn"> Plan 1</a>
                        <a href="{{route('subscribePlan', 20)}}" class="btn"> Plan 2</a>
                        <a href="{{route('subscribePlan', 30)}}" class="btn"> Plan 3</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection