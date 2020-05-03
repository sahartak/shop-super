@extends('layouts.app')

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
                       <form method="post" action="/shop-name" class="text-center">
                           @csrf
                           <p>
                               https://
                               <input type="text" name="shop_name" style="width: 250px" required> .{{env('SHOP_DOMAIN')}}
                           </p>
                           <p>
                               <br/>
                               <button type="submit">Create shop</button>
                           </div>

                       </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection