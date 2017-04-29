<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/MasterPages/SecurityMasterPage.master" AutoEventWireup="true" CodeFile="Acceso.aspx.cs" Inherits="Administration_Acceso_Acceso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <h1>Acceso</h1>
        <div class="breadcrumb greenContainer">
            <a href="ListaAccesos.aspx" class="whiteText">Lista</a>
            / Roles
        </div>
        <h2>
            <asp:Literal runat="server" ID="tituloLiteral" /></h2>
        <div>
            <asp:Panel runat="server" ID="RegistroEditarPanel">


                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <label>Id:</label>
                        <asp:TextBox ID="Id_Txt" Enabled="false" CssClass="form-control border-input" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <label>Usuario:</label>
                        <asp:TextBox ID="Usuario_Txt" Enabled="false" CssClass="form-control border-input" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <label>Contraseña:</label>
                        <asp:TextBox ID="Contrasena_Txt" Enabled="false" CssClass="form-control border-input" runat="server"></asp:TextBox>
                    </div>
                </div>



            </asp:Panel>
            <div>
                <div>Permisos:</div>
                <asp:GridView runat="server" ID="ListaModulos_GV" CssClass="table table-striped whiteContainer" AutoGenerateColumns="false" OnRowDataBound="ListaModulos_GV_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="Asignar">
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="ModuloIdHF" Value='<%# Eval("ModuloId") %>' />
                                <asp:CheckBox runat="server" ID="Modulo_CheckBox" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="AreaId" HeaderText="Rol" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Permiso" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
            <asp:Button Text="Guardar" runat="server" ID="GuardarBtn" OnClick="GuardarBtn_Click" CssClass="btn btn-info btn-fill btn-wd boton-registro" />
            <asp:Button Text="Cancelar" runat="server" CssClass="btn btn-info btn-fill btn-wd boton-registro" OnClick="Unnamed1_Click" />

        </asp:Panel>


        <br />
        <br />

    </div>

</asp:Content>

