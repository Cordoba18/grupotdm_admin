@extends('mails.layout.app_mails')
@section('content')
<b>Buen dìa {{ $user->name }}</b>
                <br>
                <b>Cordial saludo</b>
                <br>
            <p>El motivo del presente correo es notificar la creacion de tu nuevo archivo en el repositorio con id {{ $directorie->id }}:</p>
                <br>
                <div style="display: flex; align-items: center">
                <p>Nombre : <b style="padding: 10px">{{ $file->name }}</b></p>
                </div>
                <br>
                <form action="{{ route('dashboard.view_directory') }}" method="get">
                    <input type="text" name="id" value="{{ $directorie->id }}" hidden readonly style="opacity: 0;">
                    <button style="width: 100%; padding: 10px; background-color: black; color: white; font-size: 10px; border-radius: 20px; text-decoration: none; font-weight: bold;"> VER DIRECTORIO </button>
                </form>
@endsection
