
@extends('mails.layout.app_mails')
@section('content')

<b>Buen dìa {{ $jefe->name }}</b>
<br>
<b>Cordial saludo</b>
<br>
<p>El motivo del presente correo es notificar la creación de un nuevo permiso del colaborador <b> {{ $user->name }}</b> el cual esta esperando aprovación: </p>
<br>
<div style="align-items: center; display: flex">
<p style="margin: 5px">FECHA DE SOLICITUD: </p><b>{{ $permission->date_application }}</b>
</div>
<div style="align-items: center; display: flex">
    <p style="margin: 5px">OBSERVACIONES : </p><b>{{ $permission->observations }}</b>
    </div>
    <div style="align-items: center; display: flex">
        <a style=" text-align: center;  width: 100%; padding: 10px; background-color: black; color: white; font-size: 10px; border-radius: 20px; text-decoration: none; font-weight: bold;" href="{{ route('dashboard.permissions.view_permission', $permission->id) }}"> VER PERMISO </a>
    </div>
@endsection


