@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@php
    $user = Auth::user();
@endphp

@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">

    @vite(['resources/css/view_ticket.css', 'resources/js/app.js'])
    @vite('resources/css/content_loading.css')

@stop

@section('content_header')
<div class="content_loading" hidden>

    <p id="id_user" hidden>{{ $user->id }}</p>
</div>
<h1>Ticket</h1>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
@stop

@section('content')

<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">ID</label>
    <input disabled type="text" id="id_ticket" name="" class="form-control"  value="{{ $ticket->id }}">
  </div>
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Nombre</label>
    <input disabled type="text" id="name" name="" class="form-control"  value="{{ $ticket->name }}">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Descripciòn</label>
    <textarea  disabled  class="form-control"id="description" rows="3" name="description" >{{ $ticket->description }}</textarea>
  </div>

  @if ($file)
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">Archivo</label>
    <div class="col-sm-10">
    <a id="file" class="btn btn-dark" href="{{ asset('storage/files/'.$file) }}" download="">Descargar archivo de {{$ticket->name }} <i class="bi bi-download"></i></a>
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
      <input id="priority" disabled type="text" name="" id="" readonly class="form-control-plaintext" value="{{ $ticket->priority }}">
    </div>
</div>
<div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Usuario remitente</label>
    <div class="col-sm-10">
        <a href="{{ route('dashboard.users.view_user', $ticket->id_user_sender) }}">
            <p id="id_user_sender" hidden>{{ $ticket->id_user_sender }}</p>
      <input style="font-weight: bold;"  type="text" name="" id="name_user_sender"   class="form-control-plaintext"value="{{ $ticket->name_sender }} (PRESIONA PARA VER)">
    </a>
    </div>
</div>
<div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Usuario de destino</label>
    <div class="col-sm-10">
        <p id="id_user_destination" hidden>{{ $ticket->id_user_destination }}</p>
        <a href="{{ route('dashboard.users.view_user', $ticket->id_user_destination) }}">
      <input  style="font-weight: bold;" type="text" name="" id="name_user_destination"  class="form-control-plaintext" value="{{ $ticket->name_destination }} (PRESIONA PARA VER)">
    </a>
    </div>
</div>

<div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Estado</label>
    <div class="col-sm-10">

      <input disabled type="text" name="" id="state" readonly class="form-control-plaintext" value="{{ $ticket->state }}">
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
@if ($ticket->id_user_destination == $user->id || $ticket->id_user_sender == $user->id)
<div class="content_comments">

<div class="header_comments">
    <div class="mb-3 row">
        <label for="staticEmail" class="col-sm-2 col-form-label">Chat</label>
        <br>
        <div class="col-sm-10">
            <form>
                <input type="number" value="{{ $ticket->id }}" hidden name="id_ticket">
                <input type="text" required placeholder="Agregar un mensaje" name="comment" id="comment" style="width: 90%">
                <button class="btn btn-light" id="btn_save_comment">Guardar</button>
            </form>
        </div>
    </div>
</div>


    <div class="coments">
        @foreach ($comments as $c)
        <div class="comment" style="@if ($c->id_user == $user->id)
        {{ "align-items: end;" }}
        @else
        {{ "align-items: start; background-color:#DDDDDD;" }}
        @endif">
            <div class="comment_header">
            <b>{{ $c->name }}</b>
            <p>{{ $c->date }}</p>
        </div>
            <p>{{ $c->comment }}</p>
            <br>

                <input type="number" value="{{ $ticket->id }}" name="id_ticket" hidden>
                <input type="number" value="{{ $c->id }}" name="id_comment" id="id_comment" hidden>
                @if ($c->id_user == $user->id)

                <button href="" class="btn btn-danger" id="btn_comment_delete"><i class="bi bi-trash3"></i></button>


            @endif
        </div>
        @endforeach


        </div>
        <div class="content_comment_fooder">
            <div class="comment_fooder">
            <b id="validate_conection" >DESCONECTADO <i class="bi bi-wifi"></i></b>
            <b id="validate_writting"></b>
        </div>
    </div>
</div>
@endif


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
            <textarea required  class="form-control" id="exampleFormControlTextarea1" rows="3" name="comment" placeholder="Opinion.......">{{ $calification->comment }}</textarea>
            @else
            <textarea required  class="form-control" id="exampleFormControlTextarea1" rows="3" name="comment" placeholder="Opinion......."></textarea>
            @endif

          </div>

          <button class="btn btn-success" style="margin-bottom:20px;">CALIFICAR</button>
      </form>
    @endif
    <div class="content_buttons">
        @if ($ticket->id_user_sender == $user->id || $validate_user_sistemas)
        <a  href="{{ route('dashboard.tickets.edit_ticket', $ticket->id) }}" class="btn btn-light"> EDITAR TICKET <i class="bi bi-pencil-fill"></i></a>
        @endif
        <a class="btn btn-light" href="{{ route('dashboard.tickets') }}">Volver <i class="bi bi-arrow-return-left"></i></a>

        @if ($ticket->id_user_sender == $user->id)
        <form action="{{ route('dashboard.tickets.delete_ticket') }}" method="post" @if($ticket->id_state != 7) onsubmit="return confirmarEnvio()" @endif>
            @csrf
            <input type="number" name="id_ticket" value="{{ $ticket->id }}" hidden>
            @if($ticket->id_state == 7)
            <button class="btn btn-success">RE ABRIR TICKET </button>
            @else
            <button class="btn btn-danger">ELIMINAR <i class="bi bi-trash3-fill"></i> </button>
            @endif

        </form>
        @if (($ticket->id_state == 5 || $ticket->id_state == 6 ) && $ticket->id_user_sender == $user->id)
        <form action="{{ route('dashboard.tickets.state') }}" method="post">
            @csrf
            <input type="number" name="id_ticket" value="{{ $ticket->id }}" hidden>
        <button class="btn btn-success">TERMINAR <i class="bi bi-check-circle-fill"></i></button>
    </form>
        @endif
        @else

        @if ($ticket->id_state == 4 && $ticket->id_user_destination == $user->id)
        <form action="{{ route('dashboard.tickets.state') }}" method="post">
            @csrf
            <input type="number" name="id_ticket" value="{{ $ticket->id }}" hidden>
        <button  class="btn btn-dark">EJECUTAR <i class="bi bi-info"></i></button>
    </div>
    </form>
    @elseif(( $ticket->id_state == 6||$ticket->id_state == 5) && $ticket->id_user_destination == $user->id)
    <form action="{{ route('dashboard.tickets.notificate_finish_ticket_mail') }}" method="post">
        @csrf
        <input type="number" name="id_ticket" value="{{ $ticket->id }}" hidden>
    <button  class="btn btn-light">NOTIFICAR SOBRE FINALIZACIÓN <i class="bi bi-exclamation-triangle-fill"></i></button>
    </div>
    </form>
        @endif

        @endif
    </div>
@stop


@section('js')
<script>
try {
    const route_sond_notification = "{{ asset('storage/sonds/iphone-notificacion.mp3') }}";
} catch (error) {

}

</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
@vite(['resources/js/view_ticket.js'])

<script>
    function confirmarEnvio() {
      // Mostrar un mensaje de confirmación
      var confirmacion = confirm("¿Estás seguro de eliminar esta ticket?");

      // Si el usuario hace clic en "Aceptar", el formulario se enviará
      return confirmacion;
  }
</script>

<script>

    let content_logo_loading = '<div class="content_logo">'+
        '<img src="{{ asset('storage/icons/loading_logo.gif') }}" alt="">'+
    '</div>';
    const content_loading = document.querySelector(".content_loading");



    document.addEventListener('DOMContentLoaded', function () {
        try {
            var formulario = document.getElementById('miFormulario');
            formulario.addEventListener('submit', function (event) {
                if (validarFormulario()) {
                    content_loading.removeAttribute('hidden');
                    content_loading.innerHTML = content_logo_loading;
                }
            });
        } catch (error) {

}
            function validarFormulario() {

                return true;
            }
        });

</script>
@stop

@extends('layouts.content_notifications')
