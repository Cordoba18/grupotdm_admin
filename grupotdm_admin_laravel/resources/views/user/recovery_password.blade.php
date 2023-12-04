@extends('layouts.auth_user')
@section('title', 'Recuperar Contraseña GRUPO TDM')
@section('css')
@vite(['resources/css/login.css'])
@endsection
@section('content')
    <div class="content_form">
        <div class="content_image">
            <img src="{{ asset('storage/icons/logo.png') }}" alt="">
        </div>
        <h1>Recuperar Contraseña</h1>
        <form action="{{ route('recover.sendcode') }}" method="post">
            @csrf
            <label>Ingrese su correo electronico</label>
            <input type="email" placeholder="Ingrese su correo" name="email">
            </div>
            @if (session('message_error'))
              <p class="alert alert-danger" role="alert" id="error"> {{ session('message_error') }}</p>
            @endif
            <div class="content_form_buttons">
            <button>Enviar codìgo</button>
            <a href="{{ route('login') }}">Volver</a>
        </div>
        </form>
    </div>
@endsection
