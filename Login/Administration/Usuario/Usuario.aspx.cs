using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;



public partial class Administration_Usuario_Usuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tituloLiteral.Text = "Nuevo usuario";
            try
            {
                RegistroEditarPanel.Visible = false;
                string id = Request["id"];
                if (!string.IsNullOrEmpty(id))
                {
                    Usuario obj = UsuarioBLL.GetUsuarioById(Convert.ToInt32(id));
                    if (obj != null)
                    {
                        tituloLiteral.Text = "Editar usuario";
                        RegistroEditarPanel.Visible = true;
                        Id_Txt.Text = obj.UsuarioId.ToString();
                        NombreUsuario_Txt.Text = obj.NombreUsuario;
                        Contrasena_Txt.Text = obj.Contrasena;
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
            if (string.IsNullOrEmpty(NombreUsuario_Txt.Text.Trim()) || string.IsNullOrEmpty(Contrasena_Txt.Text.Trim()))
            {
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Hay campos vacios')", true);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Hay compas invalidos');", true);
                return;
            }
            Usuario obj = new Usuario();
            obj.NombreUsuario = NombreUsuario_Txt.Text.Trim();
            obj.Contrasena =  getSha1(Contrasena_Txt.Text.Trim());
            if (string.IsNullOrEmpty(Id_Txt.Text))
            {
                UsuarioBLL.InsertUsuario(obj);
            }
            else
            {
                obj.UsuarioId = Convert.ToInt32(Id_Txt.Text);
                UsuarioBLL.UpdateUsuario(obj);
            }
            Response.Redirect("ListaUsuarios.aspx");
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Error en la operacion');", true);
            throw ex;
        }
    }

    public string getSha1(string texto)
    {
        SHA1CryptoServiceProvider sh = new SHA1CryptoServiceProvider();
        sh.ComputeHash(ASCIIEncoding.ASCII.GetBytes(texto));
        byte[] re = sh.Hash;
        StringBuilder sb = new StringBuilder();
        foreach (byte b in re)
        {
            sb.Append(b.ToString("x2"));
        }
        return sb.ToString();
    }



    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Usuario.aspx");
    }
}