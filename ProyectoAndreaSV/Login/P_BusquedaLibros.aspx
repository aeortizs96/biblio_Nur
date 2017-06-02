<%@ Page Language="C#" AutoEventWireup="true" CodeFile="P_BusquedaLibros.aspx.cs" Inherits="P_BusquedaLibros" %>

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
                            <i class="ti-view-list-alt"></i>
                            <p>Lista de usuarios</p>
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
                        <div class="col-md-12">

                            <div>
                                <div class="row">
                                    <div class="col-md-2 col-md-offset-1">

                                        <asp:DropDownList ID="DropDownList2" CssClass="form-control border-input" runat="server" AppendDataBoundItems="true">
                                            <asp:ListItem Value="mfn">MFN</asp:ListItem>
                                            <asp:ListItem Value="titulo" Selected="True">Titulo</asp:ListItem>
                                            <asp:ListItem Value="autor">Autor</asp:ListItem>
                                            <asp:ListItem Value="editorial">Editorial</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_busqueda" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2 col-md-offset-4 boton-registro">
                                        <asp:Button ID="btn_busqueda" runat="server" Text="Buscar" CssClass="btn btn-info btn-fill btn-wd" OnClick="btn_busqueda_Click" />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="content table-responsive table-full-width">
                                        <asp:GridView ID="grvListadoLibros" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="mfn" HorizontalAlign="Center" Width="90%" OnSelectedIndexChanged="grvListadoLibros_SelectedIndexChanged">
                                            <Columns>

                                                <asp:BoundField DataField="mfn" HeaderText="Mfn" />
                                                <asp:BoundField DataField="titulo" HeaderText="Titulo" />
                                                <asp:BoundField DataField="autor" HeaderText="Autor" />
                                                <asp:BoundField DataField="editorial" HeaderText="Editorial" />
                                                <asp:BoundField DataField="estados" HeaderText="estados" />
                                                <asp:CommandField ShowSelectButton="True" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>

                                <asp:Button Text="Editar" ID="btn_editar" CssClass="btn btn-info btn-fill btn-wd boton-registro" runat="server" />

                            </div>

                            <asp:Panel ID="pnlAltasReservas" runat="server" BackColor="#F4F3EF" Visible="False">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3">
                                        <label>Reserva: </label>
                                        <asp:TextBox ID="txt_reserva" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3">
                                        <label>Fecha: </label>
                                        <asp:TextBox ID="txt_fecha" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3">
                                        <label>Libro de mfn: </label>
                                        <asp:TextBox ID="txt_libroMfn" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-offset-3">
                                    <asp:Button ID="btn_Reservar" CssClass="btn btn-info btn-fill btn-wd boton-registro" runat="server" Text="Reservar" />
                                    <asp:Button ID="btnCancelar" CssClass="btn btn-info btn-fill btn-wd boton-registro" runat="server" Text="Cancelar" />
                                </div>
                            </asp:Panel>

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
    </div>
</body>
</html>

