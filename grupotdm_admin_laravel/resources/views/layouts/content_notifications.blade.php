
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
@vite(['resources/css/notifications.css'])
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
let id_user = "{{ Auth::user()->id }}";
let route_principal = "{{ route('dashboard') }}";
    try {
        var route_sond_notification = "{{ asset('storage/sonds/iphone-notificacion.mp3') }}";

    } catch (error) {

    }


</script>
@vite(['resources/js/app.js','resources/js/notifications.js'])
