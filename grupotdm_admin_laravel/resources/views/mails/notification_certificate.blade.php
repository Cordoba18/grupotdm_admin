@extends('mails.layout.app_mails')
@section('content')
<b>Buen dìa {{ $user_receive->name }}</b>
<br>
<b>Cordial saludo</b>
<br>
<p>El motivo del presente correo es notificar {{ $mensaje }}</p>
@endsection

