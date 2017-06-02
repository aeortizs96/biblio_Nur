<%@ Page Language="C#" AutoEventWireup="true" CodeFile="P_Categoria.aspx.cs" Inherits="P_Categoria" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />



         <a href="P_PaginaInicio.aspx" class="smoothScroll">Inicio</a>



            <br />
            <br />
            <asp:Panel ID="PanelCategoria" runat="server">
                <asp:Button ID="btn_NuevaCategoria" runat="server" Text="Nuevo" Height="26px" OnClick="btn_NuevaCategoria_Click" />
                <br />
                <br />

                <asp:Panel ID="pnlListadoCategoria" runat="server" Direction="LeftToRight" Width="1077px" BackColor="#FFFFCC">
                    <br />
                    <asp:TextBox ID="txt_busqueda" runat="server" Width="50%"></asp:TextBox>
                    <asp:Button ID="btn_busqueda" runat="server" Text="Buscar" OnClick="btn_busqueda_Click" />
                    <br />
                    <asp:GridView ID="grvListadoCategoria" runat="server" AutoGenerateColumns="False" DataKeyNames="categoriaId" HorizontalAlign="Center" Width="90%" OnSelectedIndexChanged="grvListadoCategoria_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="categoriaId" HeaderText="Codigo" />
                            <asp:BoundField DataField="descripcion" HeaderText="Descripcion" />
                            <asp:CommandField ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </asp:Panel>

                <br />
                <br />

                <asp:Panel ID="pnlAltas" runat="server" BackColor="#99FFCC">
                    <asp:Label ID="Label1" runat="server" Text="Codigo:"></asp:Label>
                    <asp:TextBox ID="txt_CategoriaId" runat="server" Enabled="False"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Descripcion:"></asp:Label>
                    <asp:TextBox ID="txt_descripcion" runat="server" Enabled="False"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="btnGrabar" runat="server" Text="Grabar" OnClick="btnGrabar_Click" />
                    <asp:Button ID="btn_Modificar" runat="server" OnClick="btn_Modificar_Click" Text="Modificar" />
                    <asp:Button ID="btn_Borrar" runat="server" OnClick="btn_Borrar_Click" Text="Borrar" />
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                </asp:Panel>

            </asp:Panel>
            <br />

        </div>
    </form>
</body>
</html>
