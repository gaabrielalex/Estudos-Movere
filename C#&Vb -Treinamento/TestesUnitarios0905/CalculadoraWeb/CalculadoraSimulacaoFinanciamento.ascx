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

    }

    .conteudoSimulacaoFinanciamento tr {
       height: 50px;
    }

    .conteudoSimulacaoFinanciamento td {
       width: 70px;
    }

</style>


<h1> Calculadora de simulação financiamento(Não implementado, estrutura copiada do juros composto)</h1>

Favor preencher os campos para que seja realizado os calculos de simulação de financiamento:

<br />
   <br />
<div class="conteudoSimulacaoFinanciamento">
    <table>
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
    <div class="divbtncalcular">
        <asp:button runat="server" id="CalcularFinanciamentoButton" text="calcular" onclick="CalcularFinanciamentoButton_Click" />
    </div>
    <div class="divresultado">
        resultado: <asp:label id="ResultadoFinanciamentoLabel" runat="server" text="text"></asp:label>
    </div>

    <asp:Repeater runat="server" ID="SimulacaoFinanciamentoReapeter">
        <HeaderTemplate>
            <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <% %>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
</div>
