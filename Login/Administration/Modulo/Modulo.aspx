<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/MasterPages/SecurityMasterPage.master" AutoEventWireup="true" CodeFile="Modulo.aspx.cs" Inherits="Administration_Modulo_Modulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <h1>Permisos</h1>
        <div class="breadcrumb greenContainer">
            <a href="../Default.aspx" class="whiteText">Inicio</a>
            / <a href="ListaModulos.aspx" class="whiteText">Lista</a>
            / Permisos
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
                    <label>Rol:</label>
                    <asp:DropDownList runat="server" ID="Area_Cbx" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <label>Descripcion:</label>
                    <asp:TextBox runat="server" ID="Descripcion_Txt" CssClass="form-control" />
                </div>
            </div>

        </div>
        <div>
            <br />
            <br />
            <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
                <asp:Button Text="Guardar" runat="server" ID="GuardarBtn" OnClick="GuardarBtn_Click" CssClass="btn btn-info btn-fill btn-wd boton-registro" />
                <asp:Button Text="Cancelar"  runat="server" CssClass="btn btn-info btn-fill btn-wd boton-registro" OnClick="Unnamed1_Click" />


            </asp:Panel>


        </div>
    </div>

</asp:Content>

