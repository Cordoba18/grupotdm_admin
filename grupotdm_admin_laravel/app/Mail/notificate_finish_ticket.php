<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;

class notificate_finish_ticket extends Mailable
{
    use Queueable, SerializesModels;
    public $user_sender;
    public $user_destination;
    public $ticket;
    /**
     * Create a new message instance.
     */
    public function __construct($user_sender, $user_destination, $ticket)
    {
        $this->user_sender = $user_sender;
        $this->user_destination = $user_destination;
        $this->ticket = $ticket;
    }

           /**
     * Get the message envelope.
     */

 public function build()
{
    $user_sender = $this->user_sender;
    $user_destination = $this->user_destination;
    $ticket = $this->ticket;
    return $this->subject("FINALIZACIÓN DE TICKET ".$ticket->name)
                ->view('mails.notificate_finish_ticket', compact('user_sender', 'user_destination','ticket'));
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
