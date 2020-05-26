@extends('layouts.admin-dashboard',['title' => 'View '.$user->name])

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">{{$user->name}} info</h3>

                </div>
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Reason</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Name</td>
                            <td>{{$user->name}}</td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>{{ $user->email }}</td>
                        </tr>
                        <tr>
                            <td>Status</td>
                            <td>{{\App\Models\User::$statuses[$user->status]}}</td>
                        </tr>
                        <tr>
                            <td>Role</td>
                            <td>{{\App\Models\User::$roles[$user->role]}}</td>
                        </tr>
                        <tr>
                            <td>Shop</td>
                            <td>{{$shop->shop_name}}</td>
                        </tr>
                        <tr>
                            <td>Boards</td>
                            <td>{{$user->boards_created}}</td>
                        </tr>
                        <tr>
                            <td>Subscription quantity</td>
                            <td>{{$subscriptionQuantity}}</td>
                        </tr>

                        <tr>
                            <td>Stripe customer</td>
                            <td><a href="{{\App\Models\User::STRIPE_CUSTOMER_DASHBOARD.'/'.$user->stripeId()}}" target="_blank">{{$user->stripeId()}} </a></td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
    </div>
@endsection