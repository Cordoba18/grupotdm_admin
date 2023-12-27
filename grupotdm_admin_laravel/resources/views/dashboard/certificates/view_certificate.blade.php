@extends('adminlte::page')

@section('title', 'GRUPO TDM')


@section('content_header')
@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    @vite(['resources/css/view_certificate.css'])
@stop

@php
$user = Auth::user();
@endphp

@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
@stop

@section('content')
<div id="content_form_certificate">
<br>
<center>
    <h1 style="font-weight: bold">ACTA DE {{ $certificate->proceeding }}</h1>
<div class="content_img" style="height: 100px; width: 150px">
    <img style="object-fit: contain; width: 100%; height: 100%;" src="{{ asset('storage/icons/logo.png') }}" alt="">
    </div>
    </center>
    <br>

<div class="content_header_certificate" style="display: flex">
    <div class="content_left_certificate" style="padding-right:10px">
    <div class="mb-3">
        <label for="formFile" class="form-label">FECHA</label>
        <input required type="text"  id="" name="" readonly class="form-control-plaintext" value="{{ $certificate->date }}" style="background-color: white; padding: 10px; width: 100%;">
      </div>
      <div class="mb-3">
        <label for="formFile" class="form-label">AREA DEL DESPACHADOR</label>
        <input required type="text" id="area" name="area" readonly class="form-control-plaintext" value="{{ $certificate->area_delivery }}" style="background-color: white; padding: 10px; width: 100%;">
      </div>
      <div class="mb-3">
        <label for="formFile" class="form-label">DESPACHA</label>
        <input required type="text" id="deveices" name="user_delivery" readonly class="form-control-plaintext" value="{{ $certificate->name_delivery }}" style="background-color: white; padding: 10px; width: 100%;">
      </div>
      <div class="mb-3">
        <label for="formFile" class="form-label">DIRECCIÓN DE ENVIO</label>
        <input required type="text" id="deveices" name="user_delivery" readonly class="form-control-plaintext" value="{{ $certificate->address }}" style="background-color: white; padding: 10px; width: 100%">
      </div>
    </div>
    <div class="content_right_certificate">
        <div class="mb-3">
            <label for="formFile" class="form-label">TIPO DE ACTA</label>
            <input required type="text" id="deveices" name="user_delivery" readonly class="form-control-plaintext" value="{{ $certificate->proceeding }}" style="background-color: white; padding: 10px; width: 100%;">
          </div>
        <div class="mb-3">
            <label for="formFile" class="form-label">AREA DE USUARIO A RECIBIR</label>
            <input required type="text" id="deveices" name="user_delivery" readonly class="form-control-plaintext" value="{{ $certificate->area_receives }}" style="background-color: white; padding: 10px; width: 100%;">
          </div>

          <div class="mb-3">
            <label for="formFile" class="form-label">USUARIO A RECIBIR</label>
            <input required type="text" id="deveices" name="user_delivery" readonly class="form-control-plaintext" value="{{ $certificate->name_receives }}" style="background-color: white; padding: 10px; width: 100%;">
          </div>


          <div class="mb-3">
            <label for="formFile" class="form-label">RECEPCIONISTA ENCARGADO DE DAR SALIDA</label>
            <input style="width: 100%;background-color: white; padding: 10px;" required type="text" id="deveices" name="user_delivery" readonly class="form-control-plaintext" value="
            @if ($user_reception)
            {{ $user_reception->name }}
            @else
            {{ "No ha sido accionado por un recepcionista" }}
            @endif">
          </div>
    </div>
</div>
<div class="mb-3">
    <label for="formFile" class="form-label">ACTIVOS</label>
</div>

        <table class="table" style="font-size: 14px; width: 100%;border: 1px solid black;">
            <thead class="table-dark">
            <th>ID</th>
            <th>CANTIDAD</th>
            <th>DESCRIPCIÓN - MODELO</th>
            <th>MARCA</th>
            <th>SERIAL</th>
            <th>TIPO DE COMPONENTE</th>
            <th>ORIGEN</th>
            <th>ESTADO</th>
            <th>ACCESORIOS</th>
        </thead>

        <tbody class="table-light" style="height: auto">
            @foreach ($rows_certificate as $r)
                <tr style="border-bottom: 4px solid black; text-align: center;">
                    <td>{{ $r->id }}</td>
                    <td>{{ $r->amount }}</td>
                    <td>{{ $r->description }}</td>
                    <td>{{ $r->brand }}</td>
                    <td>{{ $r->serie }}</td>
                    <td>{{ $r->type_component }}</td>
                    <td>{{ $r->origin_certificate }}</td>
                    <td>{{ $r->state_certificate }}</td>
                    <td>{{ $r->accessories }}</td>

                </tr>
                @endforeach
        </tbody>
        </table>

        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Observaciones Generales</label>
            <textarea  style=" width: 100%; background-color: white; padding: 10px;" readonly class="form-control form-control-plaintext" id="observations" rows="3" name="observations" placeholder="Ingrese una descripcion" maxlength="500">{{ $certificate->general_remarks }}</textarea>
          </div>
    <br>
    <div class="mb-3">
        <label for="formFile" class="form-label">ESTADO</label>
        <input required type="text" id="deveices" name="user_delivery" readonly class="form-control-plaintext" value="{{ $certificate->state }}" style="background-color: white; padding: 10px; width: 100%;">
      </div>
      <br>

    <div class="content_images" style="display: flex">
        <div class="content_left_images" style="width: 50%">
            <b style="width: 100%">Prueba de despacho de activos:</b>
            <br>
            @if ($certificate_full->image_exit)

            <div class="content_image" style="width: 100%; height: 240px;">
                <img style="width: 100%; height: 100%; object-fit: contain" src="{{ asset('storage/files/'.$certificate_full->image_exit) }}" alt="">
            </div>
            <br>
            <div style="display: flex; width: 100%;">
                <p style="margin-right: 15px">FECHA :</p>
                <b>{{ $certificate_full->date_exit }}</b>
            </div>
            @else
            <p style="width: 100%">No se ha generado una prueba</p>
            @endif
        </div>
        <div class="content_right_images" style="width: 50%">
            <b style="width: 100%">Prueba de llegada de activos:</b>
            <br>
            @if ($certificate_full->image_delivery)

            <div class="content_image" style="width: 100%; height: 240px;">
                <img style="width: 100%; height: 100%; object-fit: contain" src="{{ asset('storage/files/'.$certificate_full->image_delivery) }}" alt="">
            </div>
            <br>
            <div style="display: flex; width: 100%;">
                <p style="margin-right: 15px">FECHA :</p>
                <b>{{ $certificate_full->date_delivery }}</b>
            </div>
            @else
            <p style="width: 100%">No se ha generado una prueba</p>
            @endif
        </div>
    </div>
</div>

    @if(($user->id == $certificate_full->id_user_receives || $user->id_area == 16) && $certificate_full->id_state != 12)

    <form action="{{ route('dashboard.certificates.view_certificate.state_certificate') }}" method="post" enctype="multipart/form-data">
    @csrf

    <div class="mb-3">
        @if ($certificate_full->id_state == 3 &&  $user->id_area == 16)
        <label for="formFile" class="form-label">DAR SALIDA DE ACTIVOS</label>
        @elseif ($certificate_full->id_state == 11)
        <label for="formFile" class="form-label">DAR ENTRADA DE ACTIVOS</label>
        @endif
        <input required type="file" name="file" id="" accept="image/*" style="width: 100%">
        <label for="formFile" class="form-label">FECHA</label>
        <input type="text" id="date" style="width: 100%" readonly name="date">
        <input type="text" name="id_certificate" hidden value="{{ $certificate_full->id }}">
        <button class="btn btn-dark" style="margin-top: 10px">GUARDAR</button>
        <br>
        <br>
      </div>
    </form>
      @endif
      <div class="mb-3">
      <button onclick="imprimirDiv()" class="btn btn-dark">Imprimir ACTA</button>
      </div>
@stop




@section('js')

@vite(['resources/js/show_certificate.js'])
<script>
    function imprimirDiv() {
      var contenidoDiv = document.getElementById('content_form_certificate').innerHTML;
      var ventanaImpresion = window.open('', '_blank');
      ventanaImpresion.document.write('<html><head><title>ACTA GRUPO TDM</title></head><body style="font-size:10px;"><style>  input{ padding: 0; } </style>');
      ventanaImpresion.document.write(contenidoDiv);
      ventanaImpresion.document.write('</body></html>');
      ventanaImpresion.document.close();
      ventanaImpresion.print();
    }
  </script>

@stop
