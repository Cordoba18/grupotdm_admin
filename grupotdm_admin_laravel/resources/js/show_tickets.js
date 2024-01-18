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

function read_ticket(ticket, accion, animation) {
    let row_action = "";
    if (accion == false) {
        row_action = ` <a href="${route_ticket+ ticket['id']}" class="btn btn-primary"><i class="bi bi-eye-fill"></i></a>`;
    }else if (accion == "finish") {
        row_action = ` <i class="bi bi-check-circle-fill"></i>`;
    } else {
        row_action = `<i class="bi bi-x-lg"></i>`;
    }
    // animation_ticket
    const info_ticket =`<tr id="tickets" class="${ animation }">
    <td>${ ticket['id'] }</td>
    <td>${ ticket['name'] }</td>
    <td id="date_start">${ ticket['date_start'] }</td>
    <td id="date_finally" >${ ticket['date_finally'] }</td>
    <td>${ ticket['priority'] }</td>


    <td><a  style="font-weight: bold;color: black" href="${route_user+ ticket['id_user_sender']}">${ticket['name_sender']}</a><p hidden id="id_sender"> ${ ticket['id_user_sender'] }</p> </td>
    <td><a  style="font-weight: bold;color: black" href="${route_user+ ticket['id_user_destination']}">${ticket['name_destination']}</a> <p hidden id="id_destination"> ${ ticket['id_user_destination'] }</p></td>
    <td>${ ticket['state'] }</td>
    <td>
        ${row_action}
        <input type="number" value="${ ticket['id_state'] }" disabled hidden id="id_state">
        <input type="number" value="${ ticket['id'] }" disabled hidden id="id_ticket">
    </td>
    </tr>`;

    return info_ticket;
}

Echo.join(`createticket`)
.listen('CreateTicket', (e)=>{
    const ticket = e.ticket;

    if (id_user == ticket['id_user_destination'] || id_area_user == ticket['id_area_user_destination']) {
        const content_tickets = document.querySelector("#content_tickets");
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
            content_tickets.innerHTML =  read_ticket(ticket, false, "animation_ticket_create") + content_tickets.innerHTML ;
          }, 2000);
          const total_pendientes = document.querySelector("#total_pendientes");

          total_pendientes.textContent = parseInt(total_pendientes.textContent) + 1;
    }

})


Echo.join(`stateticket`)
.listen('StateTicket', (e)=>{
    const ticket = e.ticket;

    if (id_user == ticket['id_user_sender'] || id_user == ticket['id_user_destination'] || id_area_user == ticket['id_area_user_destination']) {
        const content_tickets = document.querySelector("#content_tickets");
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
            icon: "warning",
            title: `Ha habido una modificación en ticket # ${ ticket['id']}`
          });
          setTimeout(() => {
            const tickets  = document.querySelectorAll("#tickets");
            tickets.forEach(t => {
                const id_ticket = t.querySelector("#id_ticket").value;
                console.log("Ticket de tabla : "+id_ticket)
                console.log("Ticket de base de datos : "+ticket['id'])
                if (id_ticket == ticket['id']) {
                    t.remove();
                }
            });
            const total_pendientes = document.querySelector("#total_pendientes");
            const total_ejecuciones = document.querySelector("#total_ejecuciones");
            const total_vencidos = document.querySelector("#total_vencidos");
            if (ticket['id_state'] == 2) {
                content_tickets.innerHTML =  read_ticket(ticket, "delete", "animation_ticket_delete") + content_tickets.innerHTML;
            }else if (ticket['id_state'] == 7) {
                total_ejecuciones.textContent = parseInt(total_ejecuciones.textContent) - 1;
                content_tickets.innerHTML =  read_ticket(ticket, "finish", "animation_ticket_finish") + content_tickets.innerHTML;
            }else if(ticket['id_state'] == 5){
                total_ejecuciones.textContent = parseInt(total_ejecuciones.textContent) + 1;
                total_pendientes.textContent = parseInt(total_pendientes.textContent) - 1;
                content_tickets.innerHTML =  read_ticket(ticket, false, "animation_ticket_modificate") + content_tickets.innerHTML;
            }
            else{
                content_tickets.innerHTML =  read_ticket(ticket, false, "animation_ticket_modificate") + content_tickets.innerHTML;
            }

          }, 1000);


          setTimeout(() => {
            if (ticket['id_state'] == 2) {
                const tickets  = document.querySelectorAll("#tickets");
                tickets.forEach(t => {
                    const id_ticket = t.querySelector("#id_ticket").value;
                    if (id_ticket == ticket['id']) {
                        t.remove();
                    }
                });
            }
          }, 5000);

    }

})
