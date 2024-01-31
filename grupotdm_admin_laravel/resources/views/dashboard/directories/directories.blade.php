@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <link href="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.css" rel="stylesheet">
    @vite('resources/css/directories.css')
    @stop
@section('content_header')

<h1>DIRECTORIOS</h1>
<br>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
         @if (session('message_error'))

              <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>

         @endif

    <a href="{{ route('dashboard.create_repository') }}" class="btn btn-dark" id="btn_create_directory">CREAR DIRECTORIO <i class="bi bi-folder-plus"></i></a>
    <br><br>

    <div class="content_search">
        <form action="{{ route('dashboard.directories.search') }}" method="get">
            <input type="text" name="search" placeholder="Buscar repositorios">
            <button id="btn_search" class="btn btn-primary"><i class="bi bi-search"></i></button></form>
        </div>
<br>
@stop

@section('content')

    <table id="miTabla" class="table table-bordered table-striped dataTable">
        <thead class="table-dark">
         <th>NOMBRE</th>
         <th>Codigo</th>
         <th>FECHA CREACION</th>
         <th>ULTIMA FECHA DE MODIFICACION</th>
         <th>PROPIETARIO</th>
         <th>VER</th>
         <th>ACCION</th>
        </thead>
        <tbody style="overflow-y: 300px;">
            @foreach ($directories as $d)
            <tr class="table-light">
            <td>{{ $d->name }}</td>
            @if($d->id_user == Auth::user()->id)
            <td>{{ $d->code }}</td>
            @else
            <td>OCULTO</td>
            @endif
            <td>{{ $d->date_create }}</td>
            <td>{{ $d->date_update }}</td>
            <td>{{ $d->name_user }}</td>
            <td>
                <form action="{{ route('dashboard.view_directory') }}" method="get">
                    <input type="number" name="id" value="{{ $d->id }}" hidden>
                    <button class="btn btn-primary"><i class="bi bi-eye-fill"></i></button>
                </form>

            </td>
            <td>
                @if ($d->id_user == $user->id)
                <form action="{{ route('dashboard.delete_directory') }}" method="post"  onsubmit="return confirmarEnvio()">
                    @csrf
                    <input type="number" value="{{ $d->id }}" hidden name="id_directory">
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
        "ordering": false, // Habilita la ordenación de columnas
        "info": false, // Muestra información sobre la paginación
        "autoWidth": true // Deshabilita el ajuste automático del ancho de las columnas

      });
    });
  </script>
<script>
    function confirmarEnvio() {
      // Mostrar un mensaje de confirmación
      var confirmacion = confirm("¿Estás seguro de eliminar este directorio?");

      // Si el usuario hace clic en "Aceptar", el formulario se enviará
      return confirmacion;
  }
</script>
@stop
@extends('layouts.content_notifications')
