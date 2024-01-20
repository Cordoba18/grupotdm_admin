
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
@endsection


