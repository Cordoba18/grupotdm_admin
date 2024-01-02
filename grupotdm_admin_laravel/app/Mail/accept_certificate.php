<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;

class accept_certificate extends Mailable
{
    use Queueable, SerializesModels;

    public $user_receive;
    public $message;
    public $certificate;
    /**
     * Create a new message instance.
     */
    public function __construct($user_receive, $message, $certificate)
    {
        $this->user_receive = $user_receive;
        $this->message = $message;
        $this->certificate = $certificate;
    }

           /**
     * Get the message envelope.
     */

 public function build()
{
    $user_receive = $this->user_receive;
    $mensaje = $this->message;
    $certificate = $this->certificate;
    return $this->subject("ACCION EN CERTIFICADOS")
                ->view('mails.accept_certificate', compact('user_receive','mensaje','certificate'));
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
