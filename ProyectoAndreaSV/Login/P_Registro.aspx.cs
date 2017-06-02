

using CapaEntidades;
using CapaNegocios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class P_Registro : System.Web.UI.Page
{
    public E_Usuario objEntUsuario = new E_Usuario();
    public N_Registro objNegRegistro = new N_Registro();


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void TextBoxAObjeto()
    {
        objEntUsuario.Email = txt_Correo.Text;
        objEntUsuario.Contrasena = getSha1(txt_Contrasena.Text);
        objEntUsuario.Nombres = txt_Nombres.Text;
        objEntUsuario.Apellidos = txt_Apellidos.Text;
        objEntUsuario.CI = txt_Ci.Text;
        objEntUsuario.Direccion = txt_Direccion.Text;
        objEntUsuario.Telefono = txt_Telefono.Text;
        objEntUsuario.NombreUsuario = txt_NombreUsuario.Text;
        objEntUsuario.Sexo = ddl_Sexo.Text;
        objEntUsuario.Tipo = ddl_Tipo.Text;

    }

    private void VaciaTextBox()
    {
        txt_Correo.Text = string.Empty;
        txt_Nombres.Text = string.Empty;
        txt_Apellidos.Text = string.Empty;
        txt_NombreUsuario.Text = string.Empty;
        txt_Contrasena.Text = string.Empty;


        txt_Correo.Text = string.Empty;
        txt_Contrasena.Text = string.Empty;
        txt_Nombres.Text = string.Empty;
        txt_Apellidos.Text = string.Empty;
        txt_Ci.Text = string.Empty;
        txt_Direccion.Text = string.Empty;
        txt_Telefono.Text = string.Empty;
        txt_NombreUsuario.Text = string.Empty;
        ddl_Sexo.Text = "Elija un genero";
        ddl_Tipo.Text = "Elija un tipo de usuario";

    }

    protected void btn_guardar_Click(object sender, EventArgs e)
    {
        int nGrabados = -1;
        TextBoxAObjeto();
        nGrabados = objNegRegistro.abcRegistro(objEntUsuario);
        VaciaTextBox();
        lbl_mensaje.Text = "SE INSERTARON CORRECTAMENTE LOS DATOS";
        if (nGrabados != -1)

            Response.Write("<script>window.alert('AVISO: La consulta Se inserto correctamente.')</script>");

        else
            Response.Write("<script>window.alert('AVISO:  La consulta no se inserto correctamente.')</script>");
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
