@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
@vite('resources/css/content_loading.css')
<link href="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">

@vite('resources/css/ip_linux_directions.css')
@stop
@php
    $user = Auth::user();
@endphp
@section('content_header')
<div class="content_loading" hidden>

</div>
<h1>IP's LINUX DIRECTIONS</h1>
<br>

<a href="{{ route('dashboard.servers.ip_linux_directions.create_ip_linux_directions') }}" class="btn btn-dark" id="btn_create">CREAR UN DIRECCIÓN IP LINUX  <i class="bi bi-clipboard2-data"></i></a>

<br>
<br>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
         <br>
         <div class="content_search">
            <form action="{{ route('dashboard.servers.ip_linux_directions') }}" method="get">

                @if ($search)
                <input type="text" name="search" placeholder="Buscar" id="Buscar productos" value="{{ $search }}">
                @else
                <input type="text" name="search" placeholder="Buscar" id="Buscar productos">
                @endif
        <button id="btn_search" class="btn btn-primary"><i class="bi bi-search"></i></button>
    </form>
    </div>


@stop

@section('content')


<div class="content_ip_linux_directions">
    @foreach ($ip_linux_directions as $i)
    <div class="cotent_ip_linux_direction">
        <div class="content_hader">
            <i class="bi bi-cpu"></i>
        </div>
        <div class="content_fooder">
            <b>Ip linux {{ $i->ip }}</b>
            <p>Server {{ $i->name }}</p>
            <form action="{{ route('dashboard.servers.ip_linux_directions.delete_ip_linux_directions') }}" method="post" onsubmit="return confirmarEnvio()">
                @csrf
                <input type="number" hidden value="{{ $i->id }}" name="id_ip_linux_direction">
                <button class="btn_delete"><i class="bi bi-trash"></i></button>
            </form>
        </div>
    </div>
    @endforeach
</div>

@stop



@section('js')

<script>
var route_view_user = "{{ route('dashboard.users.view_user', 0) }}".slice(0, -1);
function confirmarEnvio() {
      // Mostrar un mensaje de confirmación
      var confirmacion = confirm("¿Estás seguro de eliminar esa DIRECCIÓN IP LINUX?");

      // Si el usuario hace clic en "Aceptar", el formulario se enviará
      return confirmacion;
  }
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
