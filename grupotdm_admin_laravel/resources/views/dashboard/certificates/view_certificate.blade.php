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
            <img style="object-fit: contain; width: 100%; height: 100%;" src="{{ asset('storage/icons/logo.png') }}"
                alt="">
        </div>
    </center>
    <br>

    <div class="content_header_certificate" style="display: flex">
        <div class="content_left_certificate" style="padding-right:10px">
            <div class="mb-3">
                <label for="formFile" class="form-label">FECHA</label>
                <input required type="text" id="" name="" readonly class="form-control-plaintext"
                    value="{{ $certificate->date }}" style="background-color: white; padding: 10px; width: 100%;">
            </div>
            <div class="mb-3">
                <label for="formFile" class="form-label">AREA DEL DESPACHADOR</label>
                <input required type="text" id="area" name="area" readonly class="form-control-plaintext"
                    value="{{ $certificate->area_delivery }}"
                    style="background-color: white; padding: 10px; width: 100%;">
            </div>
            <div class="mb-3">
                <label for="formFile" class="form-label">DESPACHA</label>
                <a href="{{ route('dashboard.users.view_user', $certificate->id_user_delivery) }}">
                    <input required type="text" id="deveices" name="user_delivery" readonly
                        class="form-control-plaintext" value="{{ $certificate->name_delivery }}"
                        style="background-color: white; padding: 10px; width: 100%;font-weight: bold; border-bottom: 3px solid black;"></a>
            </div>
            <div class="mb-3">
                <label for="formFile" class="form-label">DIRECCIÓN DE ENVIO</label>
                <input required type="text" id="deveices" name="user_delivery" readonly
                    class="form-control-plaintext" value="{{ $certificate->address }}"
                    style="background-color: white; padding: 10px; width: 100%">
            </div>
        </div>
        <div class="content_right_certificate">
            <div class="mb-3">
                <label for="formFile" class="form-label">TIPO DE ACTA</label>
                <input required type="text" id="deveices" name="user_delivery" readonly
                    class="form-control-plaintext" value="{{ $certificate->proceeding }}"
                    style="background-color: white; padding: 10px; width: 100%;">
            </div>
            @if ($certificate->name_user_receives)
            <div class="mb-3">
                <label for="formFile" class="form-label">USUARIO A RECIBIR</label>
                <input required type="text" id="" name="" readonly
                    class="form-control-plaintext" value="{{ $certificate->name_user_receives }}"
                    style="background-color: white; padding: 10px; width: 100%">
            </div>
            @else
            <div class="mb-3">
                <label for="formFile" class="form-label">AREA DE USUARIO A RECIBIR</label>
                <input required type="text" id="deveices" name="user_delivery" readonly
                    class="form-control-plaintext" value="{{ $certificate->area_receives }}"
                    style="background-color: white; padding: 10px; width: 100%;">
            </div>

            <div class="mb-3">
                <label for="formFile" class="form-label">USUARIO A RECIBIR</label>
                <a href="{{ route('dashboard.users.view_user', $certificate->id_user_receives) }}">
                    <input required type="text" id="deveices" name="user_delivery" readonly
                        class="form-control-plaintext" value="{{ $certificate->name_receives }}"
                        style="background-color: white; padding: 10px; width: 100%;font-weight: bold; border-bottom: 3px solid black;">
                </a>
            </div>
            @endif



            <div class="mb-3">
                <label for="formFile" class="form-label">USUARIO/RECEPCIONISTA ENCARGADO DE DAR SALIDA</label>
                @if ($user_reception)
                    <a href="{{ route('dashboard.users.view_user', $user_reception->id) }}">
                @endif
                <input
                    style="width: 100%;background-color: white; padding: 10px; font-weight: bold;border-bottom: 3px solid black;"
                    required type="text" id="deveices" name="user_delivery" readonly class="form-control-plaintext"
                    value="@if ($user_reception) {{ $user_reception->name }}@else{{ 'No ha sido accionado por un recepcionista' }} @endif">
                @if ($user_reception)
                    </a>
                @endif
            </div>
        </div>
    </div>
    <div class="mb-3">
        <label for="formFile" class="form-label">ACTIVOS</label>
    </div>

    <table class="table" style="font-size: 14px; width: 100%;border: 1px solid black;">
        <thead class="table-dark">
            <th>ID PRODUCTO</th>
            <th>NOMBRE/DESCRIPCION</th>
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
                    <td>{{ $r->id_product }} <br><a href="{{ route('dashboard.inventories.view_product', $r->id_product) }}"
                        class="btn btn-primary"><i class="bi bi-eye-fill"></i></a></td>
                    <td>{{ $r->name }}</td>
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
        <textarea style=" width: 100%; background-color: white; padding: 10px;" readonly
            class="form-control form-control-plaintext" id="observations" rows="3" name="observations"
            placeholder="Ingrese una descripcion" maxlength="500">{{ $certificate->general_remarks }}</textarea>
    </div>
    <br>
    <div class="mb-3">
        <label for="formFile" class="form-label">ESTADO</label>
        <input required type="text" id="deveices" name="user_delivery" readonly class="form-control-plaintext"
            value="{{ $certificate->state }}" style="background-color: white; padding: 10px; width: 100%;">
    </div>
    <br>

    <div class="content_images">
        <div class="content_left_images">
            @if($certificate->id_proceeding == 1)
            <b style="width: 100%">Prueba de despacho de activos:</b>
            @else
            <b style="width: 100%">Prueba de prestamo de activos:</b>
            @endif

            <br>
            @if ($certificate_full->image_exit)
                <div class="content_image" style="width: 100%; height: 240px;">
                    <img style="width: 100%; height: 100%; object-fit: contain"
                        src="{{ asset('storage/files/' . $certificate_full->image_exit) }}" alt="">
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
        <div class="content_right_images">
            <b style="width: 100%">Prueba de llegada de activos:</b>
            <br>
            @if ($certificate_full->image_delivery)
                <div class="content_image" style="width: 100%; height: 240px;">
                    <img style="width: 100%; height: 100%; object-fit: contain"
                        src="{{ asset('storage/files/' . $certificate_full->image_delivery) }}" alt="">
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
@if (
    (($user->id ==  $certificate_full->id_user_delivery && $certificate_full->id_state == 3 && $certificate_full->id_proceeding == 2)  || ($user->id_area == 16 || $user->id == $certificate_full->id_user_receives || $user->id_area == $certificate->id_area_user_receives) && $certificate_full->id_state == 11) ||
        ($user->id_area == 16 && $certificate_full->id_state == 3 && $certificate_full->id_state != 12))

    <form action="{{ route('dashboard.certificates.view_certificate.state_certificate') }}" method="post"
        enctype="multipart/form-data">
        @csrf
        <div class="mb-3">
            @if ($certificate_full->id_state == 3)
                <label for="formFile" class="form-label">DAR SALIDA DE ACTIVOS </label>
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
    <div class="content_buttons" style="display: flex;flex-direction: column; justify-content: space-around;flex-wrap: wrap; justify-items: center;">
    <button onclick="imprimirDiv()" class="btn btn-dark btn-lg">Imprimir acta <i class="bi bi-printer"></i></button>
    @if ($user->id == $certificate_full->id_user_receives || $user->id == $certificate_full->id_user_delivery)
    <a href="{{ route('dashboard.certificates.view_certificate.reports_certificate',$certificate_full->id) }}" class="btn btn-outline-light btn-lg" style="color: black">Reportar novedades <i class="bi bi-person-raised-hand"></i></a>

    @endif
    @if($user->id == $certificate_full->id_user_delivery && $certificate_full->id_state == 11 )
    <form action="{{  route('dashboard.certificates.view_certificate.notificate_user_finish_certificate') }}" method="post">
        @csrf
        <input type="text" name="id_certificate" value="{{ $certificate_full->id }}" hidden>
        <button class="btn btn-success btn-lg" style="width: 100%">PEDIR A USUARIO CONFIRMACIÓN DE ACTIVOS <i class="bi bi-bell-fill"></i></button>
    </form>
    @endif
    @if ($certificate_full->id_user_delivery == $user->id && $certificate_full->id_state !== 2 && $certificate_full->id_state !== 12)
    <form action="{{ route('dashboard.certificates.delete') }}" method="post"  onsubmit="return confirmarEnvio()">
        @csrf
        <input type="number" value="{{ $certificate_full->id }}" hidden name="id_certificate">
        <button class="btn btn-danger btn-lg" style="width: 100%">ELIMINAR<i class="bi bi-trash3"></i></button>
    </form>
    @endif
</div>

</div>
@stop




@section('js')
<script>
    function confirmarEnvio() {
      // Mostrar un mensaje de confirmación
      var confirmacion = confirm("¿Estás seguro de eliminar esta acta?");

      // Si el usuario hace clic en "Aceptar", el formulario se enviará
      return confirmacion;
  }
</script>

@vite(['resources/js/show_certificate.js'])
<script>
    function imprimirDiv() {
        var contenidoDiv = document.getElementById('content_form_certificate').innerHTML;
        var ventanaImpresion = window.open('', '_blank');
        ventanaImpresion.document.write(
            '<html><head><title>ACTA GRUPO TDM</title></head><body style="font-size:10px;"><style>  input{ padding: 0; } </style>'
        );
        ventanaImpresion.document.write(contenidoDiv);
        ventanaImpresion.document.write('</body></html>');
        ventanaImpresion.document.close();
        ventanaImpresion.print();
    }
</script>

@stop
@extends('layouts.content_notifications')
