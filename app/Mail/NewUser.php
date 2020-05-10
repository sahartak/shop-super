<?php

namespace App\Mail;

use App\Models\UserShop;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class NewUser extends Mailable
{
    use Queueable, SerializesModels;
    public $shop;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(UserShop $shop)
    {
        $this->shop = $shop;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from(env('MAIL_USERNAME'))->view('emails.welcome') ->with([
            'shop_name' => $this->shop->shop_name,
            'user_name' => $this->shop->user->name,
        ]);
    }
}
