<%@ Page Language="C#" AutoEventWireup="true" CodeFile="P_Autentificacion.aspx.cs" Inherits="P_Autentificacion" %>

<!DOCTYPE html>

<html lang="en" class="no-js">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Autentificacion</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSS -->
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
    <link rel="stylesheet" href="assets/css/reset.css">
    <link rel="stylesheet" href="assets/css/supersized.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="assets/css/boton.css" rel="stylesheet" />
    <link href="css/checkboxcss.css" rel="stylesheet" />

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css'>

    <style>
        /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
        .cbx {
            position: relative;
            top: 1px;
            width: 17px;
            height: 17px;
            border: 1px solid #c8ccd4;
            border-radius: 3px;
            vertical-align: middle;
            transition: background 0.1s ease;
            cursor: pointer;
        }

            .cbx:after {
                content: '';
                position: absolute;
                top: 1px;
                left: 5px;
                width: 5px;
                height: 11px;
                opacity: 0;
                transform: rotate(45deg) scale(0);
                border-right: 2px solid #fff;
                border-bottom: 2px solid #fff;
                transition: all 0.3s ease;
                transition-delay: 0.15s;
            }

        .lbl {
            margin-left: 5px;
            vertical-align: middle;
            cursor: pointer;
        }

        #cbx:checked ~ .cbx {
            border-color: transparent;
            background: #6871f1;
            animation: jelly 0.6s ease;
        }

            #cbx:checked ~ .cbx:after {
                opacity: 1;
                transform: rotate(45deg) scale(1);
            }

        .cntr {
            position: absolute;
            top: 50%;
            left: 0;
            width: 100%;
            text-align: center;
        }

        @-moz-keyframes jelly {
            from {
                transform: scale(1, 1);
            }

            30% {
                transform: scale(1.25, 0.75);
            }

            40% {
                transform: scale(0.75, 1.25);
            }

            50% {
                transform: scale(1.15, 0.85);
            }

            65% {
                transform: scale(0.95, 1.05);
            }

            75% {
                transform: scale(1.05, 0.95);
            }

            to {
                transform: scale(1, 1);
            }
        }

        @-webkit-keyframes jelly {
            from {
                transform: scale(1, 1);
            }

            30% {
                transform: scale(1.25, 0.75);
            }

            40% {
                transform: scale(0.75, 1.25);
            }

            50% {
                transform: scale(1.15, 0.85);
            }

            65% {
                transform: scale(0.95, 1.05);
            }

            75% {
                transform: scale(1.05, 0.95);
            }

            to {
                transform: scale(1, 1);
            }
        }

        @-o-keyframes jelly {
            from {
                transform: scale(1, 1);
            }

            30% {
                transform: scale(1.25, 0.75);
            }

            40% {
                transform: scale(0.75, 1.25);
            }

            50% {
                transform: scale(1.15, 0.85);
            }

            65% {
                transform: scale(0.95, 1.05);
            }

            75% {
                transform: scale(1.05, 0.95);
            }

            to {
                transform: scale(1, 1);
            }
        }

        @keyframes jelly {
            from {
                transform: scale(1, 1);
            }

            30% {
                transform: scale(1.25, 0.75);
            }

            40% {
                transform: scale(0.75, 1.25);
            }

            50% {
                transform: scale(1.15, 0.85);
            }

            65% {
                transform: scale(0.95, 1.05);
            }

            75% {
                transform: scale(1.05, 0.95);
            }

            to {
                transform: scale(1, 1);
            }
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>
<body>
    <div class="page-container">
        <h1 style="color: white; font: bold;">Login</h1>
        <form id="form1" runat="server">
            <div class="container">

                <asp:Login ID="Login1" runat="server" BorderColor="Transparent"
                    BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em"
                    OnAuthenticate="Login1_Authenticate" BorderPadding="4" ForeColor="#CC0000"
                    Width="267px" FailureTextStyle-ForeColor="#CC0000" FailureTextStyle-BorderColor="#CC0000" FailureTextStyle-BackColor="#CC0000">
                    <LayoutTemplate>
                        <br />
                        <asp:TextBox ID="UserName" class="username" runat="server" placeholder="Nombre de usuario"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        <asp:TextBox ID="Password" class="password" runat="server" TextMode="Password" placeholder="Contraseña"></asp:TextBox>

                        <div>
                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                        </div>


                        <asp:Button ID="LoginButton" runat="server" Text="Inicio de sesion" CommandName="Login" ValidationGroup="LoginUserValidationGroup" OnClick="LoginButton_Click" CssClass="nada" />

                        <div class="error"><span>+</span></div>

                    </LayoutTemplate>
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
                        BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                    <TextBoxStyle Font-Size="0.8em" />
                    <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="#FFFFFF"
                        Font-Size="0.9em" />

                </asp:Login>


           
                <div class="cntr" style="margin-top:60px">
                    <asp:CheckBox class="hidden-xs-up" ID="cbx2" runat="server" Text="Make Magic" />
                    <input class="hidden-xs-up" id="cbx" type="checkbox" />
                    <label class="cbx" for="cbx"></label>
                    <label class="lbl" for="cbx">Recordar usuario por 30 dias</label>
                </div>

                <div class="connect">
                    <p style="color: white">O conectar por:</p>
                    <p>
                        <a class="facebook" href="https://www.facebook.com/Dental-Bolivia-232510743465197/?ref=br_rs"></a>
                        <a class="twitter" href=""></a>
                    </p>
                </div>
            </div>


        </form>


    </div>

    <!-- Javascript -->
    <script src="assets/js/jquery-1.8.2.min.js"></script>
    <script src="assets/js/supersized.3.2.7.min.js"></script>
    <script src="assets/js/supersized-init.js"></script>
    <script src="assets/js/scripts.js"></script>
    <script src="js/checkboxjs.js"></script>
</body>
</html>
