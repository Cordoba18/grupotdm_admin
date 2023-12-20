@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
@stop
@php
    $user = Auth::user();
@endphp
@section('content_header')

<h1>PERMISOS</h1>
<br>
<a href="{{ route('dashboard.permissions.create') }}" class="btn btn-dark">GENERAR UN PERMISO</a>
<br>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
         <br>
    <div class="content_search">
            <form action="{{ route('dashboard.permissions') }}" method="get">

                <input type="text" name="search" placeholder="Buscar permiso">

        <button id="btn_search" class="btn btn-primary">Buscar</button>
    </form>
    </div>
    <br>


@stop

@section('content')

<table class="table">

    <thead>
        <th>ID</th>
        <th>FECHA DEL PERMISO</th>
        <th>NOMBRE DE COLABORADOR</th>
        <th>AREA</th>
        <th>DETALLE</th>
    </thead>

    <tbody>
        @foreach ($permissions as $p)
        @if ($p->id_area == $user->id_area || $validation_jefe || $p->id_user_collaborator == $user->id)
        <tr>
            <td>{{ $p->id }}</td>
            <td>{{ $p->date_exit }}</td>
            <td>{{ $p->name }}</td>
            <td>{{ $p->area }}</td>
            <td><a href="" class="btn btn-primary">VER DETALLE</a></td>
        </tr>

        @endif
        @endforeach
    </tbody>
</table>

@stop



@section('js')
@stop
