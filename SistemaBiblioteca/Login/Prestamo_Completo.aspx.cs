using Entidades;
using Negocios;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Prestamo_Completo : System.Web.UI.Page
{
    public E_Libro objEntLibro = new E_Libro();
    public N_Libro objNegLibro = new N_Libro();

    public E_Prestamos objEntPrestamo = new E_Prestamos();
    public N_Prestamos objNegPrestamo = new N_Prestamos();

    public SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        //ListadoLibro();
        txt_editorial.Enabled = false;
        txt_titulo.Enabled = false;
        txt_nombreuser.Enabled = false;
        
        if (!IsPostback)
        {

        }
    }




    #region Metodos adicionales busqueda libro

    //private void ListadoLibro()
    //{
    //    DataSet ds = new DataSet();
    //    ds = objNegLibro.listadoLibro();
    //    if (ds.Tables[0].Rows.Count > 0)
    //    {
    //        grvVenta.DataSource = ds.Tables[0];
    //        grvVenta.DataBind();// esto es lo que hace que la base de dato se pase al datagriview
    //    }
    //    else
    //        Response.Write("<script>window.alert('AVISO: No existen libros en el sistema.')</script>");
    //}

    #endregion

    #region Metodos OnClick Busqueda Libro


    //protected void btn_busqueda_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        String sql = "select * from tbl_Libros where " + DropDownList2.SelectedValue.ToString() + " like '%" + txt_busqueda.Text + "%'";

    //        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
    //        DataTable dt = new DataTable();
    //        da.Fill(dt);
    //        this.grvListadoLibros.DataSource = dt;
    //        grvListadoLibros.DataBind();
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}

    //protected void grvListadoLibros_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DataSet ds = new DataSet();
    //    objEntLibro.Mfn = grvListadoLibros.DataKeys[grvListadoLibros.SelectedIndex].Value.ToString();

    //    ds = objNegLibro.seleccionaLibro(objEntLibro.Mfn);
    //    if (ds.Tables[0].Rows.Count > 0)
    //    {
    //        ObjetoATextBoxReserva(ds);
    //    }
    //}

    #endregion

    #region Metodos adicionales reserva
    //metodo que obtiene lo que este escrito en los txtbox
    private void TextBoxAObjetoReserva()
    {


        objEntPrestamo.FechaInicio = txt_fecha.Text;
        objEntPrestamo.FechaFin = txt_fecha2.Text;
        objEntPrestamo.LibroMFN = txt_libroMfn.Text;
        objEntPrestamo.UsuarioId = txt_usuarioId.Text;
    }

    //metodo que pasa los parametros de la entidad  a los textbox
    private void ObjetoATextBoxReserva(DataSet ds)
    {
        txt_libroMfn.Text = ds.Tables[0].Rows[0]["mfn"].ToString();
    }


    private void VaciaTextBoxPrestamo()
    {
        txt_fecha.Text = string.Empty;
        txt_fecha2.Text = string.Empty;
        txt_libroMfn.Text = string.Empty;
        txt_usuarioId.Text = string.Empty;
    }

    #endregion

    #region Metodos OnClick Reserva

    protected void btn_GuardarReserva_Click(object sender, EventArgs e)
    {
        int nGrabados = -1;
        TextBoxAObjetoReserva();
        nGrabados = objNegPrestamo.abmPrestamos("AGREGAR", objEntPrestamo);


        VaciaTextBoxPrestamo();

        if (!Page.IsValid)
        {

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

    protected void btnClose_Click(object sender, EventArgs e)
    {

        VaciaTextBoxPrestamo();

    }

    //protected void txt_libroMfn_TextChanged(object sender, EventArgs e)
    //{
    //    try
    //    {

    //        string query = "select titulo, editorial from tbl_Libros where mfn = @mfn";
    //        SqlCommand cmd = new SqlCommand(query, cn);
    //        cmd.Parameters.AddWithValue(" @mfn", Convert.ToInt32(txt_libroMfn.Text));
    //        SqlDataReader dr = cmd.ExecuteReader();
    //        if (dr.Read()) 
    //        {
    //            txt_titulo.Text = dr["titulo"].ToString();
    //            txt_editorial.Text = dr["editorial"].ToString();
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}

    public bool IsPostback { get; set; }
}