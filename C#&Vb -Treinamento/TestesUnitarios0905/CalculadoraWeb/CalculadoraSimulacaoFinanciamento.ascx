<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalculadoraSimulacaoFinanciamento.ascx.cs" Inherits="CalculadoraWeb.CalculadoraSimulacaoFinanciamento" %>

<style>

    .divBtnCalcular {
        display: flex;
        justify-content: end;
        align-items: center;
        margin-top: 25px;
    }

    .divResultado{
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


<h1> Calculadora de simulação financiamento</h1>
<h2><%=Nome %></h2>

Favor preencher os campos para que seja realizado os calculos de simulação de financiamento:

<br />
   <br />
<div class="conteudoSimulacaoFinanciamento">
    <table class="campos">
        <tr>
            <td><asp:label runat="server" id="VlrFinanciamentoLabel" text="Valor do financiamento:" /></td>
            <td><asp:textbox runat="server" id="VlrFinanciamentoTxtBox" /></td>
        </tr>
        <tr>
            <td><asp:label runat="server" id="NumMaxParcelasLabel" text="Número máximo de parcelas:" /></td>
            <td><asp:textbox runat="server" id="NumMaxParcelasTxtBox" /></td>
        </tr>
        <tr>
            <td><asp:label runat="server" id="TaxaJurosLabel" text="Taxa de juros:" /></td>
            <td><asp:textbox runat="server" id="TaxaJurosTxtBox" /></td>
        </tr>
    </table>
    <br />
    <div class="divbtncalcular">
        <asp:button runat="server" id="CalcularFinanciamentoButton" text="calcular" onclick="CalcularFinanciamentoButton_Click" />
    </div>
    <br />
    <div class="divresultado">
        resultado: <asp:label id="ResultadoFinanciamentoLabel" runat="server" text="text"></asp:label>
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
                <td><%# DataBinder.Eval((Container.DataItem), "Quantidade") %> x <%# DataBinder.Eval((Container.DataItem), "ValorDaParcela") %> </td>
                <td> <big>R$  <%# DataBinder.Eval((Container.DataItem), "ValorTotal")%> </big> </td>
                <td> <small>R$  <%# DataBinder.Eval((Container.DataItem), "ValorJuros")%> </small> </td>
                <td><b> Último vencimento: <%# ((DateTime)DataBinder.Eval((Container.DataItem), "Vencimento")).ToString("dd/MM/yyyy") %> </b></td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr style="background-color: #ccc">
                <td><%# DataBinder.Eval((Container.DataItem), "Quantidade") %> x <%# DataBinder.Eval((Container.DataItem), "ValorDaParcela") %> </td>
                <td> <big>R$  <%# DataBinder.Eval((Container.DataItem), "ValorTotal")%> </big> </td>
	            <td> <small>R$  <%# DataBinder.Eval((Container.DataItem), "ValorJuros")%> </small> </td>
	            <td><b> Último vencimento: <%# ((DateTime)DataBinder.Eval((Container.DataItem), "Vencimento")).ToString("dd/MM/yyyy") %> </b></td>
            </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</div>
				