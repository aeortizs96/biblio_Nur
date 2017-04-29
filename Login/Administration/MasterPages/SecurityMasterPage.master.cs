using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPages_SecurityMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMainMenuScript();
        }
    }


    private void LoadMainMenuScript()
    {
        StringBuilder scriptText = new StringBuilder("<script src=\"");
        scriptText.Append(ResolveClientUrl("~/js/jquery-2.1.1.min.js"));
        scriptText.Append("\" type=\"text/javascript\"></script>\n");

        scriptText.Append("<script src=\"");
        scriptText.Append(ResolveClientUrl("~/js/bootstrap.min.js"));
        scriptText.Append("\" type=\"text/javascript\"></script>\n");

        scriptText.Append("<script src=\"");
        scriptText.Append(ResolveClientUrl("~/js/Adm/script.js"));
        scriptText.Append("\" type=\"text/javascript\"></script>\n");

        HeaderLinksAndScriptsLiteral.Text = scriptText.ToString();
    }
    //protected void Unnamed1_Click(object sender, EventArgs e)
    //{
    //    //se borra la cookie de autenticacion
    //    FormsAuthentication.SignOut();

    //    //se redirecciona al usuario a la pagina de login
    //    Response.Redirect(Request.UrlReferrer.ToString());
    //}

    protected void btncerrar_Click(object sender, EventArgs e)
    {
        //se borra la cookie de autenticacion
        FormsAuthentication.SignOut();

        //se redirecciona al usuario a la pagina de login
        Response.Redirect(Request.UrlReferrer.ToString());
    }
}
