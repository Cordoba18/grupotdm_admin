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
    <br>

@stop

@section('content')

    <table class="table">
        <thead>
         <th>NOMBRE</th>
         <th>FECHA CREACION</th>
         <th>ULTIMA FECHA DE MODIFICACION</th>
         <th>PROPIETARIO</th>
         <th>VER</th>
         <th>ELIMINAR</th>
        </thead>
        <tbody style="overflow-y: 300px;">
            @foreach ($directories as $d)
            <tr>
            <td>{{ $d->name }}</td>
            <td>{{ $d->date_create }}</td>
            <td>{{ $d->date_update }}</td>
            <td>{{ $d->name_user }}</td>
            <td>
                <a class="btn btn-primary" href="{{ route('dashboard.view_directory', $d->id) }}">VER</a>
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
