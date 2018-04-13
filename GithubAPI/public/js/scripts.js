//global functions
jQuery.noConflict();

jQuery(document).ready(function () {
    Ajustes();
});

var prm = Sys.WebForms.PageRequestManager.getInstance();
prm.add_endRequest(function () {
    Ajustes();
    AbrirModal();
});

function Ajustes() {
    jQuery(".maskCPF").keyup(function () {
        var texto = jQuery(this).val();

        texto = texto.replace(/[^\d]/g, '');

        if (texto.length > 0) {
            if (texto.length > 3)
                texto = [texto.slice(0, 3), ".", texto.slice(3)].join('');
            if (texto.length > 7)
                texto = [texto.slice(0, 7), ".", texto.slice(7)].join('');
            if (texto.length > 11)
                texto = [texto.slice(0, 11), "-", texto.slice(11)].join('');
            if (texto.length > 14)
                texto = texto.substr(0, 14);
        }
        jQuery(this).val(texto);
    });

    jQuery(".maskCep").keyup(function () {
        var texto = jQuery(this).val();

        texto = texto.replace(/[^\d]/g, '');

        if (texto.length > 0) {

            if (texto.length > 2) {
                texto = [texto.slice(0, 2), ".", texto.slice(2)].join('');
            }
            if (texto.length > 6) {
                texto = [texto.slice(0, 6), "-", texto.slice(6)].join('');
            }
            if (texto.length > 10)
                texto = texto.substr(0, 10);
        }
        jQuery(this).val(texto);
    });

    jQuery(".maskTelefone").keyup(function () {

        var texto = jQuery(this).val();

        texto = texto.replace(/[^\d]/g, '');

        if (texto.length > 0) {
            texto = "(" + texto;

            if (texto.length > 3) {
                texto = [texto.slice(0, 3), ") ", texto.slice(3)].join('');
            }
            if (texto.length > 12) {
                if (texto.length > 13)
                    texto = [texto.slice(0, 10), "-", texto.slice(10)].join('');
                else
                    texto = [texto.slice(0, 9), "-", texto.slice(9)].join('');
            }
            if (texto.length > 15)
                texto = texto.substr(0, 15);
        }
        jQuery(this).val(texto);
    });

    jQuery(".maskData").keyup(function () {
        var texto = jQuery(this).val();

        texto = texto.replace(/[^\d]/g, '');

        if (texto.length > 0) {

            if (texto.length > 2) {
                texto = [texto.slice(0, 2), "/", texto.slice(2)].join('');
            }
            if (texto.length > 5) {
                texto = [texto.slice(0, 5), "/", texto.slice(5)].join('');
            }
            if (texto.length > 10)
                texto = texto.substr(0, 10);
        }
        jQuery(this).val(texto);
    });
}

(function ($) {

    $(document).ready(function () {
        $("[id*=dgvSMTPs] tr").mouseover(function () {
            $(this).find("td div a").addClass("highlight_history");
        });
        $("[id*=dgvSMTPs] tr").mouseout(function () {
            $(this).find("td div a").removeClass("highlight_history");
        });

        $("[id*=dgvSMTPs] tr td div a").mouseover(function () {
            $(this).addClass("highlight");
        });
        $("[id*=dgvSMTPs] tr td div a").mouseout(function () {
            $(this).removeClass("highlight");
        });
    });

	//functions
	/*
	$(window).load(function($){
	});

	$(window).resize(function() {
	});
	*/

	$(window).bind("load resize", function() {
		var topOffset = 49;
		var width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
		var	$navbar__collapse = $('.navbar-collapse'),
			$page__wrapper = $('.page-dashboard__wrapper');


		if (width < 768) {
			$navbar__collapse.addClass('collapse');
		} else {
			$navbar__collapse.removeClass('collapse');
		}

		var height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
		height = height - topOffset;
		if (height < 1) height = 1;
		if (height > topOffset) {
			$page__wrapper.css("min-height", (height) + "px");
		}
	});

})(jQuery);

function SomenteNumero(e) {
    var tecla = (window.event) ? event.keyCode : e.which;
    switch (tecla) {
        case 0:
        case 8:
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
            return true;
            break;
        default:
            return false;
    }
}

function AbrirModal() {
    var zindex = 9999;
    jQuery(".modalFundo").remove();

    jQuery(".modal1, .modal-jq-ui").each(function () {
        var modal = jQuery(this);

        if (modal.css("display") != "none") {
            jQuery("form").append("<div class='modalFundo' style='z-index:" + zindex + ";'></div>");
            ++zindex;
            modal.css("z-index", zindex++);
        }
    });
}