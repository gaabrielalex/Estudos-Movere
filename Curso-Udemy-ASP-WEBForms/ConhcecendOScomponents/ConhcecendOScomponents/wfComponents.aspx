<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wfComponents.aspx.cs" Inherits="ConhcecendOScomponents.wfComponents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        	<table style="width:100%;">
				<tr>
					<td>Site</td>
					<td>Endereço</td>
					<td>Opções</td>
				</tr>
				<tr>
					<td>
						<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
					</td>
					<td>
						<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
					</td>
					<td>
						<asp:Button ID="Button1" runat="server" Text="Button" />
					</td>
				</tr>
				<tr>
					<td>
						<asp:DropDownList ID="DropDownList1" runat="server">
						</asp:DropDownList>
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
        </div>
    </form>
</body>
</html>
