//Defino valor Ticket
const valorTicket = 200;

// Descuentos
let sinDescuentos = 1;
let descuentoEstudiante = 0.20;
let descuentoTrainee = 0.50;
let descuentoJunior = 0.85;

let totalAPagar    = document.getElementById("totalAPagar");

  function comprarEntrada(formulario){
    if(formulario.nombre.value.trim() == 0){
        alert("Debe ingresar su nombre");
        return false
    }
    if(formulario.apellido.value.trim() == 0){
        alert("Debe ingresar su apellido");
        return false
    }
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if(!emailRegex.test(formulario.email.value)){
        alert("Debe ingresar un email válido");
        return false
    }
    if(formulario.cantidad.value == 0){
        alert("Ingrese la cantidad de Tickets");
        return false
    }
    if(formulario.categoria.value == ""){
        alert("Seleccione la categoria");
        return false
    }
    
    let totalValorEntrada = (cantidad.value) * valorTicket;

    switch(categoria.value){
        case "0":
            totalValorEntrada = totalValorEntrada;
            break;
        case "1":
            totalValorEntrada = totalValorEntrada * descuentoEstudiante;
            break;
        case "2":
            totalValorEntrada = totalValorEntrada * descuentoTrainee;
            break;
        case "3":
            totalValorEntrada = totalValorEntrada * descuentoJunior;
            break;
            }
    
    totalAPagar.innerHTML = "Total a Pagar $ "+totalValorEntrada;
    return false

    
  }

  function borrarFormulario() {
    formulario.reset();
    totalAPagar.innerHTML = "Total a Pagar: $";
  }
  
  document.getElementById("botonBorrar").addEventListener("click", borrarFormulario);
  