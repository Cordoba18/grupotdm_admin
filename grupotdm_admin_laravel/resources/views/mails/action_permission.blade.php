
@extends('mails.layout.app_mails')
@section('content')
<b>Buen dìa {{ $user->name }}</b>
<br>
<b>Cordial saludo</b>
<br>
<p>El motivo del presente correo es notificar {{ $message_email  }} </p>
@endsection
