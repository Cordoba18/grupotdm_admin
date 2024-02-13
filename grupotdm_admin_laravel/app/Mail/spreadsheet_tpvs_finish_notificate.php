<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;

class spreadsheet_tpvs_finish_notificate extends Mailable
{
    use Queueable, SerializesModels;

    public $user;
    public $spreadsheet_tpvs;

    /**
     * Create a new message instance.
     */
    public function __construct($user, $spreadsheet_tpvs)
    {
        $this->user = $user;
        $this->spreadsheet_tpvs = $spreadsheet_tpvs;

    }

           /**
     * Get the message envelope.
     */

 public function build()
{
    $user = $this->user;
    $spreadsheet_tpvs = $this->spreadsheet_tpvs;

    return $this->subject("CONTEO TESORERO")
                ->view('mails.spreadsheet_tpvs_finish_notificate', compact('user','spreadsheet_tpvs'));
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
