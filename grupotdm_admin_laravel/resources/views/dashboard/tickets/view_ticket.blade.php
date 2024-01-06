@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@php
    $user = Auth::user();
@endphp

@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="/css/admin_custom.css">

    @vite(['resources/css/view_ticket.css'])
    <style>
        body{
    background-color: white;
    margin: 0;
}

.content_loading{
    background-color: rgba(2, 2, 2, 0.6);
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 10000;
    position: fixed;
}
.content_loading .content_logo{

    position: fixed;
    transform: translate(-50%, -50%);
    left: 50%;
    top: 50%;
    border-radius: 50px;
    border: 6px solid;
    padding: 20px;
    background-color: white;
    animation: start_loading 0.5s;

}
.content_loading .content_logo img{
    width: 100%;
    height: 100%;
    object-fit: cover;
}

@keyframes start_loading{

    0%{
        opacity: 0;
       transform: translateX(-50%) translateY(-100%);
    }
    100%{
        opacity: 1;
        transform: translateX(-50%) translateY(-50%);
    }
}
@media (max-width:700px){
    .content_loading .content_logo{
        width: 100vw; /* 100% del ancho del viewport */
    height: 100vh;

    }
    .content_loading .content_logo{
        border-radius: 0;
    }
    .content_loading .content_logo img{
    object-fit: contain;
}
}
    </style>

@stop

@section('content_header')
<div class="content_loading" hidden>

</div>
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
      <input disabled type="text" name="" id="" readonly class="form-control-plaintext" value="{{ $ticket->priority }}">
    </div>
</div>
<div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Usuario remitente</label>
    <div class="col-sm-10">
        <a href="{{ route('dashboard.users.view_user', $ticket->id_user_sender) }}">
      <input style="font-weight: bold;"  type="text" name="" id=""   class="form-control-plaintext"value="{{ $ticket->name_sender }} (PRESIONA PARA VER)">
    </a>
    </div>
</div>
<div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Usuario de destino</label>
    <div class="col-sm-10">
        <a href="{{ route('dashboard.users.view_user', $ticket->id_user_destination) }}">
      <input  style="font-weight: bold;" type="text" name="" id=""  class="form-control-plaintext" value="{{ $ticket->name_destination }} (PRESIONA PARA VER)">
    </a>
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
            <form id="miFormulario"  action="{{ route('dashboard.tickets.comment_create') }}" method="post">
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

    <br>
    <form id="form_starts" action="{{ route('dashboard.tickets.calification_ticket') }}" method="post">
        @csrf
        <div class="mb-3">
        @if ($calification)
        <b>EDITAR CALIFICACIÓN</b>
        @else
        <b>AGREGAR CALIFICACIÓN</b>
        @endif
</div>
<div class="mb-3">
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
        </div>
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
<script>

    let content_logo_loading = '<div class="content_logo">'+
        '<img src="{{ asset('storage/icons/loading_logo.gif') }}" alt="">'+
    '</div>';
    const content_loading = document.querySelector(".content_loading");
    document.addEventListener('DOMContentLoaded', function () {
            var formulario = document.getElementById('miFormulario');

            formulario.addEventListener('submit', function (event) {
                if (validarFormulario()) {
                    content_loading.removeAttribute('hidden');
                    content_loading.innerHTML = content_logo_loading;
                }
            });

            function validarFormulario() {

                return true;
            }
        });
</script>
@stop

