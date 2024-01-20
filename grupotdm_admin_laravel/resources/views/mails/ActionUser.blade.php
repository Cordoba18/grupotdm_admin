
@extends('mails.layout.app_mails')
@section('content')
<b>Buen dìa {{ $name }}</b>
<br>
<b>Cordial saludo</b>
<br>
<p>El motivo del presente correo es notificar que su jefe de area con nombre {{ $name_action }} y correo {{ $email }} a modificado su cuenta a estado <b>{{ $state }}</b> </p>
@endsection
