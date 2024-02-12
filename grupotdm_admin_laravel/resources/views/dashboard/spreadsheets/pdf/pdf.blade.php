<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>INFORME</title>
</head>

<body>
    <div class="content_logo" style="width: 100%; text-align: center;">
        <img style="width: 200px; height: 130px; object-fit: contain;" src="https://d3ds42pui5xyj7.cloudfront.net/cachebuster_1202307101357571017242616/cdn_procampuscolmena/tok_202312045/contents/collectives/429/campus/campusheader/default/logo-tdm.png">
    </div>
    <div class="content">
        <div class="info">
            <p>Se adjunta reporte de conteo de TPVS de la compañia @if($id_company == 1){{ "El TEMPLO DE LA MODA S.A.S" }}@else{{ "El TEMPLO DE LA MODA FRESCA S.A.S" }}@endif</p>
        </div>
        <div class="date">
           <p>FECHA DE INFORME :</p> <b> {{ $spreadsheets->date_previous }}</b>
        </div>
        <br><br>
        @foreach ($spreadsheet_tpvs as $s)
        @if ($s->id_company == $id_company)

            <div class="content_info_tpv">
                <div class="info_tpv">

                    <table style="width: 100%;text-align: center;font-size: 10px; border: 1px solid black; background-color: grey">
                        <thead>
                            <th>TPV</th>
                            <th>TIENDA</th>
                            <th>COMPAÑIA</th>
                            <th>TOTAL POS</th>
                            <th>TOTAL CUADRE</th>
                            <th>TOTAL DIFERENCIA</th>
                        </thead>

                        <tbody>
                            <tr style="border: 1px solid black">
                                <td>{{ $s->tpv }}</td>
                                <td>{{ $s->shop }}</td>
                                <td>{{ $s->companie }}</td>
                                <td>{{ $s->total }}</td>
                                <td>{{ $s->sub_total }}</td>
                                <td>{{ $s->difference }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="info_payment_methods">

                    <table style="width: 100%;text-align: center;font-size: 10px;border: 1px solid black;">
                        <thead class="table">
                            <th>METODO DE PAGO</th>
                            <th>VALOR POS</th>
                            <th>VALOR CONTEO</th>
                        </thead>

                        <tbody>
                            @foreach ($spreadsheet_rows_tpvs as $srt)
                            @if($srt->id_spreadsheet_tpv == $s->id)
                                <tr id="rows" style="border: 1px solid black">

                                    <td>{{ $srt->name }}</td>
                                    <td> {{ $srt->value_pos }}</td>
                                    <td>
                                        @if ($srt->value_treasurer)
                                            {{ $srt->value_treasurer }}@else{{ 0 }}
                                        @endif
                                    </td>
                                </tr>
                                @endif
                            @endforeach
                        </tbody>
                    </table>
                </div>

            </div>

        @endif
        @endforeach
        <br><br>
        <div style="display: flex; text-align: center;width: 100%;">
        <b style="color: red; width: 100%;">INFORMACIÓN GENERADA POR EL GESTOR DE TAREAS DEL GRUPO TDM</b>
    </div>
    </div>


</body>

</html>
