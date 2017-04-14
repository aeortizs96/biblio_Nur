<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="P_Registro.aspx.cs" Inherits="Presentacion.Seguridad.P_Registro" %>

<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       
        <asp:Label ID="Label3" runat="server" Text="Nombre Completo :"></asp:Label>
    <asp:TextBox ID="txt_NombreCompleto" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Correo :"></asp:Label>
    <asp:TextBox ID="txt_Correo" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Nombre Usuario :"></asp:Label>
    <asp:TextBox ID="txt_NombreUsuario" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Contraseña :"></asp:Label>
    <asp:TextBox ID="txt_Contrasena" runat="server"></asp:TextBox>
        <br />
        <br />  
        <asp:Label ID="lbl_mensaje" runat="server" Text="#"></asp:Label>
    <br />
    <br />
    <asp:Button ID="btn_guardar" runat="server" Text="Guardar" OnClick="btn_guardar_Click" />
    
    </div>
    </form>
</body>
</html>
