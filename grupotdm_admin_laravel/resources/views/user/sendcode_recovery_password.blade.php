@extends('layouts.auth_user')
@section('title', 'Codigo Recuperaciòn Contraseña GRUPO TDM')
@section('css')
    @vite(['resources/css/login.css'])
@endsection
@section('content')
    <div class="content_principal">
        <div class="content_form">
            <div class="content_image">
                <img src="{{ asset('storage/icons/logo.png') }}" alt="">
            </div>
            <h1>Recuperar Contraseña</h1>
            <form action="{{ route('recover.validecode') }}" method="post">
                @csrf
                <p>Hemos enviado un codigo para la recuperaciòn de usuario a <b>{{ $email }}</b> </p>
                <label>Ingrese su codìgo</label>
                <input hidden type="email" name="email" value="{{ $email }}">
                <input id="code" type="number" inputmode="none" maxlength="6" inputmode="numeric" pattern="[0-9]*"
                    placeholder="Ingrese el codigo" name="code" required>

                @if (session('message_error'))
                    <p class="alert alert-danger" role="alert" id="error"> {{ session('message_error') }}</p>
                @endif
                <div class="content_form_buttons">
                    <button>Validar codígo</button>
                    <a href="{{ route('login') }}">Volver</a>
                </div>
            </form>
        </div>
    </div>
@endsection
