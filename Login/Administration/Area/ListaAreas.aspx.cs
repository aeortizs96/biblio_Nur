using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administration_Areas_ListaAreas : System.Web.UI.Page
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
        ListaAreas_GV.DataSource = AreaBLL.GetAreas();
        ListaAreas_GV.DataBind();
    }

    protected void ListaAreas_GV_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editar")
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Area.aspx?id=" + id);
            }
            catch (Exception ex)
            { throw ex; }
        }
        if (e.CommandName == "Eliminar")
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('id=" + id + "')", true);
                AreaBLL.DeleteArea(id);
                CargarLista();
            }
            catch (Exception ex)
            { throw ex; }
        }
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Area.aspx");
    }
}