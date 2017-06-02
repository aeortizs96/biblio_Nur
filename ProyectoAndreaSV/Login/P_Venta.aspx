<%@ Page Language="C#" AutoEventWireup="true" CodeFile="P_Venta.aspx.cs" Inherits="P_Venta" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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

        <asp:Panel ID="PanelVenta" runat="server">
            <asp:Button ID="btn_NuevoVenta" runat="server" Text="Nuevo" OnClick="btn_NuevoVenta_Click" />
            <asp:Button ID="btn_limpieza" runat="server" Text="Limpiar" OnClick="btn_limpieza_Click" />
            <br />
            <br />

            <asp:Panel ID="pnlListadoVenta" runat="server" Direction="LeftToRight" Width="1077px" BackColor="#FFFFCC">
                <br />
                <asp:DropDownList ID="DropDownListVenta" runat="server" AppendDataBoundItems="true">
                    <asp:ListItem Value="ventaId">Codigo Venta</asp:ListItem>
                    <asp:ListItem Value="tipoDocumento">Tipo de documento</asp:ListItem>
                    <asp:ListItem Value="numeroDocumento">Numero de documento</asp:ListItem>
                    <asp:ListItem Value="nombres">Nombre Cliente</asp:ListItem>
                    <asp:ListItem Value="apellidos">Apellido Cliente</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txt_busquedaVenta" runat="server" Width="50%"></asp:TextBox>
                <asp:Button ID="btn_busquedaVenta" runat="server" Text="Buscar" OnClick="btn_busquedaVenta_Click" />
                <br />
                <asp:GridView ID="grvVenta" runat="server" AutoGenerateColumns="False" DataKeyNames="ventaId" Width="851px" OnSelectedIndexChanged="grvVenta_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="ventaId" HeaderText="ventaId" InsertVisible="False" ReadOnly="True" SortExpression="ventaId" />
                        <asp:BoundField DataField="clienteId" HeaderText="clienteId" SortExpression="clienteId" />
                        <asp:BoundField DataField="fechaVenta" HeaderText="fechaVenta" SortExpression="fechaVenta" />
                        <asp:BoundField DataField="numeroDocumento" HeaderText="numeroDocumento" SortExpression="numeroDocumento" />
                        <asp:BoundField DataField="tipoDocumento" HeaderText="tipoDocumento" SortExpression="tipoDocumento" />
                        <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" />
                        <asp:BoundField DataField="apellidos" HeaderText="apellidos" SortExpression="apellidos" />
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>




                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:default %>" SelectCommand="SELECT tbl_Ventas.ventaId, tbl_Ventas.clienteId, tbl_Ventas.fechaVenta, tbl_Ventas.numeroDocumento, tbl_Ventas.tipoDocumento, tbl_Clientes.nombres, tbl_Clientes.apellidos FROM tbl_Clientes INNER JOIN tbl_Ventas ON tbl_Clientes.clienteId = tbl_Ventas.clienteId"></asp:SqlDataSource>




            </asp:Panel>

            <br />
            <br />

            <asp:Panel ID="pnlAltasVentas" runat="server" BackColor="#99FFCC">
                <asp:Label ID="Label3" runat="server" Text="Codigo Venta:"></asp:Label>
                <asp:TextBox ID="txt_ventaId" runat="server" Enabled="False"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" Text="Nr clienteId:"></asp:Label>
                <asp:TextBox ID="txt_clienteId" runat="server" Enabled="False"></asp:TextBox>&nbsp;&nbsp;
                <asp:TextBox ID="txt_nombreCliente" runat="server" Enabled="False"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button ID="btnShow" runat="server" Text="Ver" />
                <br />
                <br />
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
                <br />
                <asp:Label ID="Label5" runat="server" Text="Numero de documento:"></asp:Label>
                <asp:TextBox ID="txt_numeroDocumento" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Tipo Documento:"></asp:Label>
                <%--<asp:TextBox ID="txt_tipoDocumento" runat="server"></asp:TextBox>
                <br />
                <br />--%>

                <asp:DropDownList ID="DropDownListtipoDocumento" runat="server" AppendDataBoundItems="true">
                    <asp:ListItem Text="Factura"></asp:ListItem>
                    <asp:ListItem Text="Boleta"></asp:ListItem>
                </asp:DropDownList>




                <asp:Button ID="btnGrabarVenta" runat="server" Text="Grabar" OnClick="btnGrabarVenta_Click" />
                <asp:Button ID="btn_ModificarVenta" runat="server" Text="Modificar" Height="26px" OnClick="btn_ModificarVenta_Click" />
                <asp:Button ID="btn_BorrarVenta" runat="server" Text="Borrar" OnClick="btn_BorrarVenta_Click" />
                <asp:Button ID="btnCancelarVenta" runat="server" Text="Cancelar" OnClick="btnCancelarVenta_Click" />
            </asp:Panel>

        </asp:Panel>



        <br />
        <br />

        <br />
        <br />

        <!-- ModalPopupExtender -->
        <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="pnlListadoCliente" TargetControlID="btnShow"
            CancelControlID="btnClose" BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>
        <%--        <asp:Panel ID="PanelCategoria" runat="server">--%>

        <%--<asp:Button ID="btn_NuevaCategoria" runat="server" Text="Nuevo" Height="26px" OnClick="btn_NuevaCategoria_Click" />
                <br />
                <br />--%>

        <asp:Panel ID="pnlListadoCliente" runat="server" Direction="LeftToRight" Width="1077px" BackColor="#FFFFCC">
            <br />
            <asp:TextBox ID="txt_busqueda" runat="server" Width="50%"></asp:TextBox>
            <asp:Button ID="btn_busqueda" runat="server" Text="Buscar" OnClick="btn_busqueda_Click" />
            <br />
            <asp:GridView ID="grvListadoCliente" runat="server" AutoGenerateColumns="False" DataKeyNames="clienteId" HorizontalAlign="Center" Width="90%" OnSelectedIndexChanged="grvListadoCliente_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="clienteId" HeaderText="Codigo" />
                    <asp:BoundField DataField="nombres" HeaderText="Nombre" />
                    <asp:BoundField DataField="apellidos" HeaderText="Apellido" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            <br />

            <asp:Button ID="btnClose" runat="server" Text="Close" />
        </asp:Panel>

    </form>

</body>
</html>
