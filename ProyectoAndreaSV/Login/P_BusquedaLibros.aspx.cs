
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


// acomodar todos los metodos segun donde corresponda, hacer los textbox a objeto
public partial class P_BusquedaLibros : System.Web.UI.Page
{

    //terminar el text box reservar
    public E_Libro objEntLibro = new E_Libro();
    public N_Libro objNegLibro = new N_Libro();

    public SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        ListadoLibro();
    }


    #region Metodos Adicionales Busqueda Libro



    //metodo que obtiene lo que este escrito en los txtbox
    private void TextBoxAObjetoReserva()
    {

        objEntLibro.fec = txt_fecha.Text;
        objEntLibro.Titulo = txt_contrasena.Text;
        objEntLibro.Autor = txt_nombreCompleto.Text;
        objEntLibro.Editorial = txt_nombreUsuario.Text;
        objEntLibro.Estados = txt_sexo.Text;

    }

    //metodo que pasa los parametros de la entidad  a los textbox
    private void ObjetoATextBox(DataSet ds)
    {
        txt_libroMfn.Text = ds.Tables[0].Rows[0]["mfn"].ToString();

    }



    #endregion

    //#region Metodos Onclick



    //protected void btn_Modificar_Click(object sender, EventArgs e)
    //{
    //    int nresultado = -1;
    //    TextBoxAObjeto();
    //    objEntLibro.UsuarioId = Convert.ToInt32(grvListadoUsuario.DataKeys[grvListadoUsuario.SelectedIndex].Value.ToString());
    //    nresultado = objNegLibro.abmUsuario("MODIFICAR", objEntLibro);

    //    ListadoLibro();
    //    DesHabilitarTextBox();
    //    VaciaTextBox();

    //    if (nresultado != -1)
    //        Response.Write("<script>window.alert('AVISO: el usuario fue modificado.')</script>");
    //    else
    //        Response.Write("<script>window.alert('AVISO: el usuario no fue modificado.')</script>");
    //}
    //protected void btn_Borrar_Click(object sender, EventArgs e)
    //{
    //    int nResultado = -1;
    //    TextBoxAObjeto();
    //    objEntLibro.UsuarioId = Convert.ToInt16(grvListadoUsuario.DataKeys[grvListadoUsuario.SelectedIndex].Value.ToString());
    //    nResultado = objNegLibro.abmUsuario("BORRAR", objEntLibro);

    //    ListadoLibro();
    //    VaciaTextBox();
    //    DesHabilitarTextBox();

    //    if (nResultado != -1)
    //        Response.Write("<script>window.alert('AVISO: EL usuario fue borrado.')</script>");
    //    else
    //        Response.Write("<script>window.alert('AVISO: El usuario no pudo ser borrado.')</script>");
    //}
    //protected void btnCancelar_Click(object sender, EventArgs e)
    //{
    //    VaciaTextBox();
    //    HabilitarBotones();
    //    DesHabilitarTextBox();
    //    pnlAltas.Visible = false;
    //}
    //#endregion


    //protected void grvListadoUsuario_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DataSet ds = new DataSet();
    //    objEntLibro.UsuarioId = Convert.ToInt32(grvListadoUsuario.DataKeys[grvListadoUsuario.SelectedIndex].Value.ToString());

    //    btn_Borrar.Enabled = true;
    //    btn_Modificar.Enabled = true;
    //    btnCancelar.Enabled = true;
    //    HabilitarTextBox();

    //    ds = objNegLibro.seleccionaUsuario(objEntLibro.UsuarioId);
    //    if (ds.Tables[0].Rows.Count > 0)
    //    {
    //        ObjetoATextBox(ds);
    //    }
    //}


    //protected void btn_editar_Click(object sender, EventArgs e)
    //{
    //    pnlAltas.Visible = true;
    //}
    //protected void btncerrar_Click(object sender, EventArgs e)
    //{
    //    //se borra la cookie de autenticacion
    //    FormsAuthentication.SignOut();

    //    //se redirecciona al usuario a la pagina de login
    //    Response.Redirect(Request.UrlReferrer.ToString());
    //}




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
        //DataSet ds = new DataSet();
        //objEntLibro.Mfn = grvListadoLibros.DataKeys[grvListadoLibros.SelectedIndex].Value.ToString();

        //btn_Borrar.Enabled = true;
        //btn_Modificar.Enabled = true;
        //btnCancelar.Enabled = true;
        //HabilitarTextBox();

        //ds = objNegLibro.seleccionaLibro(objEntLibro.Mfn);
        //if (ds.Tables[0].Rows.Count > 0)
        //{
        //    ObjetoATextBox(ds);
        //}
    }

    #endregion
    #region Metodos adicionales reserva


    #endregion

    #region Metodos OnClick Reserva



    #endregion

}


