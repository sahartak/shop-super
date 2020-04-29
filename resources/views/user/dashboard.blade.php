@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Dashboard</div>

                    <div class="card-body">
                        @if (session('errorMessage'))
                            <div class="alert alert-success">
                                {{ session('errorMessage') }}
                            </div>
                        @endif
                       <form method="post" action="/shop-name">
                           @csrf
                           <input type="text" name="shop_name">
                           <input type="submit">

                       </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection