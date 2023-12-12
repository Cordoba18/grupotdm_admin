@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@php
    $my_user = Auth::user();
@endphp
@section('content_header')

<h1>Crear nuevo usuario para <b>{{ $area->area }}</b> </h1>
@if (session('message_error'))

              <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>

         @endif
@endsection
@section('content')


<form action="{{ route('dashboard.users.save_user') }}" method="post">
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
  <select required name="id_company" style="width: 100%" class="form-select form-select-lg mb-3" aria-label="Large select example">
    <option value="">SELECCIONE UNA COMPAÑIA</option>
    @foreach ($companies as $c)
    <option value="{{ $c->id }}">{{ $c->company }}</option>
    @endforeach
  </select>
</div>
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Cargos</label>
  <select required name="id_chargy" style="width: 100%" class="form-select form-select-lg mb-3" aria-label="Large select example">
    <option value="">SELECCIONE UN CARGO</option>
    @foreach ($charges as $c)

    <option value="{{ $c->id }}">{{ $c->chargy }}</option>
    @endforeach
  </select>
</div>
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Tienda</label>
  <select name="id_shop" style="width: 100%" class="form-select form-select-lg mb-3" aria-label="Large select example">
    <option value="">SELECCIONE UNA TIENDA</option>
    <option value="">NINGUNA</option>
    @foreach ($shops as $s)

    <option value="{{ $s->id }}">{{ $s->shop }}</option>
    @endforeach
    <div class="shops">
</div>
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
@stop

@section('js')

@stop
