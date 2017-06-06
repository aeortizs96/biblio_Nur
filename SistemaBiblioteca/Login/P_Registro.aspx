<%@ Page Language="C#" AutoEventWireup="true" CodeFile="P_Registro.aspx.cs" Inherits="P_Registro" %>

<!DOCTYPE html>

<html>
    <head runat="server">
        <title>Seguridad</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../css/bootstrap.css" rel="stylesheet" />
        <link href="../css/bootstrap.min.css" rel="stylesheet" />
    </head>
    
    <body>
        <nav class="navbar navbar-default">
          <div class="container-fluid">
            <div class="navbar-header">
              <a class="navbar-brand" href="#">Universidad NUR</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                <li><a href="Login.aspx">Login</a></li>
                <li><a href="#">Registrarse</a></li>
              </ul>
            </div>
          </div>
        </nav>

        <form id="form1" class="form-horizontal img-background" runat="server">
            <fieldset>
                <legend class="form-group">Formulario de registro</legend>
                <div class="form-group">
                    <asp:Label ID="Label3" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1" runat="server" Text="Nombre Completo:"></asp:Label>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <asp:TextBox ID="txt_NombreCompleto" class="form-control" runat="server" placeholder="Nombre completo"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label1" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1" runat="server" Text="Correo:"></asp:Label>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <asp:TextBox ID="txt_Correo" class="form-control" runat="server" placeholder="Correo"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label4" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1" runat="server" Text="Nombre Usuario:"></asp:Label>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <asp:TextBox ID="txt_NombreUsuario" class="form-control" runat="server" placeholder="Nombre usuario"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1" runat="server" Text="Contraseña:"></asp:Label>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <asp:TextBox ID="txt_Contrasena" class="form-control" runat="server" TextMode="Password" placeholder="Contraseña"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label6" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1" runat="server" Text="Sexo:"></asp:Label>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <asp:DropDownList ID="ddl_Sexo" class="form-control" runat="server" AutoPostBack="True">
                            <asp:ListItem Text="Elija un genero" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Masculino" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Femenino" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>


                <div class="form-group">
                    <asp:Label ID="Label5" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1" runat="server" Text="Tipo:"></asp:Label>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <asp:DropDownList ID="ddl_Tipo" class="form-control" runat="server" AutoPostBack="True">
                            <asp:ListItem Text="Elija un tipo de usuario" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Usuario" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Administrativo" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Administrador de página" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xs-offset-3 col-sm-offset-3 col-md-offset-3 col-lg-offset-3">
                        <asp:Label ID="lbl_mensaje" runat="server" Text="#"></asp:Label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xs-offset-3 col-sm-offset-3 col-md-offset-3 col-lg-offset-3">
                        <asp:Button ID="btn_guardar" class="btn btn-primary" runat="server" Text="Guardar" OnClick="btn_guardar_Click" />
                    </div>
                </div>
            </fieldset>
        </form>
    </body>
</html>

