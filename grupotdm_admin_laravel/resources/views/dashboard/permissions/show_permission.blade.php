@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')

@stop
@php
    $user = Auth::user();
@endphp
@section('content_header')
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
         <br><br>

@stop

@section('content')
<div id="content_form_permission">
    <center>
<h1>FORMATO DE SOLICITUD DE PERMISO</h1>

<div class="content_img">
<img src="{{ asset('storage/icons/logo.png') }}" alt="">
</div>
</center>
<br>
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">NOMBRE DE COLABORADOR</label>
    <input style="width: 100%" type="text" required disabled name="" class="form-control" id="exampleFormControlInput1" placeholder="" value="{{ $permission->name_user }}">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">CEDULA</label>
    <input style="width: 100%" type="text" required disabled name="" class="form-control" id="exampleFormControlInput1" placeholder="" value="{{  $permission->nit }}">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">OBSERVACIONES</label>
    <textarea style="width: 100%"  required disabled class="form-control" id="exampleFormControlTextarea1" rows="3" name="" placeholder="Ingrese observaciones" maxlength="500">{{  $permission->observations }}</textarea>
  </div>
  <div class="mb-3">
    <label for="formFile" class="form-label">FECHA DE SOLICITUD</label>
    <input style="width: 100%" required disabled type="text" id="" name="" readonly class="form-control-plaintext" value="{{ $permission->date_application }}">
  </div>
  @if($dates_permission->date_tomorrow != 0)
  <div class="mb-3">
    <label for="formFile" class="form-label">FECHA DE LLEGADA EN LA MAÑANA</label>
    <input style="width: 100%" required disabled type="text" value="{{ $dates_permission->date_tomorrow }}" id="" name="" readonly class="form-control-plaintext">
  </div>
  @else
  <div class="mb-3">
    <label for="formFile" class="form-label">FECHA DE SALIDA</label>
  @if($dates_permission->time_exit)

    <input style="width: 100%" required disabled type="text" value="{{ $dates_permission->time_exit }}" id="" name="" readonly class="form-control-plaintext">
    @else
    <input style="width: 100%" required disabled type="text" value="No ha salido" id="" name="" readonly class="form-control-plaintext">
    @if($user->id_area == 16  && $permission->id_state == 10)
    <form action="{{ route('dashboard.permissions.view_permission.permission_user_exit') }}" method="post">
        @csrf
        <input style="width: 100%" type="text" id="date" name="time_exit" hidden>
        <input style="width: 100%" type="number" value="{{ $permission->id }}" name="id_permission" hidden required>
        <button class="btn btn-success">DAR SALIDA</button>
    </form>
    @endif


  @endif
</div>

<div class="mb-3">
    <label for="formFile" class="form-label">FECHA DE LLEGADA</label>
  @if($dates_permission->time_return)

    <input style="width: 100%" required disabled type="text" value="{{ $dates_permission->time_return }}" id="" name="" readonly class="form-control-plaintext">
    @else
    <input style="width: 100%" required disabled type="text" value="No ha llegado" id="" name="" readonly class="form-control-plaintext">
    @if ($dates_permission->time_exit && $user->id_area == 16 && $permission->id_state == 10)
    <form action="{{ route('dashboard.permissions.view_permission.permission_user_return') }}" method="post">
        @csrf
        <input style="width: 100%" type="text" id="date" name="time_return" hidden>
        <input  style="width: 100%" type="number" value="{{ $permission->id }}" name="id_permission" hidden required>
        <button class="btn btn-success">DAR LLEGADA</button>
    </form>
    @endif
  @endif
</div>
  @endif
  <div class="mb-3">
    <label for="formFile" class="form-label">JEFE QUE APROBO EL PERMISO</label>
    @if($user_boss)
    <input style="width: 100%" required disabled type="text" id="" name="" readonly class="form-control-plaintext" value="{{ $user_boss->name }}">
    <label for="formFile" class="form-label">CEDULA DEL JEFE</label>
    <input style="width: 100%" required disabled type="text" id="" name="" readonly class="form-control-plaintext" value="{{ $user_boss->nit }}">
    @else
    <input style="width: 100%" required disabled type="text" id="" name="" readonly class="form-control-plaintext" value="No ha sido aprovado">
@endif
  </div>

  <div class="mb-3">
    <label for="formFile" class="form-label">RECEPCIONISTA ENCARGADO</label>
    @if($user_reception)
    <input style="width: 100%" required disabled type="text" id="" name="" readonly class="form-control-plaintext" value="{{ $user_reception->name }}">
    @else
    <input style="width: 100%" required disabled type="text" id="" name="" readonly class="form-control-plaintext" value="No ha sido gestionado por un recepcionista">
@endif
  </div>


  <div class="mb-3">
    <label for="formFile" class="form-label">MOTIVO</label>
    <input style="width: 100%" required  disabled ="text" id="" name="" readonly class="form-control-plaintext" value="{{ $permission->reason }}">
  </div>
  <div class="mb-3">
    <label for="formFile" class="form-label">¿REPONE TIEMPO?</label>
    <input style="width: 100%" required  disabled ="text" id="" name="" readonly class="form-control-plaintext" value="{{ $permission->replenish_time }}">
  </div>
  <div class="mb-3">
    <label for="formFile" class="form-label">ESTADO</label>
    <input style="width: 100%" required  disabled ="text" id="" name="" readonly class="form-control-plaintext" value="{{ $permission->state }}">
  </div>
  @if($validation_jefe && !$user_boss && $permission->id_state == 8)
  <div class="mb-3">
    <label for="formFile" class="form-label">¿Deseas aprobar el permiso?</label>
    <form action="{{ route('dashboard.permissions.view_permission.permission_approve') }}" method="post">
        @csrf
        <input style="width: 100%" type="number" value="{{ $permission->id }}" name="id_permission" hidden required>
        <button  class="btn btn-success">APROBAR PERMISO</button>
    </form>
    <form action="{{ route('dashboard.permissions.view_permission.permission_disapprove') }}" method="post">
        @csrf
        <input style="width: 100%" type="number" value="{{ $permission->id }}" name="id_permission" hidden required>
        <button  class="btn btn-danger">DESAPROBAR PERMISO</button>
    </form>
  </div>

  @endif
</div>
<button onclick="imprimirDiv()" class="btn btn-dark">Imprimir PERMISO</button>
<br><br><br>
@stop



@section('js')
<script>
    function imprimirDiv() {
      var contenidoDiv = document.getElementById('content_form_permission').innerHTML;
      var ventanaImpresion = window.open('', '_blank');
      ventanaImpresion.document.write('<html><head><title>PERMISO GRUPO TDM</title></head><body>');
      ventanaImpresion.document.write(contenidoDiv);
      ventanaImpresion.document.write('</body></html>');
      ventanaImpresion.document.close();
      ventanaImpresion.print();
    }
  </script>
@vite(['resources/js/show_permission.js'])
@stop
