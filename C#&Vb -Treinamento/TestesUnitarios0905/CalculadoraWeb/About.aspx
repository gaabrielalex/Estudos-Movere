<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="CalculadoraWeb.About" %>

<%--<%@ Import Namespace="ConsoleAppCSharp" %>--%> 

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
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
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">

        <div>
			<asp:Button runat="server" Text="Calcular Fibonacci" OnClick="Unnamed_Click" />
			<br />
              <asp:Button runat="server" Text="Calcular Juros" OnClick="Unnamed_Click1" />
        </div>

        <asp:panel runat="server" ID="FibonacciPanel" Visible="false">

            <h1> Calculadora Fibonnaci</h1>

            Favor informar a quantidade de números:

            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"> </asp:TextBox>

             <asp:Label ID="TextoModificado" runat="server" Text="Valor Original"></asp:Label>

             <br />
		    <br />
             Quantidade de visitas na página: <asp:Label ID="VisitalLabel" runat="server" Text="Label"></asp:Label>

             <br />
		    <br />
              Quantidade de alterações do lista de fibo: <asp:Label ID="QtdeAlt" runat="server"></asp:Label>
   
            <br />
            <br />

            <asp:Button ID="Button1" runat="server" Text="Carregador Números" OnClick="Button1_Click" />
                <br />
       
                <br />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

        </asp:panel>

        <asp:Panel runat="server" ID="CalcularJurosPanel" Visible="false">

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


        </asp:Panel>
    </main>
</asp:Content>
