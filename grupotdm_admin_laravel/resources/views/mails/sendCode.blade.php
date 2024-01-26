@extends('mails.layout.app_mails')
@section('content')
<p>Hola, <b>{{ $nombre }}</b> {{ $mensaje }}</p>
<br>
<center>
    <div class="content_code"
        style=" border: 3px solid black; width: 250px;
background-color: white;
height: auto;">
        <h1 style=" background-color: red;
height: 50px; margin: 0;">CODIGO</h1>
        <p style="font-weight: bold; margin: 0;
font-size: 30px;
height: 60px;">
            {{ $cod }}</p>
    </div>
</center>
<div class="danger"
    style="font-weight: bold;
text-align: center;
font-size: 20px;">
<p>Recuerda que el codigo sera borrado despues de 10 minutos</p>
@endsection
