@extends('mails.layout.app_mails')
@section('content')
<b>Buen dìa {{ $user_receive->name }}</b>
                <br>
                <b>Cordial saludo</b>
                <br>
                <p>El motivo del presente correo es notificar {{ $mensaje }}</p>
                <br>

                <b style="width: 100%;">Si ya te llegaron los componentes favor informar informar con el siguiente boton: </b>

                <form action="{{ route('dashboard.certificates.accept_certificate') }}" method="GET">
                <input type="text" name="id_certificate" value="{{ $certificate->id }}" hidden readonly style="opacity: 0;">
                <input type="text" name="id_user_receives" value="{{ $user_receive->id }}" hidden readonly style="opacity: 0;"><br>
                <button style="width: 100%; padding: 10px; background-color: black; color: white; font-size: 10px; border-radius: 20px; text-decoration: none; font-weight: bold;"> DAR LLEGADA DE ACTIVOS </button>
            </form>
@endsection


