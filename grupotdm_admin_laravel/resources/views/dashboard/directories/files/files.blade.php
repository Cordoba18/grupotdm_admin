@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@section('content_header')

@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">

    <link href="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.css" rel="stylesheet">
    @vite( 'resources/css/files.css')
@stop
<h1>Archivos</h1>
<br>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
         @if (session('message_error'))

              <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>

         @endif

    <a href="{{ route('dashboard.create_file',$id) }}" class="btn btn-dark" id="btn_create_file">CREAR ARCHIVO <i class="bi bi-file-earmark-plus"></i></a>
    <a href="{{ route('dashboard.directories') }}" class="btn btn-success" id="btn_return_directorie">Volver</a>
    <br>
<br>
<div class="content_search">
    <form action="{{ route('dashboard.view_directory.search') }}" method="get">
        <input type="number" name="id" placeholder="Buscar archivos" value="{{ $id }}" hidden>
        <input type="text" name="search" placeholder="Buscar archivos">
        <button id="btn_search" class="btn btn-primary"><i class="bi bi-search"></i></button></form>
</div>
@stop

@section('content')

    <table id="miTabla" class="table table-bordered table-striped dataTable">
        <thead class="table-dark">
         <th>ID</th>
         <th>NOMBRE</th>
         <th>FECHA DE CREACION</th>
         <th>FECHA DE MODIFICACION</th>
         <th>USUARIO DE MODIFICACION</th>
         <th>VER</th>
         <th>DESCARGAR</th>
         <th>ELIMINAR</th>


        </thead>
        <tbody style="overflow-y: 300px;">
            @foreach ($files as $f)
            <tr class="table-secondary">
            <td>{{ $f->id }}</td>
            <td>{{ $f->name }}</td>
            <td>{{ $f->date_create }}</td>
            <td>{{ $f->date_update }}</td>
            <td>{{ $f->name_user }}</td>
            <td>
                <form action="{{ route('dashboard.view_file') }}" method="get">
                <input type="number" value="{{ $f->id }}" hidden name="id_file">
                <input type="number" value="{{ $f->id_directory }}" hidden name="id_directory">
                <button class="btn btn-primary" href=""><i class="bi bi-eye-fill"></i></button>
                </form>
            </td>
            <td>
                <a class="btn btn-success" href="{{ asset('storage/files/'.$f->directory."/".$f->file) }}" download="">Descargar Archivo<i class="bi bi-download"></i></a>
            </td>
            <td>
                @if ($f->id_user_directory == $user->id)
                <form action="{{route('dashboard.delete_file')}}" method="post" onsubmit="return confirmarEnvio()">
                    @csrf
                    <input type="number" value="{{ $f->id }}" hidden name="id_file">
                    <button class="btn btn-danger"><i class="bi bi-trash3"></i></button>
                </form>
                @endif
            </td>
        </tr>
            @endforeach

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
<script>
      function confirmarEnvio() {
        // Mostrar un mensaje de confirmación
        var confirmacion = confirm("¿Estás seguro de eliminar este archivo?");

        // Si el usuario hace clic en "Aceptar", el formulario se enviará
        return confirmacion;
    }
</script>
@stop
