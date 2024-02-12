const id_company = document.querySelector('#id_company');

// Al presentarse un cambio en la compañia del usuario se obtienen las tiendas de la compañia
id_company.addEventListener('change', function (e) {

    const id_shop = document.querySelector('#id_shop');
    $.ajax({
        type: "GET",
        url: "../users/profile/edit_profile/getshops/"+id_company.value,
        success: function (response) {
            id_shop.innerHTML = "";
           if (response['shops']) {
            response['shops'].forEach(shop => {
                id_shop.innerHTML = id_shop.innerHTML + "<option value='"+shop['id']+"'>"+shop['shop']+"</option>";
            });

           }


        },
        error: function (error) {
            // Manejar el error si lo hay
            console.error(error);
        }
    });
})


