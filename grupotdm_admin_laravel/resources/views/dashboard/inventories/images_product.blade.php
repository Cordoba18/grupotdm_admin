@extends('adminlte::page')

@section('title', 'GRUPO TDM')
@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    @vite(['resources/css/images_product.css'])
    <link href="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.css" rel="stylesheet">
@stop
@section('content_header')

<h1>IMAGENES SECUNDARIAS</h1>
<br>
@if (session('message'))

              <p class="alert alert-success" role="alert" class=""> {{ session('message') }}</p>

         @endif
         @if (session('message_error'))

              <p class="alert alert-danger" role="alert" class=""> {{ session('message_error') }}</p>

         @endif

    <form action="{{ route('dashboard.inventories.view_product.save_image_product') }}" method="post" enctype="multipart/form-data">
        @csrf
    <div class="mb-3">
        <label for="exampleFormControlTextarea1" class="form-label">Agregar imagen</label>
        <input required readonly type="text" name="id_product" id="" style="width: 100%" value="{{ $product->id }}" hidden>
        <input required type="file" name="file" id="" accept="image/*" style="width: 100%">
      </div>
      <div class="mb-3">
       <button class="btn btn-success">INSERTAR IMAGEN</button>
       <a href="{{ route('dashboard.inventories.view_product',$product->id) }}" class="btn btn-primary">VOLVER</a>
      </div>
    </form>
<br>
@stop

@section('content')
<table id="miTabla" class="table table-bordered table-striped dataTable">

    <thead class="table-dark">
        <th>IMAGEN</th>
        <th>ELIMINAR</th>
    </thead>
    <tbody>
        @php
        $suma = 0;
    @endphp
        @foreach($images_product as $ip)

        @if($product->id == $ip->id_product)

        @php
        $suma = $suma + 1;
    @endphp
    @if ($suma > 1)
    <tr>
    <td>
        <div class="content_image">
 <img src="{{ asset('storage/files/'.$ip->image) }}" alt="">
</div>
</td>
<td>
    <form action="{{ route('dashboard.inventories.view_product.delete_image_product') }}" method="post" onsubmit="return confirmarEnvio()">
        @csrf
        <input type="text" hidden value="{{ $product->id }}" name="id_product">
        <input type="text" hidden value="{{ $ip->id }}" name="id_image_product">
        <button class="btn btn-danger"><i class="bi bi-trash3"></i></button>
    </form>
</td>
</tr>
 @endif

 @endif




        @endforeach

    </tbody>
</table>
<br>

@stop



@section('js')
<script src="https://cdn.datatables.net/v/bs5/dt-1.13.8/datatables.min.js"></script>
<script>
    $(document).ready(function() {
      $('#miTabla').DataTable({
        "paging": true,  // Habilita la paginación
        "lengthChange": false, // Oculta el control para cambiar el número de elementos por página
        "searching": false, // Deshabilita la función de búsqueda
        "ordering": true, // Habilita la ordenación de columnas
        "info": false, // Muestra información sobre la paginación
        "autoWidth": true // Deshabilita el ajuste automático del ancho de las columnas

      });
    });
  </script>
<script>
    function confirmarEnvio() {
      // Mostrar un mensaje de confirmación
      var confirmacion = confirm("¿Estás seguro de eliminar esta imagen?");
      // Si el usuario hace clic en "Aceptar", el formulario se enviará
      return confirmacion;
  }
</script>
@stop
