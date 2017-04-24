<%@ Page Language="C#" AutoEventWireup="true" CodeFile="P_ListaUsuarios.aspx.cs" Inherits="P_ListaUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Panel ID="pnlListadoUsuarios" runat="server" Direction="LeftToRight" Width="1077px" BackColor="#FFFFCC">
                <br />
                <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="true">
                    <asp:ListItem Value="correo">Correo</asp:ListItem>
                    <asp:ListItem Value="nombreCompleto" Selected="True">Nombre</asp:ListItem>
                    <asp:ListItem Value="tipo">Tipo</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txt_busqueda" runat="server" Width="50%"></asp:TextBox>
                <asp:Button ID="btn_busqueda" runat="server" Text="Buscar" OnClick="btn_busqueda_Click"  />

                <br />
                <asp:GridView ID="grvListadoUsuario" runat="server" AutoGenerateColumns="False" DataKeyNames="usuarioId" HorizontalAlign="Center" Width="90%" OnSelectedIndexChanged="grvListadoUsuario_SelectedIndexChanged" >
                    <Columns>
                        <asp:BoundField DataField="usuarioId" HeaderText="Codigo" />
                        <asp:BoundField DataField="correo" HeaderText="Correo" />
                        <asp:BoundField DataField="contrasena" HeaderText="Contraseña" />
                        <asp:BoundField DataField="nombreCompleto" HeaderText="Nombre Completo" />
                        <asp:BoundField DataField="nombreUsuario" HeaderText="Usuario" />
                        <asp:BoundField DataField="sexo" HeaderText="Sexo" />
                        <asp:BoundField DataField="tipo" HeaderText="Tipo" />
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:Button Text="Editar" ID="btn_editar" runat="server" OnClick="btn_editar_Click" />

            </asp:Panel>

            <asp:Panel ID="pnlAltas" runat="server" BackColor="#CCFFFF" Visible="False">
                <asp:Label ID="Label1" runat="server" Text="Codigo:"></asp:Label>
                <asp:TextBox ID="txt_usuariId" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Nombres:"></asp:Label>
                <asp:TextBox ID="txt_nombreCompleto" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Usuario:"></asp:Label>
                <asp:TextBox ID="txt_nombreUsuario" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" Text="Contraseña:"></asp:Label>
                <asp:TextBox ID="txt_contrasena" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="Correo:"></asp:Label>
                <asp:TextBox ID="txt_correo" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Sexo:"></asp:Label>
                <asp:TextBox ID="txt_sexo" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label7" runat="server" Text="Tipo:"></asp:Label>
                <asp:TextBox ID="txt_tipo" runat="server"></asp:TextBox>
                <br />
                <br />
                <br />
                <asp:Button ID="btn_Modificar" runat="server" Text="Modificar" OnClick="btn_Modificar_Click" />
                <asp:Button ID="btn_Borrar" runat="server"  Text="Borrar" OnClick="btn_Borrar_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
            </asp:Panel>

        </div>
    </form>
</body>
</html>
