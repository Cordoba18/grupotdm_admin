@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')

<style>
    select{
   width: 100%; border: 0; padding: 10px;
}
</style>
@vite('resources/css/content_loading.css')
@stop
@php
    $user = Auth::user();
@endphp

@section('content_header')
<div class="content_loading" hidden>

</div>
<h1>CREAR UN NUEVO PRODUCTO</h1>

@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
         @if (session('message_error'))

              <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>

         @endif
@stop

@section('content')

<br>
<form id="miFormulario" action="{{ route('dashboard.inventories.create.save') }}" method="POST" enctype="multipart/form-data">
    @csrf
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nombre/Descripción</label>
    <input type="text" required name="name" class="form-control" id="exampleFormControlInput1" placeholder="" value="">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Marca</label>
    <input type="text" required  name="brand" class="form-control" id="exampleFormControlInput1" placeholder="" value="">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Serial</label>
    <input type="text" required id="input_serie" name="serie" class="form-control"  placeholder="" value="">
    <button type="button" class="btn btn-dark" id="btn_serie">GENERAR SERIAL ALEATORIA</button>
    <span style="color: red;">El serial no debe pertenecer a ningun otro producto</span>
</div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Accesorios</label>
    <textarea  required class="form-control" id="exampleFormControlTextarea1" rows="3" name="accessories" placeholder="Ingrese observaciones" maxlength="500"></textarea>
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">SUBIR UNA IMAGEN</label>
    <input required type="file" name="file" id="" accept="image/*" style="width: 100%">
    <span style="color: green;">*Podras ingresar otras imagenes luego de haber creado el producto*</span>
  </div>

  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Tipo de componente</label>
    <select name="id_type_component" id="id_type_component" required >
        <option value="">Tipo de componente</option>
        @foreach ($types_components as $t)
        <option value="{{ $t->id }}">{{ $t->type_component }}</option>
        @endforeach
    </select>
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Estado de origen</label>
    <select required name="id_origin_certificate" id="id_origin_certificate">
        <option value="">Estado de origen</option>
    @foreach ($origins_certificates as $o)
    <option value="{{ $o->id }}">{{ $o->origin_certificate }}</option>
    @endforeach
</select>
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Estado</label>
    <select required name="id_state_certificate" id="id_state_certificate">
        <option value="">Estado</option>
        @foreach ($states_certificates as $s)
        <option value="{{ $s->id }}">{{ $s->state_certificate }}</option>
        @endforeach
        </select>
  </div>
    <button class="btn btn-success">Crear Producto</button>
</form>

@stop



@section('js')


@vite(['resources/js/create_product.js'])
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
