@extends('mails.layout.app_mails')
@section('content')
<b>Buen dìa {{ $user_receives->name }}</b>
                <br>
                <b>Cordial saludo</b>
                <br>
                <p>El motivo del presente correo es notificar que el usuario {{ $user_delivery->name }} con correo {{ $user_delivery->email }} esta esperando la confirmación de la llegada de activos :  </p>

                <div style="display: flex; justify-content: center; align-items: center">
                    <p>ID :  </p> <b>{{ $certificate->id }}</b>
                    </div>
                <div style="display: flex; justify-content: center; align-items: center">
                <p>Dirección :  </p> <b>{{ $certificate->address }}</b>
                </div>
                <br>
                <div style="display: flex; justify-content: center; align-items: center">
                    <p>Fecha :  </p> <b>{{ $certificate->date }}</b>
                    </div>
                <br>
<center>
                <b> Puedes gestionar la llegada de activos desde el siguiente boton:</b>
            </center>
            <form action="{{ route('dashboard.certificates.accept_certificate') }}" method="GET">
                <input type="text" name="id_certificate" value="{{ $certificate->id }}" hidden readonly style="opacity: 0;">
                <input type="text" name="id_user_receives" value="{{ $user_receives->id }}" hidden readonly style="opacity: 0;"><br>
                <button style="width: 100%; padding: 10px; background-color: black; color: white; font-size: 10px; border-radius: 20px; text-decoration: none; font-weight: bold;"> DAR LLEGADA DE ACTIVOS </button>
            </form>
@endsection

