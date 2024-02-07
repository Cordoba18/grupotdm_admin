const id_area_receives = document.querySelector('#id_area_user');

//al hacer un cambio en el area del usuario cargo los usuarios pertenecientes a ese area
id_area_receives.addEventListener('change', function (e) {
    const id_user_receives = document.querySelector('#id_user');
    $.ajax({
        type: "GET",
        url: "../../certificates/create/get_users_areas/" + id_area_receives.value,
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
