@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@section('content_header')

<div class="content_loading" hidden>

</div>
<h1>CREAR REPOSITORIO</h1>

@if (session('message'))

              <p class="alert alert-danger" role="alert" class=""> {{ session('message') }}</p>

         @endif
@stop

@section('content')
<form id="miFormulario" action="{{ route('dashboard.create_repository.save_directory') }}" method="POST" enctype="multipart/form-data">
    @csrf
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nombre</label>
    <input type="text" required name="name" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese nombre del repositorio">
  </div>

    <button class="btn btn-success">Crear directorio</button>
    <a href="{{ route('dashboard.directories') }}" class="btn btn-primary">Volver</a>
</form>
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
