const permissions = document.querySelectorAll('#permission');

permissions.forEach(permission => {
    const id_state = permission.querySelector('#id_state').value;
    console.log(id_state)
    if (id_state == 3) {
        permission.style.backgroundColor = '#FFF5C2';
    } else if (id_state == 9) {
        permission.style.backgroundColor = '#F48484';
    } else {
        permission.style.backgroundColor = '#D0F288';
    }
});





