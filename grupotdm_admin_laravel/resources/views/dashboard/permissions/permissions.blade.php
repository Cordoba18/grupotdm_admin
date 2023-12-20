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
        @if ($p->id_area == $user->id_area || $validation_jefe || $p->id_user_collaborator == $user->id || $user->id_area == 16)
        <tr id="permission">
            <td>{{ $p->id }}</td>
            <td>{{ $p->date_application }}</td>
            <td>{{ $p->name }}</td>
            <td>{{ $p->area }}</td>
            <td>{{ $p->reason }}</td>
            <td>{{ $p->replenish_time }}</td>
            <td><b>{{ $p->state }}</b></td>
            <td>
                <input type="number" hidden id="id_state" value="{{ $p->id_state }}">
                <a href="{{ route('dashboard.permissions.view_permission', $p->id) }}" class="btn btn-primary">VER DETALLE</a> @if($p->id_user_collaborator == $user->id)
                <form action="{{ route('dashboard.permissions.delete') }}" method="post">
                    @csrf
                    <input type="number" hidden name="id_permission" value="{{ $p->id }}">
                    <button href="" class="btn btn-danger">ELIMINAR</button>

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
@stop
