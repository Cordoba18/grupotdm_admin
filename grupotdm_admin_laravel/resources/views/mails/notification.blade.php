@extends('mails.layout.app_mails')
@section('content')
<p>Buen día Administrador, El usuario <b>{{ $nombre }}</b> con correo <b> {{ $correo }}</b> de <b>{{ $company }}</b> del area de <b>{{ $area }}</b> esta a la espera de activación</p>
@endsection
