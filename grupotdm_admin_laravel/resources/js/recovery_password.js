const btn_change_password = document.querySelector('#btn_change_password');
const error_form = document.querySelector('#error');
btn_change_password.addEventListener('click', function(e){
    e.preventDefault();
    const _token = document.querySelector("input[name=_token]").value;
    const email = document.querySelector('#email');
    const password1 = document.querySelector('#password1');
    const password2 = document.querySelector('#password2');
    if (password1.value != password2.value) {
        error_form.innerHTML = "LAS CONTRASEÑAS NO COINCIDEN";
        error_form.removeAttribute('hidden');
    } else if (!tieneMayuscula(password1.value) || !tieneMinuscula(password1.value) || !tieneNumero(password1.value)) {
        error_form.innerHTML = "La contraseña debe contener al menos una mayuscula, una minuscula y un numero";
        error_form.removeAttribute('hidden');
    } else if (!largocontrasena(password1.value)) {
        error_form.innerHTML = "La contraseña debe ser de mayor a 8 o menor a 15 caracteres";
        error_form.removeAttribute('hidden');
    } else {
        error_form.innerHTML = "VALIDANDO USUARIO....";
        error_form.removeAttribute('hidden');
        error_form.classList.remove('alert-danger');
        error_form.classList.add('alert-success');

        $.ajax({
            type: "POST",
            url: "changepassword",
            data: {
                email: email.value,
                password: password1.value,
                _token: _token,
            },
            success: function (response) {
                if (response['message'] == true) {
                    Swal.fire({
                        icon: 'success',
                        title: 'CAMBIO REALIZADO',
                        text: 'Su contraseña se cambio con exito'
                    })
                    setTimeout(() => {
                        window.location = "../login";
                    }, 2000);

                }

            },
            error: function (error) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Vuelve a intentarlo de nuevo'
                })
            }
        });
    }
})

function tieneMayuscula(texto) {
    for (let i = 0; i < texto.length; i++) {
        if (texto[i] !== texto[i].toLowerCase()) {
            return true;
        }
    }
    return false;
}
//metodo para encontrar minusculas en un texto
function tieneMinuscula(texto) {
    for (let i = 0; i < texto.length; i++) {
        if (texto[i] !== texto[i].toUpperCase()) {
            return true;
        }
    }
    return false;
}
//metodo para encontrar numeros en un texto
function tieneNumero(texto) {
    for (let i = 0; i < texto.length; i++) {
        if (!isNaN(texto[i])) {
            return true;
        }
    }
    return false;
}
//mvalidar el largo permitido de la contraseña

function largocontrasena(texto) {
    if (texto.length > 15 || texto.length < 8) {
        return false;
    } else {
        return true;
    }
}

function largotextos(texto) {
    if (texto.length > 100 || texto.length <= 0) {
        return true;
    } else {
        return false;
    }
}
