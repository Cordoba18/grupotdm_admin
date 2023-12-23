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
<form action="" method="post">
<div class="content_header_certificate">
    <div class="content_left_certificate">
    <div class="mb-3">
        <label for="formFile" class="form-label">FECHA</label>
        <input required type="text" id="date" name="date" readonly class="form-control-plaintext" value="0" style="background-color: white; padding: 10px">
      </div>
      <div class="mb-3">
        <label for="formFile" class="form-label">AREA DEL DESPACHADOR</label>
        <input required type="text" id="date" name="date" readonly class="form-control-plaintext" value="{{ $user->area }}" style="background-color: white; padding: 10px">
      </div>
      <div class="mb-3">
        <label for="formFile" class="form-label">DESPACHA</label>
        <input required type="text" id="date" name="date" readonly class="form-control-plaintext" value="{{ $user->name }}" style="background-color: white; padding: 10px">
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
            </select>
          </div>
    </div>
</div>
        <table class="table" style="font-size: 14px">
            <thead class="table-dark">
            <th>CANTIDAD</th>
            <th>DESCRIPCIÓN - MODELO</th>
            <th>MARCA</th>
            <th>SERIAL</th>
            <th>TIPO DE COMPONENTE</th>
            <th>ORIGEN</th>
            <th>ESTADO</th>
            <th>ACCESORIOS</th>
            <th>ACCION</th>
        </thead>

        <tbody class="table-light" id="content_rows">
                <tr class="row_certificate">
                    <td><input type="number" placeholder="Cantidad" name="amount"></td>
                    <td><input type="text" placeholder="Descripción" name="description"></td>
                    <td><input type="text" placeholder="Marca" name="brand"></td>
                    <td><input type="text" placeholder="Serial" name="serie"></td>
                    <td><select name="id_type_component" id="" required>
                        <option value="">Tipo de componente</option>
                        @foreach ($types_components as $t)
                        <option value="{{ $t->id }}">{{ $t->type_component }}</option>
                        @endforeach
                    </select></td>
                    <td><select required name="id_origin_certificate" id="">
                        <option value="">Estado de origen</option>
                    @foreach ($origins_certificates as $o)
                    <option value="{{ $o->id }}">{{ $o->origin_certificate }}</option>
                    @endforeach
                </select></td>
                    <td><select required name="id_state_certificate" id="">
                        <option value="">Estado</option>
                        @foreach ($states_certificates as $s)
                        <option value="{{ $s->id }}">{{ $s->state_certificate }}</option>
                        @endforeach
                        </select></td>
                    <td><textarea name="" id="" cols="10" rows="3" placeholder="Accesorios"></textarea></td>
                    <td><button class="btn btn-danger" id="btn_delete_row"><i class="bi bi-trash3"></i></button></td>
                </tr>
        </tbody>
        </table>
        <div class="mb-3">
        <button class="btn btn-success" id="btn_add_row">ADICIONAR UN CAMPO <i class="bi bi-plus"></i></button>
        </div>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Observaciones Generales</label>
            <textarea  required class="form-control" id="exampleFormControlTextarea1" rows="3" name="description" placeholder="Ingrese una descripcion" maxlength="500"></textarea>
          </div>

</form>
@stop



@section('js')

@vite(['resources/js/create_certificate.js'])
@stop
