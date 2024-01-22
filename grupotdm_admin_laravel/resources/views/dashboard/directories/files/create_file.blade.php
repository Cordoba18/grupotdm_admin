@extends('adminlte::page')

@section('title', 'GRUPO TDM')


@section('content_header')

<div class="content_loading" hidden>

</div>
<h1>CREAR ARCHIVO</h1>

@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
@stop

@section('content')
<form id="miFormulario" action="{{ route('dashboard.save_file') }}" method="POST" enctype="multipart/form-data">
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
  <div class="mb-3">
  <div class="content_buttons" style="display: flex">
    <button class="btn btn-success" style="margin-right: 10px">Crear archivo</button>
</form>
<form action="{{ route('dashboard.view_directory') }}" method="get">
    <input type="number" name="id" value="{{ $id_directory}}" hidden>
    <button class="btn btn-primary">VOLVER</button>
</form>
</div>
</div>
@stop

@section('css')
@vite('resources/css/content_loading.css')
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
