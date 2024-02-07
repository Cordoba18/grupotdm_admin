<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;

class Create_vpn extends Mailable
{
    use Queueable, SerializesModels;

    public $user;
    public $vpn;
    /**
     * Create a new message instance.
     */
    public function __construct($user, $vpn)
    {
        $this->user = $user;
        $this->vpn = $vpn;
    }

           /**
     * Get the message envelope.
     */

 public function build()
{
    $user = $this->user;
    $vpn = $this->vpn;
    return $this->subject("ASIGNACIÓN LLAVE VPN $vpn->name")
                ->view('mails.create_vpn', compact('user','vpn'));
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
