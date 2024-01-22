@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
<link href="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
@vite('resources/css/reports.css')
@stop
@php
    $user = Auth::user();
@endphp
@section('content_header')

<h1>REPORTES</h1>
<br>
         <div class="content_search">
            <form action="{{ route('dashboard.resports') }}" method="get">

                <input type="text" name="search" placeholder="Buscar Reporte" style="">
                    <select name="filter" id="" >
                    <option value="">Seleccione un filtro</option>
                    @foreach ($report_details as $r)
                        <option value="{{ $r->id }}">{{ $r->report }}</option>
                    @endforeach
                </select>
        <button id="btn_search" class="btn btn-primary"><i class="bi bi-search"></i></button>
    </form>
    </div>


@stop

@section('content')
@if ($reports)


<table id="miTabla" class="table table-bordered table-striped dataTable">

    <thead class="table-dark">
        <th>ID</th>
        <th>DECRIPCIÓN</th>
        <th>USUARIO DE ACCIÓN</th>
        <th>CLASE DE REPORTE</th>
        <th>FECHA Y HORA DE REPORTE</th>
    </thead>

    <tbody>
        @foreach ($reports as $r)
        @if($r->id_area == $user->id_area || $user->id_area == 1)
        <tr  class="table-light">
            <td>{{ $r->id }}</td>
            <td>{{ $r->description }}</td>
            <td>{{ $r->name_user }}</td>
            <td>{{ $r->report }}</td>
            <td>{{ $r->date }}</td>
        </tr>
        @endif

        @endforeach
    </tbody>
</table>
@else
<h1>No existe un resultado que coincida con tu búsqueda</h1>
@endif
@stop



@section('js')
<script src="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.js"></script>
<script>
    $(document).ready(function() {
      $('#miTabla').DataTable({
        "paging": true,  // Habilita la paginación
        "lengthChange": false, // Oculta el control para cambiar el número de elementos por página
        "searching": false, // Deshabilita la función de búsqueda
        "ordering": true, // Habilita la ordenación de columnas
        "info": false, // Muestra información sobre la paginación
        "autoWidth": true, // Deshabilita el ajuste automático del ancho de las columnas
        "order": [[0, 'asc']],
      });
    });
  </script>
@stop
@extends('layouts.content_notifications')
