<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;

class new_repository extends Mailable
{
    use Queueable, SerializesModels;

    public $user;
    public $directorie;
    /**
     * Create a new message instance.
     */
    public function __construct($user, $directorie)
    {
        $this->user = $user;
        $this->directorie = $directorie;
    }

           /**
     * Get the message envelope.
     */

 public function build()
{
    $user = $this->user;
    $directorie = $this->directorie;

    return $this->subject("CREACION REPOSITORIO")
                ->view('mails.new_repository', compact('user','directorie'));
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
