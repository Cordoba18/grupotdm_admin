const certificates = document.querySelectorAll('#certificate');

//Se recorren todos los certificados y dependiendo del estado se coloca un color de fondo para el certificado
certificates.forEach(certificate => {
    const id_state = certificate.querySelector('#id_state').value;
    if (id_state == 3) {
        certificate.style.backgroundColor = '#FFFFEC';
    } else if (id_state == 11) {
        certificate.style.backgroundColor = '#F1E4C3';
    } else if (id_state == 2) {
        certificate.style.backgroundColor = '#F48484';
    } else {
        certificate.style.backgroundColor = '#A1EEBD';
    }
});
