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

<h1>CREAR SERVIDOR</h1>
<br>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif


@stop

@section('content')

<form id="miFormulario" action="{{ route('dashboard.serves.create.save') }}" method="post">
    @csrf
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nombre/Descripción</label>
    <input type="text" required name="name" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese nombre del servidor" value="">
  </div>

  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">OS</label>
    <input type="text" required name="OS" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese OS del servidor" value="">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Servicio</label>
    <input type="text" required name="service" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese nombre del servidor" value="">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Observaciones</label>
    <textarea  required class="form-control" id="observations" rows="3" name="observations" placeholder="Ingrese obsercaciones del servidor" maxlength="500"></textarea>
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">RAM</label>
    <input type="text" required name="RAM" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese RAM del servidor" value="">
  </div>

  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">vCPU</label>
    <input type="text" required name="vCPU" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese nombre del servidor" value="">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Total DD</label>
    <input type="number" required name="totaldd" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese total DD del servidor" value="">
  </div>

  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">IP</label>
    <input type="text" required name="ip" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese ip del servidor" value="">
  </div>

  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">SPLA RDP TS</label>
    <input type="text" required name="SPLA_RDP_TS" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese SPLA_RDP-TS del servidor" value="">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">SPLA_EXCEL</label>
    <input type="text" required name="SPLA_EXCEL" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese ip del servidor" value="">
  </div>
  <button class="btn btn-primary" style="margin-bottom: 30px; width: 100%;">GUARDAR SERVIDOR  <i class="bi bi-floppy"></i></button>
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
