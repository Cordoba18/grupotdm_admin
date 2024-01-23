

@extends('mails.layout.app_mails')
@section('content')
<b>Buen dìa {{ $user->name }}</b>
                <br>
                <b>Cordial saludo</b>
                <br>
                <p>El motivo del presente correo es notificar que el ticket de  <b>{{ $ticket->name }}</b> con id <b>{{ $ticket->id }}</b> del cual haces parte ha recibido una nueva calificacíon</p>
                <br>
                <div style="display: flex; align-items: center">
                <a href="{{ route('dashboard.tickets.ticket_detail', $ticket->id) }}" style="text-align: center;  width: 100%; padding: 10px; background-color: black; color: white; font-size: 10px; border-radius: 20px; text-decoration: none; font-weight: bold;"> VER TICKET </a>
            </div>
                @endsection
