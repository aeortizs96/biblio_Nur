<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/MasterPages/SecurityMasterPage.master" AutoEventWireup="true" CodeFile="Usuario.aspx.cs" Inherits="Administration_Usuario_Usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <h1>Usuario</h1>
        <div class="breadcrumb greenContainer">
            <a href="ListaUsuarios.aspx" class="whiteText">Lista</a>
            / Usuario
        </div>
        <div>
            <h2>
                <asp:Literal runat="server" ID="tituloLiteral" /></h2>
            <asp:Panel runat="server" ID="RegistroEditarPanel">
                <div>Id:</div>
                <asp:TextBox runat="server" Enabled="false" ID="Id_Txt" CssClass="form-control" />
            </asp:Panel>

            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <label>Usuario:</label>
                    <asp:TextBox ID="NombreUsuario_Txt" CssClass="form-control border-input" runat="server" placeholder="Nombre Usuario"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="txt_nit" Display="Dynamic" ErrorMessage="Debe ingresar el nit del Usuario" ValidationGroup="RegistroUsuario"></asp:RequiredFieldValidator>--%>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <label>Contrasena:</label>
                    <asp:TextBox ID="Contrasena_Txt" CssClass="form-control border-input" runat="server" placeholder="Nombre Usuario"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="txt_nit" Display="Dynamic" ErrorMessage="Debe ingresar el nit del Usuario" ValidationGroup="RegistroUsuario"></asp:RequiredFieldValidator>--%>
                </div>
            </div>



            <div>
                <asp:Button Text="Guardar" runat="server" ID="GuardarBtn" OnClick="GuardarBtn_Click" CssClass="btn btn-info btn-fill btn-wd boton-registro" />

                <asp:Button Text="Cancelar" runat="server" CssClass="btn btn-info btn-fill btn-wd boton-registro" OnClick="Unnamed1_Click"/>
            </div>
        </div>
</asp:Content>

