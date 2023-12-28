@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    @vite(['resources/css/inventories.css'])
@stop
@section('content_header')

<h1>INVETARIOS</h1>
<br>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
         @if (session('message_error'))

              <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>

         @endif

    <a href="{{ route('dashboard.inventories.create') }}" class="btn btn-dark">CREAR PRODUCTO</a>
    <br><br>

    <div class="content_search">
        <form action="" method="get">
            <input type="text" name="search" placeholder="Buscar productos" style="width: 80%">
            <button id="btn_search" class="btn btn-primary">Buscar</button></form>
        </div>
<br>
@stop

@section('content')


<div class="content_products">

    @foreach ($products as $p)

    <div class="content_product">
        <div class="content_image_product">
            <a href="">
            @foreach($images_products as $ip)
            @php
                $suma = 1;
            @endphp
            @if($p->id == $ip->id_product && $suma == 1)
            @php
            $suma = $suma + 1;

        @endphp
        <img src="{{ asset('storage/files/'.$ip->image) }}" alt="">
            @endif
            @if($suma == 1)
            <img src="{{ asset('storage/icons/logo.png') }}" alt="">
            @endif
            @endforeach
        </a>
        </div>
        <div class="content_info">
            <div>
            <p>Nombre:</p><b>{{ $p->name }}</b>
        </div>
        <div>
            <p>Serial:</p><b>{{ $p->serie }}</b>
        </div>
    </div>
    <div class="content_buttons">
        <form action="" method="post">
            @csrf
            <input type="text" hidden value="{{ $p->id }}" name="id_product">
            <button class="btn btn-danger"><i class="bi bi-trash3"></i></button>
        </form>
    </div>
</div>
    @endforeach
</div>


@stop



@section('js')
@stop
