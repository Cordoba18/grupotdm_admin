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
<h1>TPVS PLANTILLA </h1>
<br>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
         <form action="{{ route('dashboard.spreadsheets.pdf') }}" method="get">
            <input type="text" hidden name="id_spreadsheets" value="{{ $id }}">
            <input type="text" hidden name="id_companie" value="1">
            <button href="" class="btn btn-danger" id="btn_create_vpn">EXPORTAR EN PDF TMD <i class="bi bi-file-earmark-spreadsheet-fill"></i></button>
         </form>

         <form action="{{ route('dashboard.spreadsheets.pdf') }}" method="get">
            <input type="text" hidden name="id_spreadsheets" value="{{ $id }}">
            <input type="text" hidden name="id_companie" value="2">
         <button href="" class="btn btn-danger" id="btn_create_vpn">EXPORTAR EN PDF TMDF <i class="bi bi-file-earmark-spreadsheet-fill"></i></button>
        </form>
@stop

@section('content')



<table id="miTabla" class="table table-bordered table-striped dataTable">

    <thead class="table table-dark">
        <th>ESTADO</th>
        <th>TPV</th>
        <th>TIENDA</th>
        <th>TOTAL POS</th>
        <th>TOTAL CUADRE</th>
        <th>TOTAL DIFERENCIA</th>
        <th>VER</th>
    </thead>

    <tbody>
        @foreach ($spreadsheet_tpvs as $s)
        <tr >

                <td style="font-size: 30px;">@if($s->id_state == 3)
                    <i style="font-weight: bold" class="bi bi-file-earmark-spreadsheet" style="color: yellow;"></i>
                    @else<i class="bi bi-file-earmark-spreadsheet" style="color: green;"></i>@endif</td>
            <td>{{ $s->tpv }}</td>
            <td>{{ $s->shop }}</td>
            <td>{{ $s->total }}</td>
            <td>{{ $s->sub_total }}</td>
            <td>{{ $s->difference }}</td>

            <td><a href="{{ route('dashboard.spreadsheets.tpvs.rows_tpvs', $s->id) }}" class="btn btn-primary"><i class="bi bi-eye-fill"></i></a></td>
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
