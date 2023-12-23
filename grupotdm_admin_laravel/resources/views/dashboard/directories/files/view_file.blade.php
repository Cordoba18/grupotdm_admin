@extends('adminlte::page')

@section('title', 'GRUPO TDM')


@section('content_header')
@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
@stop
    <h1>EDITAR ARCHIVO</h1>

    @if (session('message'))
        <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>
    @endif
    @if (session('message_error'))
        <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>
    @endif
@stop

@section('content')
    <form action="{{ route('dashboard.edit_file') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <input type="number" hidden required name="id_directory" class="form-control" id="exampleFormControlInput1"
            value="{{ $directorie->id }}">
        <input type="number" hidden required name="id_file" class="form-control" id="exampleFormControlInput1"
            value="{{ $file->id }}">

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Nombre</label>
            <input type="text" required name="name" class="form-control" id="exampleFormControlInput1"
                placeholder="Ingrese nombre del archivo" value="{{ $file->name }}">
        </div>
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Fecha de creacion</label>
            <input type="text" required disabled class="form-control" id="exampleFormControlInput1"
                value="{{ $file->date_create }}">
        </div>
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Ultima fecha de modificacion</label>
            <input type="text" required disabled class="form-control" id="exampleFormControlInput1"
                value="{{ $file->date_update }}">
        </div>

        <div class="mb-3">
            <label for="formFile" class="form-label">Descargar archivo</label>
            <br>
            <a class="btn btn-dark" href="{{ asset('storage/files/' . $directorie->directory . '/' . $file->file) }}"
                download="">Descargar Archivo <i class="bi bi-download"></i></a>
        </div>
        <div class="mb-3">
            <label for="formFile" class="form-label">Cambiar archivo</label>
            <input class="form-control" type="file" id="formFile" name="file">
        </div>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">CODIGO DEL REPOSITORIO</label>
            <input id="code" type="number" inputmode="none" maxlength="6" inputmode="numeric" pattern="[0-9]*"
                placeholder="Ingrese el codigo" name="code" required>
        </div>
        <div style="display: flex">
        <button class="btn btn-success" style="margin-right: 10px">GUARDAR CAMBIOS</button>

    </form>
    <form action="{{ route('dashboard.view_directory') }}" method="get">
        <input type="number" name="id" value="{{ $directorie->id}}" hidden>
        <button class="btn btn-primary">VOLVER</button>
    </form>
</div>
    <br>
    <b>OTROS CAMBIOS</b>
    <br>
    <table class="table">
        <thead>
            <th>ID</th>
            <th>NOMBRE</th>
            <th>FECHA DE MODIFICACION</th>
            <th>USUARIO DE ACCION</th>
            <th>DESCARGAR</th>
        </thead>
        <tbody style="overflow-y: 300px;">
            @foreach ($files_modified as $fm)
                <tr>
                    <td>{{ $fm->id }}</td>
                    <td>{{ $fm->name }}</td>
                    <td>{{ $fm->date_update }}</td>
                    <td>{{ $fm->name_user }}</td>
                    <td>
                        <a class="btn btn-dark"
                            href="{{ asset('storage/files/' . $directorie->directory . '/' . $fm->file) }}"
                            download="">Descargar Archivo<i class="bi bi-download"></i></a>
                    </td>
                </tr>
            @endforeach

        </tbody>
    </table>
@stop



@section('js')

@stop
