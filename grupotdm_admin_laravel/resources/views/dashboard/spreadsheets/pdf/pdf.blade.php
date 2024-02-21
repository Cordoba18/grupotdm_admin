<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>INFORME @if($id_company == 1){{ "El TEMPLO DE LA MODA S.A.S" }}@else{{ "El TEMPLO DE LA MODA FRESCA S.A.S" }}@endif</title>
</head>

<body>
    @php
    $user = Auth::user();
@endphp
    <div class="content_logo" style="width: 100%; text-align: center;">
        <img style="width: 200px; height: 130px; object-fit: contain;" src="https://d3ds42pui5xyj7.cloudfront.net/cachebuster_1202307101357571017242616/cdn_procampuscolmena/tok_202312045/contents/collectives/429/campus/campusheader/default/logo-tdm.png">
    </div>
    <div class="content">
        <div class="info">
            <p>Se adjunta reporte de conteo de TPVS de la compañia @if($id_company == 1){{ "El TEMPLO DE LA MODA S.A.S" }}@else{{ "El TEMPLO DE LA MODA FRESCA S.A.S" }}@endif</p>
        </div>
        <div  style="display: flex; width: 100%;" class="date">
           <p>FECHA DE INFORME :</p> <b> {{ $spreadsheets->date_previous }}</b>
        </div>
        <br>
        @php
        $shop = "";
        $total = 0;
        $sub_total = 0;
        @endphp
        @foreach ($spreadsheet_tpvs as $s)


        @if ($s->shop != $shop)
        @php
              $shop = $s->shop;
        @endphp
 @foreach ($spreadsheet_tpvs as $s2)
 @if ($s2->id_shop == $s->id_shop)
 @php
 $total += $s2->total;
 $sub_total += $s2->sub_total;
 @endphp
 @endif

 @endforeach
 <br>
 <table style="width: 100%;text-align: center;font-size: 20px; border: 5px solid black;">
    <thead>
        <th>TIENDA</th>
        <th>TOTAL POS</th>
        <th>TOTAL CONTEO</th>
    </thead>

    <tbody>
        <tr style="border: 1px solid black">
            <td  style="border: 1px solid black">{{ $s->shop }}</td>
            <td  style="border: 1px solid black">${{ number_format( $total ) }}</td>
            <td  style="border: 1px solid black">${{ number_format( $sub_total ) }}</td>
        </tr>
    </tbody>
</table>
 <br>
 @php
      $total = 0;
      $sub_total = 0;
@endphp
        @endif

        @if ($s->id_company == $id_company && (($s->total != 0 && $s->sub_total != 0 && $s->difference != 0) || ($s->total != null && $s->sub_total != null && $s->difference != null)))

            <div class="content_info_tpv">
                <div class="info_tpv">

                    <table style="width: 100%;text-align: center;font-size: 13px; border: 3px solid black; ">
                        <thead>
                            <th>TPV</th>
                            <th>TOTAL POS</th>
                            <th>TOTAL CONTEO</th>
                            <th>TOTAL DIFERENCIA</th>
                        </thead>

                        <tbody>
                            <tr style="border: 1px solid black">
                                <td>{{ $s->tpv }}</td>
                                <td>${{ number_format($s->total) }}</td>
                                <td>${{ number_format($s->sub_total) }}</td>
                                <td>${{  number_format($s->difference) }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="info_payment_methods">

                    <table style="width: 100%;text-align: center;font-size: 13px;border: 1px solid black;">
                        <thead class="table">
                            <th>METODO DE PAGO</th>
                            <th>VALOR POS</th>
                            <th>VALOR CONTEO</th>
                            <th>DIFERENCIA</th>
                        </thead>

                        <tbody>
                            @foreach ($spreadsheet_rows_tpvs as $srt)
                            @if($srt->id_spreadsheet_tpv == $s->id && (($srt->value_pos != 0 && $srt->value_treasurer != 0 && $srt->difference != 0) || ($srt->value_pos != null && $srt->value_treasurer != null && $srt->difference != null)))
                                <tr id="rows" style="border: 1px solid black">

                                    <td>{{ $srt->name }}</td>
                                    <td>$ {{  number_format($srt->value_pos) }}</td>
                                    <td>$
                                        @if ($srt->value_treasurer)
                                            {{  number_format($srt->value_treasurer) }}@else{{ 0 }}
                                        @endif
                                    </td>
                                    <td>$
                                        @if ($srt->difference)
                                        {{  number_format($srt->difference) }}@else{{ 0 }}
                                    @endif
                                    </td>
                                </tr>
                                @endif
                            @endforeach
                        </tbody>
                    </table>
                    <br>
                </div>

            </div>

        @endif
        @endforeach
        <br><br>


    <div class="">
        <p>Generado por: <b> {{ $user->name }}</b></p>
        <p>CC <b> @if ($user->nit){{ $user->nit }}@endif</b></p>
    </div>
    </div>
    <br>
    <div style="display: flex; text-align: center;width: 100%;">
        <b style="color: red; width: 100%;">INFORMACIÓN GENERADA POR EL GESTOR DE TAREAS DEL GRUPO TDM</b>
    </div>


</body>

</html>
