@extends('layouts.admin-dashboard',['title' => 'Users'])

@section('content')

    <div class="col-sm-12">

        @if(session()->get('success'))
            <div class="alert alert-success">
                {{ session()->get('success') }}
            </div>
        @endif
    </div>

    <table class="table data_table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
           {{-- <th scope="col">Email</th>--}}
            <th scope="col">Role</th>
            <th scope="col">User status</th>
            <th scope="col">Shop</th>
            <th scope="col">Plan</th>
            <th scope="col">Shop status</th>
            <th scope="col">Created at</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        @foreach($users as $key => $user)
            <tr>
                <th scope="row">{{$key++}}</th>
                <td>{{$user->id}}</td>
                <td>{{$user->name}}</td>
              {{--  <td>{{$user->email}}</td>--}}
                <td>{{$user->roleName()}}</td>
                <td>{{$user->statusName()}}</td>
                <td>{{$user->userShop->shop_name ?? ''}}</td>
                <td>{{$user->userShop->plan ?? ''}}</td>
                <td>{{$user->userShop ? $user->userShop->planStatus() : ''}}</td>
                <td>{{$user->created_at}}</td>
                <td>
                    <a href="{{ route('user-edit', $user->id) }}" class="btn btn-primary">edit</a>
                    <a href="{{ route('user-delete', $user->id) }}" class="btn btn-danger">delete</a>
                </td>
            </tr>
        @endforeach


        </tbody>
    </table>
@endsection

