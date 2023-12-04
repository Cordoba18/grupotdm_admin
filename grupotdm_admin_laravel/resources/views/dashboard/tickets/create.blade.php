@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@php
    $user = Auth::user();
@endphp
@section('content_header')

<h1>Generar un ticket</h1>


@stop

@section('content')
<form action="">
    @csrf
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nombre</label>
    <input type="text" name="name" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese nombre del ticket">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Descripciòn</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="description"></textarea>
  </div>

  <div class="mb-3">
    <label for="formFile" class="form-label">Subir un archivo</label>
    <input class="form-control" type="file" id="formFile">
  </div>

  <label for="exampleFormControlInput1" class="form-label">Seleccione el usuario a imponer tarea</label>
  <select style="width: 100%" class="form-select form-select-lg mb-3" aria-label="Large select example">
    <option selected>Seleccionar usuario</option>
  </select>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Dias de plazo</label>
    <input type="text" name="number" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese dias de plazo">
</div>
<div class="form-check">
    <input class="form-check-input" type="checkbox" name="" value="Hoy" id="flexCheckDefault">
    <label class="form-check-label" for="flexCheckDefault">
      Hoy
    </label>
  </div>
  <div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Previa fecha de finalizacion</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="20/12/2023 14:15:00">
    </div>
    <label for="exampleFormControlInput1" class="form-label">Prioridad</label>
    <select style="width: 100%" class="form-select form-select-lg mb-3" aria-label="Large select example">
      <option selected>Seleccionar la prioridad</option>
    </select>
    <button class="btn btn-success">Crear ticket</button>
</form>
@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')

@stop
