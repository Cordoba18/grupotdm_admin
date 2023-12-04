@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@php
    $user = Auth::user();
@endphp
@section('content_header')
@if ($users == null)
<h1>No estas autorizado para ver usuarios</h1>
@else
<h1>Usuarios</h1>
    <br>
    <div class="content_search"></div>
    <input type="text" placeholder="Buscar" id="Buscar usuarios">
    <button id="btn_search" class="btn btn-primary">Buscar</button>
@endif

@stop

@section('content')
@if ($users != null)

    <table class="table">
        <thead>
         <th>ID</th>
         <th>NOMBRE</th>
         <th>NIT</th>
         <th>CORREO</th>
         <th>COMPAÑIA</th>
         <th>AREA</th>
         <th>CARGO</th>
         @if ($user->id_area != 1)
         <th>TIENDA</th>
         @endif

         <th>ESTADO</th>
         <th>EDITAR</th>

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
                @if ($user->id_area != 1)
                <td>{{ $u->shop }}</td>
                @endif
                <td>{{ $u->state }}</td>
                <td>
                    <form action="{{ route('dashboard.users.edit_profile' , $u->id)}}" method="get">
                    <button href="" class="btn btn-outline-primary">EDITAR</button>
                </form>
                    <form action="{{ route('dashboard.users.delete') }}" method="post">
                        @csrf
                        <input hidden type="text" name="id_jefe" value="{{ $user->id }}">
                        <input hidden type="text" name="id" value="{{ $u->id }}">
                    @if ($u->id_state == 1)
                    <button class="btn btn-outline-danger" href="">ELIMINAR</button></td>
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

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')

@stop
