<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/MasterPages/SecurityMasterPage.master" AutoEventWireup="true" CodeFile="ListaAreas.aspx.cs" Inherits="Administration_Areas_ListaAreas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <h1>Roles</h1>
        <div class="breadcrumb greenContainer">
            <a href="../Default.aspx" class="whiteText">Inicio</a>
            / Lista
        </div>
        <div>
            <div>
                <%--<a href="Area.aspx" class=" btn btn-primary">Nuevo</a></div>--%>
            <asp:Button runat="server" Text="Nuevo" CssClass="btn btn-info btn-fill btn-wd boton-registro" OnClick="Unnamed1_Click"  />
            <h2>Lista</h2>
            <asp:GridView runat="server" ID="ListaAreas_GV" CssClass="table table-striped whiteContainer" AutoGenerateColumns="false" OnRowCommand="ListaAreas_GV_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("AreaId") %>' OnClientClick="return confirm('Desea eliminar registro?');">
                                        <span class="glyphicon glyphicon-remove"></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Editar" CommandArgument='<%# Eval("AreaId") %>'>
                                        <span class="glyphicon glyphicon-pencil"></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
