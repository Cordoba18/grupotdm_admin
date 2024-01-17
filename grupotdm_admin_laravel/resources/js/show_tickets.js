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
try {


const tickets = document.querySelectorAll('#tickets');

tickets.forEach(ticket => {

    const date_start = ticket.querySelector('#date_start').textContent;
    const date_finally = ticket.querySelector('#date_finally').textContent;
    const my_id = document.querySelector('#my_id').value;
    const id_destination = ticket.querySelector('#id_destination').textContent;
    const id_sender = ticket.querySelector('#id_sender').textContent;
    const hour = calcularHorasRestantes(date_start, date_finally);

    const id_state = ticket.querySelector('#id_state').value;

    if (id_state == 7) {
        ticket.style.backgroundColor = '#D0F288';
    } else if (id_state == 6) {
        ticket.style.backgroundColor = '#F48484';
    }
    else
        if (hour <= 1) {
            ticket.style.backgroundColor = 'orange';
        } else if (hour == 0 || hour == "") {
            ticket.style.backgroundColor = 'red';
        } else {
            ticket.style.backgroundColor = 'yellow';
        }
});
}
catch (error) {

}

const id_user = document.querySelector("#id_user").textContent;
const id_area_user = document.querySelector("#id_area_user").textContent;
const content_tickets = document.querySelector("#content_tickets");
function read_ticket(ticket) {
    const info_ticket =`<tr id="tickets" class="animation_ticket">
    <td>${ ticket['id'] }</td>
    <td>${ ticket['name'] }</td>
    <td id="date_start">${ ticket['date_start'] }</td>
    <td id="date_finally" >${ ticket['date_finally'] }</td>
    <td>${ ticket['priority'] }</td>


    <td><a  style="font-weight: bold;color: black" href="${route_user+ ticket['id_user_sender']}">${ticket['name_sender']}</a><p hidden id="id_sender"> ${ ticket['id_user_sender'] }</p> </td>
    <td><a  style="font-weight: bold;color: black" href="${route_user+ ticket['id_user_destination']}">${ticket['name_destination']}</a> <p hidden id="id_destination"> ${ ticket['id_user_destination'] }</p></td>
    <td>${ ticket['state'] }</td>
    <td>
        <a href="${route_ticket+ ticket['id']}" class="btn btn-primary"><i class="bi bi-eye-fill"></i></a>

    </td>
    </tr>`;

    return info_ticket;
}

Echo.join(`createticket`)
.listen('CreateTicket', (e)=>{
    const ticket = e.ticket;

    if (id_user == ticket['id_user_destination'] || id_area_user == ticket['id_area_user_destination']) {
        const Toast = Swal.mixin({
            toast: true,
            position: "top-end",
            showConfirmButton: false,
            timer: 2000,
            timerProgressBar: true,
            didOpen: (toast) => {
              toast.onmouseenter = Swal.stopTimer;
              toast.onmouseleave = Swal.resumeTimer;
            }
          });
          Toast.fire({
            icon: "info",
            title: "Se ha creado un nuevo ticket"
          });

          setTimeout(() => {
            content_tickets.innerHTML =  read_ticket(ticket) + content_tickets.innerHTML ;
          }, 2000);
    }

})
