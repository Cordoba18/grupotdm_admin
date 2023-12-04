<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class ActionUser extends Mailable
{
    use Queueable, SerializesModels;
    public $nombre;
    public $correo;
    public $estado;
    public $name_action;

    /**
     * Create a new message instance.
     */
    public function __construct($nombre, $correo, $estado, $name_action)
    {
        $this->nombre = $nombre;
        $this->correo=$correo;
        $this->estado=$estado;
        $this->name_action=$name_action;

    }

           /**
     * Get the message envelope.
     */

 public function build()
{
    $email = $this->correo;
    $name = $this->nombre;
    $state = $this->estado;
    $name_action  = $this->name_action;

    return $this->subject("MODIFICACIÒN DE USUARIO")
                ->view('mails.ActionUser', compact('name', 'email','state'));
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
