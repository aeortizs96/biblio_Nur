using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administration_Acceso_Acceso : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tituloLiteral.Text = "Asignacion de permisos";
            try
            {
                RegistroEditarPanel.Visible = false;
                string id = Request["id"];
                if (!string.IsNullOrEmpty(id))
                {
                    Usuario obj = UsuarioBLL.GetUsuarioById(Convert.ToInt32(id));
                    if (obj != null)
                    {
                        RegistroEditarPanel.Visible = true;
                        Id_Txt.Text = obj.UsuarioId.ToString();
                        Usuario_Txt.Text = obj.NombreUsuario;
                        Contrasena_Txt.Text = obj.Contrasena;

                        CargarLista();
                    }
                    else
                        Response.Redirect("ListaAccesos.aspx");
                }
                else
                    Response.Redirect("ListaAccesos.aspx");
            }
            catch (Exception)
            { }
        }
    }

    private void CargarLista()
    {
        ListaModulos_GV.DataSource = ModuloBLL.GetModulos();
        ListaModulos_GV.DataBind();

        HiddenField hf = new HiddenField();
        CheckBox cb = new CheckBox();
        Acceso obj = new Acceso(); ;
        foreach (GridViewRow row in ListaModulos_GV.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                hf = row.Cells[0].FindControl("ModuloIdHF") as HiddenField;
                cb = row.Cells[0].FindControl("Modulo_CheckBox") as CheckBox;
                obj.ModuloId = Convert.ToInt32(hf.Value);
                obj.UsuarioId = Convert.ToInt32(Id_Txt.Text);
                if (AccesoBLL.GetAccesoBy_ModuloId_UsuarioId(obj) != null)
                    cb.Checked = true;
            }
        }
    }

    protected void GuardarBtn_Click(object sender, EventArgs e)
    {
        List<Modulo> lista_Modulos_Asignados = new List<Modulo>();
        try
        {
            foreach (GridViewRow row in ListaModulos_GV.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    HiddenField hf = row.Cells[0].FindControl("ModuloIdHF") as HiddenField;
                    CheckBox cb = row.Cells[0].FindControl("Modulo_CheckBox") as CheckBox;
                    if (!string.IsNullOrEmpty(hf.Value) && cb.Checked)
                    {
                        lista_Modulos_Asignados.Add(ModuloBLL.GetModuloById(Convert.ToInt32(hf.Value)));
                    }
                }
            }
        }
        catch (Exception)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Error en la operacion 1');", true);
            return;
        }
        try
        {
            List<Modulo> lista_Acceso_Usuario = AccesoBLL.GetAccesoByUsuarioId(Convert.ToInt32(Id_Txt.Text));
            for (int i = 0; i < lista_Acceso_Usuario.Count; i++)
            {
                Acceso obj = new Acceso();
                obj.ModuloId = lista_Acceso_Usuario[i].ModuloId;
                obj.UsuarioId = Convert.ToInt32(Id_Txt.Text);
                AccesoBLL.Deleteacceso(obj);
            }
        }
        catch (Exception)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Error en la operacion 2');", true);
            return;
        }
        try
        {
            for (int i = 0; i < lista_Modulos_Asignados.Count; i++)
            {
                Acceso obj = new Acceso();
                obj.ModuloId = lista_Modulos_Asignados[i].ModuloId;
                obj.UsuarioId = Convert.ToInt32(Id_Txt.Text);
                AccesoBLL.InsertAcceso(obj);
            }
        }
        catch (Exception)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Error en la operacion 3');", true);
            return;
        }
        Response.Redirect("ListaAccesos.aspx");
    }

    protected void ListaModulos_GV_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            string celda = e.Row.Cells[1].Text;
            int id = Convert.ToInt32(celda);
            if (AreaBLL.GetAreaById(id) != null)
                e.Row.Cells[1].Text = AreaBLL.GetAreaById(id).Descripcion;
        }
        catch (Exception)
        { }
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Acceso.aspx");
    }
}