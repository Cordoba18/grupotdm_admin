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
                <b>Buen dìa {{ $user_destination->name }}</b>
                <br>
                <b>Cordial saludo</b>
                <br>
                <p>El motivo del presente correo es notificar que el usuario {{ $user_sender->name }} con correo {{ $user_sender->email }} esta esperando el cierre del ticket con los siguientes datos: </p>

                <div style="display: flex; justify-content: center; align-items: center">
                    <p>ID :  </p> <b>{{ $ticket->id }}</b>
                    </div>
                <div style="display: flex; justify-content: center; align-items: center">
                <p>Nombre :  </p> <b>{{ $ticket->name }}</b>
                </div>
                <br>
                <div style="display: flex; justify-content: center; align-items: center">
                    <p>Fecha de inicio :  </p> <b>{{ $ticket->date_start }}</b>
                    </div>
                <br>
                <div style="display: flex; justify-content: center; align-items: center">
                    <p>Fecha final :  </p> <b>{{ $ticket->date_finally }}</b>
                    </div>
                <br>
<center>
                <b> Puedes gestionar el cierre del ticket desde el siguiente boton:</b>
            </center>
                <form action="{{ route('dashboard.tickets.notificate_finish_ticket.finish_ticket_mail') }}" method="GET">
                    <input type="text" name="id_ticket" value="{{ $ticket->id }}" hidden readonly style="opacity: 0;">
                    <button style="width: 100%; padding: 10px; background-color: black; color: white; font-size: 10px; border-radius: 20px; text-decoration: none; font-weight: bold;"> CERRAR TICKET</button>
                </form>
                <br>
                <b>POV: No responder a este correo ya que es un correo automatico</b>
            </div>
<center>
            <p style="text-align: center; color: red;border-top: solid black 1px; padding: 2px">Informacion enviada por el area de administración GRUPO TDM</p>
        </center>
        </div>
    </div>
</body>
</html>
