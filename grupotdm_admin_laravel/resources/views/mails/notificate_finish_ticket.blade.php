@extends('mails.layout.app_mails')
@section('content')
<b>Buen dìa {{ $user_destination->name }}</b>
                <br>
                <b>Cordial saludo</b>
                <br>
                <p>El motivo del presente correo es notificar que el usuario {{ $user_sender->name }} con correo {{ $user_sender->email }} esta esperando el cierre del ticket con los siguientes datos: </p>

                <div style="display: flex; justify-content: center; align-items: center">
                    <p>ID :  </p> <b>{{ $ticket->id }}</b>
                    </div>
                <div style="display: flex; justify-content: center; align-items: center">
                <p>Nombre :  </p> <b>{{ $ticket->name }}</b>
                </div>
                <br>
                <div style="display: flex; justify-content: center; align-items: center">
                    <p>Fecha de inicio :  </p> <b>{{ $ticket->date_start }}</b>
                    </div>
                <br>
                <div style="display: flex; justify-content: center; align-items: center">
                    <p>Fecha final :  </p> <b>{{ $ticket->date_finally }}</b>
                    </div>
                <br>
<center>
                <b> Puedes gestionar el cierre del ticket desde el siguiente boton:</b>
            </center>
                <form action="{{ route('dashboard.tickets.notificate_finish_ticket.finish_ticket_mail') }}" method="GET">
                    <input type="text" name="id_ticket" value="{{ $ticket->id }}" hidden readonly style="opacity: 0;">
                    <button style="width: 100%; padding: 10px; background-color: black; color: white; font-size: 10px; border-radius: 20px; text-decoration: none; font-weight: bold;"> CERRAR TICKET</button>
                </form>
@endsection


