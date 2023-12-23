@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@php
    $user = Auth::user();
@endphp
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('content_header')
@if (!$validation_jefe)
<h1>No estas autorizado para ver usuarios</h1>
@else
<h1>Usuarios</h1>
<br>
<a href="{{ route('dashboard.users.new_user') }}" class="btn btn-primary">CREAR NUEVO USUARIO</a>
    <br>
    @if (session('message'))

    <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

@endif
<br>
    <div class="content_search">
        <form action="{{ route('dashboard.users.search_users') }}" method="get">
    <input type="text" name="search" placeholder="Buscar" id="Buscar usuarios" style="width: 90%">
    <button id="btn_search" class="btn btn-primary">Buscar</button>
</form>
</div>
@endif

@stop

@section('content')
@if ($validation_jefe)

    <table class="table">
        <thead class="table-dark">
         <th>ID</th>
         <th>NOMBRE</th>
         <th>NIT</th>
         <th>CORREO</th>
         <th>COMPAÑIA</th>
         <th>AREA</th>
         <th>CARGO</th>
         <th>ESTADO</th>
         <th>EDITAR</th>

        </thead>
        <tbody>
            <div class="content_users">

                @foreach ($users as $u)
                <tr class="table-light">
                <td>{{ $u->id }}</td>
                <td>{{ $u->name }}</td>
                <td>{{ $u->nit }}</td>
                <td>{{ $u->email }}</td>
                <td>{{ $u->company }}</td>
                <td>{{ $u->area }}</td>
                <td>{{ $u->chargy }}</td>
                <td>{{ $u->state }}</td>
                <td>
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
            </tr>
                @endforeach
            </div>
        </tbody>
    </table>
    @endif
@stop


@section('js')

@stop
