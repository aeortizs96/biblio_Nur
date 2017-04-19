<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="P_Loggin.aspx.cs" Inherits="Presentacion.Seguridad.P_Loggin" %>

<!DOCTYPE html>
<html>
<head runat="server">
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/estilos.css" rel="stylesheet" />
    
</head>
<body>
    <nav class="navbar navbar-default col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Universidad NUR</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                <li><a href="#">Login</a></li>
                <li><a href="P_Registro.aspx">Registrarse</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <form id="form1" class="form-horizontal" runat="server">
        <div>
            <div class="form-group">
                <div class="col-xs-12 col-sm-6 col-md-2 col-lg-4 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2">
                    <img class="img-login-nur" src="images/ISOLOGOTIPO-NUR-CMYK-ISO-9001-Convertido.jpg"/>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbNombreUsuario" CssClass="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" runat="server" Text="Nombre de usuario:"></asp:Label>
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                    <asp:TextBox ID="txt_NombreUsuario" CssClass="form-control" runat="server" placeholder="Nombre de usuario"></asp:TextBox>
                </div>
            </div>

        <div class="form-group">
            <asp:Label ID="lbContrasena" CssClass="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" runat="server" Text="Contraseña:"></asp:Label>
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
    	        <asp:TextBox ID="txt_Contrasena" CssClass="form-control" runat="server" TextMode="Password" placeholder="Contraseña"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
    	    <asp:Label ID="lbl_mensaje" CssClass="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" runat="server" Text="#"></asp:Label>
        </div>
            
        <div class="form-group">
            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xs-offset-4 col-sm-offset-4 col-md-offset-4 col-lg-offset-4">
    	        <asp:Button ID="btn_Aceptar" CssClass="btn btn-primary" runat="server" Text="Aceptar" OnClick="btn_Aceptar_Click" />
            </div>
        </div>


        </div>
    </form>
</body>
</html>

