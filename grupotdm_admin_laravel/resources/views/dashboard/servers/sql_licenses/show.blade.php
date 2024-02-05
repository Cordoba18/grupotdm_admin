@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
@vite('resources/css/content_loading.css')
@vite('resources/css/sql_licenses.css')

<link href="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">


@stop
@php
    $user = Auth::user();
@endphp
@section('content_header')
<div class="content_loading" hidden>

</div>
<h1>LICENCIAS SQL</h1>
<br>

<a href="{{  route('dashboard.servers.sql_licenses.create') }}" class="btn btn-dark" id="btn_create_sql_license">CREAR LICENCIA SQL <i class="bi bi-hdd-rack"></i></a>
<br>
<br>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
         <br>
         {{-- <div class="content_search">
            <form action="{{ route('dashboard.inventories') }}" method="get">

                @if ($search)
                <input type="text" name="search" placeholder="Buscar" id="Buscar productos" value="{{ $search }}">
                @else
                <input type="text" name="search" placeholder="Buscar" id="Buscar productos">
                @endif
                <select name="filter" id="" >
                    @php
                    $f = "";
                    @endphp

                    @if($filter)

                    @foreach ($filters as $frs)
                    @if($frs->id == $filter)
                    @php
                        $f = $frs->state;
                    @endphp
                    @endif
                    @endforeach
                    <option value="{{ $filter }}">{{ $f }}</option>
                    <option value="">SIN FILTRO</option>
                    @else
                    <option value="">Seleccione un filtro</option>

                    @endif

                    @foreach ($filters as $f)
                    @if($filter != $f->id)
                    <option value="{{ $f->id }}">{{ $f->state }}</option>
                    @endif

                    @endforeach
                </select>
        <button id="btn_search" class="btn btn-primary"><i class="bi bi-search"></i></button>
    </form>
    </div> --}}


@stop

@section('content')


<div class="content_sql_licenses">

    @foreach ($sql_licenses as $s)
    <div class="content_sql_license">
        <div class="content_header_sql_license">
            <i class="bi bi-filetype-sql"></i>
        </div>
        <div class="content_fooder_sql_license">
            <p> {{ $s->name }}</p>
            <form action="{{ route('dashboard.servers.sql_licenses.delete') }}" method="post" onsubmit="return confirmarEnvio()">
                @csrf

                <input type="number" hidden value="{{ $s->id }}" name="id_sql_license">
                <button class="btn btn-danger"> ELIMINAR <i class="bi bi-trash"></i></button>
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
      var confirmacion = confirm("¿Estás seguro de eliminar esa licencia SQL?");

      // Si el usuario hace clic en "Aceptar", el formulario se enviará
      return confirmacion;
  }
</script>
<script src="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.js"></script>

{{-- <script>
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
  </script> --}}
@stop
@extends('layouts.content_notifications')
