using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

using Negocios;
using Entidades;
using System.Security.Cryptography;
using System.Text;

namespace Presentacion.Seguridad
{
    public partial class P_Registro : System.Web.UI.Page
    {
        public E_Usuario objEntUsuario = new E_Usuario();
        public N_Registro objNegRegistro = new N_Registro();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void TextBoxAObjeto()
        {
            objEntUsuario.Correo = txt_Correo.Text;
            objEntUsuario.Contrasena = getSha1(txt_Contrasena.Text);
            objEntUsuario.NombreCompleto = txt_NombreCompleto.Text;
            objEntUsuario.NombreUsuario = txt_NombreUsuario.Text;
        }

        private void VaciaTextBox()
        {
            txt_Correo.Text = string.Empty;
            txt_NombreCompleto.Text = string.Empty;
            txt_NombreUsuario.Text = string.Empty;
            txt_Contrasena.Text = string.Empty;
        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            int nGrabados = -1;
            TextBoxAObjeto();
            nGrabados = objNegRegistro.abmRegistro(objEntUsuario);
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
}


