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
    <h1>TIENDAS TESORERIA</h1>
    <br>
    @if (session('message'))
        <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>
    @endif
    @if (session('message_error'))
    <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>
@endif


@stop

@section('content')
@if($validation_jefe)


    <form id="miFormulario" action="{{ route('dashboard.spreadsheets.shops.create') }}" method="post">
        @csrf
          <div class="mb-3">
            <label for="formFile" class="form-label">USUARIO A RECIBIR</label>
            <select name="id_user" id="id_user" style="width: 100%;border: 0; padding: 10px" required>
                <option value="">Seleccione un tesorero</option>
                @foreach ($users as $u)
                <option value="{{ $u->id }}">{{ $u->name }}</option>
                @endforeach
            </select>
          </div>
        </div>
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Compañia</label>
            <select required name="id_company" id="id_company" style="width: 100%" class="form-select form-select-lg mb-3"
                aria-label="Large select example">
                <option value="">SELECCIONE UNA COMPAÑIA</option>
                @foreach ($companies as $c)
                    <option value="{{ $c->id }}">{{ $c->company }}</option>
                @endforeach
            </select>
        </div>
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Tienda</label>
            <select name="id_shop" id="id_shop" style="width: 100%" class="form-select form-select-lg mb-3"
                aria-label="Large select example">
                <option value="">SELECCIONE UNA TIENDA</option>
                <option value="">NINGUNA</option>
                @foreach ($shops as $s)
                    <option value="{{ $s->id }}">{{ $s->shop }}</option>
                @endforeach
            </select>
                <button class="btn btn-primary" style="margin-bottom: 10px; width: 100%;">ASIGNAR</button>
    </form>

    @endif
    <table id="miTabla" class="table table-bordered table-striped dataTable">

        <thead class="table">
            <th>NOMBRE DE TESORERO</th>
            <th>TIENDAS</th>
            <th>COMPAÑIA</th>
            @if($validation_jefe)
            <th>QUITAR</th>
            @endif
        </thead>

        <tbody>
            @foreach ($spreadsheet_shops as $s)
                <tr>
                    <td><a style="color: black;text-decoration: none; font-weight: bold;" href="{{ route('dashboard.users.view_user', $s->id_user) }}">{{ $s->name }}</a> </td>
                    <td>{{ $s->shop }}</td>
                    <td>{{ $s->companie }}</td>
                    @if($validation_jefe)
                    <td><form action="{{ route("dashboard.spreadsheets.shops.delete") }}" method="post">
                        @csrf
                        <input type="number" name="id_spreadsheet_shop" value="{{ $s->id }}" hidden>
                    <button class="btn btn-danger">ELIMINAR</button>
                    </form></td>
                    @endif
                </tr>
            @endforeach
        </tbody>
    </table>



@stop



@section('js')
    @vite('resources/js/spreadsheets_shops.js')
    <script>
        var route_view_user = "{{ route('dashboard.users.view_user', 0) }}".slice(0, -1);
    </script>
    <script src="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#miTabla').DataTable({
                "paging": true, // Habilita la paginación
                "lengthChange": false, // Oculta el control para cambiar el número de elementos por página
                "searching": true, // Deshabilita la función de búsqueda
                "ordering": true, // Habilita la ordenación de columnas
                "info": false, // Muestra información sobre la paginación
                "autoWidth": true // Deshabilita el ajuste automático del ancho de las columnas

            });
        });
    </script>
@stop
@extends('layouts.content_notifications')
