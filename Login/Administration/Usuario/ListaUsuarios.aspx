<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/MasterPages/SecurityMasterPage.master" AutoEventWireup="true" CodeFile="ListaUsuarios.aspx.cs" Inherits="Administration_Usuario_ListaUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <h1>Usuarios</h1>
      <%--  <div class="breadcrumb greenContainer">
         
           
        </div>--%>
        <div>
            
            <asp:button href="Usuario.aspx" text="Nuevo" runat="server"  CssClass="btn btn-info btn-fill btn-wd boton-registro" OnClick="Unnamed1_Click" />
            
             <h2>Lista</h2>
            <asp:gridview runat="server" id="ListaUsuarios_GV" cssclass="table table-striped whiteContainer" autogeneratecolumns="false" onrowcommand="ListaUsuarios_GV_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="Eliminar">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("UsuarioId") %>' OnClientClick="return confirm('Desea eliminar registro?');">
                                        <span class="glyphicon glyphicon-remove"></span>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Editar">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" CommandName="Editar" CommandArgument='<%# Eval("UsuarioId") %>'>
                                        <span class="glyphicon glyphicon-pencil"></span>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="NombreUsuario" HeaderText="NombreUsuario" />
                                <asp:BoundField DataField="Contrasena" HeaderText="Contrasena" />
                            </Columns>
                        </asp:gridview>
        </div>
    </div>

</asp:Content>

