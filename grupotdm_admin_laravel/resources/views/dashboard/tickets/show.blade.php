@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <link href="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.css" rel="stylesheet">
    @vite(['resources/css/tickets.css'])
@stop
@php
    $user = Auth::user();
@endphp
@section('content_header')

<p id="id_user" hidden>{{ $user->id }}</p>
<p id="id_area_user" hidden>{{ $user->id_area }}</p>
<h1>Tickets</h1>
    <br>
    <a href="{{ route('dashboard.tickets.create') }}" class="btn btn-dark" id="id_create_ticket">GENERAR UN TICKET <i class="bi bi-person-raised-hand"></i></a>
    <br>
    @if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif

         <div class="content_search">
            <form action="{{ route('dashboard.show_tickets_filter_search') }}" method="get">

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
        <button id="btn_search" class="btn btn-primary"><i class="bi bi-search"></i></button>
    </form>
    </div>


<div class="content_info_tickets">
    <div class="content_amount">
        <h1>Vistos/pendientes </h1>
        @php
        $total_v_P = 0;
        @endphp
        @foreach ($tickets_all as $t)
        @if(($t->id_user_sender == $user->id && ($t->id_state == 3 || $t->id_state == 4)) || ($t->id_user_destination == $user->id && ($t->id_state == 3 || $t->id_state == 4)))
        @php
        $total_v_P += 1;
        @endphp
        @endif
        @endforeach
        <b id="total_pendientes">{{ $total_v_P }}</b>
    </div>
    <div class="content_amount">
        <h1>En ejecución </h1>
        @php
        $total_e = 0;
        @endphp
        @foreach ($tickets_all as $t)
        @if( ($t->id_user_sender == $user->id && $t->id_state == 5 ) ||($t->id_user_destination == $user->id && $t->id_state == 5) )
        @php
        $total_e += 1;
        @endphp
        @endif
        @endforeach
        <b id="total_ejecuciones">{{ $total_e }}</b>
    </div>
    <div class="content_amount">
        <h1>Vencidos </h1>
        @php
        $total_v = 0;
        @endphp
        @foreach ($tickets_all as $t)
        @if(($t->id_user_sender == $user->id && $t->id_state == 6 ) || ($t->id_user_destination == $user->id && $t->id_state == 6 ))
        @php
        $total_v += 1;
        @endphp
        @endif
        @endforeach
        <b id="total_vencidos">{{ $total_v }}</b>
    </div>

 </div>

@stop

@section('content')
<input type="number" hidden id="my_id" value="{{ $user->id }}">
    <table id="miTabla" class="table table-bordered table-striped dataTable">
        <thead class="table-dark">
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
        <tbody id="content_tickets" style="overflow-y: 300px;">

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
                        <input type="number" value="{{ $t->id }}" disabled hidden id="id_ticket">
                        <a href="{{ route('dashboard.tickets.ticket_detail', $t->id) }}" class="btn btn-primary"><i class="bi bi-eye-fill"></i></a>
                    </td>
                </tr>
                @endforeach


        </tbody>
    </table>

@stop



@section('js')

<script>
    try {
        const route_sond_notification = "{{ asset('storage/sonds/iphone-notificacion.mp3') }}";
    } catch (error) {

    }

</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    let route_user = "{{ route('dashboard.users.view_user', 0)}}".slice(0, -1);
let route_ticket = "{{ route('dashboard.tickets.ticket_detail',0)}}".slice(0, -1);
</script>
@vite(['resources/js/show_tickets.js'])
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
