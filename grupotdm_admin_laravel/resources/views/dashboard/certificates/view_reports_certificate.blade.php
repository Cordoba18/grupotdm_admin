@extends('adminlte::page')

@section('title', 'GRUPO TDM')

@section('css')
<link rel="stylesheet" href="/css/admin_custom.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<link href="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.css" rel="stylesheet">
@stop

@section('content_header')


@php
    $user = Auth::user();
@endphp


<h1>Generar un reporte</h1>
<br>
@if (session('message'))
    <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>
@endif

<br>
@if (session('message_error'))
    <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>
@endif
@stop

@section('content')


<form action="{{ route('dashboard.certificates.view_certificate.reports_certificate.create') }}" method="post" enctype="multipart/form-data">
    @csrf
    <input type="text" hidden readonly name="id_certificate" value="{{ $id_certificate }}">
    <div class="mb-3">
        <label for="exampleFormControlTextarea1" class="form-label">Descripción del reporte</label>
        <textarea required style=" width: 100%; background-color: white; padding: 10px;"
            class="form-control form-control-plaintext" id="description" rows="3" name="description"
            placeholder="Ingrese una descripcion" maxlength="500"></textarea>
    </div>
    <div class="mb-3">
        <label for="exampleFormControlTextarea1" class="form-label">Subir pruba visual</label>
        <input required type="file" name="file" id="" accept="image/*" style="width: 100%">
      </div>
      <div class="mb-3">
        <button class="btn btn-success">GENERAR</button> <a href="{{ route('dashboard.certificates.view_certificate', $id_certificate) }}" class="btn btn-primary">VOLVER AL CERTIFICADO</a>
      </div>
</form>
<h1>Reportes </h1>
<table  id="miTabla" class="table table-bordered table-striped dataTable">
    <thead>
        <th>ID</th>
        <th>DESCRIPCIÓN</th>
        <th>IMAGEN</th>
        <th>FECHA</th>
        <th>USUARIO DE REPORTE</th>
        <th>ACCIÓN</th>

    </thead>
    <tbody>
        @foreach ($reports_certificates as $r)
        <tr>
        <td>{{ $r->id }}</td>
        <td>{{ $r->description }}</td>
        <td> <img style="width: 100%; height: 100%; object-fit: contain"
            src="{{ asset('storage/files/'.$r->image ) }}" alt=""></td>
        <td>{{ $r->date }}</td>
        <td>{{ $r->name }}</td>
        @if($r->id_user)
        <td>

            <form action="{{ route('dashboard.certificates.view_certificate.reports_certificate.delete') }}" method="post">
                @csrf
                <input type="text" hidden readonly name="id_report_certificate" value="{{ $r->id }}">
                <input type="text" hidden readonly name="id_certificate" value="{{ $id_certificate }}">
                <button class="btn btn-danger"><i class="bi bi-trash3"></i></button>
            </form>

        </td>
        @endif

    </tr>
        @endforeach

    </tbody>
</table>
@stop
@section('js')
<script src="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.js"></script>
<script>
    $(document).ready(function() {
      $('#miTabla').DataTable({
        "paging": true,  // Habilita la paginación
        "lengthChange": false, // Oculta el control para cambiar el número de elementos por página
        "searching": false, // Deshabilita la función de búsqueda
        "ordering": false, // Habilita la ordenación de columnas
        "info": false, // Muestra información sobre la paginación
        "autoWidth": true // Deshabilita el ajuste automático del ancho de las columnas

      });
    });
  </script>

@stop
@extends('layouts.content_notifications')
