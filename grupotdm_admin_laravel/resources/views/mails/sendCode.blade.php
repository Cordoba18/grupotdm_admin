<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CORREO</title>
</head>

<body>


    <div class="content_full"
        style="width: 100%; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; display: flex;
    justify-content: center;
    align-items: center;
    align-content: center; align-self: center; justify-self: center; justify-items: center;">
        <div class="content_mail"
            style="background-color: white;
    padding: 30px 120px;
    width: 400px;
    height: auto;">
            <div class="content_page" style="text-align: center;">
                <div class="content_logo" style="width: 100%;
            height: 400px;">
                    <img style=" width: 100%;
            height: 400px;
            object-fit: contain;"
                        src="https://d3ds42pui5xyj7.cloudfront.net/cachebuster_1202307101357571017242616/cdn_procampuscolmena/tok_202312045/contents/collectives/429/campus/campusheader/default/logo-tdm.png" alt="">
                </div>
                <h1 style="font-weight: bold;">GRUPO TDM</h1>
            </div>

            <div class="info">
                <p>Hola, <b>{{ $nombre }}</b> {{ $mensaje }}</p>
            </div>
            <center>
                <div class="content_code"
                    style=" border: 3px solid black; width: 250px;
        background-color: white;
        height: auto;">
                    <h1 style=" background-color: red;
            height: 50px; margin: 0;">CODIGO</h1>
                    <p style="font-weight: bold; margin: 0;
            font-size: 30px;
            height: 60px;">
                        {{ $cod }}</p>
                </div>
            </center>
            <div class="danger"
                style="font-weight: bold;
        text-align: center;
        font-size: 20px;">
                <p>Recuerda que el codigo sera borrado despues de 10 minutos</p>
            </div>
        </div>
    </div>
</body>

</html>
