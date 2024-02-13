@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
@vite('resources/css/content_loading.css')
<link href="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
@stop
@php
    $user = Auth::user();
@endphp

@section('content_header')
<div class="content_loading" hidden>

</div>
<h1 id="tpv"> {{ $spreadsheet_tpv->tpv }} </h1>
<b>  {{ $spreadsheet_tpv->shop }} -  {{ $spreadsheet_tpv->company }} </b>
<br>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif

@stop

@section('content')

<table id="miTabla" class="table table-danger">
    <p id="id_spreadsheet_tpv" hidden>{{ $spreadsheet_tpv->id }}</p>

    <thead class="table">
        <th>METODO DE PAGO</th>
        <th>VALOR POS</th>
        <th>VALOR CONTEO</th>
        <td>DIFERENCIA</td>
    </thead>

    <tbody>
        @foreach ($spreadsheet_rows_tpvs as $s)
        <tr id="rows">

        <td>{{ $s->name }} <p id="id_spreadsheet_rows_tpv" hidden>{{ $s->id }}</p> <p id="name_payment_method" hidden>{{ $s->name }}</p></td>
        <td id="value_pos"> {{ $s->value_pos  }}</td>
        <td><input id="input_value_treasurer" min="0" type="number" value="@if ($s->value_treasurer){{ $s->value_treasurer }}@else{{ 0 }}@endif"></td>
        <td><input id="value_difference" value="{{ $s->difference }}" type="number" disabled></td>
    </tr>
        @endforeach
         </tbody>
</table>

<table class="table table-bordered table-striped dataTable ">


    <thead>
        <th>TOTAL</th>
        <th>TOTAL CONTEO</th>
        <th>DIFERENCIA</th>
    </thead>

    <tbody>

        <tr>

        <td id="total">{{ $spreadsheet_tpv->total }}</td>
        <td id="sub_total">{{ $spreadsheet_tpv->sub_total }}</td>
        <td id="difference">{{ $spreadsheet_tpv->difference }}</td>
    </tr>

         </tbody>
</table>


<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">ESTADO</label>
    <input disabled type="text" id="state" name="" class="form-control-plaintext" value="{{ $spreadsheet_tpv->state }}">
</div>

<div class="overlay" id="content_loading" style="display: flex; align-items: center" hidden>
    <p class="alert alert-success" role="alert" id="label_success" style="margin-right: 20px">Cargando.........</p>
    <i id="element_loading" class="fas fa-2x fa-sync-alt fa-spin"></i>
</div>
<div class="content_buttons" style="display: flex;flex-wrap: wrap;">
    <button style="width: 100%;" class="btn btn-success" id="btn_save">GUARDAR</button>
    @if ($spreadsheet_tpv->id_state == 7 && $validation_jefe || $spreadsheet_tpv->id_state == 3 && !$validation_jefe)
    <form style="width: 100%;" action="{{ route('dashboard.spreadsheets.tpvs.state') }}" method="post">
        @csrf
        <input type="number" id="id_spreadsheet_tpv" name="id_spreadsheet_tpv" value="{{ $spreadsheet_tpv->id }}" hidden>
        <button style="width: 100%; margin: 5px;" class="btn btn-primary" id="btn_save">@if ($spreadsheet_tpv->id_state == 7 && $validation_jefe) RE ABRIR @else TERMINAR @endif</button>
    </form>
    @endif
    <a style="width: 100%;"  href="{{ route('dashboard.spreadsheets.tpvs', $spreadsheet_tpv->id_spreadsheet) }}" class="btn btn-light">VOLVER</a>
</div>



@stop



@section('js')

@vite('resources/js/view_rows_tpvs.js')
<script>
var route_view_user = "{{ route('dashboard.users.view_user', 0) }}".slice(0, -1);

</script>
<script src="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.js"></script>

<script>
    $(document).ready(function() {
      $('#miTabla').DataTable({
        "paging": false,  // Habilita la paginación
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
