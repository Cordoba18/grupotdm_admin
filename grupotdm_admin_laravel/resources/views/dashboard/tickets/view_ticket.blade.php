@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@php
    $user = Auth::user();
@endphp


@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
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
@if ($calification)
<div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Calificación</label>
    <div class="col-sm-10" id="content_starts">

        @if($calification->calification == 1)
        <i class="bi bi-star-fill"></i>
        @elseif ($calification->calification == 2)
        <i class="bi bi-star-fill"></i>
        <i class="bi bi-star-fill"></i>
        @elseif ($calification->calification == 3)
        <i class="bi bi-star-fill"></i>
        <i class="bi bi-star-fill"></i>
        <i class="bi bi-star-fill"></i>
        @elseif ($calification->calification == 4)
        <i class="bi bi-star-fill"></i>
        <i class="bi bi-star-fill"></i>
        <i class="bi bi-star-fill"></i>
        <i class="bi bi-star-fill"></i>
        @elseif ($calification->calification == 5)
        <i class="bi bi-star-fill"></i>
        <i class="bi bi-star-fill"></i>
        <i class="bi bi-star-fill"></i>
        <i class="bi bi-star-fill"></i>
        <i class="bi bi-star-fill"></i>
        @endif
    </div>
</div>
<div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Reseña</label>
    <div class="col-sm-10">
        <textarea disabled  class="form-control" id="exampleFormControlTextarea1" rows="3" name="comment" placeholder="Opinion......." >{{ $calification->comment }}</textarea>
    </div>
</div>
@else
<div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Calificación</label>
    <div class="col-sm-10">
      <input disabled type="text" readonly class="form-control-plaintext" value="No existe una calificación">
    </div>
</div>
 <br>
@endif
    @if ($ticket->id_user_sender == $user->id || $validate_user_sistemas)
    <a href="{{ route('dashboard.tickets.edit_ticket', $ticket->id) }}" class="btn btn-success"> EDITAR TICKET </a>
    @endif
    <a class="btn btn-primary" href="{{ route('dashboard.tickets') }}">Volver</a>
    <br><br>
    <div style="display: flex; flex-wrap: wrap;">
    @if ($ticket->id_user_sender == $user->id)
    <form action="{{ route('dashboard.tickets.delete_ticket') }}" method="post">
        @csrf
        <input type="number" name="id_ticket" value="{{ $ticket->id }}" hidden>
        <button class="btn btn-danger">ELIMINAR</button>
    </form>
    @if (($ticket->id_state == 5 || $ticket->id_state == 6 ) && $ticket->id_user_sender == $user->id)
    <form action="{{ route('dashboard.tickets.state') }}" method="post">
        @csrf
        <input type="number" name="id_ticket" value="{{ $ticket->id }}" hidden>
    <button class="btn btn-success">TERMINAR</button>
</form>
    @endif
    @else

    @if ($ticket->id_state == 4 && $ticket->id_user_destination == $user->id)
    <form action="{{ route('dashboard.tickets.state') }}" method="post">
        @csrf
        <input type="number" name="id_ticket" value="{{ $ticket->id }}" hidden>
    <button  class="btn btn-dark">EJECUTAR</button>
</div>
</form>
@elseif($ticket->id_state == 5 && $ticket->id_user_destination == $user->id)
<form action="{{ route('dashboard.tickets.notificate_finish_ticket_mail') }}" method="post">
    @csrf
    <input type="number" name="id_ticket" value="{{ $ticket->id }}" hidden>
<button  class="btn btn-success">NOTIFICAR SOBRE FINALIZACIÓN</button>
</div>
</form>
    @endif

    @endif

<div class="content_comments">
@if ($ticket->id_user_destination == $user->id || $ticket->id_user_sender == $user->id)
<div class="header_comments">
    <div class="mb-3 row">
        <label for="staticEmail" class="col-sm-2 col-form-label">Comentarios</label>
        <br>
        <div class="col-sm-10">
            <form action="{{ route('dashboard.tickets.comment_create') }}" method="post">
                @csrf
                <input type="number" value="{{ $ticket->id }}" hidden name="id_ticket">
                <input type="text" required placeholder="Agregar un comentario" name="comment" style="width: 90%">
                <button class="btn btn-light" >Guardar</button>
            </form>
        </div>
    </div>
</div>
@endif

    <div class="coments">
        @foreach ($comments as $c)
        <div class="comment" style="@if ($c->id_user == $user->id)
        {{ "align-items: end;" }}
        @else
        {{ "align-items: start; background-color:#DDDDDD;" }}
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
                <button href="" class="btn btn-danger"><i class="bi bi-trash3"></i></button>
            </form>

            @endif
        </div>
        @endforeach
    </div>
</div>
    @if ($ticket->id_user_sender == $user->id)

    <br><br>
    <form id="form_starts" action="{{ route('dashboard.tickets.calification_ticket') }}" method="post">
        @csrf
        @if ($calification)
        <b>EDITAR CALIFICACIÓN</b>
        @else
        <b>AGREGAR CALIFICACIÓN</b>
        @endif

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
            @if($calification)

            <textarea  class="form-control" id="exampleFormControlTextarea1" rows="3" name="comment" placeholder="Opinion.......">{{ $calification->comment }}</textarea>
            @else
            <textarea  class="form-control" id="exampleFormControlTextarea1" rows="3" name="comment" placeholder="Opinion......."></textarea>
            @endif

          </div>

          <button class="btn btn-success" style="margin-bottom:20px;">CALIFICAR</button>
      </form>
    @endif
@stop


@section('js')

@stop
