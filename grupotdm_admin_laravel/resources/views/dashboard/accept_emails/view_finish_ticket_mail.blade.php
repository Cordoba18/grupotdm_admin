<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CIERRE TICKET</title>
    @vite(['resources/css/accept_certificate.css'])
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>


    <div class="content_principal">
    <div class="content_image">
        <img src="{{ asset('storage/icons/logo.png') }}" alt="">
    </div>
    <div class="content-info">
        <h1>GRACIAS POR TU COLABORACIÒN!<i class="bi bi-check-circle-fill" style="color: green;font-size: 30px;"></i></h1>
        <b>El usuario {{ $user_destination->name }} ha sido notificado con la finalización del ticket.</b>
        <br><a href="{{ route('dashboard.tickets.ticket_detail', $ticket->id) }}">VER TICKET</a>
    </div>

    </div>
</body>
</html>

