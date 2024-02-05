@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
@vite('resources/css/content_loading.css')
@vite( 'resources/css/view_server.css')
<link href="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">


@stop
@php
    $user = Auth::user();
@endphp
@section('content_header')
<div class="content_loading" hidden>

</div>
<h1>SERVIDOR :  {{ $server->name }}</h1>
<br>
@if (session('message'))
              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>
         @endif
         @if (session('message_error'))
              <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>
         @endif

@stop

@section('content')
<div class="content_server_principal">
    <div class="content_left">
<form id="miFormulario" action="{{ route('dashboard.servers.view.save_changes') }}" method="post">
    @csrf
    <input type="number" hidden value="{{ $server->id }}" name="id_server">
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nombre/Descripción</label>
    <input type="text" required name="name" class="form-control" value="{{ $server->name }}" id="exampleFormControlInput1" placeholder="Ingrese nombre del servidor" value="">
  </div>

  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">OS</label>
    <input type="text" required name="OS" class="form-control" value="{{ $server->OS }}" id="exampleFormControlInput1" placeholder="Ingrese OS del servidor" value="">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Servicio</label>
    <input type="text" required name="service" class="form-control" value="{{ $server->service }}" id="exampleFormControlInput1" placeholder="Ingrese nombre del servidor" value="">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">RAM</label>
    <input type="text" required name="RAM" class="form-control" value="{{ $server->RAM }}" id="exampleFormControlInput1" placeholder="Ingrese RAM del servidor" value="">
  </div>

  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">vCPU</label>
    <input type="text" required name="vcpu" class="form-control" value="{{ $server->vcpu }}" id="exampleFormControlInput1" placeholder="Ingrese nombre del servidor" value="">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Total DD</label>
    <input type="number" required name="totaldd" value="{{ $server->totaldd }}" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese total DD del servidor" value="">
  </div>

  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">IP</label>
    <input type="text" disabled readonly name="ip" value="{{ $server->ip }}" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese ip del servidor" value="">
  </div>

  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">SPLA RDP TS</label>
    <input type="text" required name="SPLA_RDP_TS" value="{{ $server->SPLA_RDP_TS }}" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese SPLA_RDP-TS del servidor" value="">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">SPLA_EXCEL</label>
    <input type="text" required name="SPLA_EXCEL" value="{{ $server->SPLA_EXCEL }}" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese ip del servidor" value="">
  </div>

  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">ESTADO</label>
    <input readonly disabled type="text" name="state" value="{{ $server->state }}" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese ip del servidor" value="">
  </div>

  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Observaciones</label>
    <textarea  required class="form-control" id="observations" rows="3" name="observations" placeholder="Ingrese obsercaciones del servidor" maxlength="500">{{ $server->observations }}</textarea>
  </div>
  <button class="btn btn-primary" style="margin-bottom: 5px; width: 100%;">GUARDAR CAMBIOS  <i class="bi bi-pencil-square"></i></button>
</form>

<form style="width: 100%" action="{{ route('dashboard.servers.view.change_state_server') }}" method="post">
    @csrf
    <input type="number" hidden value="{{ $server->id }}" name="id_server">
    <button class="@if($server->id_state == 1)btn btn-danger @else btn btn-success @endif" style="margin-bottom: 30px; width: 100%;">  @if($server->id_state == 1)ELIMINAR <i class="bi bi-trash"></i>@else ACTIVAR <i class="bi bi-activity"></i> @endif</button>
</form>
</div>
<div class="content_right">
<h1>
    LICENCIAS SQL
</h1>

<form action="{{ route('dashboard.servers.view.add_sql_licenses_server') }}" method="post">

    @csrf
    <input type="number" hidden value="{{ $server->id }}" name="id_server">
    <div class="mb-3">
        <label for="formFile" class="form-label">AGREGAR LICENCIA</label>
            <select name="id_sql_licenses" id="id_sql_licenses" style="width: 100%;border: 0; padding: 10px" required>
                <option value="">Seleccione una licencia</option>
                @foreach ($sql_licenses as $s)
                <option value="{{ $s->id }}">{{ $s->name }}</option>
                @endforeach
            </select>
      </div>

      <button class="btn btn-primary" style="margin-bottom: 5px; width: 100%;">AGREGAR LICENCIA  <i class="bi bi-filetype-sql"></i></button>
</form>

<table id="miTabla" class="table table-bordered table-striped dataTable">

    <thead class="table">
        <th>Licencia</th>
        <th>Eliminar</th>
    </thead>

    <tbody>
        @foreach ($server_sql_licenses as $s)
        <tr>
            <td>{{ $s->name }}</td>
            <td><form action="{{ route('dashboard.servers.view.delete_sql_licenses_server') }}" method="post">

            @csrf
            <input type="number" hidden value="{{ $server->id }}" name="id_server">
            <input type="number" hidden value="{{ $s->id }}" name="id_server_sql_licenses">
            <button class="btn btn-danger" style="width: 100%;"> ELIMINAR <i class="bi bi-trash"></i></button>

        </form></td>
        </tr>
        @endforeach
    </tbody>
</table>
</div>
</div>
@stop






@section('js')

<script>
var route_view_user = "{{ route('dashboard.users.view_user', 0) }}".slice(0, -1);

</script>
<script src="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.js"></script>

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
