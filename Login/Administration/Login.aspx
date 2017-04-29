<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link href="ABMS/css/bootstrap.css" rel="stylesheet" />
    <link href="ABMS/css/bootstrap.min.css" rel="stylesheet" />
    <link href="ABMS/css/estilos.css" rel="stylesheet" />


</head>
<body>

    <nav class="navbar navbar-default col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Biblioteca Nur</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                </ul>
            </div>
        </div>
    </nav>

    <form id="form1" class="form-horizontal" runat="server">
        <div>
            <div class="form-group">
                <div class="col-xs-12 col-sm-6 col-md-2 col-lg-4 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2">
                    <img class="img-login-nur" src="ABMS/css/images/ISOLOGOTIPO-NUR-CMYK-ISO-9001-Convertido.jpg" />
                </div>
            </div>


            <asp:Login ID="Login1" runat="server" BackColor="White" BorderColor="White"
                BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em"
                OnAuthenticate="Login1_Authenticate" BorderPadding="4" ForeColor="#333333"
                Width="267px">
                <LayoutTemplate>

                    <div class="form-group">
                        <asp:Label ID="lbNombreUsuario" CssClass="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" runat="server" Text="Nombre de usuario:"></asp:Label>
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                            <asp:TextBox ID="UserName" CssClass="form-control" runat="server" placeholder="Nombre de usuario"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lbContrasena" CssClass="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" runat="server" Text="Contraseña:"></asp:Label>
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                            <asp:TextBox ID="Password" CssClass="form-control" runat="server" TextMode="Password" placeholder="Contraseña"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-md-offset-4">
                            <asp:CheckBox ID="ChkRecordar" CssClass="checkbox" runat="server" Text="Recordar la próxima vez" />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-md-offset-4">
                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xs-offset-4 col-sm-offset-4 col-md-offset-4 col-lg-offset-4">
                            <asp:Button ID="LoginButton" CssClass="btn btn-primary" runat="server" Text="Iniciar sesión" CommandName="Login" ValidationGroup="LoginUserValidationGroup" OnClick="LoginButton_Click" />

                        </div>
                    </div>

                </LayoutTemplate>
                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
                    BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                <TextBoxStyle Font-Size="0.8em" />
                <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="#FFFFFF"
                    Font-Size="0.9em" />

            </asp:Login>
        </div>
    </form>
</body>
</html>
