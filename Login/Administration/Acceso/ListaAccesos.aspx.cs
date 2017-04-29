using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administration_Acceso_ListaAccesos : System.Web.UI.Page
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
        if (e.CommandName == "Ver")
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Acceso.aspx?id=" + id);
            }
            catch (Exception ex)
            { throw ex; }
        }
    }

    protected void ListaUsuarios_GV_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string celda = e.Row.Cells[2].Text;
        try
        {
            int id = Convert.ToInt32(celda);
            e.Row.Cells[2].Text = AccesoBLL.GetAccesoByUsuarioId(id).Count.ToString();
        }
        catch (Exception)
        { }
    }
}