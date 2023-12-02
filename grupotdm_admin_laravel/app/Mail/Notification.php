<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class Notification extends Mailable
{
    use Queueable, SerializesModels;
    public $nombre;
    public $correo;
    public $company;
    public $area;

    /**
     * Create a new message instance.
     */
    public function __construct($nombre, $correo, $company, $area)
    {
        $this->nombre = $nombre;
        $this->correo=$correo;
        $this->company=$company;
        $this->area=$area;
    }

           /**
     * Get the message envelope.
     */

 public function build()
{
    $correo = $this->correo;
    $nombre = $this->nombre;
    $company = $this->company;
    $area = $this->area;
    return $this->subject("ACTIVACIÓN DE USUARIO")
                ->view('mails.notification', compact('nombre', 'correo','company','area'));
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
