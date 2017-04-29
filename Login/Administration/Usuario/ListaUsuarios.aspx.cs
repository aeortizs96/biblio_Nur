using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administration_Usuario_ListaUsuarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarLista();
        }
    }

    private void CargarLista()
    {
        ListaUsuarios_GV.DataSource = UsuarioBLL.GetUsuarios();
        ListaUsuarios_GV.DataBind();
    }

    protected void ListaUsuarios_GV_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editar")
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Usuario.aspx?id=" + id);
            }
            catch (Exception ex)
            { throw ex; }
        }
        if (e.CommandName == "Eliminar")
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);
                UsuarioBLL.DeleteUsuario(id);
                CargarLista();
            }
            catch (Exception ex)
            { throw ex; }
        }
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Usuario.aspx");
    }
}