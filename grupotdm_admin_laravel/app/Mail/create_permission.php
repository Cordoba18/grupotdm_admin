<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;

class create_permission extends Mailable
{
    use Queueable, SerializesModels;

    public $user;
    public $permission;
    public $jefe;
    /**
     * Create a new message instance.
     */
    public function __construct($jefe, $permission , $user)
    {
        $this->user = $user;
        $this->permission = $permission;
        $this->jefe = $jefe;
    }

           /**
     * Get the message envelope.
     */

 public function build()
{
    $user = $this->user;
    $permission = $this->permission;
    $jefe = $this->jefe;
    return $this->subject("NUEVO PERMISO DE COLABORADOR")
                ->view('mails.create_permission', compact('user','permission', 'jefe'));
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
