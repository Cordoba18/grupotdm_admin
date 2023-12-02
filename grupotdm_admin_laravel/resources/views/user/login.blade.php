@extends('layouts.auth_user')

@section('title', 'LOGIN')
@section('css')
@vite(['resources/css/login.css'])
@endsection
@section('content')
    <div class="content_login">
        <div class="content_image">
            <img src="{{ asset('storage/icons/logo.png') }}" alt="">
        </div>
        <h1>LOGIN</h1>
        <form action="{{ route('login.logueo') }}" method="post">
            @csrf
            <label>Correo: </label>
            <input type="email" placeholder="Ingrese su correo" name="email">
            <label>Contraseña: </label>
            <input type="password" placeholder="Ingrese su contraseña" name="password">
            <div class="content_recovery_password">
                <a href="">¿Olvidaste tu contraseña?</a>
            </div>
            @if (session('message_error'))
              <p id="error"> {{ session('message_error') }}</p>
         @endif
            <div class="content_form_buttons">
            <button>INGRESAR</button>
            <a href="{{ route('register') }}">Registrarme</a>
        </div>
        </form>
    </div>
@endsection
