document.addEventListener("DOMContentLoaded", function () {
  let btnResumen = document.querySelector("#btnResumenVenta");
  let btnBorrar = document.querySelector("#btnBorrarVenta");
  let outputTicket = document.querySelector("#outputTicket");
  let cantidadInput = document.querySelector("#cantidad");
  let categoriaInput = document.querySelector("#CategoriaTicket");

  btnResumen.addEventListener("click", calcularTotal);
  btnBorrar.addEventListener("click", borrarOutput);

  function calcularTotal() {
    let cantidad = parseInt(cantidadInput.value);
    let categoria = categoriaInput.value;

    let descuento = 0;
    switch (categoria) {
      case "Estudiante":
        descuento = 200 * 0.2;
        break;
      case "Trainee":
        descuento = 200 * 0.5;
        break;
      case "Junior":
        descuento = 200 * 0.85;
        break;
      default:
        alert("Selecciona una categoría válida.");
        return;
    }

    let totalPagar = cantidad * descuento;

    outputTicket.value = `$${totalPagar.toFixed(2)}`;
  }

  function borrarOutput() {
    cantidadInput.value = "";
    categoriaInput.value = "";
    outputTicket.value = "";
  }

  let formulario = document.querySelector("#formVenta");
  formulario.addEventListener("submit", function (event) {
    if (!validarFormulario()) {
      event.preventDefault();
    }
  });

  function validarFormulario() {
    let cantidad = parseInt(cantidadInput.value);
    let categoria = categoriaInput.value;

    if (isNaN(cantidad) || cantidad <= 0) {
      alert("Ingrese una cantidad válida.");
      return false;
    }

    if (categoria === "") {
      alert("Seleccione una categoría válida.");
      return false;
    }

    return true;
  }
});

