@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
@vite('resources/css/content_loading.css')
<link href="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
@stop
@php
    $user = Auth::user();
@endphp
@section('content_header')
<div class="content_loading" hidden>

</div>
<h1>Llave vpn <b> {{ $vpn->name }}</b></h1>
<br>
@if (session('message_error'))

              <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>

         @endif
         @if (session('message'))

         <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

    @endif


@stop

@section('content')

<form id="miFormulario" action="{{ route('dashboard.vpns.save_changes') }}" method="post" enctype="multipart/form-data">
    @csrf

    <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">ID</label>
        <input type="text" disabled name="id" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese nombre del servidor" value="{{ $vpn->id }}">
      </div>
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nombre</label>
    <input type="text" disabled name="name" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese nombre del servidor" value="{{ $vpn->name }}">
  </div>

  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Archivo</label>
    <div class="col-sm-10">
    <a id="file" class="btn btn-dark" href="{{ asset('storage/vpns/'.$vpn->file) }}" download="">Descargar archivo de {{$vpn->name }} <i class="bi bi-download"></i></a>
    <br>
</div>
</div>
<input type="number" name="id_vpn" hidden class="form-control" id="exampleFormControlInput1" value="{{ $vpn->id }}">
  <div class="mb-3">
    <label for="formFile" class="form-label">Cambiar archivo</label>
    <input class="form-control" type="file" id="formFile" name="file">
  </div>

  <div class="mb-3">
    <label for="formFile" class="form-label">CAMBIAR AREA DEL USUARIO</label>
    <select name="" id="id_area_user" style="width: 100%;border: 0; padding: 10px">
        <option value="">Seleccione un area</option>
        @foreach ($areas as $a)
        <option value="{{ $a->id }}">{{ $a->area }}</option>
        @endforeach
    </select>
  </div>
  <div class="mb-3">
    <label for="formFile" class="form-label">CAMBIAR USUARIO</label>
    <select name="id_user" id="id_user" style="width: 100%;border: 0; padding: 10px" required>
        <option value="{{ $vpn->id_user }}">{{ $vpn->name_user }} | @if($vpn->shop ){{ $vpn->shop }}@else SIN UBICACIÓN @endif</option>
    </select>
  </div>
  <div class="mb-3">
    <label for="formFile" class="form-label">VER USUARIO A RECIBIR</label>
    <br>
    <a  style="font-weight: bold;color: black; " href="{{ route('dashboard.users.view_user', $vpn->id_user) }}">{{ $vpn->name_user }} (Presiona para ver )</a>
</div>
  <button class="btn btn-primary" style="margin-bottom: 10px; width: 100%;">GUARDAR CAMBIOS</button>
</form>
<form action="{{ route('dashboard.vpns.view.change_state') }}" method="post">
    @csrf
    <input type="number" hidden value="{{ $vpn->id }}" name="id_vpn">
    <button class="@if($vpn->id_state == 1)btn btn-danger @else btn btn-success @endif" style="margin-bottom: 30px; width: 100%;">  @if($vpn->id_state == 1)ELIMINAR <i class="bi bi-trash"></i>@else ACTIVAR <i class="bi bi-activity"></i> @endif</button>
</form>


<h1>
    IP's LINUX
</h1>

<form action="{{ route('dashboard.vpns.view.add_ip_linux_direction') }}" method="post">

    @csrf
    <input type="number" hidden value="{{ $vpn->id }}" name="id_vpn">
    <div class="mb-3">
        <label for="formFile" class="form-label">AGREGAR IP LINUX</label>
            <select name="id_ip_linux_direction" id="id_ip_linux_direction" style="width: 100%;border: 0; padding: 10px" required>
                <option value="">Seleccione una dirección ip linux</option>
                @foreach ($ip_linux_directions as $i)
                <option value="{{ $i->id }}">{{ $i->name }} {{ $i->ip_server }}  | IP LINUX {{ $i->ip }} </option>
                @endforeach
            </select>
      </div>

      <button class="btn btn-primary" style="margin-bottom: 5px; width: 100%;">AGREGAR IP LINUX</button>
</form>

<table id="miTabla" class="table table-bordered table-striped dataTable">

    <thead class="table">
        <th>IP LINUX</th>
        <th>NOMBRE SERVIDOR</th>
        <th>IP SERVIDOR</th>
        <th>ELIMINAR</th>
    </thead>

    <tbody>
        @foreach ($vpn_servers as $v)
        <tr>
            <td>{{ $v->ip }}</td>
            <td>{{ $v->name }}</td>
            <td>{{ $v->ip_server }}</td>
            <td>
                <form action="{{ route('dashboard.vpns.view.delete_ip_linux_direction') }}" method="post" >
                    @csrf
                    <input type="number" hidden value="{{ $vpn->id }}" name="id_vpn">
                    <input type="number" hidden value="{{ $v->id }}" name="id">
                    <button class="btn btn-danger">ELIMINAR  <i class="bi bi-trash"></i></button></td>
                </form>

        </tr>
        @endforeach
    </tbody>
</table>

  @stop



@section('js')

@vite('resources/js/view_vpn.js')

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
@stop
@extends('layouts.content_notifications')
