<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CalculadoraCompleta.aspx.cs" Inherits="CalculadoraWeb.CalculadoraCompleta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<style>
		input[type="submit"] {
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
		</div>
	</div>
	<div class="row m-2">
		<div class="col">
			Atual:
			<asp:Label runat="server" ID="NumeroAtualLabel" Text="0"></asp:Label>
		</div>
	</div>
	<div class="row m-2">
		<div class="col-1">
		</div>
		<div class="col-1">
			<asp:Button runat="server" ID="OperacaoCEButton" Text="CE" CssClass="btn btn-primary btn-lg" OnClick="OperacaoCEButton_Click" />
		</div>
		<div class="col-1">
			<asp:Button runat="server" ID="OperacaoCButton" Text="C" CssClass="btn btn-primary btn-lg" OnClick="OperacaoCButton_Click" />
		</div>
		<div class="col-1">
			<asp:Button runat="server" ID="OperacaoBackSpaceButton" Text="<=" CssClass="btn btn-primary btn-lg" OnClick="OperacaoBackSpaceButton_Click" />
		</div>
	</div>
	<div class="row m-2">
		<div class="col-1">
			<asp:Button runat="server" ID="Numero7Button" Text="7" CssClass="btn btn-secondary btn-lg" OnClick="Numero7Button_Click" />
		</div>
		<div class="col-1">
			<asp:Button runat="server" ID="Numero8Button" Text="8" CssClass="btn btn-secondary btn-lg" OnClick="Numero8Button_Click" />
		</div>
		<div class="col-1">
			<asp:Button runat="server" ID="Numero9Button" Text="9" CssClass="btn btn-secondary btn-lg" OnClick="Numero9Button_Click" />
		</div>
		<div class="col-1">
			<asp:Button runat="server" ID="OperacaoDividirButton" Text="÷" CssClass="btn btn-primary btn-lg" OnClick="OperacaoDividirButton_Click" />
		</div>
	</div>
	<div class="row m-2">
		<div class="col-1">
			<asp:Button runat="server" ID="Numero4Button" Text="4" CssClass="btn btn-secondary btn-lg" OnClick="Numero4Button_Click" />
		</div>
		<div class="col-1">
			<asp:Button runat="server" ID="Numero5Button" Text="5" CssClass="btn btn-secondary btn-lg" OnClick="Numero5Button_Click" />
		</div>
		<div class="col-1">
			<asp:Button runat="server" ID="Numero6Button" Text="6" CssClass="btn btn-secondary btn-lg" OnClick="Numero6Button_Click" />
		</div>
		<div class="col-1">
			<asp:Button runat="server" ID="OperacaoMultiplicarButton" Text="x" CssClass="btn btn-primary btn-lg" OnClick="OperacaoMultiplicarButton_Click" />
		</div>
	</div>
	<div class="row m-2">
		<div class="col-1">
			<asp:Button runat="server" ID="Numero1NButton" Text="1" CssClass="btn btn-secondary btn-lg" OnClick="Numero1Button_Click" />
		</div>
		<div class="col-1">
			<asp:Button runat="server" ID="Numero2Button" Text="2" CssClass="btn btn-secondary btn-lg" OnClick="Numero2Button_Click" />
		</div>
		<div class="col-1">
			<asp:Button runat="server" ID="Numero3Button" Text="3" CssClass="btn btn-secondary btn-lg" OnClick="Numero3Button_Click" />
		</div>
		<div class="col-1">
			<asp:Button runat="server" ID="OperacaoSubtrairButton" Text="-" CssClass="btn btn-primary btn-lg" OnClick="OperacaoSubtrairButton_Click" />
		</div>
	</div>
	<div class="row m-2">
		<div class="col-1">
		</div>
		<div class="col-1">
			<asp:Button runat="server" ID="Numero0Button" Text="0" CssClass="btn btn-secondary btn-lg" OnClick="Numero0Button_Click" />
		</div>
		<div class="col-1">
		</div>
		<div class="col-1">
			<asp:Button runat="server" ID="OperacaoSomarButton" Text="+" CssClass="btn btn-primary btn-lg" OnClick="OperacaoSomarButton_Click" />
		</div>
	</div>
</asp:Content>

