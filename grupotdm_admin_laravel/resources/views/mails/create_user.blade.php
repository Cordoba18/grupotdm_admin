@extends('mails.layout.app_mails')
@section('content')
<b>Buen dìa {{ $user->name }}</b>
                <br>
                <b>Cordial saludo</b>
                <br>
                <p>El motivo del presente correo es notificar la informacion sobre la creacion de su cuenta el cual cuenta con las siguientes caracteristicas:</p>
                <div style="display: flex; justify-content: center; align-items: center">
                <p>Nombre :  </p> <b>{{ $user->name }}</b>
                </div>
                <br>
                <div style="display: flex; justify-content: center; align-items: center">
                    <p>Nit :  </p> <b>{{ $user->nit }}</b>
                    </div>
                <br>
                <div style="display: flex; justify-content: center; align-items: center">
                    <p>Contraseña :  </p> <b>{{ $password }}</b>
                    </div>
                <br>

                <div style="display: flex; justify-content: center; align-items: center">
                    <p>Area :  </p> <b>{{ $user->area }}</b>
                    </div>
                <br>
                <div style="display: flex; justify-content: center; align-items: center">
                    <p>Cargo :  </p> <b>{{ $user->chargy }}</b>
                    </div>
@endsection
