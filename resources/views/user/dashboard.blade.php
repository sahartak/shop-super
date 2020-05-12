@extends('layouts.app')
@section('parentJs')
    @parent
@stop
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Put your shop subdomain</div>

                    <p class="card-body">
                    @if (session('errorMessage'))
                        <div class="alert alert-success">
                            {{ session('errorMessage') }}
                        </div>
                    @endif

                    @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                    <form method="post" action="/shop-name" class="text-center">
                        @csrf
                        <p>
                            https://
                            <input type="text" name="shop_name" style="width: 250px" required> .{{env('SHOP_DOMAIN')}}
                        </p>
                        <p>
                            <br/>
                            <button type="submit" class="btn btn-primary">Create shop</button>
                </div>

                </form>
            </div>
        </div>
    </div>
    </div>
    </div>
@endsection