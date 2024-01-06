<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CORREO</title>
</head>

<body>


    <div class="content_full"
        style="width: 400px; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; display: flex;
    justify-content: center;
    align-items: center;
    align-content: center; align-self: center; justify-self: center; justify-items: center;">
        <div class="content_mail"
            style="background-color: white;
    padding: 30px 20px;
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
                <b>Buen dìa {{ $user->name }}</b>
                <br>
                <b>Cordial saludo</b>
                <br>
                <p>El motivo del presente correo es notificar que el ticket de <b>{{ $ticket->name }}</b> con id <b>{{ $ticket->id }}</b>  del cual haces parte ha recibido un cambio. Porfavor revisar novedad</p>
                <br>
                <a href="{{ route('dashboard.tickets.ticket_detail', $ticket->id) }}" style="text-align: center; width: 400px; padding: 10px;padding-left: 100px;padding-right: 100px; background-color: black; color: white; font-size: 10px; border-radius: 20px; text-decoration: none; font-weight: bold;"> VER TICKET </a>
                <br><br>
                <b>POV: No responder a este correo ya que es un correo automatico</b>
            </div>
            <center>
            <p style="text-align: center; color: red;border-top: solid black 1px; padding: 2px">Informacion enviada por el area de administración GRUPO TDM</p>
        </center>
        </div>
    </div>
</body>
</html>
