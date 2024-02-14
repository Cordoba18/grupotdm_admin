const total = document.querySelector("#total");
const sub_total = document.querySelector("#sub_total");
const difference = document.querySelector("#difference");
const btn_save = document.querySelector("#btn_save");
const rows = document.querySelectorAll("#rows");
var tpv = document.querySelector("#tpv");

const id_spreadsheet_tpv = document.querySelector("#id_spreadsheet_tpv");

btn_save.addEventListener("click", function (e){
    const content_loading = document.querySelector("#content_loading");

    content_loading.removeAttribute("hidden");
    const label_success = document.querySelector("#label_success");
    const rows = document.querySelectorAll("#rows");
    btn_save.disabled = true;
    rows.forEach(row => {

        const id_spreadsheet_rows_tpv = row.querySelector("#id_spreadsheet_rows_tpv");
        const input_value_treasurer = row.querySelector("#input_value_treasurer");
        const name_payment_method = row.querySelector("#name_payment_method");
        const value_difference = row.querySelector("#value_difference");
        setTimeout(() => {
            label_success.innerHTML = `Guardando ${name_payment_method.textContent}...`;
        }, 500);

        axios.post(`${route_principal}/spreadsheets/tpvs/rows/save_rows`,{
            id_spreadsheet_rows_tpv: id_spreadsheet_rows_tpv.textContent,
            value_treasurer: input_value_treasurer.value,
            value_difference: value_difference.value,
          }).then(res=>{
            setTimeout(() => {
            label_success.innerHTML = `${name_payment_method.textContent} Guardado con exito!`;
        }, 500);
          }).catch(error=>{

          });


    });

const total = document.querySelector("#total");
const sub_total = document.querySelector("#sub_total");
const difference = document.querySelector("#difference");
const state = document.querySelector("#state");
console.log(total.textContent);
setTimeout(() => {
    label_success.innerHTML = `Guardando informaciòn de informe...!`;
}, 500);
axios.post(`${route_principal}/spreadsheets/tpvs/rows/save_spreadsheet_tpv`,{
    id_spreadsheet_tpv: id_spreadsheet_tpv.textContent,
    total: total.textContent,
    sub_total: sub_total.textContent,
    difference: difference.textContent,
  }).then(res=>{
    setTimeout(() => {
        btn_save.disabled = false;
        content_loading.setAttribute("hidden","true");
        const Toast = Swal.mixin({
            toast: true,
            position: "top-end",
            showConfirmButton: false,
            timer: 1500,
            timerProgressBar: true,
            didOpen: (toast) => {
              toast.onmouseenter = Swal.stopTimer;
              toast.onmouseleave = Swal.resumeTimer;
            }
          });
          Toast.fire({
            icon: "success",
            title: `Informe de ${tpv.textContent} Guardado con exito!`
          });
}, 500);
  }).catch(error=>{

  });

});





//recorro las filas
rows.forEach(row => {
    const value_pos = row.querySelector("#value_pos");
    const value_difference = row.querySelector("#value_difference");
    const input_value_treasurer = row.querySelector("#input_value_treasurer");
//evento que se dispara cuando el usuario escribe en un input de una fila
    input_value_treasurer.addEventListener("input", function(e) {
        //creo un cantador
        let contador = 0;
        //recorro nuevamente las filas
        rows.forEach(r => {

            const input_value_treasurer = r.querySelector("#input_value_treasurer");
            //valido el input tengo un valor para sumar
            if (input_value_treasurer.value == "") {
            }else if (parseInt(input_value_treasurer.value) < 0) {
                Swal.fire({
                    title: "CONTEO INVALIDO",
                    text: "No puedes ingresar un valor menor a 0!",
                    icon: "error"
                  });
                  input_value_treasurer.value = 0;
            }else{
                //agrego al contador la suma del input con el mismo contador
                contador += parseInt(input_value_treasurer.value);

            }


        });
        //Valido si el contador supera el valor total y arrojo una alerta
        if (parseInt(total.textContent) < contador) {

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
                title: `Tu conteo esta sobre pasando el valor total del POS`
              });

        }
        value_difference.value = parseInt(value_pos.textContent - input_value_treasurer.value);
        //resto el total con el valor del contador para hayar la diferencia
        difference.innerHTML = parseInt(total.textContent) - contador;
        //muestro el valor total del conteo que obtuve de la variable del contador
        sub_total.innerHTML = contador;
    })
});
