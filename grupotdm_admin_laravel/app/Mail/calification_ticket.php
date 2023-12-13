<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;

class calification_ticket extends Mailable
{
    use Queueable, SerializesModels;

    public $user;
    public $ticket;
    /**
     * Create a new message instance.
     */
    public function __construct($user, $ticket)
    {
        $this->user = $user;
        $this->ticket = $ticket;
    }

           /**
     * Get the message envelope.
     */

 public function build()
{
    $user = $this->user;
    $ticket = $this->ticket;

    return $this->subject("NUEVA CALIFICACIÓN EN TICKET")
                ->view('mails.calification_ticket', compact('user','ticket'));
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
