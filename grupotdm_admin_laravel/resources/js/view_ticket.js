const validate_conection = document.querySelector("#validate_conection");
const id_user_destination = document.querySelector("#id_user_destination");
const id_user_sender = document.querySelector("#id_user_sender").textContent;
const id_ticket = document.querySelector("#id_ticket").value;
const id_user = document.querySelector("#id_user").textContent;
let conection = false;
const comments = document.querySelector(".coments");
comments.scrollTop = comments.scrollHeight;
const btn_save_comment = document.querySelector("#btn_save_comment");

// {{ "align-items: end;" }}
// {{ "align-items: start; background-color:#DDDDDD;" }}
/* <form action="{{ route('dashboard.tickets.comment_delete') }}" method="post">
            @csrf
            <input type="number" value="{{ $ticket->id }}" name="id_ticket" hidden>
            <input type="number" value="{{ $c->id }}" name="id_comment" hidden>
            <button href="" class="btn btn-danger"><i class="bi bi-trash3"></i></button>
        </form> */
function writting_comment(comment, align, btn_delete) {
    let write_btn_delete = `<input type="number" value="${id_ticket}" name="id_ticket" hidden>
    <input type="number" value="${comment['id']}" name="id_comment" id="id_comment" hidden>`;
    if (btn_delete) {
        write_btn_delete = write_btn_delete + `<button href="" class="btn btn-danger" id="btn_comment_delete"><i class="bi bi-trash3"></i></button>`;
    }
    let content_coment = `<div class="comment" style="${align}">
        <div class="comment_header">
        <b>${comment['name']}</b>
        <p>${comment['date']}</p>
    </div>
        <p>${comment['comment']}</p>
        <br>
        ${write_btn_delete} </div>`;
    return content_coment;
}

btn_save_comment.addEventListener('click', function (e) {

    e.preventDefault();
    const content_comment = document.querySelector("#comment");

    const comments = document.querySelector(".coments");

    axios.post('../comment_create',{
        comment: content_comment.value,
        id_ticket: id_ticket,
        conection: conection,
      }).then(res=>{
        let comment = res.data;
        if (comment['id_user'] == id_user) {
            comments.insertAdjacentHTML("beforeend", writting_comment(comment,"align-items: end;", true));


        }else{
            comments.insertAdjacentHTML("beforeend", writting_comment(comment,"align-items: start; background-color:#DDDDDD;", false));

        }
        content_comment.value = "";

        comments.scrollTop = comments.scrollHeight;
      }).catch(error=>{
        console.log("Ha ocurrido un error : " +error);
      });

      if (!conection) {

        Swal.fire({
            title: "EL USUARIO NO ESTA CONECTADO",
            text: "Hemos enviado un correo al usuario notificando tu mensaje (Favor no enviar mas mensajes hasta que el usuario se conecte)",
            icon: "info"
          });
      }
      setTimeout(() => {
        const comment = document.querySelectorAll(".comment");
        activa_btn_deletes(comment);

      }, 2000);


})

try {
    const file = document.querySelector("#file");
} catch (error) {

}


Echo.join(`commentticket.${id_ticket}`)
.listen('Comment_Ticket', (e)=>{
    let sond_notification  = new Audio(route_sond_notification);
    sond_notification.play();
    let comment = e.comment;
    const comments = document.querySelector(".coments");
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
        title: "Nuevo comentario"
      });


    if (comment['id_user'] == id_user) {
        comments.insertAdjacentHTML("beforeend",  writting_comment(comment,"align-items: end;", true));


    }else{
        comments.insertAdjacentHTML("beforeend", writting_comment(comment,"align-items: start; background-color:#DDDDDD;", false));

    }
    comments.scrollTop = comments.scrollHeight;

    setTimeout(() => {
        const comment = document.querySelectorAll(".comment");
        activa_btn_deletes(comment);

      }, 2000);



}).here(users =>{
    let result = users.filter(user => user.id != id_user);


    if (result.length > 0) {

        result.forEach(u => {
            if (u.id == id_user_destination.textContent || u.id == id_user_sender && u.id != id_user) {

            validate_conection.className = "comment_state_online";
            validate_conection.innerHTML = `COLABORADOR CONECTADO EN TICKET <i class="bi bi-wifi"></i>`;
            conection = true;
        }
        });




    }
}).joining(user => {
    if (user.id != id_user) {
        if (user.id == id_user_destination.textContent || user.id == id_user_sender && user.id != id_user) {
        validate_conection.className = "comment_state_online";
        validate_conection.innerHTML = `COLABORADOR CONECTADO EN TICKET <i class="bi bi-wifi"></i>`;
        conection = true;
        }

    }
}).leaving( user => {
if (user.id != id_user) {

    if (user.id == id_user_destination.textContent || user.id == id_user_sender && user.id != id_user) {
    validate_conection.className = "comment_state_offline";
    validate_conection.innerHTML = `COLABORADOR DESCONECTADO DE TICKET <i class="bi bi-wifi"></i>`;
    conection = false;
    }

}
});



Echo.join(`stateticket`)
.listen('StateTicket', (e)=>{
    const ticket = e.ticket;

    if ((id_user == ticket['id_user_sender'] || id_user == ticket['id_user_destination'] || id_area_user == ticket['id_area_user_destination']) && ticket['id'] == id_ticket) {

          setTimeout(() => {


            Swal.fire({
                title: "EL TICKET HA RECIBIDO UN CAMBIO!",
                text: "Recargaremos la pagina para actualizar el ticket",
                icon: "info"
              });

              setTimeout(() => {

                window.location = `./${id_ticket}`;
              }, 4000);


          }, 2000);
    }

})


const content_comment = document.querySelector("#comment");

content_comment.addEventListener('input', function (e) {

    axios.post('./writting_ticket',{
        id_ticket: id_ticket,
      }).then(res=>{

      }).catch(error=>{

      });
})
const validate_writting = document.querySelector("#validate_writting");
let count_write = 0;
Echo.join(`writtingcomment.${id_ticket}`)
.listen('Writting_Comment', (e)=>{

    let user = e.user;


        count_write = count_write + 1;
        validate_writting.textContent = `${user.name} esta escribiendo....`;

        setTimeout(() => {
            count_write = count_write - 1;
            if (count_write == 0) {
                validate_writting.textContent = "";
            }

        }, 1000);

})

const comment = document.querySelectorAll(".comment");
    activa_btn_deletes(comment);


function activa_btn_deletes(comment) {


    comment.forEach(c => {
        const btn_comment_delete = c.querySelector("#btn_comment_delete");

        if (btn_comment_delete !== null) {


        btn_comment_delete.addEventListener('click', function (e) {
            e.preventDefault();
            const id_comment = c.querySelector("#id_comment").value;
            axios.post('../comment_delete',{
                id_ticket: id_ticket,
                id_comment:id_comment,
              }).then(res=>{

                c.style.opacity = '0';

                setTimeout(() => {
                    c.remove();
                }, 2000);

              }).catch(error=>{
                console.log("Ha ocurrido un error : " +error);
              });


        })

    }
    });

}
Echo.join(`deletecomment.${id_ticket}`)
.listen('Delete_Comment', (e)=>{

    let id_comment = e.comment.id;
    const comment = document.querySelectorAll(".comment");
    comment.forEach(c => {

        const id = c.querySelector("#id_comment").value;
        if (id_comment == id) {
            c.style.opacity = '0';
            setTimeout(() => {
                c.remove();
                setTimeout(() => {
                    const comment = document.querySelectorAll(".comment");
                    activa_btn_deletes(comment);

                  }, 2000);
            }, 2000);

        }
    });
})
