<%@ Page Language="C#" AutoEventWireup="true" CodeFile="P_Cliente.aspx.cs" Inherits="P_Cliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
              <a href="P_PaginaInicio.aspx" class="smoothScroll">Inicio</a>
            <br />
            <asp:Button ID="btn_NuevoCliente" runat="server" Text="Nuevo" OnClick="btn_NuevoCliente_Click" />


            <br />
            <br />


            <asp:Panel ID="pnlListadoClientes" runat="server" Direction="LeftToRight" Width="1077px" BackColor="#FFFFCC">
                <br />
                <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="true">
                    <asp:ListItem Value="nit">Nit</asp:ListItem>
                    <asp:ListItem Value="nombres" Selected="True">Nombre</asp:ListItem>
                    <asp:ListItem Value="apellidos">Apellido</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txt_busqueda" runat="server"  Width="50%"></asp:TextBox>
                <asp:Button ID="btn_busqueda" runat="server" Text="Buscar" OnClick="btn_busqueda_Click" />
               
                <br />
                <asp:GridView ID="grvListadoCliente" runat="server" AutoGenerateColumns="False" DataKeyNames="clienteId" HorizontalAlign="Center" Width="90%" OnSelectedIndexChanged="grvListadoCliente_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="nit" HeaderText="Nit" />
                        <asp:BoundField DataField="nombres" HeaderText="Nombres" />
                        <asp:BoundField DataField="apellidos" HeaderText="Apellidos" />
                        <asp:BoundField DataField="email" HeaderText="Email" />
                        <asp:BoundField DataField="telefono" HeaderText="Telefono" />
                        <asp:BoundField DataField="direccion" HeaderText="Direccion" />
                        <asp:BoundField DataField="sexo" HeaderText="Sexo" />
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
            </asp:Panel>

            <br />
            <br />
            <asp:Panel ID="pnlAltas" runat="server" BackColor="#99FFCC">
                <asp:Label ID="Label1" runat="server" Text="Nit:"></asp:Label>
                <asp:TextBox ID="txt_nit" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Nombres:"></asp:Label>
                <asp:TextBox ID="txt_nombre" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Apellidos:"></asp:Label>
                <asp:TextBox ID="txt_apellido" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" Text="Telefono:"></asp:Label>
                <asp:TextBox ID="txt_telefono" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="Direccion:"></asp:Label>
                <asp:TextBox ID="txt_direccion" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Correo:"></asp:Label>
                <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label7" runat="server" Text="Sexo:"></asp:Label>
                <asp:TextBox ID="txt_sexo" runat="server"></asp:TextBox>
                <br />
                <br />
                <br />
                <asp:Button ID="btnGrabarCliente" runat="server" Text="Grabar" OnClick="btnGrabarCliente_Click" />
                <asp:Button ID="btn_Modificar" runat="server" OnClick="btn_Modificar_Click" Text="Modificar" />
                <asp:Button ID="btn_Borrar" runat="server" OnClick="btn_Borrar_Click" Text="Borrar" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
            </asp:Panel>
            <br />

        </div>
    </form>
</body>
</html>
