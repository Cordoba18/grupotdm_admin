@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
@vite('resources/css/content_loading.css')
<link href="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
@vite('resources/css/vpns.css')

@stop
@php
    $user = Auth::user();
@endphp
@section('content_header')
<div class="content_loading" hidden>

</div>
<h1>LLAVES VPN</h1>
<br>

<a href="{{  route('dashboard.vpns.create') }}" class="btn btn-dark" id="btn_create_vpn">CREAR UNA NUEVA LLAVE VPN  <i class="bi bi-key-fill"></i></a>
<br>
<br>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
         <br>
         <div class="content_search">
            <form action="{{ route('dashboard.vpns') }}" method="get">

                @if ($search)
                <input type="text" name="search" placeholder="Buscar" id="Buscar licencias" value="{{ $search }}">
                @else
                <input type="text" name="search" placeholder="Buscar" id="Buscar licencias">
                @endif
        <button id="btn_search" class="btn btn-primary"><i class="bi bi-search"></i></button>
    </form>
    </div>


@stop

@section('content')


<div class="content_vpns">
    @foreach ($vpns as $v)

    <div class="content_vpn">
        <div class="content_header">
            <a href="{{ route('dashboard.vpns.view', $v->id) }}">
                @if ($v->id_state == 1)
                <i style="color: green" class="bi bi-key-fill"></i>
                @else
                <i style="color: red" class="bi bi-key-fill"></i>
                @endif

        </a>

        </div>
        <div class="content_fooder">

            <b> {{ $v->name_vpn }}</b>

            <p><a href="{{ route('dashboard.users.view_user', $v->id_user) }}">{{ $v->name_user }}</a></p>
        </div>
    </div>

    @endforeach
</div>

@stop



@section('js')

<script>
var route_view_user = "{{ route('dashboard.users.view_user', 0) }}".slice(0, -1);

</script>
<script src="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.js"></script>

<script>
    $(document).ready(function() {
      $('#miTabla').DataTable({
        "paging": true,  // Habilita la paginación
        "lengthChange": false, // Oculta el control para cambiar el número de elementos por página
        "searching": false, // Deshabilita la función de búsqueda
        "ordering": false, // Habilita la ordenación de columnas
        "info": false, // Muestra información sobre la paginación
        "autoWidth": true // Deshabilita el ajuste automático del ancho de las columnas

      });
    });
  </script>
@stop
@extends('layouts.content_notifications')
