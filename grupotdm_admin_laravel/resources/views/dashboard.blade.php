@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@section('content_header')
    <h1>ADMINISTRACIÒN</h1>
@stop

@section('content')
    <p>Bienvenido al panel de administraciòn del GRUPO TDM</p>

    @if (session('message_error'))

    <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>

@endif
@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')

@stop

