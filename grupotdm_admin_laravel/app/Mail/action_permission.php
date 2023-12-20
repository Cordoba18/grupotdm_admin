<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;

class action_permission extends Mailable
{
    use Queueable, SerializesModels;

    public $user;
    public $message;
    /**
     * Create a new message instance.
     */
    public function __construct($user, $message)
    {
        $this->user = $user;
        $this->message = $message;

    }

           /**
     * Get the message envelope.
     */

 public function build()
{
    $user = $this->user;
    $message = $this->message;
    return $this->subject("PERMISO COLABORADOR")
                ->view('mails.action_permission', compact('user','message'));
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
