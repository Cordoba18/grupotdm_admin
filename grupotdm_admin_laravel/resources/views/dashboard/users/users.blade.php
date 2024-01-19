@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@php
    $user = Auth::user();
@endphp
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">

    <link href="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.css" rel="stylesheet">
    @vite(['resources/css/view_users.css'])
@stop

@section('content_header')

<h1>Usuarios</h1>
<br>
@if ($validation_jefe)
<a href="{{ route('dashboard.users.new_user') }}" class="btn btn-primary" id="btn_create_user">CREAR NUEVO USUARIO</a>
    <br>
    @if (session('message'))

    <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

@endif
<br>
    <div class="content_search">
        <form action="{{ route('dashboard.users.search_users') }}" method="get">
    <input type="text" name="search" placeholder="Buscar" id="Buscar usuarios">
    <button id="btn_search" class="btn btn-primary"><i class="bi bi-search"></i></button>
</form>
</div>
@endif

@stop

@section('content')

    <table id="miTabla" class="table table-bordered table-striped dataTable">
        <thead class="table-dark">
         <th>ID</th>
         <th>NOMBRE</th>
         <th>NIT</th>
         <th>CORREO</th>
         <th>COMPAÑIA</th>
         <th>AREA</th>
         <th>CARGO</th>
         <th>ESTADO</th>
         @if ($validation_jefe || $validate_user_sistemas)
         <th>EDITAR</th>
         @endif

        </thead>
        <tbody>
            <div class="content_users">

                @foreach ($users as $u)
                <tr>
                <td>{{ $u->id }}</td>
                <td>{{ $u->name }}</td>
                <td>{{ $u->nit }}</td>
                <td>{{ $u->email }}</td>
                <td>{{ $u->company }}</td>
                <td>{{ $u->area }}</td>
                <td>{{ $u->chargy }}</td>
                <td>{{ $u->state }}</td>
                @if ($validation_jefe || $validate_user_sistemas) <td>
                    <form action="{{ route('dashboard.users.edit_profile' , $u->id)}}" method="get">
                    <button href="" class="btn btn-outline-primary"><i class="bi bi-pencil-square"></i></button>
                </form>
                    <form action="{{ route('dashboard.users.delete') }}" method="post">
                        @csrf
                        <input hidden type="text" name="id_jefe" value="{{ $user->id }}">
                        <input hidden type="text" name="id" value="{{ $u->id }}">
                    @if ($u->id_state == 1)
                    <button class="btn btn-outline-danger" href=""><i class="bi bi-trash3"></i></button></td>
                    @else
                    <button class="btn btn-outline-success" href="">ACTIVAR</button></td>
                @endif
            </form>
            @endif
            </tr>
                @endforeach
            </div>
        </tbody>
    </table>
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
        "autoWidth": true // Deshabilita el ajuste automático del ancho de las columnas

      });
    });
  </script>
@stop
