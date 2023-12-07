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
        <h1>Cambiar contraseña</h1>
        <form action="" method="post">
            @csrf
            <input hidden id="email" type="email" name="email" value="{{ $email }}">
            <label>Contraseña: </label>
            <input id="password1" type="password" placeholder="Ingrese su contraseña" name="password">
            <label>Confirmar contraseña: </label>
            <input id="password2" type="password" placeholder="Ingrese de nuevo la contraseña" name="password2">

              <p class="alert alert-danger" role="alert" id="error" hidden></p>

            <div class="content_form_buttons">
            <button id="btn_change_password">Guardar</button>
            <a href="{{ route('login') }}">Volver</a>
        </div>
        </form>
    </div>
</div>
@vite(['resources/js/recovery_password.js'])
@endsection
