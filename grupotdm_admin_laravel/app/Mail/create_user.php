<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;

class create_user extends Mailable
{
    use Queueable, SerializesModels;
    public $id;
    public $password;
    /**
     * Create a new message instance.
     */
    public function __construct($id, $password)
    {
        $this->id = $id;
        $this->password = $password;
    }

           /**
     * Get the message envelope.
     */

 public function build()
{
    $id = $this->id;
    $password = $this->password;
    $user = DB::selectOne("SELECT u.id, u.name, u.nit, u.email,c.company, s.state, a.area, ch.chargy, u.id_state
    FROM users u
   INNER JOIN companies c ON u.id_company = c.id
   INNER JOIN states s ON u.id_state = s.id
   INNER JOIN areas a ON u.id_area = a.id
   INNER JOIN charges ch ON u.id_chargy = ch.id
   WHERE u.id = $id");

    return $this->subject("CREACIÓN DE USUARIO")
                ->view('mails.create_user', compact('user', 'password'));
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
