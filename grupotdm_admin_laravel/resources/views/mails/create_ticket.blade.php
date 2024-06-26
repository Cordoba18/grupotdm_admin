@extends('mails.layout.app_mails')
@section('content')
<b>Buen dìa {{ $user_destination->name }}</b>
<br>
<b>Cordial saludo</b>
<br>
<p>El motivo del presente correo es notificar la creacion de un ticket por {{ $user_sender->name }} con correo {{ $user_sender->email }} con las siguientes caracteristicas: </p>
<div style="display: flex; justify-content: center; align-items: center">
<p>Nombre :  </p> <b>{{ $ticket->name }}</b>
</div>
<br>
<div style="display: flex; justify-content: center; align-items: center">
    <p>Prioridad :  </p> <b>{{ $priority }}</b>
    </div>
<br>

<div style="display: flex; justify-content: center; align-items: center">
    <p>Fecha de inicio :  </p> <b>{{ $ticket->date_start }}</b>
    </div>
<br>
<div style="display: flex; justify-content: center; align-items: center">
    <p>Fecha final :  </p> <b>{{ $ticket->date_finally }}</b>
    </div>

    <div style="display: flex; align-items: center">
        <a style=" text-align: center;  width: 100%; padding: 10px; background-color: black; color: white; font-size: 10px; border-radius: 20px; text-decoration: none; font-weight: bold;" href="{{ route('dashboard.tickets.ticket_detail', $ticket->id) }}"> VER TICKET </a>
        </div>

@endsection
