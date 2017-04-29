<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/MasterPages/SecurityMasterPage.master" AutoEventWireup="true" CodeFile="ListaModulos.aspx.cs" Inherits="Administration_Modulo_ListaModulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <h1>Permisos</h1>
        <div class="breadcrumb greenContainer">
            <a href="../Default.aspx" class="whiteText">Inicio</a>
            / Lista
        </div>
        <div>
            
            <asp:Button runat="server" Text="Nuevo" CssClass="btn btn-info btn-fill btn-wd boton-registro" OnClick="Unnamed1_Click"  />
            <h2>Lista</h2>
            <asp:gridview runat="server" id="ListaModulos_GV" cssclass="table table-striped whiteContainer" autogeneratecolumns="false" onrowcommand="ListaModulos_GV_RowCommand" onrowdatabound="ListaModulos_GV_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="Eliminar">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("ModuloId") %>' OnClientClick="return confirm('Desea eliminar registro?');">
                                        <span class="glyphicon glyphicon-remove"></span>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Editar">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" CommandName="Editar" CommandArgument='<%# Eval("ModuloId") %>'>
                                        <span class="glyphicon glyphicon-pencil"></span>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="AreaId" HeaderText="Rol" />
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                            </Columns>
                        </asp:gridview>
        </div>
    </div>

</asp:Content>

