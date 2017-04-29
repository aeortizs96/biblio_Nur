<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/MasterPages/SecurityMasterPage.master" AutoEventWireup="true" CodeFile="Area.aspx.cs" Inherits="Administration_Areas_Area" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <h1>Roles</h1>
        <div class="breadcrumb greenContainer">
            <a href="../Default.aspx" class="whiteText">Inicio</a>
            / <a href="ListaAreas.aspx" class="whiteText">Lista</a>
            / Registro
        </div>
        <div>
            <h2>
                <asp:Literal runat="server" ID="tituloLiteral" />
            </h2>

            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <label>Id:</label>
                    <asp:TextBox ID="Id_Txt" Enabled="false" CssClass="form-control border-input" runat="server" placeholder="Codigo"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="txt_nit" Display="Dynamic" ErrorMessage="Debe ingresar el nit del Usuario" ValidationGroup="RegistroUsuario"></asp:RequiredFieldValidator>--%>
                </div>
            </div>




            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <label>Descripcion:</label>
                    <asp:TextBox runat="server" ID="Descripcion_Txt" CssClass="form-control border-input" />
                </div>
            </div>
            <br />
            <br />
            <br />
            <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">

                <asp:Button Text="Guardar" runat="server" ID="GuardarBtn" OnClick="GuardarBtn_Click" CssClass="btn btn-info btn-fill btn-wd boton-registro" />
                <%--<a href="ListaAreas.aspx" class="btn btn-danger">Cancelar</a>--%>
                <asp:Button Text="Cancelar" runat="server" CssClass="btn btn-info btn-fill btn-wd boton-registro" OnClick="Unnamed1_Click" />

            </asp:Panel>


        </div>
</asp:Content>

