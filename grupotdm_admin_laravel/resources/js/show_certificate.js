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

  try {
    const date = document.querySelector('#date');
    date.value = obtenerFechaActual();
  } catch (error) {
    console.log('fecha no insertada')
  }

