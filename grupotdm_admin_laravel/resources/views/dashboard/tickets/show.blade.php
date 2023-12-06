@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@php
    $user = Auth::user();
@endphp
@section('content_header')

<h1>Tickets</h1>
    <br>
    <a href="{{ route('dashboard.tickets.create') }}" class="btn btn-dark">GENERAR UN TICKET</a>
    <br>
    @if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
@stop

@section('content')

    <table class="table">
        <thead>
         <th>ID</th>
         <th>NOMBRE</th>
         <th>FECHA INICIO</th>
         <th>FECHA FINAL</th>
         <th>PRIORIDAD</th>
         <th>DE</th>
         <th>PARA</th>
         <th>ESTADO</th>
         <th>ACCIÓN</th>


        </thead>
        <tbody style="overflow-y: 300px;">
            <div class="content_tickets" >
                @foreach ($tickets as $t)

                <tr id="tickets">
                    <td>{{ $t->id }}</td>
                    <td>{{ $t->name }}</td>
                    <td id="date_start">{{ $t->date_start }}</td>
                    <td id="date_finally" >{{ $t->date_finally }}</td>
                    <td>{{ $t->priority }}</td>
                    <td>{{ $t->name_sender }}</td>
                    <td>{{ $t->name_destination }}</td>
                    <td>{{ $t->state }}</td>
                    <td>
                        <input type="number" value="{{ $t->id_state }}" disabled hidden id="id_state">
                        <form action="{{ route('dashboard.tickets.state') }}" method="post">
                            @csrf
                            <input type="number" name="id_ticket" value="{{ $t->id }}" hidden>
                        @if ($validate_user_sistemas)
                        @if ($t->id_state == 4 && $t->id_user_destination == $user->id)
                        <button  class="btn btn-dark">EJECUTAR</button>
                        @elseif ($t->id_state == 5 && $t->id_user_destination == $user->id)
                        <button class="btn btn-success">TERMINAR</button>
                        @endif
                        @else
                        <button class="btn btn-danger">ELIMINAR</button>
                        @endif
                    </form>
                    </td>

                </tr>
                @endforeach
                </div>

        </tbody>
    </table>

@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')
@vite(['resources/js/show_tickets.js'])
@stop
