<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalculadoraSimulacaoFinanciamento.ascx.cs" Inherits="CalculadoraWeb.CalculadoraSimulacaoFinanciamento" %>

<%@ Register TagPrefix="d" TagName="LinhaTabela" Src="~/LinhaSimulcaoParcela.ascx" %>

<style>
	.divBtnCalcular {
		display: flex;
		justify-content: end;
		align-items: center;
		margin-top: 25px;
	}

	.divResultado {
		margin-top: 25px;
	}

	.conteudoSimulacaoFinanciamento {
		display: inline-flex;
		flex-direction: column;
		width: 45vw;
	}

		.conteudoSimulacaoFinanciamento .campos tr {
			height: 50px;
		}

		.conteudoSimulacaoFinanciamento .campos td {
			width: 70px;
		}
</style>


<h1>Calculadora de simulação financiamento</h1>
<h2><%=Nome %></h2>

Favor preencher os campos para que seja realizado os calculos de simulação de financiamento:

<br />
<br />
<div class="conteudoSimulacaoFinanciamento">
	<table class="campos">
		<tr>
			<td>
				<asp:Label runat="server" ID="VlrFinanciamentoLabel" Text="Valor do financiamento:" /></td>
			<td>
				<asp:TextBox runat="server" ID="VlrFinanciamentoTxtBox" /></td>
		</tr>
		<tr>
			<td>
				<asp:Label runat="server" ID="NumMaxParcelasLabel" Text="Número máximo de parcelas:" /></td>
			<td>
				<asp:TextBox runat="server" ID="NumMaxParcelasTxtBox" /></td>
		</tr>
		<tr>
			<td>
				<asp:Label runat="server" ID="TaxaJurosLabel" Text="Taxa de juros:" /></td>
			<td>
				<asp:TextBox runat="server" ID="TaxaJurosTxtBox" /></td>
		</tr>
	</table>
	<br />
	<div class="divbtncalcular">
		<asp:Button runat="server" ID="CalcularFinanciamentoButton" Text="calcular" OnClick="CalcularFinanciamentoButton_Click" />
	</div>
	<br />
	<div class="divresultado">
		resultado:
		<asp:Label ID="ResultadoFinanciamentoLabel" runat="server" Text="text"></asp:Label>
	</div>

	<br />
	<asp:Repeater runat="server" ID="SimulacaoFinanciamentoReapeter">
		<HeaderTemplate>
			<table width="100%" border="1">
				<tr>
					<th>Simulacao</th>
					<th>Valor total</th>
					<th>Juros</th>
					<th>Vencimento</th>
				</tr>
		</HeaderTemplate>
		<ItemTemplate>
			<tr>
				<d:LinhaTabela runat="server" Linha="<%#Container.DataItem%>"></d:LinhaTabela>
			</tr>
		</ItemTemplate>
		<AlternatingItemTemplate>
			<tr style="background-color: #ccc">
				<d:LinhaTabela runat="server" Linha="<%#Container.DataItem%>"></d:LinhaTabela>
			</tr>
		</AlternatingItemTemplate>
		<FooterTemplate>
			</table>
		</FooterTemplate>
	</asp:Repeater>
</div>
