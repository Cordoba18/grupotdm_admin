<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class SendCode extends Mailable
{
    use Queueable, SerializesModels;

    public $cod;
    public $nombre;
    public $mensaje;
    public $sujeto;
    /**
     * Create a new message instance.
     */
    public function __construct($cod, $nombre, $mensaje, $sujeto)
    {
        $this->cod = $cod;
        $this->nombre=$nombre;
        $this->mensaje=$mensaje;
        $this->sujeto=$sujeto;
    }

           /**
     * Get the message envelope.
     */

     public function build(){

        $cod = $this->cod;
        $nombre = $this->nombre;
        $sujeto = $this->sujeto;
        $mensaje = $this->mensaje;
        return $this->subject($sujeto)
        ->view('mails.sendCode', compact('cod', 'nombre', 'mensaje'));
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
