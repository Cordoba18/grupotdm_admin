@extends('layouts.auth_user')

@section('title', 'Registro GRUPO TDM')
@section('css')
@vite(['resources/css/login.css'])
@endsection
@section('content')
<div class="content_principal">
    <div class="content_form">
        <div class="content_image">
            <img src="{{ asset('storage/icons/logo.png') }}" alt="">
        </div>
        <h1>REGISTRARSE</h1>
        <form action="" method="post">
            @csrf
            <label>Nombre: </label>
            <input id="name" type="text" placeholder="Ingrese sus nombres" name="name">
            <label>Apellidos: </label>
            <input id="lastname" type="text" placeholder="Ingrese sus apellidos" name="lastname">
            <label>Cedula: </label>
            <input id="nit" type="number" placeholder="Ingrese su cedula" name="nit">
            <label>Area: </label>
            <select name="area" id="area">
                <option value="">SÉLECCIONE SU AREA</option>
                @foreach ($areas as $a)
                <option value="{{ $a->id }}">{{ $a->area }}</option>
                @endforeach
            </select>
            <label>Compañia: </label>
            <select name="company" id="company">
                <option value="">SÉLECCIONE SU COMPAÑIA</option>
                @foreach ($companies as $c)
                <option value="{{ $c->id }}">{{ $c->company }}</option>
                @endforeach
            </select>
            <label>Correo: </label>
            <input id="email" type="email" placeholder="Ingrese su correo" name="email">
            <label>Contraseña: </label>
            <input id="password1" type="password" placeholder="Ingrese su contraseña" name="password1">
            <label>Confirmar contraseña: </label>
            <input id="password2" type="password" placeholder="Ingrese de nuevo la contraseña" name="password2">
            <p class="alert alert-danger" role="alert" id="message_error" class="error" hidden></p>
            <div class="content_form_buttons">
            <button id="btn_register">REGISTRARSE</button>
            <a href="{{ route('login') }}">Loguearse</a>
        </div>
        </form>
    </div>
</div>
@endsection

@section('js')
<script> let route_login = "{{ route('login') }}"; </script>
@vite(['resources/js/register.js'])
@endsection
