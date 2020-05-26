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
            <th scope="col">Has payment</th>
            <th scope="col">Boards</th>
            <th scope="col">Created at</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        @foreach($users as $key => $user)
            <tr>
                <th scope="row">{{$loop->iteration}}</th>
                <td>{{$user->id}}</td>
                <td>{{$user->name}}</td>
              {{--  <td>{{$user->email}}</td>--}}
                <td>{{$user->roleName()}}</td>
                <td>{{$user->statusName()}}</td>
                <td>{{$user->userShop->shop_name ?? ''}}</td>
                <td>{{$user->has_payment ? 'Yes' : 'No'}}</td>
                <td>{{$user->boards_created}}</td>
                <td>{{$user->created_at}}</td>
                <td>
                    <a href="{{ route('user-view', $user->id) }}" class="btn btn-success">view</a>
                    <a href="{{ route('user-edit', $user->id) }}" class="btn btn-primary">edit</a>
                    <a href="{{ route('user-delete', $user->id) }}" class="btn btn-danger"
                       data-target="#confirm-delete" onclick="return confirm('Are you sure you want remove {{$user->name}}')">delete</a>
                </td>
            </tr>
        @endforeach


        </tbody>
    </table>
@endsection

