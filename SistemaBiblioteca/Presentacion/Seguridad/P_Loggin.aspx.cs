using Entidades;
using Negocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion.Seguridad
{
    public partial class P_Loggin : System.Web.UI.Page
    {

        public E_Usuario objEntUsuario = new E_Usuario();
        public N_Loggin objNegLoggin = new N_Loggin();



        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void TextBoxAObjeto()
        {
            objEntUsuario.Contrasena = txt_Contrasena.Text;
            objEntUsuario.NombreUsuario = txt_NombreUsuario.Text;
        }

        protected void btn_Aceptar_Click(object sender, EventArgs e)
        {
            {
                int nGrabados = -1;
                TextBoxAObjeto();
                nGrabados = objNegLoggin.abmLoggin(objEntUsuario);
                //VaciaTextBox();
                lbl_mensaje.Text = "SE INSERTARON CORRECTAMENTE LOS DATOS";
                if (nGrabados != -1)
                {
                    //Response.Write("<script>window.alert('AVISO: La consulta Se inserto correctamente.')</script>");
                    Response.Write("<script>window.alert('AVISO:  La consulta no se inserto correctamente.')</script>");
                   
                }
                else
                {
                   
                    Response.Redirect("P_Registro.aspx");
                }
            }



        }


    }
}