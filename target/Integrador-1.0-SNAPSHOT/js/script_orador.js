document.addEventListener("DOMContentLoaded", function () {
    let btnEnviarOrador = document.querySelector("#btnEnviarOrador");
    btnEnviarOrador.addEventListener("click", validarFormulario);

    function validarFormulario() {
        let nombre = document.querySelector("#nombre").value;
        let apellido = document.querySelector("#apellido").value;
        let tema = document.querySelector("#tema").value;

        if (nombre.trim() === "" || apellido.trim() === "" || tema.trim() === "") {
            alert("Completa todos los campos.");
            return false;
        }

        return true;
    }
});


