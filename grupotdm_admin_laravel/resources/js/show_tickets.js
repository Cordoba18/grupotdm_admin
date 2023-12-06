function calcularHorasRestantes(fechaInicioStr, fechaFinStr) {
    // Convertir las cadenas de fecha a objetos Date
    var fechaInicio = new Date(fechaInicioStr);
    var fechaFin = new Date(fechaFinStr);

    // Calcular la diferencia en milisegundos
    var diferenciaMs = fechaFin - fechaInicio;

    // Convertir la diferencia a horas
    var horasRestantes = diferenciaMs / (1000 * 60 * 60);

    // Redondear a dos decimales
    horasRestantes = Math.round(horasRestantes * 100) / 100;

    return horasRestantes;
}
const tickets = document.querySelectorAll('#tickets');

tickets.forEach(ticket => {

    const date_start = ticket.querySelector('#date_start').textContent;
    const date_finally = ticket.querySelector('#date_finally').textContent;
    const hour = calcularHorasRestantes(date_start, date_finally);
    console.log(hour)
    const id_state = ticket.querySelector('#id_state').value;
    if (id_state == 7) {
        ticket.style.backgroundColor = 'green';
    } else
        if (hour <= 1) {
            ticket.style.backgroundColor = 'orange';
        } else if (hour == 0 || hour == "") {
            ticket.style.backgroundColor = 'red';
        } else {
            ticket.style.backgroundColor = 'yellow';
        }
});
