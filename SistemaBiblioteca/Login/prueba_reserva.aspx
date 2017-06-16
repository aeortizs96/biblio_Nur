<%@ Page Language="C#" AutoEventWireup="true" CodeFile="prueba_reserva.aspx.cs" Inherits="prueba_reserva" %>

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
    <link href="css/estilos.css" rel="stylesheet" />
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

    <script language:"javascript">
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
                    <li class="active">
                        <a href="#">
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
                        <a class="navbar-brand" href="#">Reserva de libros</a>
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
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>

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
                                    <div class="col-md-5">
                                        <asp:TextBox ID="txt_busqueda" CssClass="form-control border-input" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-3">
                                        <asp:Button ID="Button1" runat="server" Text="Buscar" CssClass="btn btn-info btn-fill btn-wd boton_buscar" OnClick="btn_busqueda_Click" />
                                    </div>
                                </div>

                                <div class="row" id="GridView">
                                    <div class="content table-responsive table-full-width">
                                        <asp:GridView ID="grvListadoLibros" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="mfn" HorizontalAlign="Center" Width="90%" OnSelectedIndexChanged="grvListadoLibros_SelectedIndexChanged">
                                            <Columns>
                                                <asp:BoundField DataField="mfn" HeaderText="MFN" />
                                                <asp:BoundField DataField="titulo" HeaderText="Título" />
                                                <asp:BoundField DataField="autor_nombre" HeaderText="Autor" />
                                                <asp:BoundField DataField="editorial" HeaderText="Editorial" />
                                                <asp:BoundField DataField="estados" HeaderText="Estado" />
                                                <%--     <asp:CommandField ShowSelectButton="True" SelectText="Reservar" />--%>
                                                <asp:TemplateField HeaderText="Reservar">
                                                    <ItemTemplate>
                                                        <a href='<%# "javascript:reservaModal(\""+ Eval("mfn") +"\")" %>'>Reservar</a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>



                                <%--      <script type="text/javascript">
                                    function reservaModal(codigoLibro) {
                                        debugger;
                                        $('.pnlAltasReservas').show();
                                        $('.pnlAltasReservas input[type="text"]').val('' + codigoLibro);
                                    }
                                </script>--%>

                                <script type="text/javascript">
                                    function reservaModal(codigoLibro) {
                                        debugger;
                                        $('.pnlAltasReservas').show();
                                        $('.pnlAltasReservas input[type="text"][ID="txt_libroMfn"]').val('' + codigoLibro);
                                    }
                                </script>

                            </div>

                            <br />
                            <br />



                            <asp:Panel runat="server" CssClass="pnlAltasReservas" dir="ltr" Style="background-color: rgb(255, 255, 255); background-image:url('images/libro-fondo.jpg'); width: 700px; position: fixed; height:300px ;top: 102px; display: none;">
                                <div class="row">
                                    <div class="col-md-3 col-md-offset-3">
                                        <label class="lbTitulos">Fecha: </label>
                                        <asp:RequiredFieldValidator ID="ValidatorFecha" runat="server"
                                            ControlToValidate="txt_fecha" ErrorMessage="*" Font-Italic="True"
                                            ForeColor="#D73F4A" ValidationGroup="validador"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_fecha" runat="server" CssClass="form-control border-input txt_datos"></asp:TextBox>
                                        <cc3:CalendarExtender ID="CalendarExtender1" PopupButtonID="imgPopup" runat="server" TargetControlID="txt_fecha" Format="dd/MM/yyyy"></cc3:CalendarExtender>
                                    </div>
                                    <div class="col-md-3 col-md-offset-0">
                                        <label class="lbTitulos">MFN: </label>
                                        <asp:RequiredFieldValidator ID="ValidatorlibroMfn" runat="server"
                                            ControlToValidate="txt_libroMfn" ErrorMessage="*" Font-Italic="True"
                                            ForeColor="#D73F4A" ValidationGroup="validador"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_libroMfn" CssClass="form-control border-input txt_datos" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    
                                </div>

                                <%-- Enter your Private and Public key Obtained Earlier from the google recaptcha.....--%>
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3">
                                       
                                        <recaptcha:RecaptchaControl ID="recaptcha" runat="server"
                                            PrivateKey="6LdPACQUAAAAAHnsNdI5Q2L-TtAvPan-CqulC5Rb"
                                            PublicKey="6LdPACQUAAAAAEUwXXelU89vVUy_4UydgGXhN8v4"
                                            Theme="red" />
                                        <br />
                                        <asp:Label ID="LabelCaptcha" runat="server"
                                            Style="font-weight: 700; color: #DB515B; background-color: #FFFFFF"></asp:Label>
                                        <br />


                                    </div>
                                </div>

                                <div class="col-md-offset-3">
                                    <asp:Button ID="btn_GuardarReserva" runat="server" Text="Reservar" ValidationGroup="validador" CssClass="btn btn-info btn-fill btn-wd boton-registro" OnClick="btn_GuardarReserva_Click" />
                                    <asp:Button ID="btnClose" runat="server" Text="Cancelar"   CssClass="btn btn-info btn-fill btn-wd boton-registro" />
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
