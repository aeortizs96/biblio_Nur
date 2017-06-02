using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class P_PaginaInicio : System.Web.UI.Page
{
    private string saludo = "";


    protected void Page_Load(object sender, EventArgs e)
    {

        //si se autentica mostramos mensaje y nombre de usuario

        //if (HttpContext.Current.User.Identity.IsAuthenticated)
        //{


        //    Response.Write("Bienvenido " + User.Identity.Name);
        //}
    }



    protected void btncerrar_Click(object sender, EventArgs e)
    {
        //se borra la cookie de autenticacion
        FormsAuthentication.SignOut();

        //se redirecciona al usuario a la pagina de login
        Response.Redirect(Request.UrlReferrer.ToString());
    }


    protected void btn_registro_Click(object sender, EventArgs e)
    {
        Response.Redirect("P_Registro.aspx");
    }
    protected void btn_clientes_Click(object sender, EventArgs e)
    {
        Response.Redirect("P_Cliente.aspx");
    }
    protected void btn_categoria_Click(object sender, EventArgs e)
    {
        Response.Redirect("P_Categoria.aspx");
    }

    protected void btn_producto_Click(object sender, EventArgs e)
    {
        Response.Redirect("P_Producto.aspx");
    }
}