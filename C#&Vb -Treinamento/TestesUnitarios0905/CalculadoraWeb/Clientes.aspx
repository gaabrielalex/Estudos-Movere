<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="CalculadoraWeb.Clientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<h1>Clientes</h1>

	<br />
	<br />

	<asp:Button runat="server" ID="ListaDeClientesButton" Text="Carregar relação de clientes completa" OnClick="ListaDeClientesButton_Click" />

	<br />
	<br />

	<asp:Label runat="server" ID="FiltroLabel" Text="Consultar por nome:"></asp:Label>
	<asp:TextBox runat="server" ID="FiltroTextBox"></asp:TextBox>
	<asp:Button runat="server" ID="FiltrarButton" Text="Filtrar" OnClick="FiltrarButton_Click" />

	<br />
	<br />

	<asp:Button runat="server" ID="CadastrarClienteButton" Text="Cadastrar Cliente" OnClick="CadastrarClienteButton_Click" />
	<br />
	<br />

	<asp:Label runat="server" ID="MensagemLabel"></asp:Label>

	<br />
	<br />

	<asp:DataGrid runat="server" ID="RelacaoClienteGrid">
	</asp:DataGrid>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
