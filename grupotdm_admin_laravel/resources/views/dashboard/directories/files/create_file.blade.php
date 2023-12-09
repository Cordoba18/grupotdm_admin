@extends('adminlte::page')

@section('title', 'GRUPO TDM')


@section('content_header')

<h1>CREAR ARCHIVO</h1>

@if (session('message'))

              <p class="alert alert-danger" role="alert" class=""> {{ session('message') }}</p>

         @endif
@stop

@section('content')
<form action="{{ route('dashboard.save_file') }}" method="POST" enctype="multipart/form-data">
    @csrf

        <input type="number" hidden required name="id_directory" class="form-control" id="exampleFormControlInput1" value="{{ $id_directory }}">

<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nombre</label>
    <input type="text" required name="name" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese nombre del archivo">
  </div>

  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">CODIGO DEL REPOSITORIO</label>
    <input id="code" type="number" inputmode="none" maxlength="6" inputmode="numeric" pattern="[0-9]*" placeholder="Ingrese el codigo" name="code" required>
  </div>

  <div class="mb-3">
    <label for="formFile" class="form-label">Subir un archivo</label>
    <input required class="form-control" type="file" id="formFile" name="file">
  </div>
    <button class="btn btn-success">Crear archivo</button>
</form>
@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')

@stop
