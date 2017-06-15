<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registrar_Libro.aspx.cs" Inherits="Registrar_Libro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <a href="P_PaginaInicio.aspx" class="smoothScroll">Inicio</a>
        <asp:Panel ID="PanelLibro" runat="server">
            <asp:Button ID="btn_NuevoLibro" runat="server" Text="Nuevo" OnClick="btn_NuevoLibro_Click" />
            <asp:Button ID="btn_limpieza" runat="server" Text="Limpiar" OnClick="btn_limpieza_Click" />
            <br />
            <br />

            <br />
            <asp:GridView ID="grvLibro" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="mfn" HorizontalAlign="Center" Width="90%" OnSelectedIndexChanged="grvLibro_SelectedIndexChanged">

                <Columns>

                    <asp:BoundField DataField="mfn" HeaderText="MFN" ReadOnly="True" SortExpression="MFN" />
                    <asp:BoundField DataField="autor_nombre" HeaderText="Autor" SortExpression="nombres" />
                    <asp:BoundField DataField="titulo" HeaderText="Titulo" SortExpression="Titulo" />
                    <asp:BoundField DataField="editorial" HeaderText="Editorial" SortExpression="Editorial" />
                    <asp:BoundField DataField="estados" HeaderText="Estado Libro" SortExpression="Estado Libro" />

                    <asp:CommandField ShowSelectButton="True" />

                </Columns>
            </asp:GridView>
            <br />

            <br />

            <asp:Panel ID="pnlAltasLibro" runat="server" BackColor="#99FFCC">
                <asp:Label ID="Label3" runat="server" Text="MFN Libro:"></asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="txt_mfnLibro" runat="server" Enabled="False"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" Text="Titulo Libro:"></asp:Label>
                &nbsp;
                <asp:TextBox ID="txttitulo" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label11" runat="server" Text="Autor:"></asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="txt_autor" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="Editorial:"></asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="txt_editorial" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Estado del Libro:"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="cb_Estados" runat="server" Height="17px" Width="93px">
                    <asp:ListItem Value="1" Text="Activo"></asp:ListItem>
                    <asp:ListItem Value="0" Text="Inactivo"></asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />


                <asp:Button ID="btnGrabarLibro" runat="server" Text="Grabar" OnClick="btnGrabarLibro_Click" />
                <asp:Button ID="btn_ModificarLibro" runat="server" Text="Modificar" OnClick="btn_ModificarLibro_Click" Height="26px" />
                <asp:Button ID="btn_BorrarLibro" runat="server" Text="Borrar" OnClick="btn_BorrarLibro_Click" />
                <asp:Button ID="btnCancelarLibro" runat="server" Text="Cancelar" />
            </asp:Panel>

        </asp:Panel>


        <br />
        <br />

        <br />
        <br />

    </form>
</body>
</html>
