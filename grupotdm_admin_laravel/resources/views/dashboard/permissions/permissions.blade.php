@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
<link rel="stylesheet" href="/css/admin_custom.css">
<link href="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
@stop
@php
    $user = Auth::user();
@endphp
@section('content_header')

<h1>PERMISOS</h1>
<br>
<a href="{{ route('dashboard.permissions.create') }}" class="btn btn-dark">GENERAR UN PERMISO</a>
<br>
<br>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
         <br>
    <div class="content_search">
            <form action="{{ route('dashboard.permissions') }}" method="get">

                <input type="text" name="search" placeholder="Buscar permiso" style="width: 80%">

        <button id="btn_search" class="btn btn-primary">Buscar</button>
    </form>
    </div>
    <br>


@stop

@section('content')

<table id="miTabla" class="table table-bordered table-striped dataTable">

    <thead class="table-dark">
        <th>ID</th>
        <th>FECHA DE SOLICITUD</th>
        <th>NOMBRE DE COLABORADOR</th>
        <th>AREA</th>
        <th>MOTIVO</th>
        <th>¿REPONE TIEMPO?</th>
        <th>ESTADO</th>
        <th>DETALLE</th>
    </thead>

    <tbody>
        @foreach ($permissions as $p)
        @if ($p->id_area == $user->id_area || $validation_jefe || $p->id_user_collaborator == $user->id || $user->id_area == 16 || $user->id_area == 9 || $user->id_area == 1)
        <tr id="permission">
            <td>{{ $p->id }}</td>
            <td>{{ $p->date_application }}</td>
            <td><a  style="font-weight: bold;color: black" href="{{ route('dashboard.users.view_user', $p->id_user_collaborator) }}">{{ $p->name }}</a></td>
            <td>{{ $p->area }}</td>
            <td>{{ $p->reason }}</td>
            <td>{{ $p->replenish_time }}</td>
            <td><b>{{ $p->state }}</b></td>
            <td>
                <input type="number" hidden id="id_state" value="{{ $p->id_state }}">
                <a href="{{ route('dashboard.permissions.view_permission', $p->id) }}" class="btn btn-primary"><i class="bi bi-eye-fill"></i></a> @if($p->id_user_collaborator == $user->id)
                <form action="{{ route('dashboard.permissions.delete') }}" method="post">
                    @csrf
                    <input type="number" hidden name="id_permission" value="{{ $p->id }}">
                    <button href="" class="btn btn-danger"><i class="bi bi-trash3"></i></button>

                </form>

            @endif</td>
        </tr>

        @endif
        @endforeach
    </tbody>
</table>

@stop



@section('js')
@vite(['resources/js/permissions.js'])
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
