@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
@stop
@php
    $user = Auth::user();
@endphp
@section('content_header')

<h1>REPORTES</h1>
         <div class="content_search">
            <form action="{{ route('dashboard.resports') }}" method="get">

                <input type="text" name="search" placeholder="Buscar Reporte" style="width: 100%; margin-bottom: 10px">
                    <select name="filter" id="" >
                    <option value="">Seleccione un filtro</option>
                    @foreach ($report_details as $r)
                        <option value="{{ $r->id }}">{{ $r->report }}</option>
                    @endforeach
                </select>
        <button id="btn_search" class="btn btn-primary">Buscar</button>
    </form>
    </div>


@stop

@section('content')
@if ($reports)


<table class="table">

    <thead class="table-dark">
        <th>ID</th>
        <th>DECRIPCIÓN</th>
        <th>USUARIO DE ACCIÓN</th>
        <th>CLASE DE REPORTE</th>
        <th>FECHA Y HORA DE REPORTE</th>
    </thead>

    <tbody>
        @foreach ($reports as $r)
        @if($r->id_area == $user->id_area || $user->id_area == 1)
        <tr  class="table-light">
            <td>{{ $r->id }}</td>
            <td>{{ $r->description }}</td>
            <td>{{ $r->name_user }}</td>
            <td>{{ $r->report }}</td>
            <td>{{ $r->date }}</td>
        </tr>
        @endif

        @endforeach
    </tbody>
</table>
@else
<h1>No existe un resultado que coincida con tu búsqueda</h1>
@endif
@stop



@section('js')
@stop
