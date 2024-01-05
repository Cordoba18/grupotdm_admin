@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@php
    $my_user = Auth::user();
@endphp

<div class="content_loading" hidden>

</div>
@section('content_header')

<h1>Crear nuevo usuario para <b>{{ $area->area }}</b> </h1>
@if (session('message_error'))

              <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>

         @endif

@endsection
@section('content')


<form id="miFormulario" action="{{ route('dashboard.users.save_user') }}" method="post">
    @csrf
    <input type="number" hidden value="{{ $user->id }}" name="id">
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nombre</label>
    <input type="text" name="name" class="form-control" required id="exampleFormControlInput1" placeholder="Ingrese un nombre">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nit</label>
    <input type="number" name="nit" class="form-control" required id="exampleFormControlInput1" placeholder="Ingrese un nit">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Correo</label>
    <input type="email" name="email" class="form-control" required id="exampleFormControlInput1" placeholder="Ingrese un correo">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nueva contraseña</label>
    <input type="password" name="password" class="form-control" required id="exampleFormControlInput1" placeholder="Ingrese su contraseña">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Confirmar contraseña</label>
    <input type="password" name="password2" class="form-control" required id="exampleFormControlInput1" placeholder="Confirme su contraseña">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Compañia</label>
  <select required name="id_company" id="id_company" style="width: 100%" class="form-select form-select-lg mb-3" aria-label="Large select example">
    <option value="">SELECCIONE UNA COMPAÑIA</option>
    @foreach ($companies as $c)
    <option value="{{ $c->id }}">{{ $c->company }}</option>
    @endforeach
  </select>
</div>
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Tienda</label>
  <select name="id_shop" id="id_shop" style="width: 100%" class="form-select form-select-lg mb-3" aria-label="Large select example">
    <option value="">SELECCIONE UNA TIENDA</option>
    <option value="">NINGUNA</option>
    @foreach ($shops as $s)

    <option value="{{ $s->id }}">{{ $s->shop }}</option>
    @endforeach
    <div class="shops">
</div>
</select>
</div>
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Cargos</label>
  <select required name="id_chargy" id="id_chargy" style="width: 100%" class="form-select form-select-lg mb-3" aria-label="Large select example">
    <option value="">SELECCIONE UN CARGO</option>
    @foreach ($charges as $c)

    <option value="{{ $c->id }}">{{ $c->chargy }}</option>
    @endforeach
  </select>
</div>

@if($validate_user_sistemas)

<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Punto fuerte</label>
  <select required name="id_theme_user" style="width: 100%" class="form-select form-select-lg mb-3" aria-label="Large select example">
    <option value="">SELECCIONE SU PUNTO FUERTE</option>
    @foreach ($themes_users as $t)
    <option value="{{ $t->id }}">{{ $t->theme_user }}</option>
    @endforeach
  </select>
</div>

@endif

<div class="content_buttons" style="padding-bottom: 20px">
    <button class="btn btn-success">CREAR USUARIO</button>
    </form>

</div>
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
@vite(['resources/js/new_user.js'])
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
