@extends('layouts.auth_user')

@section('title', 'Login GRUPO TDM')
@section('css')
@vite(['resources/css/login.css'])
@endsection
@section('content')
    <div class="content_form">
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
                <a href="{{ route('recover') }}">¿Olvidaste tu contraseña?</a>
            </div>
            @if (session('message_error'))

              <p class="alert alert-danger" role="alert" id="error" class=""> {{ session('message_error') }}</p>
            
         @endif
            <div class="content_form_buttons">
            <button>INGRESAR</button>
            <a href="{{ route('register') }}">Registrarme</a>
        </div>
        </form>
    </div>
@endsection
