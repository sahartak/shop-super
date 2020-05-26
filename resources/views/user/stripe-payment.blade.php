@extends('layouts.app',['title' => 'Pay'])
@section('parentJs')

@stop
<style>
    input,
    .StripeElement {
        height: 40px;

        color: #32325d;
        background-color: white;
        border: 1px solid transparent;
        border-radius: 4px;

        box-shadow: 0 1px 3px 0 #e6ebf1;
        -webkit-transition: box-shadow 150ms ease;
        transition: box-shadow 150ms ease;
    }

    input {
        padding: 10px 12px;
    }

    input:focus,
    .StripeElement--focus {
        box-shadow: 0 1px 3px 0 #cfd7df;
    }

    .StripeElement--invalid {
        border-color: #fa755a;
    }

    .StripeElement--webkit-autofill {
        background-color: #fefde5 !important;
    }

    #card-button {
        float: right;
    }
</style>
@section('content')
    <div class="container">
        <div class="row justify-content-center">


            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        Our free plan is limited to 2 boards. If you would like to use more boards, please subscribe to our paid plan.
                        The monthly subscription price for each extra board is USD 10
                    </div>
                    <div class="card-body">
                        <div class="payment-form">
                            <div class="form-group">
                                <label for="card-holder-name">Card holder</label>
                                <input id="card-holder-name" type="text" class="form-control">
                            </div>
                        @csrf



                        <!-- Stripe Elements Placeholder -->
                            <div class="form-group">
                                <div id="card-element">
                                </div>
                            </div>
                            <div class="form-group">
                                <button id="card-button" data-secret="{{ $intent->client_secret }}" class="btn btn-primary">Pay</button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script src="https://js.stripe.com/v3/"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script>

        const stripe = Stripe("{{env('STRIPE_KEY')}}");

        const elements = stripe.elements();
        const cardElement = elements.create('card');

        cardElement.mount('#card-element');



        const cardHolderName = document.getElementById('card-holder-name');
        const cardButton = document.getElementById('card-button');
        const clientSecret = cardButton.dataset.secret;

        console.log(cardButton);
        cardButton.addEventListener('click', async (e) => {
            const { setupIntent, error } = await stripe.confirmCardSetup(
            clientSecret, {
                payment_method: {
                    card: cardElement,
                    billing_details: { name: cardHolderName.value }
                }
            });

            if (error) {
                console.log(error);
                // Display "error.message" to the user...
            } else {
                console.log(setupIntent.payment_method);

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('input[name="_token"]').val()
                    }
                });

                $.ajax({
                    type: "post",
                    data: {payment_method: setupIntent.payment_method},
                    url: "/make-payment",
                    success: function (data) {
                        if(data.status == 1) {
                            $('.payment-form').parent().remove();
                            $(".card").append(
                                '<p class="success-message">You have subscribed successfully! </p>' +
                            '<a class="btn btn-primary" href="{{ route('user') }}"> Go to dashboard </a>'
                            );
                        } else {
                            $(".card").append(
                                '<p class="error-message">data.status.message</p>'
                            );
                        }
                    }
                });

            }
        });


    </script>
@stop
