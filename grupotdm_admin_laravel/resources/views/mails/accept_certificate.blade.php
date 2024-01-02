<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CORREO</title>
</head>

<body>


    <div class="content_full"
    style="width: 600px; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; display: flex;
justify-content: center;
align-items: center;
align-content: center; align-self: center; justify-self: center; justify-items: center;">
    <div class="content_mail"
        style="background-color: white;
padding: 30px 120px;
width: 100%;
height: auto;">
        <div class="content_page" style="text-align: center;">
            <div class="content_logo" style="width: 100%;
        height: 400px;">
                <img style=" width: 100%;
        height: 400px;
        object-fit: contain;"
                        src="https://d3ds42pui5xyj7.cloudfront.net/cachebuster_1202307101357571017242616/cdn_procampuscolmena/tok_202312045/contents/collectives/429/campus/campusheader/default/logo-tdm.png" alt="">
                </div>
            </div>

            <div class="info">
                <b>Buen dìa {{ $user_receive->name }}</b>
                <br>
                <b>Cordial saludo</b>
                <br>
                <p>El motivo del presente correo es notificar {{ $mensaje }}</p>
                <br>

                <b style="width: 100%;">Si ya te llegaron los componentes favor informar informar con el siguiente boton: </b>

                <form action="{{ route('dashboard.certificates.accept_certificate') }}" method="GET">
                <input type="text" name="id_certificate" value="{{ $certificate->id }}" hidden readonly style="opacity: 0;">
                <input type="text" name="id_user_receives" value="{{ $user_receive->id }}" hidden readonly style="opacity: 0;">
                <button style="padding: 10px; background-color: black; color: white; font-size: 10px; border-radius: 20px; text-decoration: none; font-weight: bold;"> DAR LLEGADA DE ACTIVOS </button>
            </form>
                <b>POV: No responder a este correo ya que es un correo automatico</b>
            </div>
<center>
            <p style="text-align: center; color: red;border-top: solid black 1px; padding: 2px">Informacion enviada por el area de administración GRUPO TDM</p>
        </center>
        </div>
    </div>
</body>
</html>
