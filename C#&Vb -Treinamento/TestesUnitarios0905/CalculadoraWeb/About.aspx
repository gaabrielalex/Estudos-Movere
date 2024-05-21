<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="CalculadoraWeb.About" %>

<%--<%@ Import Namespace="ConsoleAppCSharp" %>--%> 

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Your application description page.</h3>
        <p>Use this area to provide additional information.</p>

        <P>
            Seja <b>bem vindo</b>
            <ul>
               

                 <% 

                     //var calculadora = new CalculadoraWeb.CalculadoraCopiaWeb();
                     //List<int> sequenciaFibo = calculadora.CalcularSequenciaFibonacciAteN(10);

                     var sequencia = new List<int>();
                     sequencia.Add(0);
                     sequencia.Add(1);
                     
                     for (int i = 2; i < 10; i++)
                     {
	                    var novoValor = sequencia[i - 1] + sequencia[i - 2];
	                    sequencia.Add(novoValor);
                     }

                     sequencia.ForEach((termo) =>
                     {
                        %>
                        <li>
                        <%=(termo)%>
                        </li>
                        <%
                     });

                 %>

            </ul>
        </P>
    </main>
</asp:Content>
