<%@ Page Language="C#" AutoEventWireup="true" CodeFile="P_ListaUsuarios.aspx.cs" Inherits="P_ListaUsuarios" %>

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
                    <li>
                        <a href="Registrar_Libro.aspx">
                            <i class="ti-plus"></i>
                            <p>Registro de libros</p>
                        </a>
                    </li>
                    <li class="active">
                        <a href="#">
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
                        <a class="navbar-brand" href="#">Lista de Usuarios</a>
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
                        <div class="col-md-12">

                            <div>
                                <div class="row" id="row_view">
                                    <div class="col-md-2 col-md-offset-1">
                                        <asp:DropDownList ID="DropDownList2" CssClass="form-control border-input" runat="server" AppendDataBoundItems="true">
                                            <asp:ListItem Value="correo">Correo</asp:ListItem>
                                            <asp:ListItem Value="nombreCompleto" Selected="True">Nombre</asp:ListItem>
                                            <asp:ListItem Value="tipo">Tipo</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-5">
                                        <asp:TextBox ID="txt_busqueda" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2 col-md-offset-0">
                                        <asp:Button ID="Button1" runat="server" Text="Buscar" CssClass="btn btn-info btn-fill btn-wd" OnClick="btn_busqueda_Click" />
                                    </div>
                                </div>
                                <!-- <div class="row">
                                    <div class="col-md-2 col-md-offset-4">
                                        <asp:Button ID="btn_busqueda" runat="server" Text="Buscar" CssClass="btn btn-info btn-fill btn-wd boton-registro" OnClick="btn_busqueda_Click" />
                                    </div> 
                                </div> -->
                                <br />
                                <br />
                                <div class="row" >
                                    <div class="content table-responsive table-full-width">
                                        <asp:GridView ID="grvListadoUsuario" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="usuarioId" HorizontalAlign="Center" Width="90%" OnSelectedIndexChanged="grvListadoUsuario_SelectedIndexChanged">
                                            <Columns>
                                                <asp:BoundField DataField="usuarioId" HeaderText="Codigo" />
                                                <asp:BoundField DataField="nombreCompleto" HeaderText="Nombre Completo" />
                                                <asp:BoundField DataField="correo" HeaderText="Correo" />
                                                <asp:BoundField DataField="contrasena" HeaderText="Contraseña" />
                                                <asp:BoundField DataField="nombreUsuario" HeaderText="Usuario" />
                                                <asp:BoundField DataField="sexo" HeaderText="Sexo" />
                                                <asp:BoundField DataField="tipo" HeaderText="Tipo" />
                                                <asp:CommandField ShowSelectButton="True" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>

                                <asp:Button Text="Editar" ID="btn_editar" CssClass="btn btn-info btn-fill btn-wd boton-registro" runat="server" OnClick="btn_editar_Click" />

                            </div>

                            <asp:Panel ID="pnlAltas" runat="server" BackColor="#F4F3EF" Visible="False">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3">
                                        <label>Codigo: </label>
                                        <asp:TextBox ID="txt_usuariId" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3">
                                        <label>Nombre completo: </label>
                                        <asp:TextBox ID="txt_nombreCompleto" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3">
                                        <label>Nombre de usuario: </label>
                                        <asp:TextBox ID="txt_nombreUsuario" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3">
                                        <label>Contraseña: </label>
                                        <asp:TextBox ID="txt_contrasena" CssClass="form-control border-input" Enabled="false" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3">
                                        <label>Correo: </label>
                                        <asp:TextBox ID="txt_correo" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3">
                                        <label>Sexo: </label>
                                        <asp:TextBox ID="txt_sexo" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3">
                                        <label>Tipo: </label>
                                        <asp:TextBox ID="txt_tipo" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-offset-3">
                                    <asp:Button ID="btn_Modificar" CssClass="btn btn-info btn-fill btn-wd boton-registro" runat="server" Text="Modificar" OnClick="btn_Modificar_Click" />
                                    <asp:Button ID="btn_Borrar" CssClass="btn btn-info btn-fill btn-wd boton-registro" runat="server" Text="Borrar" OnClick="btn_Borrar_Click" />
                                    <asp:Button ID="btnCancelar" CssClass="btn btn-info btn-fill btn-wd boton-registro" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
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
    
</body>
</html>
