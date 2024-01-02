<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CONFIRMACION ACTA</title>
    <style>
        body{
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
    </style>
</head>
<body>


    <div class="content_principal" style="border: 2px solid black; padding: 30px; border-radius: 20px; box-shadow: 0px 0px 10px; width: 700px;">
        <center>
    <div class="content_image" style="width: 500px; height: 500px">
        <img style="width: 100%;height: 100%; object-fit: contain;" src="{{ asset('storage/icons/logo.png') }}" alt="">
    </div>
    <div>
        <h1>GRACIAS POR TU COLABORACIÒN!</h1>
        <b>El usuario {{ $user_delivery->name }} ha sido notificado con la confirmacion de llegada de tu pedido.</b>
    </div>
    </center>
    </div>
</body>
</html>

