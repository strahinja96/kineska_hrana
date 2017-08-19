$(document).ready(function () {
    $('#ContentPlaceHolder1_btnGlasaj').click(function (e) {
        e.preventDefault();
        //alert("pocetak funkcije");
        var idOdgovor = "";
        $('input[name="ctl00$ContentPlaceHolder1$RadioButtonList1"]').each(function () {
            if ($(this).is(':checked')) {
                idOdgovor = $(this).val();
                //alert(idOdgovor);
            }
        });
        if (idOdgovor == "") {
            $('#anketaGreska').html("Morate izabrati jedan odgovor!");
            return; return;
        }
        else {
            $('#divAnketaTabela').hide(500);
            $.ajax({
                type: "POST",
                url: "WebServiceAjax.asmx/anketaGlasanje",
                data: { idOdgovora: idOdgovor },
                success: function (data) {
                    if (data) {
                        //alert(data);
                        $('#anketaPoruka').html(data);
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.responseText);
                    alert(thrownError);
                }
            });
        }
    });
});


$(document).ready(function () {
    $('#slider').unslider({
        animation: 'horizontal',
        autoplay: true,
        arrows: false,
        nav: false,
        delay: 3500
    });
});



function promeniCenu(obj) {
    var idJela = obj.value;
    //alert(idJela);
    var imeKontrole = $(obj).attr("id");
    //alert(imeKontrole);
    var brojKontrole = imeKontrole.substr(imeKontrole.length - 2);
    //alert(brojKontrole);

    $.ajax({
        type: "POST",
        url: "../WebServiceAjax.asmx/IzmeniCenu",
        data: { idJelo: idJela, BrojKontrole : brojKontrole },
        success: function (data) {
            if (data) {
                //alert(data);
                var podaci = data.split(';');
                var controlId = "ContentPlaceHolder1_GridView1_TextBoxCena" + podaci[1];
                //alert(controlId);
                var tb = document.getElementById(controlId);
                tb.value = podaci[0];
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.responseText);
            alert(thrownError);
        }
    });
}