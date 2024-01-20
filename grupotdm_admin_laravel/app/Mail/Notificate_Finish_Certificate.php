<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class Notificate_Finish_Certificate extends Mailable
{
    use Queueable, SerializesModels;
    public $user_delivery;
    public $user_receives;
    public $certificate;
    /**
     * Create a new message instance.
     */
    public function __construct($user_receives, $user_delivery, $certificate)
    {
        $this->user_delivery = $user_delivery;
        $this->user_receives = $user_receives;
        $this->certificate = $certificate;
    }

           /**
     * Get the message envelope.
     */

 public function build()
{
    $user_delivery = $this->user_delivery;
    $user_receives = $this->user_receives;
    $certificate = $this->certificate;
    return $this->subject("DAR LLEGADA DE CERTIFICADO #".$certificate->id)
                ->view('mails.notificate_finish_certificate', compact('user_delivery', 'user_receives','certificate'));
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
