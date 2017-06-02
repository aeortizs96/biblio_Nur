using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;


public partial class P_Autentificacion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
            {
                Login1.UserName = Request.Cookies["UserName"].Value;
                // Login1.Password.Attributes["value"] = Request.Cookies["Password"].Value;
            }
        }


    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        if (Autentificacion.Autenticar(Login1.UserName, getSha1(Login1.Password)))
        {
            FormsAuthentication.RedirectFromLoginPage(Login1.UserName, Login1.RememberMeSet);

        }
        else
        {
            Login1.FailureText = "El intento de conexión no fue correcto. Inténtelo de nuevo.";
        }
    }


    protected void LoginButton_Click(object sender, EventArgs e)
    {
        if (cbx2.Checked)
        {
            Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
            Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
        }
        else
        {
            Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

        }
        Response.Cookies["UserName"].Value = Login1.UserName.Trim();
        Response.Cookies["Password"].Value = Login1.Password.Trim();
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




}
