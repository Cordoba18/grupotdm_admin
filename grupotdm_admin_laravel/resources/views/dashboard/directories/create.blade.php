@extends('adminlte::page')

@section('title', 'GRUPO TDM')


@section('content_header')

<h1>CREAR REPOSITORIO</h1>

@if (session('message'))

              <p class="alert alert-danger" role="alert" class=""> {{ session('message') }}</p>

         @endif
@stop

@section('content')
<form action="{{ route('dashboard.create_repository.save_directory') }}" method="POST" enctype="multipart/form-data">
    @csrf
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nombre</label>
    <input type="text" required name="name" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese nombre del repositorio">
  </div>

    <button class="btn btn-success">Crear directorio</button>
</form>
@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')

@stop
