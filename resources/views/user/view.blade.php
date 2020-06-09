@extends('layouts.admin-dashboard',['title' => 'View '.$user->name])

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">{{$user->name}} info</h3>
                    <div class="edit-button">
                        <a href="{{ route('user-edit', $user->id) }}" class="btn btn-primary">Edit</a>
                    </div>
                </div>

                <!-- /.card-header -->
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap">
                        <thead>
                        <tr>
                            <th>Field</th>
                            <th>Info</th>
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
                            <td>Custom domain</td>
                            <td>
                                {{$shop->custom_domain}}
                               {{-- <a href="{{$shop->custom_domain}}" target="_blank">{{$shop->custom_domain}}</a>--}}
                            </td>
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
                            <td>
                                <a href="{{\App\Models\User::STRIPE_CUSTOMER_DASHBOARD.'/'.$user->stripeId()}}"
                                   target="_blank">{{$user->stripeId()}}
                                </a>

                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
    </div>
    @if(!empty($errorMessage))
        @foreach($errorMessage as $message)
            <div class="alert alert-danger" role="alert">
                {{$message}}
            </div>
        @endforeach

    @endif
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Invoices</h3>
                </div>

                @if(!empty($invoices))
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover text-nowrap">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Number</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th>Date</th>
                                <th>PDF</th>
                                <th>Invoice URL</th>
                                <th>Refund</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($invoices as $invoice)
                                <tr>
                                    <td>

                                        <a href="{{\App\Models\User::STRIPE_INVOICE_URL.'/'.$invoice->id}}"
                                           target="_blank">
                                            {{$invoice->id}}
                                        </a>
                                    </td>
                                    <td>{{$invoice->number}}</td>
                                    <td>{{$invoice->total/100}}</td>
                                    <td>{{$invoice->status}}</td>
                                    <td>{{date('Y-m-d H:i',$invoice->created)}}</td>
                                    <td><a href="{{$invoice->invoice_pdf}}">PDF</a></td>
                                    <td><a href="{{$invoice->hosted_invoice_url}}">Invoice URL</a></td>
                                    <td>
                                        <form method="post" action="{{route('payment-refund')}}">
                                            @csrf
                                            <input type="number" name="amount" max="{{$invoice->total/100}}">
                                            <input type="hidden" name="payment_intent"
                                                   value="{{$invoice->payment_intent}}">
                                            <button type="submit" data-target="#confirm-delete"
                                                    onclick="return confirm('Are you sure you want refund invoice')">
                                                Refund
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                @endif
            </div>

        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Charges</h3>
                </div>
                @if(!empty($charges))
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover text-nowrap">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Date</th>
                                <th>Receipt Number</th>
                                <th>Receipt URL</th>
                                <th>Amount</th>
                                <th>Refunded</th>
                                <th>Refunded amount</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($charges as $charge)
                                <tr>
                                    <td>
                                        <a href="{{\App\Models\User::STRIPE_PAYMENTS_DASHBOARD.'/'.$charge->id}}"
                                           target="_blank">
                                            {{$charge->id}}
                                        </a>
                                    </td>
                                    <td>{{date('Y-m-d H:i',$charge->created)}}</td>
                                    <td>{{$charge->receipt_number}}</td>
                                    <td><a href="{{$charge->receipt_url}}" target="_blank">Receipt URL</a></td>
                                    <td>{{$charge->amount/100}}</td>
                                    <td>{{$charge->refunded ? 'Yes' : 'No'}}</td>
                                    <td>{{$charge->amount_refunded/100}}</td>

                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                @endif
            </div>

        </div>
    </div>
@endsection