@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
@vite(['resources/css/view_product.css'])




@stop
@php
    $user = Auth::user();
@endphp
@section('content_header')

<h1>DETALLE DEL PRODUCTO</h1>

@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
         @if (session('message_error'))

              <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>

         @endif
@stop

@section('content')

<br>
<div id="carouselExampleRide" class="carousel slide" data-bs-ride="true">
    <div class="carousel-inner">
        @php
            $acumulador = 1;
        @endphp
        @foreach($images_product as $ip)
        @php
        $suma = 1;
    @endphp
         <div class="@if ($acumulador == 1){{ "carousel-item active"}}@else{{ "carousel-item"}}@endif">
        @if($product->id == $ip->id_product && $suma == 1)
        @php
        $suma = $suma + 1;
        $acumulador = $acumulador + 1;
    @endphp
 @if($suma == 1)
 <img src="{{ asset('storage/icons/logo.png') }}" alt="">
 @else
 <img src="{{ asset('storage/files/'.$ip->image) }}" alt="">
 @endif
        @endif

    </div>
        @endforeach


    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden"></span>
    </button>
  </div>
<br>
<form action="{{ route('dashboard.inventories.view_product.save_changes_view_product') }}" method="POST" enctype="multipart/form-data">
    @csrf
    <input readonly hidden type="text" required name="id_product" class="form-control" id="exampleFormControlInput1" placeholder="" value="{{ $product->id }}">
    <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">ID</label>
        <input  disabled readonly type="text" required name="id" class="form-control" id="exampleFormControlInput1" placeholder="" value="{{ $product->id }}">
      </div>
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nombre/Descripción</label>
    <input  type="text" required name="name" class="form-control" id="exampleFormControlInput1" placeholder="" value="{{ $product->name }}">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Marca</label>
    <input  type="text" required  name="brand" class="form-control" id="exampleFormControlInput1" placeholder="" value="{{ $product->brand }}">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Serial</label>
    <input  type="text" required  name="serie" class="form-control" id="exampleFormControlInput1" placeholder="" value="{{ $product->serie }}">
</div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Accesorios</label>
    <textarea  required class="form-control" id="exampleFormControlTextarea1" rows="3" name="accessories" placeholder="Ingrese observaciones" maxlength="500">{{ $product->accessories }}</textarea>
  </div>

  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Tipo de componente</label>
    <select name="id_type_component" id="id_type_component" required >

        @php
            $type_component = null;
        @endphp
  @foreach ($types_components as $t)
  @if ($t->id == $product->id_type_component)
  @php
  $type_component = $t->type_component;
  @endphp

  @endif
  @endforeach
  <option value="{{ $product->id_type_component }}">{{ $type_component }}</option>
        @foreach ($types_components as $t)
        @if ($t->id !== $product->id_type_component)
        <option value="{{ $t->id }}">{{ $t->type_component }}</option>
        @endif

        @endforeach
    </select>
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Estado de origen</label>
    <select required name="id_origin_certificate" id="id_origin_certificate">
        @php
        $origin_certificate = null;
    @endphp
@foreach ($origins_certificates as $o)
@if ($o->id == $product->id_origin_certificate)
@php
$origin_certificate = $o->origin_certificate;
@endphp

@endif
@endforeach
<option value="{{ $product->id_origin_certificate }}">{{ $origin_certificate }}</option>
    @foreach ($origins_certificates as $o)
    @if ($o->id !== $product->id_origin_certificate)
    <option value="{{ $o->id }}">{{ $o->origin_certificate }}</option>
    @endif

    @endforeach
</select>
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Estado</label>
    <select required name="id_state_certificate" id="id_state_certificate">
        @php
        $state_certificate = null;
    @endphp
@foreach ($states_certificates as $s)
@if ($s->id == $product->id_state_certificate)
@php
$state_certificate = $s->state_certificate;
@endphp

@endif
@endforeach
<option value="{{ $product->id_state_certificate }}">{{ $state_certificate }}</option>
    @foreach ($states_certificates as $s)
    @if ($s->id !== $product->id_state_certificate)
    <option value="{{ $s->id }}">{{ $s->state_certificate }}</option>
    @endif

    @endforeach
        </select>
  </div>
  @if ($validate_user_sistemas)
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">CAMBIAR IMAGEN PRINCIPAL</label>
    <input type="file" name="file" id="" accept="image/*" style="width: 100%">
  </div>

  <button class="btn btn-success">Guardar Cambios</button>
  <a href="{{ route('dashboard.inventories.view_product.images_product',$product->id) }}" class="btn btn-primary"> IMAGENES SECUNDARIAS </a>
  <br>

</form>


  @endif


  <br>
  <h1>ZONA DE REPORTES</h1>
  <br>
  <table class="table">

      <thead class="table-dark">
          <th>ID DE REPORTE</th>
          <th>REPORTE</th>
          <th>VER ACTA ASOCIADA</th>
      </thead>
      <tbody>
          @foreach ($reports_product as $r)
          <tr>
              <td>{{ $r->id }}</td>
              <td><b>{{ $r->report }}</b></td>
              <td><a href="{{ route('dashboard.certificates.view_certificate', $r->id_certificate ) }}" class="btn btn-primary"><i class="bi bi-eye-fill"></i></a></td>
          </tr>
          @endforeach
      </tbody>
  </table>

@stop



@section('js')
@if (!$validate_user_sistemas)
<script>
var inputsAndSelects = document.querySelectorAll('input, select, textarea');

console.log(inputsAndSelects);
// Iterar sobre cada elemento y establecer el atributo 'disabled'
inputsAndSelects.forEach(function (element) {
    element.setAttribute('disabled', 'true');
});
</script>

@endif
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
@stop
