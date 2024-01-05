@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@php
    $user = Auth::user();
@endphp
<div class="content_loading" hidden>

</div>
@section('content_header')

<h1>Generar un ticket</h1>

@stop

@section('content')
<form id="miFormulario" action="{{ route('dashboard.tickets.save_ticket') }}" method="POST" enctype="multipart/form-data">
    @csrf
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nombre</label>
    <input type="text" required name="name" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese nombre del ticket">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Descripciòn</label>
    <textarea  required class="form-control" id="exampleFormControlTextarea1" rows="3" name="description" placeholder="Ingrese una descripcion" maxlength="500"></textarea>
  </div>

  <div class="mb-3">
    <label for="formFile" class="form-label">Subir un archivo</label>
    <input class="form-control" type="file" id="formFile" name="file">
  </div>
@if($validate_user_sistemas)

  <label for="exampleFormControlInput1" class="form-label">Seleccione el usuario a imponer tarea</label>
  <select name="id_user_destination" required style="width: 100%" class="form-select form-select-lg mb-3" aria-label="Large select example">
    <option value="">Seleccionar usuario</option>
    @foreach ($users as $u)
    <option value="{{ $u->id }}">{{ $u->name }}</option>
    @endforeach
  </select>
  @else

  <label for="exampleFormControlInput1" class="form-label">Seleccione el tema central</label>
  <select name="id_theme_user" required style="width: 100%" class="form-select form-select-lg mb-3" aria-label="Large select example">
    <option value="">Seleccionar tema</option>
    @foreach ($themes_users as $t)
    <option value="{{ $t->id }}">{{ $t->theme_user }}</option>
    @endforeach
  </select>

  @endif
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Dias de plazo</label>
    <input required id="input_days" type="number" name="number" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese dias de plazo">
</div>
<div class="form-check">
    <input id="check_today" class="form-check-input" type="checkbox" name="" value="Hoy" id="flexCheckDefault">
    <label class="form-check-label" for="flexCheckDefault">
      Hoy
    </label>
  </div>
  <div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Previa fecha de inicialización</label>
    <div class="col-sm-10">
      <input required type="text" id="input_date_start" name="date_start" readonly class="form-control-plaintext" value="0">
    </div>
</div>
  <div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Previa fecha de finalización</label>
    <div class="col-sm-10">
      <input required type="text" name="date_finally" id="input_date_finally" readonly class="form-control-plaintext" value="0">
    </div>
</div>
    <label for="exampleFormControlInput1" class="form-label">Prioridad</label>
    <select name="id_priority" required id="select_prioritys" style="width: 100%" class="form-select form-select-lg mb-3" aria-label="Large select example">
    @foreach ($priorities as $p)
    <option value="{{ $p->id }}">{{ $p->priority }} = Plazo de {{ $p->hour }} horas</option>
    @endforeach
    </select>
    <button class="btn btn-success">Crear ticket</button>
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
@vite(['resources/js/tickets.js'])
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
