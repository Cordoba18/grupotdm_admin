<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;

class create_product extends Mailable
{
    use Queueable, SerializesModels;

    public $user;
    public $product;
    /**
     * Create a new message instance.
     */
    public function __construct($user, $product)
    {
        $this->user = $user;
        $this->product = $product;

    }

           /**
     * Get the message envelope.
     */

 public function build()
{
    $user = $this->user;
    $product = $this->product;
    return $this->subject("CREACIÓN DE PRODUCTO")
                ->view('mails.create_product', compact('user','product'));
}



    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        return [];
    }
}
