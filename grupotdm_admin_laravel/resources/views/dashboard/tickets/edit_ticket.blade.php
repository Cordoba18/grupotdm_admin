@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@php
    $user = Auth::user();
@endphp


@section('content_header')
<div class="content_loading" hidden>

</div>
    <h1>Editar ticket</h1>
    @if (session('message'))
        <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>
    @endif
@stop

@section('content')
    <form id="miFormulario" action="{{ route('dashboard.tickets.save_changes_ticket') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <input type="number" name="id_ticket" hidden value="{{ $ticket->id }}">
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Nombre</label>
            <input type="text" name="name" class="form-control" id="exampleFormControlInput1"
                placeholder="Ingrese nombre del ticket" required value="{{ $ticket->name }}">
        </div>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Descripciòn</label>
            <textarea required class="form-control" id="exampleFormControlTextarea1" rows="3" name="description"
                placeholder="Ingrese una descripcion" maxlength="500">{{ $ticket->description }}</textarea>
        </div>
        <div class="mb-3">
            <label for="formFile" class="form-label">Cambiar archivo</label>
            <input class="form-control" type="file" id="formFile" name="file">
        </div>

        @if ($validate_user_sistemas)
            <label for="exampleFormControlInput1" class="form-label">Seleccione el usuario a imponer tarea</label>
            <select name="id_user_destination" required style="width: 100%" class="form-select form-select-lg mb-3"
                aria-label="Large select example">
                @php
                    $name_user = null;
                    $id_user = null;
                @endphp
                @foreach ($users as $u)
                    @if ($u->id == $ticket->id_user_destination)
                        @php
                            $name_user = $u->name;
                            $id_user = $u->id;
                        @endphp
                    @endif
                @endforeach
                <option value="{{ $id_user }}">{{ $name_user }}</option>
                @foreach ($users as $u)
                    @if ($u->id !== $id_user)
                        <option value="{{ $u->id }}">{{ $u->name }}</option>
                    @endif
                @endforeach
            </select>
        @else
            <div class="mb-3 row">
                <label for="staticEmail" class="col-sm-2 col-form-label">Usuario asignado</label>
                <div class="col-sm-10">
                    <input disabled type="text" id="input_date_start" name="" readonly
                        class="form-control-plaintext" value="{{ $ticket->name_destination }}">
                </div>
            </div>
        @endif
        <div class="mb-3 row">
            <label for="staticEmail" class="col-sm-2 col-form-label">Previa fecha de inicialización</label>
            <div class="col-sm-10">
                <input disabled type="text" id="input_date_start" name="" readonly class="form-control-plaintext"
                    value="{{ $ticket->date_start }}">
            </div>
        </div>
        <div class="mb-3 row">
            <label for="staticEmail" class="col-sm-2 col-form-label">Previa fecha de finalización</label>
            <div class="col-sm-10">
                <input disabled type="text" name="" id="" readonly class="form-control-plaintext"
                    value="{{ $ticket->date_finally }}">
            </div>
        </div>

        <div class="mb-3 row">
            <label for="staticEmail" class="col-sm-2 col-form-label">Prioridad</label>
            <div class="col-sm-10">
                <input disabled type="text" name="" id="input_date_finally" readonly
                    class="form-control-plaintext" value="{{ $ticket->priority }}">
            </div>
        </div>

        <button class="btn btn-success">GUARDAR CAMBIOS</button>
        <a class="btn btn-primary" href="{{ route('dashboard.tickets.ticket_detail', $ticket->id) }}">Volver</a>
    </form>
@stop

@section('css')
@vite('resources/css/content_loading.css')

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
