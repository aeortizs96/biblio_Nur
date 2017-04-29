using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administration_Modulo_Modulo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarComboBox();
            tituloLiteral.Text = "Nuevo permiso";
            try
            {
                RegistroEditarPanel.Visible = false;
                string id = Request["id"];
                if (!string.IsNullOrEmpty(id))
                {
                    Modulo obj = ModuloBLL.GetModuloById(Convert.ToInt32(id));
                    if (obj != null)
                    {
                        tituloLiteral.Text = "Editar permiso";
                        RegistroEditarPanel.Visible = true;
                        Id_Txt.Text = obj.ModuloId.ToString();
                        Area_Cbx.SelectedValue = obj.AreaId.ToString();
                        Descripcion_Txt.Text = obj.Descripcion;
                    }
                }
            }
            catch (Exception)
            { }
        }
    }

    private void CargarComboBox()
    {
        Area_Cbx.DataValueField = "AreaId";
        Area_Cbx.DataTextField = "Descripcion";
        Area_Cbx.DataSource = AreaBLL.GetAreas();
        Area_Cbx.DataBind();
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
            Modulo obj = new Modulo();
            obj.AreaId = Convert.ToInt32(Area_Cbx.SelectedValue);
            obj.Descripcion = Descripcion_Txt.Text.Trim();
            if (string.IsNullOrEmpty(Id_Txt.Text))
            {
                ModuloBLL.InsertModulo(obj);
            }
            else
            {
                obj.ModuloId = Convert.ToInt32(Id_Txt.Text);
                ModuloBLL.UpdateModulo(obj);
            }
            Response.Redirect("ListaModulos.aspx");
        }
        catch (Exception ex)
        {
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error en la operacion')", true);
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Error en la operacion');", true);
            throw ex;
        }
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Modulo.aspx");
    }
}