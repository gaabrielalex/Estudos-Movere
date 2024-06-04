<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CalculadoraCompleta.aspx.cs" Inherits="CalculadoraWeb.CalculadoraCompleta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<style>
		input[type="submit"], button {
			width: 60px;
			height: 60px;
		}

		.error {
			font-weight: bold;
			color: red;
		}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<h1>Calculadora Completa
	</h1>
	<div class="row">
		<div class="col">
			<asp:Label runat="server" ID="ErroLabel" CssClass="error"></asp:Label>
		</div>
	</div>
	<div class="row">
		<div class="col">
			Primeiro:

			<asp:Label runat="server" ID="PrimeiroNumeroLabel"></asp:Label>
			<input type="hidden" id="PrimeiroNumeroHidden" runat="server"  value="0"/>

		</div>
	</div>
	<div class="row m-2">
		<div class="col">
			Atual:

			<asp:Label runat="server" ID="NumeroAtualLabel" Text="0"></asp:Label>
			<input type="hidden" id="NumeroAtualHidden" runat="server"  value="0"/>

		</div>
	</div>
	<div class="row m-2">
		<div class="col-1">
		</div>
		<div class="col-1">
			<button class="btn btn-primary btn-lg" OnClick="meuApp.calculadora.operacaoCE(); return false;">CE</button>
		</div>
		<div class="col-1">
			<button class="btn btn-primary btn-lg" OnClick="meuApp.calculadora.operacaoC(); return false;">C</button>
		</div>
		<div class="col-1">
			<button class="btn btn-primary btn-lg" OnClick="meuApp.calculadora.operacaoBackSpace(); return false;"><=</button>
		</div>
	</div>
	<div class="row m-2">
		<div class="col-1">
			<button class="btn btn-secondary btn-lg" OnClick="meuApp.calculadora.adicionarDigito('7'); return false;">7</button>
		</div>
		<div class="col-1">
			<button class="btn btn-secondary btn-lg" OnClick="meuApp.calculadora.adicionarDigito('8'); return false;">8</button>
		</div>
		<div class="col-1">
			<button class="btn btn-secondary btn-lg" OnClick="meuApp.calculadora.adicionarDigito('9'); return false;">9</button>
		</div>
		<div class="col-1">
			<asp:Button runat="server" ID="OperacaoDividirButton" Text="÷" CssClass="btn btn-primary btn-lg" OnClick="OperacaoDividirButton_Click" />
		</div>
	</div>
	<div class="row m-2">
		<div class="col-1">
			<button class="btn btn-secondary btn-lg" OnClick="meuApp.calculadora.adicionarDigito('4'); return false;">4</button>
		</div>
		<div class="col-1">
			<button class="btn btn-secondary btn-lg" OnClick="meuApp.calculadora.adicionarDigito('5'); return false;">5</button>
		</div>
		<div class="col-1">
			<button class="btn btn-secondary btn-lg" OnClick="meuApp.calculadora.adicionarDigito('6'); return false;">6</button>
		</div>
		<div class="col-1">
			<asp:Button runat="server" ID="OperacaoMultiplicarButton" Text="x" CssClass="btn btn-primary btn-lg" OnClick="OperacaoMultiplicarButton_Click" />
		</div>
	</div>
	<div class="row m-2">
		<div class="col-1">
			<button class="btn btn-secondary btn-lg" OnClick="meuApp.calculadora.adicionarDigito('1'); return false;">1</button>
		</div>
		<div class="col-1">
			<button class="btn btn-secondary btn-lg" OnClick="meuApp.calculadora.adicionarDigito('2'); return false;">2</button>
		</div>
		<div class="col-1">
			<button class="btn btn-secondary btn-lg" OnClick="meuApp.calculadora.adicionarDigito('3'); return false;">3</button>
		</div>
		<div class="col-1">
			<asp:Button runat="server" ID="OperacaoSubtrairButton" Text="-" CssClass="btn btn-primary btn-lg" OnClick="OperacaoSubtrairButton_Click" />
		</div>
	</div>
	<div class="row m-2">
		<div class="col-1">
			<button class="btn btn-info btn-lg" OnClick="meuApp.calculadora.negarNumAtual(); return false;" >+/-</button>
		</div>
		<div class="col-1">
			<button class="btn btn-secondary btn-lg" OnClick="meuApp.calculadora.adicionarDigito('0'); return false;">0</button>
		</div>
		<div class="col-1">
			<button class="btn btn-info btn-lg" OnClick="meuApp.calculadora.colocarVirgula(); return false;" >,</button>
		</div>
		<div class="col-1">
			<asp:Button runat="server" ID="OperacaoSomarButton" Text="+" CssClass="btn btn-primary btn-lg" OnClick="OperacaoSomarButton_Click" />
		</div>
	</div>

	<script type="text/javascript">
		var meuApp = {
			componenteEscondido: "<%=NumeroAtualHidden.ClientID %>",
			labelComNumero: "<%=NumeroAtualLabel.ClientID %>"
			
		}
	</script>

	<script src="Scripts/meus-scripts.js" type="text/javascript"> </script>
</asp:Content>
