<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalculadoraFibo.ascx.cs" Inherits="CalculadoraWeb.CalculadoraFibo" %>


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