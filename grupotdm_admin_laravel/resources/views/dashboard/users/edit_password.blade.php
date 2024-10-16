@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@php
    $my_user = Auth::user();
@endphp

@section('content_header')
<div class="content_loading" hidden>

</div>
<h1>Perfil de <b> {{ $user->name }}</b></h1>

@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif

@stop

@section('content')
@if($validate_user_administrator && $my_user->id_area != 1)
<p class="alert alert-danger" role="alert" class="">No tines permitido hacer eso</p>
@elseif ($validation_jefe || $user->id == $my_user->id || $validate_user_administrator)
<div class="content_principal" style="display: flex; align-items: center; justify-content: center">
    <div class="content_form" style="width: 70%;">
<form id="miFormulario" action="{{ route('dashboard.users.change_password.save_changes') }}" method="post">
    @csrf
    <input type="number" name="id" hidden value="{{ $user->id }}">
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Contraseña Actual</label>
    <input type="password" name="password_now" class="form-control" required id="exampleFormControlInput1">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nueva contraseña</label>
    <input type="password" name="password" class="form-control" required id="exampleFormControlInput1">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Confirmar contraseña</label>
    <input type="password" name="password2" class="form-control" required id="exampleFormControlInput1">
  </div>
  @if (session('message_error'))

              <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>

         @endif
  <div class="content_buttons" style="display: flex; width: 100%; flex-wrap: wrap;">
    <button style="width: 100%;margin-bottom: 10px;" class="btn btn-success">Cambiar contraseña</button>
</form>
<form style="width: 100%;" action="{{ route('dashboard.users.edit_profile' , $user->id)}}" method="get">
    <button style="width: 100%; text-align: center;" class="btn btn-outline-primary">Volver</button>
</form>
  </div>
@else
<p class="alert alert-danger" role="alert" class="">No estas autorizado para cambiar contraseñas</p>
@endif
@stop
</div>
</div>

@section('css')
@vite('resources/css/content_loading.css')

@stop

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
@extends('layouts.content_notifications')
