<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OlaMundo.aspx.cs" Inherits="APSM1_AloMundo.OlaMundo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Alo Mundo - Aula 1</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 210px">&nbsp;<asp:TextBox ID="txtMsg" runat="server"></asp:TextBox>
			<asp:Button ID="btExecutar" runat="server" OnClick="btExecutar_Click" Text="Executar" />
			<br />
			<asp:Label ID="lMsg" runat="server" Text="Escreva o que desejaq informar na caixa de texto"></asp:Label>
        </div>
    </form>
</body>
</html>
