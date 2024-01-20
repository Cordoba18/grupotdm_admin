@extends('mails.layout.app_mails')
@section('content')
<b>Buen dìa {{ $user_sender->name }}</b>
<br>
<b>Cordial saludo</b>
<br>
<p>El motivo del presente correo es notificar la acción de un ticket generado para <b>{{ $user_destination->name }}</b> en el cual se reporta que el ticket con id <b>{{ $ticket->id }}</b> esta en estado :  <b>{{ $ticket->state }}</b></p>
<br>
<a href="{{ route('dashboard.tickets.ticket_detail', $ticket->id) }}" style="text-align: center; width: 400px;padding-left: 100px;padding-right: 100px; padding: 10px; background-color: black; color: white; font-size: 10px; border-radius: 20px; text-decoration: none; font-weight: bold;"> VER TICKET </a>
@endsection

