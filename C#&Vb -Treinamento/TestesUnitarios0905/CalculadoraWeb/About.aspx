<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="CalculadoraWeb.About" %>

<%--<%@ Import Namespace="ConsoleAppCSharp" %>--%> 

<%@ Register TagPrefix="calc" TagName="CalculadoraFibo" Src="~/CalculadoraFibo.ascx" %>
<%@ Register TagPrefix="calc" TagName="CalculadoraJurosComposto" Src="~/CalculadoraJurosComposto.ascx" %>
<%@ Register TagPrefix="calc" TagName="CalculadoraSimulacaoFinanciamento" Src="~/CalculadoraSimulacaoFinanciamento.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style>

       
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">

        <div>
			<asp:Button runat="server" Text="Calcular Fibonacci" OnClick="Unnamed_Click" />
			<br />
            <asp:Button runat="server" Text="Calcular Juros" OnClick="Unnamed_Click1" />
            <br />
            <asp:Button runat="server" Text="Calcular Simulação de Financiamento" OnClick="Unnamed_Click2" />
			<br />
            <asp:Button runat="server" Text="Gerenciador de Nomes" OnClick="Unnamed_Click3" />
        </div>

        <asp:panel runat="server" ID="FibonacciPanel" Visible="false">
            <calc:CalculadoraFibo runat="server" ID="CalculadoraFibonacci" />
        </asp:panel>

        <asp:Panel runat="server" ID="CalcularJurosPanel" Visible="false">
            <calc:CalculadoraJurosComposto runat="server" ID="CalculadoraJurosComposto" />
        </asp:Panel>


         <asp:Panel runat="server" ID="CalcularSimulacaoFinancimanetoPanel" Visible="false">
            <calc:CalculadoraSimulacaoFinanciamento nome="Texte Simples" runat="server" ID="CalculadoraSimulacaoFinanciamento" />
         </asp:Panel>

         <asp:Panel runat="server" ID="GerenciadorDeNomesPanel" Visible="false">
           <h1>Gerenciador de Nomes</h1>
			 <br />
           <asp:Label runat="server" Text="Informe seu nome:">
                <asp:TextBox runat="server" ID="NomeTextBox" />
           </asp:Label><br /><br /><asp:Button runat="server" Text="Adicionar" id="AdicionarNomeButton" OnClick="AdicionarNomeButton_Click" />

           <ul>
                <asp:Repeater runat="server" ID="NomesRepeater">
					<ItemTemplate>
						<li><%# Container.DataItem %></li>
					</ItemTemplate>
				</asp:Repeater>
           </ul>
        </asp:Panel>


        <%--Tudo dessarrumado daqui para baixo--%>
        <%-- <asp:Panel runat="server" ID="Panel1" Visible="false">

            <h1> Calculadora de juros variados</h1>

            Favor preencher os campos para que seja realizado os calculos de simulação de financiamento:

            <br />
               <br />
            <div class="conteudoSimulacaoFinancimanento">
                <table>
                    <tr>
                        <td><asp:Label runat="server" ID="Label6" Text="Parcela:" /></td>
                        <td><asp:TextBox runat="server" ID="TextBox5" /></td>
                    </tr>
                    <tr>
                        <td><asp:Label runat="server" ID="Label7" Text="Taxa:" /></td>
                        <td><asp:TextBox runat="server" ID="TextBox6" /></td>
                    </tr>
                    <tr>
                        <td><asp:Label runat="server" ID="Label8" Text="Meses:" /></td>
                        <td><asp:TextBox runat="server" ID="TextBox7" /></td>
                    </tr>
                </table>
                <div class="divBtnCalcular">
                    <asp:Button runat="server" ID="Button3" Text="Calcular" OnClick="CalcularJurosButton_Click" />
                </div>
                <div class="divResultado">
                    Resultado: <asp:Label ID="Label9" runat="server" Text="Text"></asp:Label>
                </div>
            </div>

        </asp:Panel>--%>
    </main>
</asp:Content>
