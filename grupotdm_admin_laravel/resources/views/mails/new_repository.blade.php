@extends('mails.layout.app_mails')
@section('content')
<b>Buen dìa {{ $user->name }}</b>
                <br>
                <b>Cordial saludo</b>
                <br>
                <p>El motivo del presente correo es notificar la creacion de tu nuevo repositorio con los siguientes datos:</p>
                <br>
                <div style="display: flex; align-items: center">
                <p>Nombre : <b style="padding: 10px">{{ $directorie->name }}</b></p>
                <p>Codigo : <b style="padding: 10px">{{ $directorie->code }}</b></p>
@endsection
