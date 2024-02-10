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

<form id="miFormulario" action="" method="post" enctype="multipart/form-data">
    @csrf
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nombre/Descripción</label>
    <input type="text" required name="name" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese nombre del servidor" value="">
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
