<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="CalculadoraWeb.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Your application description page.</h3>
        <p>Use this area to provide additional information.</p>

        <P>
            Seja <b>bem vindo</b>
            <ul>
                <% 

                    for(int i = 0; i <10; i++) 
                    {
                        %>
                        <li>
                        <%=(i + 1)%>
                        </li>
                        <%
                    }

                %>
            </ul>
        </P>
    </main>
</asp:Content>
