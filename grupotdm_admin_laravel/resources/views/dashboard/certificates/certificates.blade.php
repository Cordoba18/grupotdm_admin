@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <link href="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.css" rel="stylesheet">
    @stop

@section('content_header')

<h1>CERTIFICADOS/ACTAS</h1>
<br>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
         @if (session('message_error'))

              <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>

         @endif

    <a href="{{ route('dashboard.certificates.create') }}" class="btn btn-dark">CREAR UNA ACTA</a>
    <br><br>

    <div class="content_search">
        <form action="{{ route('dashboard.certificates') }}" method="get">
            <input type="text" name="search" placeholder="Buscar actas" style="width: 80%">
            <button id="btn_search" class="btn btn-primary">Buscar</button></form>
        </div>
<br>
@stop

@section('content')
<table id="miTabla" class="table table-bordered table-striped dataTable">
    <thead class="table table-dark">
        <th>ID</th>
        <th>TIPO DE ACTA</th>
        <th>FECHA</th>
        <th>USUARIO CREACIÓN</th>
        <th>USUARIO QUE RECIBE</th>
        <th>ESTADO</th>
        <th>ACCION</th>
    </thead>
    <tbody>
        @foreach ($certificates as $c)
        @if($c->id_user_delivery == $user->id || $c->id_user_receives == $user->id || $user->id_area == 2 || $user->id_area == 1 || $user->id_area == 16)
        <tr id="certificate">
        <td>{{ $c->id }}</td>
        <td>{{ $c->proceeding }}</td>
        <td>{{ $c->date }}</td>
        <td><a  style="font-weight: bold;color: black" href="{{ route('dashboard.users.view_user', $c->id_user_delivery) }}">{{ $c->name_delivery }}</a></td>
        <td><a  style="font-weight: bold;color: black" href="{{ route('dashboard.users.view_user', $c->id_user_receives) }}">{{ $c->name_receives }}</a></td>
        <td>{{ $c->state }}</td>
        <td><input type="number" hidden id="id_state" value="{{ $c->id_state }}"><a href="{{ route('dashboard.certificates.view_certificate', $c->id) }}" class="btn btn-primary"><i class="bi bi-eye-fill"></i></a> @if ($c->id_user_delivery == $user->id)
            <form action="{{ route('dashboard.certificates.delete') }}" method="post"  onsubmit="return confirmarEnvio()">
                @csrf
                <input type="number" value="{{ $c->id }}" hidden name="id_certificate">
                <button class="btn btn-danger"><i class="bi bi-trash3"></i></button>
            </form>
            @endif</td>
        @endif
    </tr>
        @endforeach

    </tbody>
</table>
@stop


@section('js')
@vite(['resources/js/certificates.js'])
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
      var confirmacion = confirm("¿Estás seguro de eliminar esta acta?");

      // Si el usuario hace clic en "Aceptar", el formulario se enviará
      return confirmacion;
  }
</script>
@stop
