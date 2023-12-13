@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@php
    $user = Auth::user();
@endphp


@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
    @vite(['resources/css/view_ticket.css'])
@stop
@section('content_header')

<h1>Ticket</h1>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
@stop

@section('content')

<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nombre</label>
    <input disabled type="text" name="" class="form-control" id="exampleFormControlInput1" value="{{ $ticket->name }}">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Descripciòn</label>
    <textarea  disabled class="form-control" id="exampleFormControlTextarea1" rows="3" name="description" >{{ $ticket->description }}</textarea>
  </div>

  @if ($file)
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Archivo</label>
    <div class="col-sm-10">
    <a class="btn btn-dark" href="{{ asset('storage/files/'.$file) }}" download="">Descargar archivo de {{$ticket->name }} <i class="bi bi-download"></i></a>
</div>
</div>
  @endif
  <div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Previa fecha de inicialización</label>
    <div class="col-sm-10">
      <input disabled type="text" id="" name="" readonly class="form-control-plaintext" value="{{ $ticket->date_start }}">
    </div>
</div>
  <div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Previa fecha de finalización</label>
    <div class="col-sm-10">
      <input disabled type="text" name="" id="input_date_finally" readonly class="form-control-plaintext" value="{{ $ticket->date_finally }}">
    </div>
</div>
<div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Prioridad</label>
    <div class="col-sm-10">
      <input disabled type="text" name="" id="input_date_finally" readonly class="form-control-plaintext" value="{{ $ticket->priority }}">
    </div>
</div>
<div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Usuario remitente</label>
    <div class="col-sm-10">
      <input disabled type="text" name="" id="input_date_finally" readonly class="form-control-plaintext" value="{{ $ticket->name_sender }}">
    </div>
</div>
<div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Usuario de destino</label>
    <div class="col-sm-10">
      <input disabled type="text" name="" id="input_date_finally" readonly class="form-control-plaintext" value="{{ $ticket->name_destination }}">
    </div>
</div>

<div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Estado</label>
    <div class="col-sm-10">
      <input disabled type="text" name="" id="input_date_finally" readonly class="form-control-plaintext" value="{{ $ticket->state }}">
    </div>
</div>
    @if ($ticket->id_user_sender == $user->id || $validate_user_sistemas)
    <a href="{{ route('dashboard.tickets.edit_ticket', $ticket->id) }}" class="btn btn-success"> EDITAR TICKET </a>
    @endif
    <a class="btn btn-primary" href="{{ route('dashboard.tickets') }}">Volver</a>
    <br><br>
    @if ($ticket->id_user_sender == $user->id)
    <form action="{{ route('dashboard.tickets.delete_ticket') }}" method="post">
        @csrf
        <input type="number" name="id_ticket" value="{{ $ticket->id }}" hidden>
        <button class="btn btn-danger">ELIMINAR</button>
    </form>
    @else
    <form action="{{ route('dashboard.tickets.state') }}" method="post">
        @csrf
        <input type="number" name="id_ticket" value="{{ $ticket->id }}" hidden>
    @if ($ticket->id_state == 4 && $ticket->id_user_destination == $user->id)
    <button  class="btn btn-dark">EJECUTAR</button>
    @elseif ($ticket->id_state == 5 && $ticket->id_user_destination == $user->id)
    <button class="btn btn-success">TERMINAR</button>
    @endif
</form>
    @endif


@if ($ticket->id_user_destination == $user->id || $ticket->id_user_sender == $user->id)
<br><br>
    <div class="mb-3 row">
        <label for="staticEmail" class="col-sm-2 col-form-label">Comentarios</label>
        <br>
        <div class="col-sm-10">
            <form action="{{ route('dashboard.tickets.comment_create') }}" method="post">
                @csrf
                <input type="number" value="{{ $ticket->id }}" hidden name="id_ticket">
                <input type="text" required placeholder="Agregar un comentario" name="comment" style="width: 90%">
                <button class="btn btn-primary btn-sm" >Guardar</button>
            </form>
        </div>
    </div>

@endif
    <br>

    <div class="coments">
        @foreach ($comments as $c)
        <div class="comment" style="@if ($c->id_user == $user->id)
        {{ "align-items: end;" }}
        @else
        {{ "align-items: start;" }}
        @endif">
            <div class="comment_header">
            <b style="margin-right: 30px">{{ $c->name }}</b>
            <p>{{ $c->date }}</p>
        </div>
            <p>{{ $c->comment }}</p>
            <br>
            @if ($c->id_user == $user->id)
            <form action="{{ route('dashboard.tickets.comment_delete') }}" method="post">
                @csrf
                <input type="number" value="{{ $ticket->id }}" name="id_ticket" hidden>
                <input type="number" value="{{ $c->id }}" name="id_comment" hidden>
                <button href="" class="btn btn-danger">ELIMINAR COMENTARIO</button>
            </form>

            @endif
        </div>
        @endforeach
    </div>
    @if ($ticket->id_user_sender == $user->id)

    <br><br>
    <form id="form_starts" action="" method="post">
        @csrf
        <b>AGREGAR CALIFICACIÒN</b>
        <p class="clasificacion">
          <input id="radio1" type="radio" name="estrellas" value="5"><!--
          --><label for="radio1">★</label><!--
          --><input id="radio2" type="radio" name="estrellas" value="4"><!--
          --><label for="radio2">★</label><!--
          --><input id="radio3" type="radio" name="estrellas" value="3"><!--
          --><label for="radio3">★</label><!--
          --><input id="radio4" type="radio" name="estrellas" value="2"><!--
          --><label for="radio4">★</label><!--
          --><input id="radio5" type="radio" name="estrellas" value="1"><!--
          --><label for="radio5">★</label>
        </p>
        <input type="number" hidden name="id_ticket" value="{{ $ticket->id }}">
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Agrega una opinion</label>
            <textarea  class="form-control" id="exampleFormControlTextarea1" rows="3" name="comment" placeholder="Opinion......."></textarea>
          </div>

          <button class="btn btn-success" style="margin-bottom:20px;">Agregar calificacion</button>
      </form>
    @endif
@stop


@section('js')

@stop
