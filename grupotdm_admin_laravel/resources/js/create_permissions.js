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

  function obtenerFechaActualSinHoras() {
    // Obtener la fecha actual
    var fecha = new Date();

    // Obtener los componentes de la fecha
    var dia = fecha.getDate() + 1;
    var mes = fecha.getMonth() + 1; // Los meses en JavaScript son base 0
    var anio = fecha.getFullYear();

    // Formatear los componentes de la fecha con ceros a la izquierda si es necesario
    dia = (dia < 10) ? '0' + dia : dia;
    mes = (mes < 10) ? '0' + mes : mes;

    // Crear el formato deseado
    var formatoFecha = dia + '/' + mes + '/' + anio;

    // Mostrar la fecha formateada
    return formatoFecha;

    // Puedes usar formatoFecha donde necesites en tu código
  }
  function aumentarDiasYHorasAFecha(fechaStr, diasAIncrementar, horasAIncrementar) {
    // Convertir la cadena de fecha a un objeto Date
    var partesFecha = fechaStr.split(/[\s/:]+/);

    // Crear un objeto Date con las partes de la fecha
    var fecha = new Date(
        partesFecha[2],  // Año
        partesFecha[1] - 1,  // Mes (restar 1 porque los meses en JavaScript son de 0 a 11)
        partesFecha[0],  // Día
        partesFecha[3],  // Horas
        partesFecha[4],  // Minutos
        partesFecha[5]   // Segundos
    );


    // Ignorar el rango horario entre las 12:30 y las 1:30
    var horasActuales = fecha.getHours();
    var minutosActuales = fecha.getMinutes();

    if (horasActuales >= 12 && horasActuales < 13 && minutosActuales >= 30) {
        // Si está en el rango horario, avanzar a las 1:30 del día siguiente
        fecha.setHours(13, 30, 0, 0);
    }

    // Convertir todo a horas y sumar
    var totalHoras = fecha.getHours() + (diasAIncrementar * 24) + horasAIncrementar;

    // Asignar las nuevas horas
    fecha.setHours(totalHoras);

    // Formatear y mostrar la nueva fecha
    var formatoFecha = `${formatoDosDigitos(fecha.getDate())}/${formatoDosDigitos(fecha.getMonth() + 1)}/${fecha.getFullYear()} ${formatoDosDigitos(fecha.getHours())}:${formatoDosDigitos(fecha.getMinutes())}:${formatoDosDigitos(fecha.getSeconds())}`;

    return formatoFecha;
}

function formatoDosDigitos(valor) {
    return valor < 10 ? '0' + valor : valor;
}

const date_aplicattion = document.querySelector('#date_application');

const date_tomorrow =  document.querySelector('#date_tomorrow');
date_aplicattion.value = obtenerFechaActual();


const id_days = document.querySelectorAll('#id_day');
const input_time = document.querySelector('#input_time')


input_time.addEventListener('change', function (e) {

    date_tomorrow.value =  obtenerFechaActualSinHoras() + " "+ input_time.value+":00";
})
id_days.forEach(id_day => {
    id_day.addEventListener('click', function (e){

        if (id_day.value == 1) {
            input_time.disabled = true;
            date_tomorrow.value = 0;
        }else{
            input_time.disabled = false;
            date_tomorrow.value =  obtenerFechaActualSinHoras() + " "+ input_time.value+":00";
        }
    })
});
