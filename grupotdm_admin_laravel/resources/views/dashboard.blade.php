@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@section('content_header')
<h1>Bienvenido al panel de administraciòn del GRUPO TDM</h1>

@if (session('message_error'))

              <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>

         @endif

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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
@vite(['resources/css/notifications.css'])
@stop

@section('js')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
let id_user = "{{ Auth::user()->id }}";
let route_principal = "{{ route('dashboard') }}";

</script>
@vite(['resources/js/app.js','resources/js/notifications.js'])
@stop

