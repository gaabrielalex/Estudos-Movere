<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="CalculadoraWeb.About" %>

<%--<%@ Import Namespace="ConsoleAppCSharp" %>--%> 

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <%--<h2 id="title"><%: Title %>.</h2>
        <h3>Your application description page.</h3>
        <p>Use this area to provide additional information.</p>

        <P>
            Seja <b>bem vindo</b>
            <ul>
               

                 <% 

                     //var calculadora = new CalculadoraWeb.CalculadoraCopiaWeb();
                     //List<int> sequenciaFibo = calculadora.CalcularSequenciaFibonacciAteN(10);

                    

                     GerarNumerosFibonaci().ForEach((termo) =>
                     {
                        %>
                        <li>
                        <%=(termo)%>
                        </li>
                        <%
                     });

                 %>

            </ul>
        </P>--%>

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
        </asp:Panel>

    </main>
</asp:Content>
