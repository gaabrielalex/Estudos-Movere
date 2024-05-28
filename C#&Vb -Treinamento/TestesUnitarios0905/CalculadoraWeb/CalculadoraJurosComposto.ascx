<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalculadoraJurosComposto.ascx.cs" Inherits="CalculadoraWeb.CalculadoraJurosComposto" %>

 <style>

     .divBtnCalcular {
         display: flex;
         justify-content: end;
         align-items: center;
         margin-top: 25px;
     }

     .conteudoJuros {
         display: inline-flex;
         flex-direction: column;

     }

     .conteudoJuros tr {
        height: 50px;
     }

     .conteudoJuros td {
        width: 70px;
     }

     .divResultado{
         margin-top: 25px;
     }
 </style>

<h1> Calculadora de Juros</h1>

Favor preencher os campos para que seja realizado o calculo do montante com juros compostos:

<br />
<br />
<div class="conteudoJuros">
    <table>
        <tr>
            <td><asp:Label runat="server" ID="ParcelaLabel" Text="Parcela:" /></td>
            <td><asp:TextBox runat="server" ID="ParcelaTBox" /></td>
        </tr>
        <tr>
            <td><asp:Label runat="server" ID="TaxaLabel" Text="Taxa:" /></td>
            <td><asp:TextBox runat="server" ID="TaxaTBox" /></td>
        </tr>
        <tr>
            <td><asp:Label runat="server" ID="MesesLabel" Text="Meses:" /></td>
            <td><asp:TextBox runat="server" ID="MesesTBox" /></td>
        </tr>
    </table>
    <div class="divBtnCalcular">
        <asp:Button runat="server" ID="CalcularJurosButton" Text="Calcular" OnClick="CalcularJurosButton_Click" />
    </div>
    <div class="divResultado">
        Resultado: <asp:Label ID="ResultadoJurosLabel" runat="server" Text="Text"></asp:Label>
    </div>
</div>