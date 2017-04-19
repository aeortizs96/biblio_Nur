<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="P_Loggin.aspx.cs" Inherits="Presentacion.Seguridad.P_Loggin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txt_NombreUsuario" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="txt_Contrasena" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lbl_mensaje" runat="server" Text="#"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btn_Aceptar" runat="server" Text="Aceptar" OnClick="btn_Aceptar_Click" />


        </div>
    </form>
</body>
</html>
