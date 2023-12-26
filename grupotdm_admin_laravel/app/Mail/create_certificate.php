<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;

class create_certificate extends Mailable
{
    use Queueable, SerializesModels;

    public $user_receive;
    public $user_delivery;
    public $certificate;
    /**
     * Create a new message instance.
     */
    public function __construct($user_receive,$user_delivery,  $certificate)
    {
        $this->user_receive = $user_receive;
        $this->user_delivery = $user_delivery;
        $this->certificate = $certificate;
    }

           /**
     * Get the message envelope.
     */

 public function build()
{
    $user_receive = $this->user_receive;
    $user_delivery = $this->user_delivery;
    $certificate = $this->certificate;
    return $this->subject("CREACIÓN ACTA")
                ->view('mails.create_certificate', compact('user_receive','user_delivery','certificate'));
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
