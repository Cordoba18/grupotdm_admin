@extends('adminlte::page')

@section('title', 'GRUPO TDM')


@section('content_header')
@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    @vite(['resources/css/create_certificate.css'])
@stop

<h1 style="font-weight: bold">CREAR ACTA</h1>

@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
@stop

@section('content')
<form action="{{ route('dashboard.certificates.create.save') }}" method="post">
    @csrf
<div class="content_header_certificate">
    <div class="content_left_certificate">
    <div class="mb-3">
        <label for="formFile" class="form-label">FECHA</label>
        <input required type="text"  id="date" name="date" readonly class="form-control-plaintext" value="0" style="background-color: white; padding: 10px">
      </div>
      <div class="mb-3">
        <label for="formFile" class="form-label">AREA DEL DESPACHADOR</label>
        <input required type="text" id="area" name="area" readonly class="form-control-plaintext" value="{{ $user->area }}" style="background-color: white; padding: 10px">
      </div>
      <div class="mb-3">
        <label for="formFile" class="form-label">DESPACHA</label>
        <input required type="text" id="deveices" name="user_delivery" readonly class="form-control-plaintext" value="{{ $user->name }}" style="background-color: white; padding: 10px">
      </div>

    </div>
    <div class="content_right_certificate">
        <div class="mb-3">
            <label for="formFile" class="form-label">TIPO DE ACTA</label>
            <select name="id_proceeding" id="id_proceeding" style="width: 100%;border: 0; padding: 14px" required>
                <option value="">Seleccione un tipo de acta</option>
                @foreach ($proceedings as $p)
                <option value="{{ $p->id }}">{{ $p->proceeding }}</option>
                @endforeach
            </select>
          </div>
          <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">¿El usuario hace parte de la organización?</label><br>

    <label>
        <input checked type="radio" name="input_validate_user" id="input_validate_user" value="1" required>
        SI
      </label>
      <label>
        <input type="radio" name="input_validate_user" id="input_validate_user" value="2" required>
        NO
      </label>
            </div>
          <div class="content_user_dates">
        <div class="mb-3">
            <label for="formFile" class="form-label">AREA DEL USUARIO A RECIBIR</label>
            <select name="" id="id_area_receives" style="width: 100%;border: 0; padding: 10px" required>
                <option value="">Seleccione un area</option>
                @foreach ($areas as $a)
                <option value="{{ $a->id }}">{{ $a->area }}</option>
                @endforeach
            </select>
          </div>
          <div class="mb-3">
            <label for="formFile" class="form-label">USUARIO A RECIBIR</label>
            <select name="id_user_receives" id="id_user_receives" style="width: 100%;border: 0; padding: 10px" required>
                <option value="">Seleccione un area</option>
            </select>
          </div>
        </div>
        <div class="content_user_anonimo" hidden>
            <div class="mb-3">
                <label for="formFile" class="form-label">NOMBRE DE USUARIO A RECIBIR</label>
                <input required disabled type="text" id="name_user_receive" name="name_user_receive" class="form-control-plaintext" placeholder="Ingrese un nombre" style="background-color: white; padding: 10px">
              </div>
        </div>
    </div>
</div>
<div class="mb-3">
    <label for="formFile" class="form-label">DIRECCIÓN DE ENVIO</label>
    <input required type="text" id="address" name="address"  class="form-control-plaintext" placeholder="Ingrese la dirección de envio" style="background-color: white; padding: 10px">
  </div>

        <table class="table" style="font-size: 14px">
            <thead class="table-dark">
            <th>ID</th>
            <th>NOMBRE/DESCRIPCIÓN</th>
            <th>MARCA</th>
            <th>SERIAL</th>
            <th>TIPO DE COMPONENTE</th>
            <th>ORIGEN</th>
            <th>ESTADO</th>
            <th>ACCESORIOS</th>
            <th>ACCION</th>
        </thead>

        <tbody class="table-light" id="content_rows" style="height: auto">
                <tr class="row_certificate">
                    <td><input type="number" placeholder="Id producto" id="id_product" name="" value=""> <button id="btn_validate" class="btn btn-success">VALIDAR</button></td>
                    <td><input type="text" readonly disabled placeholder="Descripción" id="description" name="description" value=""></td>
                    <td><input type="text" readonly disabled placeholder="Marca" id="brand" name="brand" value=""></td>
                    <td><input type="text" readonly disabled placeholder="Serial" id="serie" name="serie"></td>
                    <td><input  type="text" readonly disabled name="id_type_component" id="id_type_component" required></td>
                    <td><input type="text" required disabled name="id_origin_certificate" id="id_origin_certificate"></td>
                    <td><input type="text" required disabled name="id_state_certificate" id="id_state_certificate"></td>
                    <td><textarea name="accessories" id="accessories" cols="20" rows="3" required disabled placeholder="Accesorios"></textarea></td>
                    <td><button class="btn btn-danger" id="btn_delete_row"><i class="bi bi-trash3"></i></button></td>
                </tr>
        </tbody>
        </table>
        <div class="mb-3">
        <button class="btn btn-success" id="btn_add_row">ADICIONAR UN CAMPO <i class="bi bi-plus"></i></button>
        </div>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Observaciones Generales</label>
            <textarea  required class="form-control" id="observations" rows="3" name="observations" placeholder="Ingrese una descripcion" maxlength="500"></textarea>
          </div>
          <div class="mb-3">
            <p class="alert alert-danger" role="alert" id="label_error" hidden ></p>
          </div>
          <div class="overlay" id="content_loading" style="display: flex; align-items: center" hidden>
            <p class="alert alert-success" role="alert" id="label_success" style="margin-right: 20px">Cargando.........</p>
            <i id="element_loading" class="fas fa-2x fa-sync-alt fa-spin"></i>
        </div>
        <br><br>
          <div class="mb-3" style="display: flex;align-items: center;">
            <button class="btn btn-primary" id="btn_save" style=" margin-right: 20px">GUARDAR ACTA</button>
            <br><br>
    </div>
    <br><br><br>
</form>
@stop



@section('js')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
@vite(['resources/js/create_certificate.js'])

@stop
