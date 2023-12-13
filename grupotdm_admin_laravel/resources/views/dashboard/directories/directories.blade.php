@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@section('content_header')

<h1>DIRECTORIOS</h1>
<br>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
         @if (session('message_error'))

              <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>

         @endif

    <a href="{{ route('dashboard.create_repository') }}" class="btn btn-dark">CREAR REPOSITORIO</a>
    <br><br>

    <div class="content_search">
        <form action="{{ route('dashboard.directories.search') }}" method="get">
            <input type="text" name="search" placeholder="Buscar repositorios" style="width: 80%">
            <button id="btn_search" class="btn btn-primary">Buscar</button></form>
        </div>
<br>
@stop

@section('content')

    <table class="table">
        <thead>
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
            <tr>
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
                    <button class="btn btn-primary">VER</button>
                </form>

            </td>
            <td>
                @if ($d->id_user == $user->id)
                <form action="{{ route('dashboard.delete_directory') }}" method="post"  onsubmit="return confirmarEnvio()">
                    @csrf
                    <input type="number" value="{{ $d->id }}" hidden name="id_directory">
                    <button class="btn btn-danger">ELIMINAR</button>
                </form>
                @endif
            </td>
        </tr>
            @endforeach

        </tbody>
    </table>

@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')

<script>
    function confirmarEnvio() {
      // Mostrar un mensaje de confirmación
      var confirmacion = confirm("¿Estás seguro de eliminar este directorio?");

      // Si el usuario hace clic en "Aceptar", el formulario se enviará
      return confirmacion;
  }
</script>
@stop
