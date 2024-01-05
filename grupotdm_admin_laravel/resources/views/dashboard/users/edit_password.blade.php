@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@php
    $my_user = Auth::user();
@endphp
<div class="content_loading" hidden>

</div>
@section('content_header')

<h1>Perfil de <b> {{ $user->name }}</b></h1>

@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif

@stop

@section('content')
@if ($user->id_area == $my_user->id_area || $my_user->id_area == 1)
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
  <div class="content_buttons" style="display: flex">
    <button class="btn btn-success">Cambiar contraseña</button>
</form>
<form action="{{ route('dashboard.users.edit_profile' , $user->id)}}" method="get">
    <button  class="btn btn-outline-primary">Volver</button>
</form>
  </div>
@else
<p class="alert alert-danger" role="alert" class="">No estas autorizado para cambiar contraseñas</p>
@endif
@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
    <style>
        body{
    background-color: white;
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
