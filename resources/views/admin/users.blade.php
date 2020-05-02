@extends('layouts.admin-dashboard',['title' => 'Users'])

@section('content')

    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Role</th>
            <th scope="col">User status</th>
            <th scope="col">Shop</th>
            <th scope="col">Plan</th>
            <th scope="col">Shop status</th>
            <th scope="col">Created at</th>
        </tr>
        </thead>
        <tbody>
        @foreach($users as $key => $user)
            <tr>
                <th scope="row">{{$key++}}</th>
                <td>{{$user->id}}</td>
                <td>{{$user->name}}</td>
                <td>{{$user->email}}</td>
                <td>{{$user->roleName()}}</td>
                <td>{{$user->statusName()}}</td>
                <td>{{$user->userShop->shop_name}}</td>
                <td>{{$user->userShop->plan}}</td>
                <td>{{$user->userShop->planStatus()}}</td>
                <td>{{$user->created_at}}</td>
            </tr>
        @endforeach


        </tbody>
    </table>
@endsection

