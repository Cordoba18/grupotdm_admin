@extends('layouts.auth_user')
@section('title', 'Codigo Recuperaciòn Contraseña GRUPO TDM')
@section('css')
    @vite(['resources/css/login.css'])
    <style>
        body{
    margin: 0;
}

.content_loading{
    background-color: rgba(2, 2, 2, 0.3);
    width: 100vw; /* 100% del ancho del viewport */
    height: 100vh;
    position: fixed;
    z-index: 10000;
}
.content_loading .content_logo{

    position: fixed;
    transform: translate(-50%, -50%);
    left: 50%;
    top: 50%;
    border-radius: 50px;
    border: 6px solid;
    padding: 20px;
    background-color: white;
    animation: start_loading 0.5s;

}
.content_loading .content_logo img{
    width: 100%;
    height: 100%;
    object-fit: cover;
}

@keyframes start_loading{

    0%{
        opacity: 0;
       transform: translateX(-50%) translateY(-100%);
    }
    100%{
        opacity: 1;
        transform: translateX(-50%) translateY(-50%);
    }
}
@media (max-width:700px){
    .content_loading .content_logo{
        width: 100vw; /* 100% del ancho del viewport */
    height: 100vh;

    }
    .content_loading .content_logo{
        border-radius: 0;
    }
    .content_loading .content_logo img{
    object-fit: contain;
}
}
    </style>
@endsection
<div class="content_loading" hidden>

</div>

@section('content')
    <div class="content_principal">
        <div class="content_form">
            <div class="content_image">
                <img src="{{ asset('storage/icons/logo.png') }}" alt="">
            </div>
            <h1>Recuperar Contraseña</h1>
            <form id="miFormulario" action="{{ route('recover.validecode') }}" method="post">
                @csrf
                <p>Hemos enviado un codigo para la recuperaciòn de usuario a <b>{{ $email }}</b> </p>
                <label>Ingrese su codìgo</label>
                <input hidden type="email" name="email" value="{{ $email }}">
                <input id="code" type="number" inputmode="none" maxlength="6" inputmode="numeric" pattern="[0-9]*"
                    placeholder="Ingrese el codigo" name="code" required>

                @if (session('message_error'))
                    <p class="alert alert-danger" role="alert" id="error">{{ session('message_error') }}</p>
                @endif
                <div class="content_form_buttons">
                    <button>Validar codígo</button>
                    <a href="{{ route('login') }}">Volver</a>
                </div>
            </form>
        </div>
    </div>
@endsection

@section('js')
<script>

    let content_logo_loading = '<div class="content_logo">'+
        '<img src="{{ asset('storage/icons/loading_logo.gif') }}" alt="">'+
    '</div>';
    const content_loading = document.querySelector(".content_loading");
    document.addEventListener('DOMContentLoaded', function () {
            var formulario = document.getElementById('miFormulario');

            formulario.addEventListener('submit', function (event) {
                if (validarFormulario()) {
                    content_loading.removeAttribute('hidden');
                    content_loading.innerHTML = content_logo_loading;
                }
            });

            function validarFormulario() {

                return true;
            }
        });
</script>
@stop
