@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
@stop
@php
    $user = Auth::user();
@endphp
@section('content_header')

<h1>CREAR UN PERMISO</h1>


@stop

@section('content')

<br>
<form action="{{ route('dashboard.permissions.create.save') }}" method="POST" enctype="multipart/form-data">
    @csrf
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nombre colaborador</label>
    <input type="text" required disabled name="name" class="form-control" id="exampleFormControlInput1" placeholder="" value="{{ $user->name }}">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Cedula</label>
    <input type="text" required disabled name="nit" class="form-control" id="exampleFormControlInput1" placeholder="" value="{{ $user->nit }}">
  </div>

  <div class="mb-3">
    <label for="formFile" class="form-label">FECHA DE SOLICITUD</label>
    <input required type="text" id="date_aplicattion" name="date_aplicattion" readonly class="form-control-plaintext">
  </div>

  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">MOTIVO</label><br>
    @foreach ($reasons as $r)
    <label>
        <input type="radio" name="id_reason" value="{{ $r->id }}" required>
        {{ $r->reason }}
      </label>
    @endforeach
</div>

<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">REPONE TIEMPO</label><br>
    @foreach ($replenish_times as $r)
    <label>
        <input type="radio" name="id_replenish_time" value="{{ $r->id }}" required>
        {{ $r->replenish_time }}
      </label>
    @endforeach
</div>

<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">DIA DE LLEGADA</label><br>

    <label>
        <input type="radio" name="id_day" id="id_day" value="1" required>
        HOY
      </label>
      <label>
        <input type="radio" name="id_day" id="id_day" value="2" required>
        MAÑANA
      </label>
</div>
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">HORA DE LLEGADA</label><br>
<label>
    <input type="time" id="input_time" disabled>
  </label>
</div>

<div class="mb-3">
    <label for="formFile" class="form-label">FECHA DE LLEGADA EN LA MAÑANA FINAL</label>
    <input required type="text" id="date_tomorrow" name="date_tomorrow" readonly class="form-control-plaintext" value="0">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">OBSERVACIONES</label>
    <textarea  required class="form-control" id="exampleFormControlTextarea1" rows="3" name="observations" placeholder="Ingrese observaciones" maxlength="500"></textarea>
  </div>

    <button class="btn btn-success">Crear Permiso</button>
</form>

@stop



@section('js')
@vite(['resources/js/permissions.js'])
@stop