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

  function aumentarDiasYHorasAFecha(fechaStr, diasAIncrementar, horasAIncrementar) {
    // Convertir la cadena de fecha a un objeto Date
    var fecha = new Date(fechaStr);

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
    var formatoFecha = `${formatoDosDigitos(fecha.getMonth() + 1)}/${formatoDosDigitos(fecha.getDate())}/${fecha.getFullYear()} ${formatoDosDigitos(fecha.getHours())}:${formatoDosDigitos(fecha.getMinutes())}:${formatoDosDigitos(fecha.getSeconds())}`;

    return formatoFecha;

}

  function formatoDosDigitos(valor) {
    return valor < 10 ? '0' + valor : valor;
  }

  // Llamar a la función con la fecha, los días, y las horas a incrementar
  // Llamar a la función con la fecha y las horas a incrementar

  const input_date_start = document.querySelector('#input_date_start');

  input_date_start.value = obtenerFechaActual();

const check_today =  document.querySelector('#check_today');

const select_prioritys = document.querySelector('#select_prioritys');

select_prioritys.addEventListener('change',function (e) {
    const input_days = document.querySelector('#input_days');

    calcular(input_date_start.value, input_days.value)
})

input_days.addEventListener('input', function (e) {
    const input_days = document.querySelector('#input_days');
    calcular(input_date_start.value, input_days.value)
})
check_today.addEventListener('click', function (e) {
    const input_days = document.querySelector('#input_days');
    if (check_today.checked) {
        input_days.disabled =true;
        input_days.value = 0;


        calcular(input_date_start.value, input_days.value)
      } else {
        input_days.disabled =false;
        input_days.value = "";
      }
})

function calcular(date_start, days) {
    const input_date_finally = document.querySelector('#input_date_finally');
    $.ajax({
        type: "GET",
        url: "get_id/" + select_prioritys.value,
        success: function (response) {

           if (response['hour']) {
            let hour =  response['hour'];
            input_date_finally.value = aumentarDiasYHorasAFecha(date_start, days,  response['hour'])
           }


        },
        error: function (error) {
            // Manejar el error si lo hay
            console.error(error);
        }
    });


}
