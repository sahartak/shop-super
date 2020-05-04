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
                            <option value="{{$val}}" @if($user->status == $val) selected @endif>{{$role}}</option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <label for="name">User Shop:</label>
                    <input type="text" class="form-control" name="shop_name" value="{{$shop->shop_name}}" />
                </div>

                <div class="form-group">
                    <label for="city">Plan:</label>
                    <select name="plan" class="custom-select">
                        @foreach(\App\Models\UserShop::$plans as $val => $plan)
                            <option value="{{$val}}" @if($shop->plan == $val) selected @endif>{{$plan}}</option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <label for="city">Plan status:</label>
                    <select name="is_active" class="custom-select">
                        @foreach(\App\Models\UserShop::$planStatuses as $val => $status)
                            <option value="{{$val}}" @if($shop->is_ictive == $val) selected @endif>{{$status}}</option>
                        @endforeach
                    </select>
                </div>



                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>
    </div>
@endsection