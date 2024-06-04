
var meuApp = meuApp || {};

(function () {
	class Calculadora {
		get hid() {
			return document.getElementById(meuApp.componenteEscondido);
		}

		get lab() {
			return document.getElementById(meuApp.labelComNumero);
		}

		get numAtual() {
			return this.hid.value;
		}

		set numAtual(value) {
			this.hid.value = value;
			this.lab.innerText = value;
		}

		adicionarDigito(digito) {
			if (this.numAtual === "0") {
				this.numAtual = digito;
			} else {
				this.numAtual += digito;
			}
		}

		negarNumAtual() {
			if (!this.numAtual.includes("-")) {
				this.numAtual = "-" + this.numAtual;
			} else {
				this.numAtual = this.numAtual.replace("-", "");
			}
		}

		colocarVirgula() {
			if (this.numAtual.length <= 0) {
				return;
			}
			if (!this.numAtual.includes(",")) {
				this.numAtual = this.numAtual + ",";
			}
		}

		operacaoBackSpace() {
			if (this.numAtual.length < 0 || this.numAtual === "0") {
				return;
			}
			this.numAtual = this.numAtual.substring(0, this.numAtual.length - 1);

		}

		operacaoCE() {
			this.numAtual = "0";
		}

		operacaoC() {
			alert("Operação indisponível no momento")
		}
		
	}

	meuApp.calculadora = new Calculadora();
})()
