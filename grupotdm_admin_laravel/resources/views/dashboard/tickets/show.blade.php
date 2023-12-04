@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@php
    $user = Auth::user();
@endphp
@section('content_header')

<h1>Tickets</h1>
    <br>
    <a href="{{ route('dashboard.tickets.create') }}" class="btn btn-success">GENERAR UN TICKET</a>

@stop

@section('content')

    <table class="table">
        <thead>
         <th>ID</th>
         <th>NOMBRE</th>
         <th>DESCRIPCIÒN</th>
         <th>ARCHIVO</th>
         <th>FECHA INICIO</th>
         <th>FECHA FINAL</th>
         <th>PRIORIDAD</th>
         <th>DE</th>
         <th>PARA</th>
         <th>ESTADO</th>


        </thead>
        <tbody>
            <div class="content_users">


        </tbody>
    </table>

@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')

@stop
