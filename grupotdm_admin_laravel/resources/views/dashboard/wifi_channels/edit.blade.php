@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
@vite('resources/css/content_loading.css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
@stop
@php
    $user = Auth::user();
@endphp
@section('content_header')
<div class="content_loading" hidden>

</div>
<h1>EDITAR CANAL DE INTERNET</h1>
<br>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif


@stop

@section('content')

<form id="miFormulario" action="{{ route("dashboard.wifi_channels.edit.save_changes") }}" method="post" enctype="multipart/form-data">
    @csrf
    <input type="number" hidden  required name="id" class="form-control" id="exampleFormControlInput1" placeholder="" value="{{ $wifi_channel->id }}">
    <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">ID</label>
        <input type="number" disabled required name="id" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese codigo" value="{{ $wifi_channel->id }}">
      </div>
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Código</label>
    <input type="text" required name="code" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese codigo" value="{{ $wifi_channel->code }}">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Detalle</label>
    <input type="text" required name="detail" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese detalle" value="{{ $wifi_channel->detail }}">
  </div>

  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Cantidad</label>
    <input type="text" required name="amount" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese cantidad " value="{{ $wifi_channel->amount }}">
  </div>

  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Valor unitario</label>
    <input type="text" required name="unit_value" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese valor unitario" value="{{ $wifi_channel->unit_value }}">
  </div>
  <div class="mb-3">
  <label for="exampleFormControlInput1"  class="form-label"  for="fecha">Selecciona fecha inicial:</label>
<input style="width: 100%" type="date" id="date_start" name="date_start" value="{{ $wifi_channel->date_start }}">
</div>
<div class="mb-3">
<label for="exampleFormControlInput1"  class="form-label" for="fecha">Selecciona fecha de finalización:</label>
<input style="width: 100%" type="date" id="date_finish" name="date_finish" value="{{ $wifi_channel->date_finish }}">
</div>
  <button class="btn btn-primary" style="margin-bottom: 5px; width: 100%;">GUARDAR CAMBIOS <i class="bi bi-floppy"></i></button>
</form>

<form action="{{ route('dashboard.wifi_channels.delete') }}" method="post">
    @csrf
    <input type="number" hidden  required name="id" class="form-control" id="exampleFormControlInput1" placeholder="" value="{{ $wifi_channel->id }}">
    <button class="btn btn-danger" style="margin-bottom: 30px; width: 100%;">ELIMINAR</button>
  </form>
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
