
using Entidades;
using Negocios;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class prueba_reserva : System.Web.UI.Page
{
    public E_Libro objEntLibro = new E_Libro();
    public N_Libro objNegLibro = new N_Libro();

    public E_Reserva objEntReserva = new E_Reserva();
    public N_Reserva objNegReserva = new N_Reserva();

    public SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        ListadoLibro();
      
    }


    #region Metodos adicionales busqueda libro

    private void ListadoLibro()
    {
        DataSet ds = new DataSet();
        ds = objNegLibro.listadoLibro();
        if (ds.Tables[0].Rows.Count > 0)
        {
            grvListadoLibros.DataSource = ds.Tables[0];
            grvListadoLibros.DataBind();// esto es lo que hace que la base de dato se pase al datagriview
        }
        else
            Response.Write("<script>window.alert('AVISO: No existen libros en el sistema.')</script>");
    }

    #endregion

    #region Metodos OnClick Busqueda Libro


    protected void btn_busqueda_Click(object sender, EventArgs e)
    {
        try
        {
            String sql = "select * from tbl_Libros where " + DropDownList2.SelectedValue.ToString() + " like '%" + txt_busqueda.Text + "%'";

            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            this.grvListadoLibros.DataSource = dt;
            grvListadoLibros.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void grvListadoLibros_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        objEntLibro.Mfn = grvListadoLibros.DataKeys[grvListadoLibros.SelectedIndex].Value.ToString();

        ds = objNegLibro.seleccionaLibro(objEntLibro.Mfn);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ObjetoATextBoxReserva(ds);
        }
    }

    #endregion

    #region Metodos adicionales reserva
    //metodo que obtiene lo que este escrito en los txtbox
    private void TextBoxAObjetoReserva()
    {


        objEntReserva.Fecha = txt_fecha.Text;
        objEntReserva.MfnLibro = txt_libroMfn.Text;
    }

    //metodo que pasa los parametros de la entidad  a los textbox
    private void ObjetoATextBoxReserva(DataSet ds)
    {
        txt_libroMfn.Text = ds.Tables[0].Rows[0]["mfn"].ToString();
    }


    private void VaciaTextBoxReserva()
    {
        txt_fecha.Text = string.Empty;
        txt_libroMfn.Text = string.Empty;
    }

    #endregion

    #region Metodos OnClick Reserva

    protected void btn_GuardarReserva_Click(object sender, EventArgs e)
    {
        int nGrabados = -1;
        TextBoxAObjetoReserva();
        nGrabados = objNegReserva.abmReserva("AGREGAR", objEntReserva);


        VaciaTextBoxReserva();

        if (!Page.IsValid)
        {
            LabelCaptcha.Text = "* Invalid Captcha";
        }
        else
        {
            if (nGrabados != -1)
                //For validation of the captcha
                Response.Write("<script>window.alert('AVISO: Libro reservado.')</script>");
        }

        //else
        //    Response.Write("<script>window.alert('AVISO:  Algo salio mal, intente de nuevo porfavor.')</script>");

    }



    #endregion

    protected void btncerrar_Click(object sender, EventArgs e)
    {
        //se borra la cookie de autenticacion
        FormsAuthentication.SignOut();

        //se redirecciona al usuario a la pagina de login
        Response.Redirect(Request.UrlReferrer.ToString());
    }
}

