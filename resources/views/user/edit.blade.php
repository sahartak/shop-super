@extends('layouts.admin-dashboard',['title' => 'Edit '.$user->name])

@section('content')
    <div class="row">
        <div class="col-sm-6 offset-sm-2">

            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
                <br />
            @endif
            <form method="post" action="{{ route('user-update', $user->id) }}">
                @method('PATCH')
                @csrf
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" name="name" value="{{$user->name}}" />
                </div>


                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="text" class="form-control" name="email" value="{{ $user->email }}" />
                </div>
                <div class="form-group">
                    <label for="city">Status:</label>
                    <select name="status" class="custom-select">
                        @foreach(\App\Models\User::$statuses as $val => $status)
                            <option value="{{$val}}" @if($user->status == $val) selected @endif>{{$status}}</option>
                            @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <label for="city">Role:</label>
                    <select name="role" class="custom-select">
                        @foreach(\App\Models\User::$roles as $val => $role)
                            <option value="{{$val}}" @if($user->role == $val) selected @endif>{{$role}}</option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <label for="name">User Shop:</label>
                    <input type="text" class="form-control" name="shop_name" value="{{$shop->shop_name}}" />
                </div>
                <div class="form-group">
                    <label for="name">Shop custom domain:</label>
                    <input type="text" class="form-control" name="custom_domain" value="{{$shop->custom_domain}}" />
                </div>

                <div class="form-group">
                    <label for="custom_domain_confirmed">Custom domain status:</label>
                    <select name="custom_domain_confirmed" class="custom-select" id="custom_domain_confirmed">
                        @foreach(\App\Models\UserShop::$custom_domain_statuses as $val => $status)
                            <option value="{{$val}}" @if($shop->custom_domain_confirmed == $val) selected @endif>{{$status}}</option>
                        @endforeach
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>
    </div>
@endsection