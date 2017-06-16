<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registrar_Libro.aspx.cs" Inherits="Registrar_Libro" %>

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
                    <li class="active">
                        <a href="#">
                            <i class="ti-plus"></i>
                            <p>Registro de libros</p>
                        </a>
                    </li>
                    <li>
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
                    <li class="#">
                        <a href="Prestamo_Completo.aspx">
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
                        <a class="navbar-brand" href="#">Registro de libros</a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right" runat="server">
                            <li>
                                <a href="#" id="aSalir" runat="server" onserverclick="btncerrar_Click">
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

                        <asp:Panel ID="PanelLibro" runat="server">
                            
                            <br />
                            <br />
                            <div class="row">
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
                            </div>
                            <asp:Button ID="btn_NuevoLibro" CssClass="btn btn-info btn-fill btn-wd boton-registro" runat="server" Text="Nuevo" OnClick="btn_NuevoLibro_Click" />
                            <!-- <asp:Button ID="btn_limpieza" runat="server" Text="Limpiar" OnClick="btn_limpieza_Click" /> -->
                            <br />

                            <br />
                            <div class="row">
                                <div class="content table-responsive table-full-width">
                                    <asp:Panel ID="pnlAltasLibro" Visible="false" runat="server">
                                        <div class="row">
                                            <div class="col-md-3 col-md-offset-4">
                                                <label>MFN Libro:</label>
                                                <asp:TextBox ID="txt_mfnLibro" runat="server" CssClass="form-control border-input" Enabled="False"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3 col-md-offset-4">
                                                <label>Titulo Libro:</label>
                                                <asp:TextBox ID="txttitulo" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3 col-md-offset-4">
                                                <label>Autor:</label>
                                                <asp:TextBox ID="txt_autor" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3 col-md-offset-4">
                                                <label>Editorial:</label>
                                                <asp:TextBox ID="txt_editorial" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3 col-md-offset-4">
                                                <label>Estado del Libro:</label>
                                                <asp:DropDownList ID="cb_Estados" CssClass="form-control border-input" runat="server">
                                                    <asp:ListItem Value="1" Text="Activo"></asp:ListItem>
                                                    <asp:ListItem Value="0" Text="Inactivo"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <br />

                                        <div class="col-xs-7 col-md-offset-2">
                                            <asp:Button ID="btnGrabarLibro" CssClass="btn btn-info btn-fill btn-wd boton-registro" runat="server" Text="Grabar" OnClick="btnGrabarLibro_Click" />
                                            <asp:Button ID="btn_ModificarLibro" CssClass="btn btn-info btn-fill btn-wd boton-registro" runat="server" Text="Modificar" OnClick="btn_ModificarLibro_Click" />
                                            <asp:Button ID="btn_BorrarLibro" CssClass="btn btn-info btn-fill btn-wd boton-registro" runat="server" Text="Borrar" OnClick="btn_BorrarLibro_Click" />
                                            <asp:Button ID="btnCancelarLibro" CssClass="btn btn-info btn-fill btn-wd boton-registro" runat="server" Text="Cancelar" />
                                        </div>

                                    </asp:Panel>
                                </div>
                            </div>
                        </asp:Panel>

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
