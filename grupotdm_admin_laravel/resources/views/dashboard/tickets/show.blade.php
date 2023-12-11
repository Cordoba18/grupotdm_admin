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

         <div class="content_search">
            <form action="{{ route('dashboard.show_tickets_filter_search') }}" method="get">
                @csrf
                @if ($search)
                <input type="text" name="search" placeholder="Buscar" id="Buscar usuarios" value="{{ $search }}">
                @else
                <input type="text" name="search" placeholder="Buscar" id="Buscar usuarios">
                @endif
                <select name="filter" id="" >
                    <option value="">Seleccione un filtro</option>
                    @foreach ($filters as $f)
                    <option value="{{ $f->id }}">{{ $f->state }}</option>
                    @endforeach
                </select>
        <button id="btn_search" class="btn btn-primary">Buscar</button>
    </form>
    </div>
@if($validate_user_sistemas)


<div class="content_info_tickets">
    <div class="content_amount">
        <h1>Vistos/pendientes </h1>
        @php
        $total_v_P = 0;
        @endphp
        @foreach ($tickets_all as $t)
        @if($t->id_user_destination == $user->id && ($t->id_state == 3 || $t->id_state == 4))
        @php
        $total_v_P += 1;
        @endphp
        @endif
        @endforeach
        <b>{{ $total_v_P }}</b>
    </div>
    <div class="content_amount">
        <h1>En ejecución </h1>
        @php
        $total_e = 0;
        @endphp
        @foreach ($tickets_all as $t)
        @if($t->id_user_destination == $user->id && $t->id_state == 5 )
        @php
        $total_e += 1;
        @endphp
        @endif
        @endforeach
        <b>{{ $total_e }}</b>
    </div>
    <div class="content_amount">
        <h1>Vencidos </h1>
        @php
        $total_v = 0;
        @endphp
        @foreach ($tickets_all as $t)
        @if($t->id_user_destination == $user->id && $t->id_state == 6 )
        @php
        $total_v += 1;
        @endphp
        @endif
        @endforeach
        <b>{{ $total_v }}</b>
    </div>

 </div>
@else
<div class="content_info_tickets">
    <div class="content_amount">
        <h1>Vistos/pendientes </h1>
        @php
        $total_v_P = 0;
        @endphp
        @foreach ($tickets_all as $t)
        @if($t->id_user_sender == $user->id && ($t->id_state == 3 || $t->id_state == 4))
        @php
        $total_v_P += 1;
        @endphp
        @endif
        @endforeach
        <b>{{ $total_v_P }}</b>
    </div>
    <div class="content_amount">
        <h1>En ejecución </h1>
        @php
        $total_e = 0;
        @endphp
        @foreach ($tickets_all as $t)
        @if($t->id_user_sender == $user->id && $t->id_state == 5 )
        @php
        $total_e += 1;
        @endphp
        @endif
        @endforeach
        <b>{{ $total_e }}</b>
    </div>
    <div class="content_amount">
        <h1>Vencidos </h1>
        @php
        $total_v = 0;
        @endphp
        @foreach ($tickets_all as $t)
        @if($t->id_user_sender == $user->id && $t->id_state == 6 )
        @php
        $total_v += 1;
        @endphp
        @endif
        @endforeach
        <b>{{ $total_v }}</b>
    </div>

 </div>
@endif

@stop

@section('content')
<input type="number" hidden id="my_id" value="{{ $user->id }}">
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


                    <td><a  style="font-weight: bold;color: black" href="{{ route('dashboard.users.view_user', $t->id_user_sender) }}">{{ $t->name_sender }}</a><p hidden id="id_sender"> {{ $t->id_user_sender }}</p> </td>
                    <td><a  style="font-weight: bold;color: black" href="{{ route('dashboard.users.view_user', $t->id_user_destination) }}">{{ $t->name_destination }}</a> <p hidden id="id_destination"> {{ $t->id_user_destination }}</p></td>
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
                        <a href="{{ route('dashboard.tickets.ticket_detail', $t->id) }}" class="btn btn-primary">DETALLE</a>
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
