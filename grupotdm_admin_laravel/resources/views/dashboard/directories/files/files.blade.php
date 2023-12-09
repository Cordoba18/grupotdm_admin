@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@section('content_header')

<h1>Archivos</h1>
<br>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
         @if (session('message_error'))

              <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>

         @endif

    <a href="{{ route('dashboard.create_file',$id) }}" class="btn btn-dark">CREAR ARCHIVO</a>
    <br>

@stop

@section('content')

    <table class="table">
        <thead>
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
            <tr>
            <td>{{ $f->id }}</td>
            <td>{{ $f->name }}</td>
            <td>{{ $f->date_create }}</td>
            <td>{{ $f->date_update }}</td>
            <td>{{ $f->name_user }}</td>
            <td>
                <form action="{{ route('dashboard.view_file') }}" method="get">
                <input type="number" value="{{ $f->id }}" hidden name="id_file">
                <input type="number" value="{{ $f->id_directory }}" hidden name="id_directory">
                <button class="btn btn-primary" href="">VER</button>
                </form>
            </td>
            <td>
                <a class="btn btn-success" href="{{ asset('storage/files/'.$f->directory."/".$f->file) }}" download="">Descargar {{$f->name }} <i class="bi bi-download"></i></a>
            </td>
            <td>
                @if ($f->id_user_directory == $user->id)
                <form action="{{route('dashboard.delete_file')}}" method="post" onsubmit="return confirmarEnvio()">
                    @csrf
                    <input type="number" value="{{ $f->id }}" hidden name="id_file">
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
        var confirmacion = confirm("¿Estás seguro de eliminar este archivo?");

        // Si el usuario hace clic en "Aceptar", el formulario se enviará
        return confirmacion;
    }
</script>
@stop
