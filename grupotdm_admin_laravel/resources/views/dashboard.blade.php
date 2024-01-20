@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@section('content_header')
<h1>Bienvenido al panel de administraciòn del GRUPO TDM</h1>
@stop

@section('content')

    <div class="content_icons">

        <div class="content_icon_tdm">
                    <img src="{{ asset('storage/icons/logo.png') }}">
        </div>

        <div class="content_all_icons">
            <div>
            <img src="{{ asset('storage/icons/logo_templo.png') }}">
        </div>
        <div>
            <img src="{{ asset('storage/icons/logo_shopping.png') }}">
        </div>
        <div>
            <img src="{{ asset('storage/icons/logo_universo.png') }}">
        </div>
            <div><img src="{{ asset('storage/icons/logo_angeles.png') }}">

    </div>

    @if (session('message_error'))

    <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>



@endif
@stop

@section('css')

@vite(['resources/css/dashboard.css'])

@stop

@section('js')

@stop

