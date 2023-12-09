<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;

class new_file extends Mailable
{
    use Queueable, SerializesModels;

    public $user;
    public $directorie;
    public $file;
    /**
     * Create a new message instance.
     */
    public function __construct($user, $directorie, $file)
    {
        $this->user = $user;
        $this->directorie = $directorie;
        $this->file = $file;
    }

           /**
     * Get the message envelope.
     */

 public function build()
{
    $user = $this->user;
    $directorie = $this->directorie;
    $file = $this->file;

    return $this->subject("CREACION ARCHIVO")
                ->view('mails.new_file', compact('user','directorie' , 'file'));
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
