@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@php
    $my_user = Auth::user();
@endphp
@section('content_header')

<h1>Perfil de <b> {{ $user->name }}</b></h1>

@stop

@section('content')

<div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Id</label>
        <input type="text" name="" class="form-control" disabled id="exampleFormControlInput1" value="{{ $user->id }}">
      </div>
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nombre</label>
    <input type="text" name="" class="form-control" disabled id="exampleFormControlInput1" value="{{ $user->name }}">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nit</label>
    <input type="number" name="" class="form-control" disabled id="exampleFormControlInput1" value="{{ $user->nit }}">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">TÉLEFONO</label>
    <input type="number" name="" class="form-control" disabled id="exampleFormControlInput1" value="@if($phone){{ $phone }}@else{{ "TELEFONO NO REGISTRADO" }}@endif">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Correo</label>
    <input disabled type="email" name="" class="form-control" disabled id="exampleFormControlInput1" value="{{ $user->email }}">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Compañia</label>
    <input type="text" name="" class="form-control" disabled id="exampleFormControlInput1" value="{{ $user->company }}">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Area</label>
    <input type="text" name="" class="form-control" disabled id="exampleFormControlInput1" value="{{ $user->area }}">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Cargo</label>
    <input type="text" name="" class="form-control" disabled id="exampleFormControlInput1" value="{{ $user->chargy }}">
  </div>
  @if($shop)
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Tienda</label>
    <input type="text" name="" class="form-control" disabled id="exampleFormControlInput1" value="{{ $shop }}">
  </div>
  @endif
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Estado</label>
    <input type="text" name="" class="form-control" disabled id="exampleFormControlInput1" value="{{ $user->state }}">
  </div>
@stop

@section('css')
@stop

@section('js')

@stop
@extends('layouts.content_notifications')
