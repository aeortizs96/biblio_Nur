<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" BackColor="White" ForeColor="Black" 
            style="font-size: xx-large" Text="Bienvenidos"></asp:Label>
    
        <br />
        <asp:Button ID="btncerrar" runat="server" onclick="btncerrar_Click" 
            Text="Cerrar Sesion" />

        <asp:Button ID="btn_registro" runat="server" Text="Registro" OnClick="btn_registro_Click" />
    
    </div>
    </form>
</body>
</html>
