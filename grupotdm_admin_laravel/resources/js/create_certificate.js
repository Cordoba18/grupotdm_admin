//funcion parar obtener fecha actual
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


loading_buttons_rows();
//funcion que permite cargar el boton de eliminacion de un producto del certificado
function loading_buttons_rows() {
    const rows =  document.querySelectorAll('.row_certificate');
    rows.forEach(row => {

        const btn_delete_row = row.querySelector("#btn_delete_row");

        btn_delete_row.addEventListener('click',function (e) {
            e.preventDefault();
            const id_product = row.querySelector('#id_product');
            id_product.value = "";
            row.remove();
        })

    });
    loading_validate_button_Row();
}

//funcion que sirve para validar activar las validaciones de todas las filas de productos de acta
function loading_validate_button_Row() {
    const rows =  document.querySelectorAll('.row_certificate');
    rows.forEach(row => {


    const btn_validate = row.querySelector('#btn_validate');

    btn_validate.addEventListener('click', function (e) {
        let validate_dates = 0;
        e.preventDefault();
        const id_product = row.querySelector('#id_product');
        const description = row.querySelector('#description');
                        const brand = row.querySelector('#brand');
                        const serie = row.querySelector('#serie');
                        const id_type_component = row.querySelector('#id_type_component');
                        const id_origin_certificate = row.querySelector('#id_origin_certificate');
                        const id_state_certificate = row.querySelector('#id_state_certificate');
                        const accessories = row.querySelector('#accessories');
                        //valido cuando productos hay con ese mismo ID
                        rows.forEach(row2 => {
                            const id_product2 = row2.querySelector('#id_product').value;
                            if (id_product2 == id_product.value) {
                                validate_dates = validate_dates + 1;
                                console.log(validate_dates)
                            }
                        });
                    //Si hay mas de uno lanzo una alerta de duplicidad


        if (validate_dates>1) {
            id_product.value = "";
            Swal.fire({
                icon: "error",
                title: "Oops...",
                text: "Ya asociaste ese producto al acta!"
              });
              //si no hay nada escrito tambien lanzo una alerta para rellenar los campos
        }else if (id_product.value == "") {
            Swal.fire({
                icon: "error",
                title: "Oops...",
                text: "Rellena el campo para validar"
              });
        }else{
        $.ajax({
            type: "GET",
            url: "create/get_dates_product/" + id_product.value,
            success: function (response) {

               if (response['product']) {
                id_product.setAttribute('Disabled', 'true');
                description.value = response['product']['name']
                brand.value = response['product']['brand']
                serie.value = response['product']['serie']
                id_type_component.value = response['product']['type_component']
                id_origin_certificate.value = response['product']['origin_certificate']
                id_state_certificate.value = response['product']['state_certificate']
                accessories.value = response['product']['accessories']
                btn_validate.setAttribute('hidden', 'true');
               }else{
                Swal.fire({
                    icon: "error",
                    title: "PRODUCTO NO ENCONTRADO",
                    text: "El producto no existe o esta asociado a una acta en procesos!"
                  });
               }


            },
            error: function (error) {
                // Manejar el error si lo hay

            }
        });

    }


  })

});
}


const input_validate_users = document.querySelectorAll("#input_validate_user");
//Capturar los inputs para el usuario del sistema o usuario prescrito y aplicar cambios en su diferenciacion
input_validate_users.forEach(input_validate_user => {

    input_validate_user.addEventListener('click', function (e) {
        const id_area_receives = document.querySelector("#id_area_receives");
        const id_user_receives = document.querySelector("#id_user_receives");
        const content_user_dates = document.querySelector(".content_user_dates");
        const content_user_anonimo = document.querySelector(".content_user_anonimo");
        const name_user_receive = document.querySelector("#name_user_receive");

        if (input_validate_user.value == 1) {
            content_user_dates.removeAttribute("hidden");
            content_user_anonimo.setAttribute("hidden", "true");
            id_area_receives.disabled = false;
            id_user_receives.disabled = false;
            name_user_receive.disabled = true;
            name_user_receive.value = "";
        } else {
            content_user_dates.setAttribute("hidden","true");
            content_user_anonimo.removeAttribute("hidden");
            id_area_receives.disabled = true;
            id_user_receives.disabled = true;
            name_user_receive.disabled = false;
        }
    })
});



  const date = document.querySelector('#date');
  date.value = obtenerFechaActual();

  //boton que ayuda a agregar una nueva fila para el certificado
  const btn_add_row = document.querySelector('#btn_add_row');

  btn_add_row.addEventListener('click', function (e) {
    e.preventDefault();
    const element = document.createElement("tr");
    element.innerHTML = row;
    element.classList.add("row_certificate");
    const content_rows = document.querySelector('#content_rows');
    content_rows.appendChild(element);
    loading_buttons_rows();
  })
  const id_area_receives = document.querySelector('#id_area_receives');

//al hacer un cambio en el area del usuario cargo los usuarios pertenecientes a ese area
  id_area_receives.addEventListener('change', function (e) {
    const id_user_receives = document.querySelector('#id_user_receives');
    $.ajax({
        type: "GET",
        url: "create/get_users_areas/" + id_area_receives.value,
        success: function (response) {

           if (response['users']) {
            id_user_receives.innerHTML = "";
            response['users'].forEach(user => {
                const adreess = user['shop'];
                if (adreess) {
                    id_user_receives.innerHTML = id_user_receives.innerHTML + "<option value='"+user['id']+"'> "+user['name']+ " | " +adreess +"</option>";
                }else{
                    id_user_receives.innerHTML = id_user_receives.innerHTML + "<option value='"+user['id']+"'> "+user['name']+ " | SIN UBICACIÓN" +"</option>";
                }

            });
           }


        },
        error: function (error) {
            // Manejar el error si lo hay
            console.error(error);
        }
    });

  })

  const btn_save = document.querySelector('#btn_save');

  //Guardar acta
  btn_save.addEventListener('click', function (e) {
    e.preventDefault();
    const rows =  document.querySelectorAll('.row_certificate');
    let counter = 0;
    const label_error = document.querySelector('#label_error');
    let validation = false;


    const date = document.querySelector("#date").value;
    const id_proceeding = document.querySelector("#id_proceeding").value;
    const id_user_receives = document.querySelector("#id_user_receives").value;
    const address = document.querySelector("#address").value;
    const observations = document.querySelector("#observations").value;
    const name_user_receive = document.querySelector("#name_user_receive");
//se validan que los campos del usuario esten rellenos
    if (date == "") {
        label_error.removeAttribute('hidden');
        label_error.textContent = "Campo de FECHA no completado";
        validation = true;
    }else if (id_proceeding == "") {
        label_error.removeAttribute('hidden');
        label_error.textContent = "Campo de TIPO DE ACTA no completado";
        validation = true;
    }else if (id_user_receives == "" && name_user_receive.disabled) {
        label_error.removeAttribute('hidden');
        label_error.textContent = "Campo de USUARIO A RECIBIR no completado";
        validation = true;
    }else if (name_user_receive == "" && !name_user_receive.disabled) {
        label_error.removeAttribute('hidden');
        label_error.textContent = "Campo de USUARIO A RECIBIR no completado";
        validation = true;
    }else if (address == "") {
        label_error.removeAttribute('hidden');
        label_error.textContent = "Campo de DIRECCIÓN no completado";
        validation = true;
    }else if (observations == "") {
        label_error.removeAttribute('hidden');
        label_error.textContent = "Campo de OBSERVACIONES no completado";
        validation = true;
    }else{
//se validan las filas para que tambien esten rellenas
    rows.forEach(row => {
        counter +=1;
        const description = row.querySelector('#description').value;
        const brand = row.querySelector('#brand').value;
        const serie = row.querySelector('#serie').value;
        const id_type_component = row.querySelector('#id_type_component').value;
        const id_origin_certificate = row.querySelector('#id_origin_certificate').value;
        const id_state_certificate = row.querySelector('#id_state_certificate').value;
        const accessories = row.querySelector('#accessories').value;
       if (description == "" || brand == ""||serie == ""||id_type_component == ""||id_origin_certificate == ""||id_state_certificate == ""||accessories == "" ) {
            label_error.removeAttribute('hidden');
            label_error.textContent = "Campos de fila #"+ counter + " incompletos";
            validation = true;
        }
    });
}

//si la validacion sale bien guarda el acta con los datos del usuario
    if(validation == false){

        label_error.setAttribute('hidden', 'true');
        const content_loading = document.querySelector('#content_loading');
        btn_save.setAttribute('disabled','true');
        content_loading.removeAttribute('hidden');
        const label_success = document.querySelector('#label_success');
        const _token = document.querySelector("input[name=_token]").value;
        const element_loading = document.querySelector("#element_loading");
        label_success.textContent = "Creando acta y enviando notificación..... 40%";
        $.ajax({
            type: "POST",
            url: "create/save",
            data: {
                id_proceeding: id_proceeding,
                date: date,
                address: address,
                id_user_receives: id_user_receives,
                general_remarks	:observations,
                name_user_receives:  name_user_receive.value,
                _token: _token,
            },
            success: function (response) {

                if (response['id_certificate']) {

                    const id_certificate = response['id_certificate'];
                    let new_counter = 0;
                    rows.forEach(row => {
                        //guardar fila por fila de cada acta
                        label_success.textContent = "Guardando fila..... 80%";
                        const id_product = row.querySelector('#id_product').value;
                        $.ajax({
                            type: "POST",
                            url: "create/save_rows",
                            data: {
                                id_certificate:id_certificate,
                                id_product: id_product,
                                _token: _token,
                            },
                            success: function (response) {

                                if (response) {
                                    new_counter += 1;

                                    label_success.textContent = "Fila insertada #"+new_counter+"..... 85%";
                                    if (counter == new_counter) {
                                    setTimeout(() => {

                                            label_success.textContent = "Filas insertadas..... 100%";
                                            element_loading.remove();
                                            setTimeout(() => {
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
                                                  //mostrar mensaje de terminacion
                                                  Toast.fire({
                                                    icon: "success",
                                                    title: "Acta creada correctamente. Redireccionando......."
                                                  });
                                                  setTimeout(() => {
                                                    //redireccionar a los certificados
                                                    window.location = "../certificates";
                                                }, 2000);
                                            }, 2000);


                                        }, 2000);
                                        }



                                }

                            },
                            error: function (error) {
                                // Manejar el error si lo hay
                                console.error(error);
                            }
                        });





                    });
                }

            },
            error: function (error) {
                // Manejar el error si lo hay
                console.error(error);
            }
        });





    }



  })


