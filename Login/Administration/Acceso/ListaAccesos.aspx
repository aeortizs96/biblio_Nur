<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/MasterPages/SecurityMasterPage.master" AutoEventWireup="true" CodeFile="ListaAccesos.aspx.cs" Inherits="Administration_Acceso_ListaAccesos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <h1>Asignar permisos</h1>
        <div class="breadcrumb greenContainer">
            
                    </div>
        <h2>Lista</h2>
        <div>
            <asp:GridView runat="server" ID="ListaUsuarios_GV" CssClass="table table-striped whiteContainer" AutoGenerateColumns="false" OnRowCommand="ListaUsuarios_GV_RowCommand" OnRowDataBound="ListaUsuarios_GV_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Ver">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Ver" CommandArgument='<%# Eval("UsuarioId") %>'>
                                            <strong>+</strong>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NombreUsuario" HeaderText="Nombre Usuario" />
                    <asp:BoundField DataField="UsuarioId" HeaderText="Accesos" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>

