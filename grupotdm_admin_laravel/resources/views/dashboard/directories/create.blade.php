@extends('adminlte::page')

@section('title', 'GRUPO TDM')

<div class="content_loading" hidden>

</div>
@section('content_header')

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
    <link rel="stylesheet" href="/css/admin_custom.css">
    <style>
        body{
    background-color: white;
    margin: 0;
}

.content_loading{
    background-color: rgba(2, 2, 2, 0.3);
    width: 100vw; /* 100% del ancho del viewport */
    height: 100vh;
    position: fixed;
    z-index: 10000;
}
.content_loading .content_logo{

    position: fixed;
    transform: translate(-50%, -50%);
    left: 50%;
    top: 50%;
    border-radius: 50px;
    border: 6px solid;
    padding: 20px;
    background-color: white;
    animation: start_loading 0.5s;

}
.content_loading .content_logo img{
    width: 100%;
    height: 100%;
    object-fit: cover;
}

@keyframes start_loading{

    0%{
        opacity: 0;
       transform: translateX(-50%) translateY(-100%);
    }
    100%{
        opacity: 1;
        transform: translateX(-50%) translateY(-50%);
    }
}
@media (max-width:700px){
    .content_loading .content_logo{
        width: 100vw; /* 100% del ancho del viewport */
    height: 100vh;

    }
    .content_loading .content_logo{
        border-radius: 0;
    }
    .content_loading .content_logo img{
    object-fit: contain;
}
}
    </style>

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
