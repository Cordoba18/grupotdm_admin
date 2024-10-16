
const icon_notification = document.querySelector("#icon_notification");
const amount_notifications = icon_notification.querySelector(".badge ");

const body = document.body;

//Esta funcion carga el boton para eliminar el contenedor de las notificaciones
function activate_button_remove() {
const content_notifications = document.querySelector(".content_notifications")

const content_notifications_full = document.querySelector(".content_notifications_full")

const btn_close_notifications = content_notifications.querySelector("#btn_close_notifications")

btn_close_notifications.addEventListener('click', function (e) {

    content_notifications_full.style.opacity = 0;

setTimeout(() => {

    content_notifications.remove();
}, 1000);

})

}


//Esta funcion cambio el estado de la notificacion a VISTO al entrar en la notificación
function activate_button_view_notification() {

    const notifications = document.querySelectorAll(".notification")

    notifications.forEach(n => {

        const id_notification = n.querySelector("#id_notification")
        const btn_view_notification = n.querySelector("#btn_view_notification");

        btn_view_notification.addEventListener('click', function (e) {
            axios.post(`${route_principal}/view_notification`,{
                id_notification: id_notification.value,
              }).then(res=>{
              }).catch(error=>{

              });
        })



    });
}


//Este contenedor contiene la escritura para agregar la notificacion retornando el componente a colocar
function add_notification(notification, div_class, view_icon) {

    let content_notification = `<div class="${div_class}">
    <input type="number" hidden id="id_notification" value="${notification['id']}">
    <div class="content_info_notification">
    ${view_icon}
    <b>${notification['notification']}</b>
    <a id="btn_view_notification" href="${notification['route']}"><i class="fa-solid fa-eye"></i></a>
    </div>
    <div class="content_date">
    <b>${notification['date']}</b>
    </div>
    </div>`;

    return content_notification;
}

//Este metodo cuenta las notificaciones y las aplica en el label para un conteo visual
    axios.post(`${route_principal}/get_notifications`,{
        id_user: id_user,
      }).then(res=>{

        let notifications = res.data;
        let conteo = 0;
        notifications.forEach(n => {
            if (n['id_state'] == 3) {
                conteo = conteo + 1;
            }
        });
        amount_notifications.innerHTML = conteo;
      }).catch(error=>{

      });


      //Este boton al presionarlo agrega el contenedor de las notificaciones y muestra las notificaciones
icon_notification.addEventListener('click', function (e) {


    var content_notifications = document.createElement("div");
    content_notifications.classList.add("content_notifications");
    body.appendChild(content_notifications);
    var content_notifications_full = document.createElement("div");
    content_notifications_full.classList.add("content_notifications_full");
    content_notifications_full.innerHTML =  `<div class="content_btn_close_notifications"><i id="btn_close_notifications" class="fa-solid fa-xmark"></i></div>`;
    content_notifications.appendChild(content_notifications_full);

    var notifications = document.createElement("div");

    notifications.classList.add("notifications");
    content_notifications_full.appendChild(notifications);
//va a la ruta y trae las notificaciones del usuario el cual sale de la sesion
    axios.post(`${route_principal}/get_notifications`,{
        id_user: id_user,
      }).then(res=>{

        //desanimar la campana con colores
        try {
            const fas =  icon_notification.querySelector(".fas");
            fas.classList.remove('animar_campana');
        } catch (error) {

        }
        let all_notifications = res.data;

        notifications.innerHTML = "";
        if (all_notifications.length > 0) {

        all_notifications.forEach(n => {
//si es el estado es PENDIENTE la agrega con una clase distinta a cuando esta VISTO
            if (n['id_state'] == 3) {
                notifications.innerHTML = notifications.innerHTML + add_notification(n,"notification notification_no_view",`<i class="fa-solid fa-circle-exclamation"></i>` )
            }else{
                notifications.innerHTML = notifications.innerHTML + add_notification(n,"notification notification_view",` <i class="fa-solid fa-check"></i>` )
            }
        });



    }else{
        //Si no tiene notificaciones muestra un titulo
        notifications.innerHTML = "<h1>No tienes ninguna notificación aún !</h1>";
    }

    //carga la funcion de los botones despues de 1 segundo
    setTimeout(() => {
        activate_button_remove();
        activate_button_view_notification();
    }, 1000);
      }).catch(error=>{

      });


})


//Escuchador de usuarios
Echo.join(`notifications_users`)
.listen('Notification_Users', (e)=>{

    let user = e.user;
    let notification = e.notification;
//veritifica si la notificacion es para el usuario
    if (notification.id_user == id_user) {
        //emite el sonido
        try {

            let sond_notification  = new Audio(route_sond_notification);
            sond_notification.play();
        } catch (error) {

        }
        const fas =  icon_notification.querySelector(".fas");
        //anima la campana
        try {
        fas.classList.add('animar_campana');
    } catch (error) {
        console.log("Error en animacion =" + error)
    }
    //aumentar nuemero de notificaciones
        const amount_notifications = icon_notification.querySelector(".badge ");
        amount_notifications.innerHTML = parseInt(amount_notifications.innerHTML) + 1;
        //mostrar un mensaje emergente
const Toast = Swal.mixin({
  toast: true,
  position: "top-end",
  showConfirmButton: false,
  timer: 3000,
  timerProgressBar: true,
  didOpen: (toast) => {
    toast.onmouseenter = Swal.stopTimer;
    toast.onmouseleave = Swal.resumeTimer;
  }
});
Toast.fire({
  icon: "info",
  title: "Tienes una nueva notificación!"
});
    }
})
