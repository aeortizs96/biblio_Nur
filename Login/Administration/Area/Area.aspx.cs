using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administration_Areas_Area : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tituloLiteral.Text = "Nuevo rol";
            try
            {
                
                string id = Request["id"];
                if (!string.IsNullOrEmpty(id))
                {
                    Area obj = AreaBLL.GetAreaById(Convert.ToInt32(id));
                    if (obj != null)
                    {
                        tituloLiteral.Text = "Editar rol";
                  
                        Id_Txt.Text = obj.AreaId.ToString();
                        Descripcion_Txt.Text = obj.Descripcion;
                    }
                }
            }
            catch (Exception)
            { }
        }
    }

    protected void GuardarBtn_Click(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(Descripcion_Txt.Text.Trim()))
            {
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Hay campos vacios')", true);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Hay compas invalidos');", true);
                return;
            }
            Area obj = new Area();
            obj.Descripcion = Descripcion_Txt.Text.Trim();
            if (string.IsNullOrEmpty(Id_Txt.Text))
            {
                AreaBLL.InsertArea(obj);
            }
            else
            {
                obj.AreaId = Convert.ToInt32(Id_Txt.Text);
                AreaBLL.UpdateArea(obj);
            }
            Response.Redirect("ListaAreas.aspx");
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('error en la operacion');", true);
            throw ex;
        }
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Area.aspx");
    }
}