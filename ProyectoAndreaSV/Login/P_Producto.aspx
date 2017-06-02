<%@ Page Language="C#" AutoEventWireup="true" CodeFile="P_Producto.aspx.cs" Inherits="P_Producto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Producto</title>
    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 300px;
            height: 140px;
        }

        #form1 {
            height: 193px;
        }
    </style>
</head>
<body style="height: 3000px">
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

          <a href="P_PaginaInicio.aspx" class="smoothScroll">Inicio</a>
        <asp:Panel ID="PanelProducto" runat="server">
            <asp:Button ID="btn_NuevoProducto" runat="server" Text="Nuevo" OnClick="btn_NuevoProducto_Click" />
            <asp:Button ID="btn_limpieza" runat="server" Text="Limpiar" OnClick="btn_limpieza_Click" />
            <br />
            <br />

            <asp:Panel ID="pnlListadoProducto" runat="server" Direction="LeftToRight" Width="1077px" BackColor="#FFFFCC">
                <br />
                <asp:DropDownList ID="DropDownListProducto" runat="server" AppendDataBoundItems="true">
                    <asp:ListItem Value="productoId" Text="Codigo Producto"></asp:ListItem>
                    <asp:ListItem Value="nombre" Selected="True" Text="Nombre Producto"></asp:ListItem>
                    <asp:ListItem Value="stock" Text="Stock"></asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txt_busquedaProducto" runat="server" Width="50%"></asp:TextBox>
                <asp:Button ID="btn_busquedaProducto" runat="server" Text="Buscar" OnClick="btn_busquedaProducto_Click" />
                <br />
                <asp:GridView ID="grvProducto" runat="server" AutoGenerateColumns="False" DataKeyNames="productoId" Width="851px" OnSelectedIndexChanged="grvProducto_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="productoId" HeaderText="productoId" InsertVisible="False" ReadOnly="True" SortExpression="productoId" />
                        <asp:BoundField DataField="categoriaId" HeaderText="categoriaId" SortExpression="categoriaId" />
                        <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="descripcionP" HeaderText="descripcionP" SortExpression="descripcionP" />
                        <asp:BoundField DataField="stock" HeaderText="stock" SortExpression="stock" />
                        <asp:BoundField DataField="precioCompra" HeaderText="precioCompra" SortExpression="precioCompra" />
                        <asp:BoundField DataField="precioVenta" HeaderText="precioVenta" SortExpression="precioVenta" />
                        <asp:BoundField DataField="fechaVencimiento" HeaderText="fechaVencimiento" SortExpression="fechaVencimiento" />
                        <asp:BoundField DataField="fechaCreado" HeaderText="fechaCreado" SortExpression="fechaCreado" />
                        <asp:BoundField DataField="imagen" HeaderText="imagen" SortExpression="imagen" />
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>




                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:default %>" SelectCommand="SELECT * FROM [tbl_Productos]"></asp:SqlDataSource>




            </asp:Panel>

            <br />
            <br />

            <asp:Panel ID="pnlAltasProducto" runat="server" BackColor="#99FFCC">
                <asp:Label ID="Label3" runat="server" Text="Codigo Producto:"></asp:Label>
                <asp:TextBox ID="txt_productoId" runat="server" Enabled="False"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" Text="Nr Categoria:"></asp:Label>
                <asp:TextBox ID="txt_codigoCategoria" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label11" runat="server" Text="Categoria:"></asp:Label>
                <asp:TextBox ID="txt_nombreCategoria" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="Nombre:"></asp:Label>
                <asp:TextBox ID="txt_nombre" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Descripcion:"></asp:Label>
                <asp:TextBox ID="txt_descripcionProducto" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label7" runat="server" Text="Stock:"></asp:Label>
                <asp:TextBox ID="txt_stock" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label8" runat="server" Text="Precio Compra:"></asp:Label>
                <asp:TextBox ID="txt_precioCompra" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label9" runat="server" Text="Precio Venta:"></asp:Label>
                <asp:TextBox ID="txt_precioVenta" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label10" runat="server" Text="Fecha Vencimiento:"></asp:Label>
                <asp:TextBox ID="txt_fechaVencimiento" runat="server"></asp:TextBox>
                <asp:Button ID="btn_fecha" runat="server" Text="Fecha" OnClick="btn_fecha_Click" />
                <br />
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False" Width="200px">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
                <br />
                <asp:Label ID="Label12" runat="server" Text="Imagen : "></asp:Label>
                <asp:TextBox ID="txt_imagen" runat="server"></asp:TextBox>

                <br />
                <br />


                <asp:Button ID="btnGrabarProducto" runat="server" Text="Grabar" OnClick="btnGrabarProducto_Click" />
                <asp:Button ID="btn_ModificarProducto" runat="server" Text="Modificar" OnClick="btn_ModificarProcuto_Click" Height="26px" />
                <asp:Button ID="btn_BorrarProducto" runat="server" Text="Borrar" OnClick="btn_BorrarProducto_Click" />
                <asp:Button ID="btnCancelarProducto" runat="server" Text="Cancelar" OnClick="btnCancelarProducto_Click" />
            </asp:Panel>

        </asp:Panel>


        <br />
        <br />

        <asp:Button ID="btnShow" runat="server" Text="Lista de Categorias" />
        <br />
        <br />

        <!-- ModalPopupExtender -->
        <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="pnlListadoCategoria" TargetControlID="btnShow"
            CancelControlID="btnClose" BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>
        <%--        <asp:Panel ID="PanelCategoria" runat="server">--%>

        <%--<asp:Button ID="btn_NuevaCategoria" runat="server" Text="Nuevo" Height="26px" OnClick="btn_NuevaCategoria_Click" />
                <br />
                <br />--%>

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
            <br />

            <asp:Button ID="btnClose" runat="server" Text="Close" />
        </asp:Panel>



        <%-- <asp:Panel ID="pnlAltas" runat="server" BackColor="#99FFCC">
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
                </asp:Panel>--%>

        <%--  </asp:Panel>--%>

        <!-- ModalPopupExtender -->


    </form>
</body>
</html>

