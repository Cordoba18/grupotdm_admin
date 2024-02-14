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
<h1>CREAR CANAL DE INTERNET</h1>
<br>
@if (session('message_error'))

              <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>

         @endif


@stop

@section('content')

<form id="miFormulario" action="{{ route("dashboard.wifi_channels.create.save") }}" method="post" enctype="multipart/form-data">
    @csrf
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Código</label>
    <input type="text" required name="code" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese codigo" value="">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Detalle</label>
    <input type="text" required name="detail" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese detalle" value="">
  </div>

  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Cantidad</label>
    <input type="text" required name="amount" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese cantidad " value="">
  </div>

  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Valor unitario</label>
    <input type="text" required name="unit_value" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese valor unitario " value="">
  </div>
  <div class="mb-3">
  <label for="exampleFormControlInput1"  class="form-label"  for="fecha">Selecciona fecha inicial:</label>
<input style="width: 100%" type="date" id="date_start" name="date_start">
</div>
<div class="mb-3">
<label for="exampleFormControlInput1"  class="form-label" for="fecha">Selecciona fecha de finalización:</label>
<input style="width: 100%" type="date" id="date_finish" name="date_finish">
</div>
  <button class="btn btn-primary" style="margin-bottom: 30px; width: 100%;">GUARDAR CANAL DE INTERNET  <i class="bi bi-floppy"></i></button>
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
