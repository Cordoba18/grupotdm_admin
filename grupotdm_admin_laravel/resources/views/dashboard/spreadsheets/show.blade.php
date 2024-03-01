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
<h1>PLANTILLAS</h1>
<br>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif


         <a style="width: 100%;" href="{{ route("dashboard.spreadsheets.shops") }}" class="btn btn-success"> TIENDAS DE TESOREROS </a>


@stop

@section('content')


<table id="miTabla" class="table table-bordered table-striped dataTable">

    <thead class="table">
        <th>ID</th>
        <th>FECHA DE PLANTILLA</th>
        <th>VER</th>
    </thead>

    <tbody>
        @foreach ($spreadsheets as $s)
        <tr>
            <td>{{ $s->id }}</td>
            <td>{{ $s->date_previous }}</td>
            <td><a href="{{ route('dashboard.spreadsheets.tpvs', $s->id) }}" class="btn btn-primary"><i class="bi bi-eye-fill"></i></a></td>
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
        "searching": true, // Deshabilita la función de búsqueda
        "ordering": true, // Habilita la ordenación de columnas
        "info": false, // Muestra información sobre la paginación
        "autoWidth": true // Deshabilita el ajuste automático del ancho de las columnas

      });
    });
  </script>
@stop
@extends('layouts.content_notifications')
