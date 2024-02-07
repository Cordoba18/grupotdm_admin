@extends('mails.layout.app_mails')
@section('content')
<b>Buen dìa {{ $user->name }}</b>
                <br>
                <b>Cordial saludo</b>
                <br>
                <p>El motivo del presente correo es notificar la creación o asignacion de una llave VPN para ti con nombre: <b>{{ $vpn->name }}</b></p>
                <br>

                <div style="width: 100%; display: flex; align-items: center">
                <a id="file" href="{{ asset('storage/vpns/'.$vpn->file) }}" download="{{ $vpn->name }}" style="width: 100%; padding: 10px; background-color: black; color: white; font-size: 10px; border-radius: 20px; text-decoration: none; font-weight: bold; text-align: center;"> DESCARGAR LLAVE VPN </a>
            </div>
            </form>
@endsection


