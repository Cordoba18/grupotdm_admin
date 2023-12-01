@extends('layouts.auth_user')

@section('title', 'Registro')

@section('content')
    <div class="content_login">
        <div class="content_image">
            <img src="{{ asset('storage/icons/logo.jpg') }}" alt="">
        </div>
        <h1>REGISTRARSE</h1>
        <form action="" method="post">
            @csrf
            <label>Nombre: </label>
            <input type="text" placeholder="Ingrese sus nombres" name="name">
            <label>Apellidos: </label>
            <input type="text" placeholder="Ingrese sus apellidos" name="lastname">
            <label>Cedula: </label>
            <input type="number" placeholder="Ingrese su cedula" name="nit">
            <label>Area: </label>
            <select name="area" id="">
                <option value="">SÉLECCIONE SU AREA</option>
            </select>
            <label>Compañia: </label>
            <select name="company" id="">
                <option value="">SÉLECCIONE SU COMPAÑIA</option>
            </select>
            <label>Correo: </label>
            <input type="email" placeholder="Ingrese su correo" name="email">
            <label>Contraseña: </label>
            <input type="password" placeholder="Ingrese su contraseña" name="password">
            <label>Confirmar contraseña: </label>
            <input type="password" placeholder="Ingrese de nuevo la contraseña" name="c_password">
            <button>REGISTRARSE</button>
            <a href="{{ route('login') }}">Loguearse</a>
        </form>
    </div>
@endsection
