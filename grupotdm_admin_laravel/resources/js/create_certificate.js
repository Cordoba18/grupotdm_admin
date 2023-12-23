
function obtenerFechaActual() {
    // Obtener la fecha actual
    var fecha = new Date();

    // Obtener los componentes de la fecha
    var dia = fecha.getDate();
    var mes = fecha.getMonth() + 1; // Los meses en JavaScript son base 0
    var anio = fecha.getFullYear();
    var horas = fecha.getHours();
    var minutos = fecha.getMinutes();
    var segundos = fecha.getSeconds();

    // Formatear los componentes de la fecha con ceros a la izquierda si es necesario
    dia = (dia < 10) ? '0' + dia : dia;
    mes = (mes < 10) ? '0' + mes : mes;
    horas = (horas < 10) ? '0' + horas : horas;
    minutos = (minutos < 10) ? '0' + minutos : minutos;
    segundos = (segundos < 10) ? '0' + segundos : segundos;

    // Crear el formato deseado
    var formatoFecha = dia + '/' + mes + '/' + anio + ' ' + horas + ':' + minutos + ':' + segundos;

    // Mostrar la fecha formateada
    return formatoFecha;

    // Puedes usar formatoFecha donde necesites en tu código
  }

const row =  document.querySelector('.row_certificate').innerHTML;

const content_rows = document.querySelector('#content_rows');
btn_delete_row();

function btn_delete_row() {
    const rows =  document.querySelectorAll('.row_certificate');
    rows.forEach(row => {
        const btn_delete_row = row.querySelector("#btn_delete_row");

        btn_delete_row.addEventListener('click',function (e) {
            e.preventDefault();
            row.remove();
        })
    });
}
  const date = document.querySelector('#date');
  date.value = obtenerFechaActual();

  const btn_add_row = document.querySelector('#btn_add_row');

  btn_add_row.addEventListener('click', function (e) {
    e.preventDefault();


    content_rows.innerHTML = content_rows.innerHTML +"<tr class='row_certificate'>" +row+"</tr>";
    btn_delete_row();
  })
  const id_area_receives = document.querySelector('#id_area_receives');


  id_area_receives.addEventListener('change', function (e) {
    const id_user_receives = document.querySelector('#id_user_receives');
    $.ajax({
        type: "GET",
        url: "create/get_users_areas/" + id_area_receives.value,
        success: function (response) {

           if (response['users']) {
            id_user_receives.innerHTML = "";
            response['users'].forEach(user => {
                id_user_receives.innerHTML = id_user_receives.innerHTML + "<option value='"+user['id']+"'> "+user['name']+"</option>"
            });
           }


        },
        error: function (error) {
            // Manejar el error si lo hay
            console.error(error);
        }
    });

  })
