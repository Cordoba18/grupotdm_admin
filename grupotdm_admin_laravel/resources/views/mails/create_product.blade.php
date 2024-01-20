
@extends('mails.layout.app_mails')
@section('content')

<b>Buen dìa {{ $user->name }}</b>
                <br>
                <b>Cordial saludo</b>
                <br>
                <p>El motivo del presente correo es notificar la creación de un nuevo producto con los siguientes datos: </p>
                <br>
                <div style="align-items: center; display: flex">
                <p style="margin: 5px">Nombre/descripción del producto: </p><b>{{ $product->name }}</b>
                </div>
                <div style="align-items: center; display: flex">
                    <p style="margin: 5px">Serial : </p><b>{{ $product->serie }}</b>
                    </div>
                    <div style="align-items: center; display: flex">
                        <p style="margin: 5px">Marca : </p><b>{{ $product->brand }}</b>
                        </div>
                        <div style="align-items: center; display: flex">
                            <p style="margin: 5px">Accesorios : </p><b>{{ $product->accessories }}</b>
                            </div>
@endsection
