<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Prestamo_Completo.aspx.cs" Inherits="Prestamo_Completo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" sizes="96x96" href="../assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>Lista de Usuarios</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet" />

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet" />


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />




    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet" />
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css' />
    <link href="assets/css/themify-icons.css" rel="stylesheet" />
    <link href="assets/css/estilos.css" rel="stylesheet" />
    <link href="assets/css/awesome-bootstrap-checkbox.css" rel="stylesheet" />

    <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

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

    <script type="text/javascript" language="javascript">
        document.onkeydown = function () {
            if (window.event && window.event.keyCode == 116) {
                window.event.keyCode = 505;
            }
            if (window.event && window.event.keyCode == 505) {
                return false;
            }
        }
    </script>
    <script>
        var ns6 = (document.getElementById && !document.all) ? true : false;
        bV = parseInt(navigator.appVersion);
        var mensaje = "Esta opción está deshabilitada.";
        function nrc(e) {
            if (ns6 && e.which > 1) {
                alert(mensaje);
                return false;
            } else if (document.all && !ns6 && (event.button > 1)) {
                alert(mensaje);
                return false;
            }
        }
        document.onmousedown = nrc;
        if (document.layers) window.captureEvents(Event.mousedown);
        if (ns6 && bV < 5) window.onmousedown = nrc;
    </script>
</head>
<body>

    <div class="wrapper">
        <div class="sidebar" data-background-color="black" data-active-color="danger">

            <!--
		        Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		        Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	        -->

            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="#" class="simple-text">Universidad Nur
                    </a>
                </div>

                <ul class="nav">
                    <li>
                        <a href="Registro.aspx">
                            <i class="ti-agenda"></i>
                            <p>Registros</p>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="ti-lock"></i>
                            <p>Permisos</p>
                        </a>
                    </li>
                    <li>
                        <a href="Registrar_Libro.aspx">
                            <i class="ti-plus"></i>
                            <p>Registro de libros</p>
                        </a>
                    </li>
                    <li class="#">
                        <a href="P_ListaUsuarios.aspx">
                            <i class="ti-view-list-alt"></i>
                            <p>Lista de usuarios</p>
                        </a>
                    </li>
                    <li class="#">
                        <a href="prueba_reserva.aspx">
                            <i class="ti-archive"></i>
                            <p>Reservas</p>
                        </a>
                    </li>
                    <li class="active">
                        <a href="#">
                            <i class="ti-pencil-alt"></i>
                            <p>Prestamos</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar bar1"></span>
                            <span class="icon-bar bar2"></span>
                            <span class="icon-bar bar3"></span>
                        </button>
                        <a class="navbar-brand" href="#">Lista de Usuarios</a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right" runat="server">
                            <li>
                                <a href="#" id="aSalir" runat="server">
                                    <i class="ti-power-off"></i>
                                    <p>Salir</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>



            <div class="content">
                <div class="container-fluid">

                    <form id="form1" runat="server">
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>

                        <div class="col-md-12">

                            <div class="row">
                                <div class="col-md-2 col-md-offset-3">
                                    <label>Usuario Id: </label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="txt_usuarioId" ErrorMessage="*" Font-Italic="True"
                                        ForeColor="#D73F4A" ValidationGroup="validador"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txt_usuarioId" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-4 col-md-offset-0">
                                    <label>Nombre de Usuario: </label>
                                    <asp:TextBox ID="txt_nombreuser" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <label>MFN: </label>
                                    <asp:RequiredFieldValidator ID="ValidatorlibroMfn" runat="server"
                                        ControlToValidate="txt_libroMfn" ErrorMessage="*" Font-Italic="True"
                                        ForeColor="#D73F4A" ValidationGroup="validador"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txt_libroMfn" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <label>Titulo: </label>
                                    <asp:TextBox ID="txt_titulo" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <label>Editorial: </label>
                                    <asp:TextBox ID="txt_editorial" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3 col-md-offset-3">
                                    <label>Fecha Inicio: </label>
                                    <asp:RequiredFieldValidator ID="ValidatorFecha" runat="server"
                                        ControlToValidate="txt_fecha" ErrorMessage="*" Font-Italic="True"
                                        ForeColor="#D73F4A" ValidationGroup="validador"></asp:RequiredFieldValidator>

                                    <asp:TextBox ID="txt_fecha" runat="server" CssClass="form-control border-input"></asp:TextBox>
                                    <cc3:CalendarExtender ID="CalendarExtender1" PopupButtonID="imgPopup" runat="server" TargetControlID="txt_fecha" Format="dd/MM/yyyy"></cc3:CalendarExtender>
                                </div>

                                <div class="col-md-3 col-md-offset-0">
                                    <label>Fecha Devolucion: </label>
                                    <asp:TextBox ID="txt_fecha2" runat="server" CssClass="form-control border-input"></asp:TextBox>
                                    <cc3:CalendarExtender ID="CalendarExtender2" PopupButtonID="imgPopup2" runat="server" TargetControlID="txt_fecha2" Format="dd/MM/yyyy"></cc3:CalendarExtender>
                                </div>
                            </div>

                            <div class="row">
                            </div>

                            <div class="row">
                                <div class="col-md-3 col-md-offset-3">
                                    <asp:Button ID="btn_GuardarReserva" runat="server" Text="Prestar" ValidationGroup="validador" CssClass="btn btn-info btn-fill btn-wd boton-registro" OnClick="btn_GuardarReserva_Click" />
                                </div>
                                <div class="col-md-3 col-md-offset-0">
                                    <asp:Button ID="btnClose" runat="server" Text="Cancelar" CssClass="btn btn-info btn-fill btn-wd boton-registro" OnClick="btnClose_Click" />
                                </div>
                            </div>

                        </div>
                        <div>

                            <asp:GridView ID="grvVenta" runat="server" AutoGenerateColumns="False" Width="851px" DataSourceID="SqlDataSource2" Visible="true">
                                <Columns>
                                    <asp:BoundField DataField="prestamoId" HeaderText="prestamoId" InsertVisible="False" ReadOnly="True" SortExpression="prestamoId" />
                                    <asp:BoundField DataField="mfn" HeaderText="mfn" SortExpression="mfn" />
                                    <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                                    <asp:BoundField DataField="nombreCompleto" HeaderText="nombreCompleto" SortExpression="nombreCompleto" />
                                    <asp:BoundField DataField="fechaInicio" HeaderText="fechaInicio" SortExpression="fechaInicio" />
                                    <asp:BoundField DataField="fechaFin" HeaderText="fechaFin" SortExpression="fechaFin" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:default %>" SelectCommand="SELECT     dbo.tbl_Prestamos.prestamoId,dbo.tbl_Libros.mfn, dbo.tbl_Libros.titulo, dbo.tbl_Usuario.nombreCompleto, dbo.tbl_Prestamos.fechaInicio, 
                      dbo.tbl_Prestamos.fechaFin
FROM         dbo.tbl_Libros INNER JOIN
                      dbo.tbl_Prestamos ON dbo.tbl_Libros.mfn = dbo.tbl_Prestamos.libroMFN INNER JOIN
                      dbo.tbl_Usuario ON dbo.tbl_Prestamos.usuarioId = dbo.tbl_Usuario.usuarioId"></asp:SqlDataSource>


                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>




    <footer class="footer">
        <div class="container-fluid">
            <nav class="pull-left">
                <ul>
                    <li>
                        <a href="http://www.nur.edu/">Universidad Nur
                        </a>
                    </li>
                    <li>
                        <a href="#">Biblioteca
                        </a>
                    </li>
                    <li>
                        <a href="#">Software III
                        </a>
                    </li>
                </ul>
            </nav>
            <div class="copyright pull-right">
                &copy;
                   
               

                <script>document.write(new Date().getFullYear())</script>
                , made in Bolivia
           
           
            </div>
        </div>
    </footer>

</body>
</html>

