@extends('layouts.auth_user')

@section('title', 'LOGIN')

@section('content')
    <div class="content_login">
        <div class="content_image">
            <img src="{{ asset('storage/icons/logo.jpg') }}" alt="">
        </div>
        <h1>LOGIN</h1>
        <form action="" method="post">
            @csrf
            <label>Correo: </label>
            <input type="email" placeholder="Ingrese su correo" name="email">
            <label>Contraseña: </label>
            <input type="password" placeholder="Ingrese su contraseña" name="password">
            <div class="content_recovery_password">
                <a href="">¿Olvidaste tu contraseña?</a>
            </div>
            <div class="content_form_buttons">
            <button>INGRESAR</button>
            <a href="{{ route('register') }}">Registrarme</a>
        </div>
        </form>
    </div>
@endsection
