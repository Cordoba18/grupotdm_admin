@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
@vite(['resources/css/view_product.css'])
<link href="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.css" rel="stylesheet">
@vite('resources/css/content_loading.css')

<link rel="stylesheet" href="/css/admin_custom.css">
@stop
@php
    $user = Auth::user();
@endphp

@section('content_header')
<div class="content_loading" hidden>

</div>
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
<form id="miFormulario" action="{{ route('dashboard.inventories.view_product.save_changes_view_product') }}" method="POST" enctype="multipart/form-data">
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
    @if($product->id_type_component == 2)
    <input  type="text" disabled  name="" class="form-control" id="exampleFormControlInput1" placeholder="" value="{{ $product->serie }}">
    @else

    <div class="content_code_references" id="content_code_references" style="width: 100%; height: 300px; display: flex; flex-wrap: wrap; align-items: center;">
        <div class="content_code_refences_header" style="width: 100%; display: flex; flex-direction: column; align-items: center; justify-content: center;">
            <div class="content_logo" style="width: 300px; height: 100px;">
                <img style="width: 100%; height: 100%; object-fit: contain;" src="{{ asset('storage/icons/logo.png') }}" alt="">
            </div>
            <div class="content_references_img" style="display: flex; flex-wrap: wrap; justify-content: center">
                {!! DNS1D::getBarcodeHTML("$product->serie", 'C128') !!}
                <div class="content_text_references" style="text-align: center; width: 100%; flex-direction: column; display: flex;"><b style="font-size: 40px;">{{ $product->serie }}</b><b style="width: 100%;font-size: 25px;">{{ $product->name }} ID  {{ $product->id }} </b>
                </div>
            </div>
        </div>




    </div>
    <button type="button" href="" onclick="imprimirDiv()" class="btn btn-dark" style="width: 100%">IMPRIMIR REFERENCIA</button>
    @endif
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
    <label for="exampleFormControlTextarea1" class="form-label">Estado de vida</label>
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
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Estado</label>
    <input  type="text" required  disabled readonly name="" class="form-control" id="exampleFormControlInput1" placeholder="" value="{{ $state }}">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">USUARIO CREADOR DEL PRODUCTO</label>
    <a href="{{ route('dashboard.users.view_user',$user_create_product->id) }}">
    <input  type="text" required style="width: 100%; padding: 10px; background-color: white; border: 1px solid black; font-weight: bold;"  name="" class="form-control" id="exampleFormControlInput1" placeholder="" value="{{ $user_create_product->name }}">
</a>
</div>
  @if ($validate_user_sistemas)
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">CAMBIAR IMAGEN PRINCIPAL</label>
    <input type="file" name="file" id="" accept="image/*" style="width: 100%">
  </div>
<div class="content_buttons" style="display: flex; flex-wrap: wrap; width: 100%;">
  <button style="margin: 5px; width: 100%;" class="btn btn-success">Guardar Cambios <i class="bi bi-box-arrow-down"></i></button>
  <a style="margin: 5px; width: 100%;" href="{{ route('dashboard.inventories.view_product.images_product',$product->id) }}" class="btn btn-primary"> IMAGENES SECUNDARIAS  <i class="bi bi-image"></i></a>
  <br>
</form>
<form style="width: 100%;" action="{{ route('dashboard.inventories.delete') }}" method="post" @if($product->id_state == 1) onsubmit="return confirmarEnvio()@endif">
    @csrf
    <input type="text" hidden value="{{ $product->id }}" name="id_product">
    @if($product->id_state == 1)
    <button style="margin: 5px; width: 100%; text-align: center;" class="btn btn-danger"><i class="bi bi-trash3"></i></button>
    @elseif ($product->id_state == 2)
    <button style="margin: 5px; width: 100%;" class="btn btn-success">ACTIVAR</button>
    @endif


</form>
</div>


  @endif


  <br>
  <h1>ZONA DE REPORTES</h1>
  <br>
  <table id="miTabla" class="table table-bordered table-striped dataTable">

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

<script src="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script>
    $(document).ready(function() {
      $('#miTabla').DataTable({
        "paging": true,  // Habilita la paginación
        "lengthChange": false, // Oculta el control para cambiar el número de elementos por página
        "searching": false, // Deshabilita la función de búsqueda
        "ordering": false, // Habilita la ordenación de columnas
        "info": false, // Muestra información sobre la paginación
        "autoWidth": true // Deshabilita el ajuste automático del ancho de las columnas

      });
    });
  </script>
@if (!$validate_user_sistemas)
<script>
var inputsAndSelects = document.querySelectorAll('input, select, textarea');

// Iterar sobre cada elemento y establecer el atributo 'disabled'
inputsAndSelects.forEach(function (element) {
    element.setAttribute('disabled', 'true');
});

</script>

@endif
<script>
    function imprimirDiv() {
        var contenidoDiv = document.getElementById('content_code_references');

        // Usa html2canvas para tomar una captura de pantalla del contenidoDiv
        html2canvas(contenidoDiv).then(function(canvas) {
            var imgData = canvas.toDataURL('image/png');

            var ventanaImpresion = window.open('', '_blank');
            ventanaImpresion.document.write('<html><head><title>REFERENCIA GRUPO TDM</title></head><body>');
                ventanaImpresion.document.write('<div style="width:100%;height: 150px;">');
            ventanaImpresion.document.write('<img src="' + imgData + '" style="width:100%; height: 100%;object-fit: contain;">');
            ventanaImpresion.document.write('</div>');
            ventanaImpresion.document.write('</body></html>');
            ventanaImpresion.document.close();

            // Luego, puedes imprimir la ventana de impresión

            setTimeout(() => {
            ventanaImpresion.print();
        }, 1000);
        });
    }
  </script>
  <script>
    function confirmarEnvio() {
      // Mostrar un mensaje de confirmación
      var confirmacion = confirm("¿Estás seguro de DESACTIVAR este producto?");
      // Si el usuario hace clic en "Aceptar", el formulario se enviará
      return confirmacion;
  }
</script>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
@stop
@extends('layouts.content_notifications')
