using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administration_Modulo_ListaModulos : System.Web.UI.Page
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
        ListaModulos_GV.DataSource = ModuloBLL.GetModulos();
        ListaModulos_GV.DataBind();
    }

    protected void ListaModulos_GV_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editar")
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Modulo.aspx?id=" + id);
            }
            catch (Exception ex)
            { throw ex; }
        }
        if (e.CommandName == "Eliminar")
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ModuloBLL.DeleteModulo(id);
                CargarLista();
            }
            catch (Exception ex)
            { throw ex; }
        }
    }

    protected void ListaModulos_GV_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string celda = e.Row.Cells[2].Text;
        try
        {
            int id = Convert.ToInt32(celda);
            if (AreaBLL.GetAreaById(id) != null)
                e.Row.Cells[2].Text = AreaBLL.GetAreaById(id).Descripcion;
        }
        catch (Exception)
        { }
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Modulo.aspx");
    }
}