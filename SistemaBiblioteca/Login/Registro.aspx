<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registro.aspx.cs" Inherits="Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" sizes="96x96" href="../assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>Seguridad</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="../assets/css/animate.min.css" rel="stylesheet" />

    <!--  Paper Dashboard core CSS    -->
    <link href="../assets/css/paper-dashboard.css" rel="stylesheet" />


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="../assets/css/demo.css" rel="stylesheet" />


    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet" />
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css' />
    <link href="../assets/css/themify-icons.css" rel="stylesheet" />
    <link href="../assets/css/estilos.css" rel="stylesheet" />

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
                    <li class="active">
                        <a href="#">
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
                        <a class="navbar-brand" href="#">Seguridad</a>
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
                <div class="content">
                    <form runat="server">
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3">
                                <label>Nombre completo</label>
                                <asp:TextBox ID="txt_NombreCompleto" CssClass="form-control border-input" runat="server" placeholder="Nombre completo"></asp:TextBox>
                                <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="txt_NombreCompleto" Display="Dynamic" ErrorMessage="Debe ingresar el nombre completo del Usuario" ValidationGroup="RegistroUsuario"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3">
                                <label>Correo</label>
                                <asp:TextBox ID="txt_Correo" CssClass="form-control border-input" runat="server" placeholder="Correo"></asp:TextBox>
                                <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="txt_Correo" Display="Dynamic" ErrorMessage="Debe ingresar el correo" ValidationGroup="RegistroUsuario"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txt_Correo" Display="Dynamic" ErrorMessage="Debe ingresar un correo válido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="RegistroUsuario"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3">
                                <label>Nombre de usuario</label>
                                <asp:TextBox ID="txt_NombreUsuario" CssClass="form-control border-input" runat="server" placeholder="Nombre de usuario"></asp:TextBox>
                                <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="txt_NombreUsuario" Display="Dynamic" ErrorMessage="Debe ingresar el nombre de Usuario" ValidationGroup="RegistroUsuario"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3">
                                <label>Contraseña</label>
                                <asp:TextBox ID="txt_Contrasena" CssClass="form-control border-input" runat="server" placeholder="Contraseña" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="txt_Contrasena" Display="Dynamic" ErrorMessage="Debe ingresar la contraseña" ValidationGroup="RegistroUsuario"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 col-md-offset-3">
                                <label>Sexo</label>
                                <asp:DropDownList ID="dd_Sexo" CssClass="form-control border-input" runat="server">
                                    <asp:ListItem Text="Masculino" Value="Masculino"></asp:ListItem>
                                    <asp:ListItem Text="Femenino" Value="Femenino"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 col-md-offset-3">
                                <label>Tipo</label>
                                <asp:DropDownList ID="dd_Tipo" CssClass="form-control border-input" runat="server">
                                    <asp:ListItem Text="Usuario" Value="Usuario"></asp:ListItem>
                                    <asp:ListItem Text="Administrativo" Value="Administrativo"></asp:ListItem>
                                    <asp:ListItem Text="Administrador de página" Value="Administrador de página"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="text-center">
                            <asp:Button ID="btnGuardar" CssClass="btn btn-info btn-fill btn-wd boton-registro" runat="server" Text="Registrar" OnClick="btn_guardar_Click" ValidationGroup="RegistroUsuario"/>
                        </div>
                        <div class="clearfix"></div>
                    </form>
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

<!--   Core JS Files   -->
<script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="assets/js/bootstrap-checkbox-radio.js"></script>

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="assets/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>

<script>
    function myFunction() {
        document.getElementById("boton").style.color = "red";
    }
</script>

<script type="text/javascript">
    $(document).ready(function () {

        demo.initChartist();

        $.notify({
            icon: 'ti-pencil-alt',
            message: "Bienvenido al modulo de seguridad"

        }, {
            type: 'success',
            timer: 1000
        });

    });
</script>
</html>
