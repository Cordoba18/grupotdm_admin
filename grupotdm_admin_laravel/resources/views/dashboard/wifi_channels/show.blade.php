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
<h1>CANALES DE INTERNET</h1>
<br>

<a href="{{  route('dashboard.wifi_channels.create') }}" class="btn btn-dark" id="btn_create">CREAR UN CANAL DE INTERNET  <i class="bi bi-key-fill"></i></a>

<a href="{{ route('dashboard.wifi_channels.export') }}" class="btn btn-success" id="btn_create">EXPORTAR EN EXCEL <i class="bi bi-file-earmark-spreadsheet-fill"></i></a>
<br>
<br>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
         <br>
         <div class="content_search">
            <form action="{{ route('dashboard.wifi_channels') }}" method="get">

                @if ($search)
                <input type="text" name="search" placeholder="Buscar" id="Buscar licencias" value="{{ $search }}">
                @else
                <input type="text" name="search" placeholder="Buscar" id="Buscar licencias">
                @endif
        <button id="btn_search" class="btn btn-primary"><i class="bi bi-search"></i></button>
    </form>
    </div>


@stop

@section('content')

<table id="miTabla" class="table table-bordered table-striped dataTable">
    <thead class="table-dark">
     <th>ID</th>
     <th>CODIGO</th>
     <th>DETALLE</th>
     <th>CANTIDAD</th>
     <th>FECHA DE INICIO</th>
     <th>FECHA DE FINALIZACIÓN</th>
     <th>VALOR UNITARIO</th>
     <th>ACCIÓN</th>


    </thead>
    <tbody>

            @foreach ($wifi_channels as $w)
            <tr>
                <td>{{ $w->id }}</td>
                <td>{{ $w->code }}</td>
                <td>{{ $w->detail }}</td>
                <td>{{ $w->amount }}</td>
                <td>{{ $w->date_start }}</td>
                <td>{{ $w->date_finish}}</td>
                <td>{{ $w->unit_value }}</td>
                <td><a  href="{{ route('dashboard.wifi_channels.edit', $w->id) }}" class="btn btn-success">EDITAR</a></td>
            </tr>
            @endforeach


    </tbody>
</table>



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
@stop
@extends('layouts.content_notifications')
