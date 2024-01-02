
const btn_serie = document.querySelector('#btn_serie');

btn_serie.addEventListener('click',
 function (e) {
    const input_serie = document.querySelector('#input_serie');
    e.preventDefault();
    $.ajax({
        type: "GET",
        url: "create/get_serie",
        success: function (response) {

           if (response['serie']) {
            console.log(response['serie'])
            input_serie.value = response['serie'];
           }


        },
        error: function (error) {
            // Manejar el error si lo hay
            console.error(error);
        }
    });

 })
