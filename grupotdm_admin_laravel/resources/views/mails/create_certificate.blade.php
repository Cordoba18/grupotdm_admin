
@extends('mails.layout.app_mails')
@section('content')

<b>Buen dìa {{ $user_receive->name }}</b>
<br>
<b>Cordial saludo</b>
<br>
<p>El motivo del presente correo es notificar la creación de una acta para usted del usuario <b>{{ $user_delivery->name }}</b> con correo <b>{{ $user_delivery->email }}</b> con los siguientes datos:</p>
<br>
<div style="display: flex; align-items: center">
    <p style="margin-right: 10px">ID</p>
    <b>{{ $certificate->id }}</b>
    </div>
<div style="display: flex; align-items: center">
<p style="margin-right: 10px">FECHA</p>
<b>{{ $certificate->date }}</b>
</div>
<div style="display: flex; align-items: center">
    <p style="margin-right: 10px">DIRRECIÓN</p>
    <b>{{ $certificate->address }}</b>
    </div>
    <div style="display: flex; align-items: center">
        <p style="margin-right: 10px">OBSERVACIONES GENERALES</p>
        <b>{{ $certificate->general_remarks }}</b>
        </div>
        <div style="display: flex; align-items: center">
            <a style=" text-align: center;  width: 100%; padding: 10px; background-color: black; color: white; font-size: 10px; border-radius: 20px; text-decoration: none; font-weight: bold;" href="{{ route('dashboard.certificates.view_certificate', $certificate->id) }}"> VER CERTIFICADO </a>
            </div>
@endsection
