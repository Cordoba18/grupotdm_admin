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

<form id="miFormulario" action="{{ route('dashboard.users.save_changes') }}" method="post">
    @csrf
    <input type="number" hidden value="{{ $user->id }}" name="id">
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nombre</label>
    <input type="text" name="name" class="form-control" required id="exampleFormControlInput1" value="{{ $user->name }}">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nit</label>
    <input type="number" name="nit" class="form-control" required id="exampleFormControlInput1" value="{{ $user->nit }}">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">TÉLEFONO</label>
    <input type="number" name="phone" class="form-control" id="exampleFormControlInput1" value="{{ $user->phone }}" placeholder="Ingrese su telefono">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Correo</label>
    <input disabled type="email" name="email" class="form-control" required id="exampleFormControlInput1" value="{{ $user->email }}">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Compañia</label>
  <select required id="id_company" name="id_company" @if (!$validation_jefe)
  disabled
  @endif style="width: 100%" class="form-select form-select-lg mb-3" aria-label="Large select example">

   @php
    $company = null;
    @endphp
    @foreach ($companies as $c) {
        @if ($c->id == $user->id_company) {
            @php
            $company = $c->company
            @endphp
        }
        @endif
    }
    @endforeach
    <option value="{{ $user->id_company }}">{{ $company }}</option>
    @foreach ($companies as $c)
    @if($c->id != $user->id_company)
    <option value="{{ $c->id }}">{{ $c->company }} </option>
    @endif
    @endforeach
  </select>
</div>
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Area</label>
  <select required name="id_area" id="id_area"
  disabled
 style="width: 100%" class="form-select form-select-lg mb-3" aria-label="Large select example">
    @php
    $area = null;
    @endphp
    @foreach ($areas as $a) {
        @if ($a->id == $user->id_area) {
            @php
            $area = $a->area
            @endphp
        }
        @endif
    }
    @endforeach
    <option value="{{ $user->id_area }}">{{ $area }}</option>
    @foreach ($areas as $a)
    @if($a->id != $user->id_area)
    <option value="{{ $a->id }}">{{ $a->area }} </option>
    @endif
    @endforeach
  </select>
</div>
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Cargos</label>
  <select required name="id_chargy" id="id_chargy" @if (!$validation_jefe)
  disabled
  @endif style="width: 100%" class="form-select form-select-lg mb-3" aria-label="Large select example">
    @php
    $chargy = null;
    @endphp
    @foreach ($charges as $c) {
        @if ($c->id == $user->id_chargy && $c->id_area == $user->id_area) {
            @php
            $chargy = $c->chargy
            @endphp
        }
        @endif
    }
    @endforeach
    <option value="{{ $user->id_chargy }}">{{ $chargy }}</option>
    @foreach ($charges as $c)
    @if($c->id != $user->id_chargy && $c->id_area == $user->id_area )
    <option value="{{ $c->id }}">{{ $c->chargy }} </option>
    @endif
    @endforeach
  </select>
</div>
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Tienda</label>
  <select name="id_shop" id="id_shop" @if (!$validation_jefe)
  disabled
  @endif style="width: 100%" class="form-select form-select-lg mb-3" aria-label="Large select example">
    @php
    $shop = null;
    @endphp
    @foreach ($shops as $s) {
        @if ($s->id == $user->id_shop && $s->id_company == $user->id_company) {
            @php
            $shop = $s->shop
            @endphp
        }
        @endif
    }
    @endforeach
    @if ($shop == null)
    <option value="">SELECIONE UNA TIENDA</option>
    @foreach ($shops as $s)
    <option value="{{ $s->id }}">{{ $s->shop }} </option>
    @endforeach
    @else
    <option value="{{ $user->id_shop }}">{{ $shop }}</option>
    @foreach ($shops as $s)
    @if($s->id != $user->id_shop && $s->id_company == $user->id_company )
    <option value="{{ $s->id }}">{{ $s->shop }} </option>
    @endif
    @endforeach
    @endif

  </select>
</div>

@if($validate_user_sistemas)

<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Punto fuerte</label>
  <select required name="id_theme_user" style="width: 100%" class="form-select form-select-lg mb-3" aria-label="Large select example">
    @php
    $theme_user = null;
    @endphp
    @foreach ($themes_users as $t) {
        @if ($t->id == $user->id_theme_user) {
            @php
            $theme_user = $t->theme_user
            @endphp
        }
        @endif
    }
    @endforeach
    @if($theme_user == null)
    <option value="">SELECCIONE SU PUNTO FUERTE</option>
    @else
      <option value="{{ $user->id_theme_user }}">{{ $theme_user }}</option>
    @endif

    @foreach ($themes_users as $t)
    @if($t->id != $user->id_theme_user)
    <option value="{{ $t->id }}">{{ $t->theme_user }} </option>
    @endif
    @endforeach
  </select>
</div>

@endif

<div class="content_buttons" style="padding-bottom: 20px; display: flex;">
    <button class="btn btn-success" style="margin-right: 10px">Guardar Cambios</button>
    </form>
    @if ($validation_jefe || $user->id == $my_user->id)
    <form action="{{ route('dashboard.users.change_password' , $user->id) }}" method="get">
    <button href="" class="btn btn-primary">Cambiar Contraseña</button>
</form>
    @endif




</div>
@else
<p class="alert alert-danger" role="alert" class=""> No tienes permitido editar este usuario</p>
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
@vite(['resources/js/edit_user.js'])

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
