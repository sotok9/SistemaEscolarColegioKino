$().ready(Desabilitar);

function Desabilitar() {
    var privilegios = sessionStorage.getItem("privilegios");
    if (privilegios == 1) {
        $(".privilegio2").addClass("disabled");
        $(".privilegio3").addClass("disabled");
        $(".privilegio4").addClass("disabled");
        $(".privilegio5").addClass("disabled");
    }
    if (privilegios == 2) {
        $(".privilegio3").addClass("disabled");
        $(".privilegio4").addClass("disabled");
        $(".privilegio5").addClass("disabled");
    }
    if (privilegios == 3) {
        $(".privilegio4").addClass("disabled");
        $(".privilegio5").addClass("disabled");
    }
    if (privilegios == 4) {
        $(".privilegio5").addClass("disabled");
    }

}
