
var meuApp = meuApp || {};

(function () {
	class Calculadora {
		consctructor() {
			this.hid = document.getElementById(meuApp.componenteEscondido),
				this.lab = document.getElementById(meuApp.labelComNumero),
		}
	}

	soulution = {
		hid: 
		lab:

	}

	meuApp.adicionarDigito = function (digito) {

		if (hid.value === "0") {
			hid.value = digito;
			lab.innerText = digito;
		} else {
			hid.value += digito;
			lab.innerText += digito;
		}

	}

	meuApp.negarValor = function () {
		if (!hid.value.includes("-")) {
			hid.value = "-" + hid.value;
			lab.innerText = "-" + hid.value;
		}
	}
})()
