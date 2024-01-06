@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
<style>
    body{
background-color: white;
margin: 0;
}

.content_loading{
    background-color: rgba(2, 2, 2, 0.3);
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 10000;
    position: fixed;
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
@php
    $user = Auth::user();
@endphp

@section('content_header')
<div class="content_loading" hidden>

</div>
<h1>CREAR UN PERMISO</h1>


@stop

@section('content')

<br>
<form id="miFormulario" action="{{ route('dashboard.permissions.create.save') }}" method="POST" enctype="multipart/form-data">
    @csrf
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nombre colaborador</label>
    <input type="text" required disabled name="name" class="form-control" id="exampleFormControlInput1" placeholder="" value="{{ $user->name }}">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Cedula</label>
    <input type="text" required disabled name="nit" class="form-control" id="exampleFormControlInput1" placeholder="" value="{{ $user->nit }}">
  </div>

  <div class="mb-3">
    <label for="formFile" class="form-label">FECHA DE SOLICITUD</label>
    <input required type="text" id="date_application" name="date_application" readonly class="form-control-plaintext">
  </div>

  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">MOTIVO</label><br>
    @foreach ($reasons as $r)
    <label>
        <input type="radio" name="id_reason" value="{{ $r->id }}" required>
        {{ $r->reason }}
      </label>
    @endforeach
</div>

<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">REPONE TIEMPO</label><br>
    @foreach ($replenish_times as $r)
    <label>
        <input type="radio" name="id_replenish_time" value="{{ $r->id }}" required>
        {{ $r->replenish_time }}
      </label>
    @endforeach
</div>

<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">DIA DE LLEGADA</label><br>

    <label>
        <input type="radio" name="id_day" id="id_day" value="1" required>
        HOY
      </label>
      <label>
        <input type="radio" name="id_day" id="id_day" value="2" required>
        MAÑANA
      </label>
</div>
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">HORA DE LLEGADA</label><br>
<label>
    <input type="time" id="input_time" disabled>
  </label>
</div>

<div class="mb-3">
    <label for="formFile" class="form-label">FECHA DE LLEGADA EN LA MAÑANA FINAL</label>
    <input required type="text" id="date_tomorrow" name="date_tomorrow" readonly class="form-control-plaintext" value="0">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">OBSERVACIONES</label>
    <textarea  required class="form-control" id="exampleFormControlTextarea1" rows="3" name="observations" placeholder="Ingrese observaciones" maxlength="500"></textarea>
  </div>

    <button class="btn btn-success">Crear Permiso</button>
</form>

@stop





@section('js')
@vite(['resources/js/create_permissions.js'])
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
