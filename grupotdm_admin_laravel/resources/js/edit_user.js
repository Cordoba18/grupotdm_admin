const id_company = document.querySelector('#id_company');

// Al presentarse un cambio en la compañia del usuario se obtienen las tiendas de la compañia
id_company.addEventListener('change', function (e) {

    const id_shop = document.querySelector('#id_shop');
    $.ajax({
        type: "GET",
        url: "getshops/"+id_company.value,
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

//Si hay un cambio en el select de las areas se obtienen los cargos de esas areas para aplicarlos en el select de los cargos
const id_area = document.querySelector('#id_area');


id_area.addEventListener('change', function (e) {

    const id_chargy = document.querySelector('#id_chargy');

    $.ajax({
        type: "GET",
        url: "getcharges/"+id_area.value,
        success: function (response) {
            id_chargy.innerHTML = "";
           if (response['charges']) {
            console.log(response['charges'])
            response['charges'].forEach(chargy => {
                id_chargy.innerHTML = id_chargy.innerHTML + "<option value='"+chargy['id']+"'>"+chargy['chargy']+"</option>";
            });

           }


        },
        error: function (error) {
            // Manejar el error si lo hay
            console.error(error);
        }
    });
})
