@extends('mails.layout.app_mails')
@section('content')
<b>Buen dìa {{ $user->name }}</b>
                <br>
                <b>Cordial saludo</b>
                <br>
                <p>El motivo del presente es notificar la finalización del conteo de un tesorero:
                </p>
                <table style="width: 100%; border: 2px solid black;" >
                <thead style="font-weight: bold">
                    <th>USUARIO DE GESTION</th>
                    <th>FECHA DE INFORME</th>
                    <th>FECHA DE CREACIÓN DE INFORME</th>
                    <th>TPV</th>
                    <th>COMAPAÑIA</th>
                    <th>TIENDA</th>
                    <th>TOTAL POS</th>
                    <th>TOTAL CONTEO</th>
                    <th>TOTAL DIFERENCIA</th>
                    <th>METODO DE PAGO</th>
                    <th>VALOR DEL POS</th>
                    <th>VALOR DEL CONTEO</th>
                    <th>VALOR DIFERENCIA</th>
                    <th>ESTADO</th>
                </thead>
                <tbody>
                    @foreach ($spreadsheet_tpvs as $s)
                    <tr style="border: 2px solid black;">
                        <td>{{ $s->name }}</td>
                        <td>{{ $s->date_previous }}</td>
                        <td>{{ $s->date_now }}</td>
                        <td>{{ $s->tpv }}</td>
                        <td>{{ $s->company }}</td>
                        <td>{{ $s->shop }}</td>
                        <td>{{ $s->total_pos }}</td>
                        <td>{{ $s->sub_total_pos }}</td>
                        <td>{{ $s->difference_pos }}</td>
                        <td>{{ $s->payment_method }}</td>
                        <td>{{ $s->value_pos }}</td>
                        <td>{{ $s->value_treasurer }}</td>
                        <td>{{ $s->difference }}</td>
                        <td>{{ $s->state }}</td>
                    </tr>


                    @endforeach


                </tbody>
            </table>
                <br>


@endsection


