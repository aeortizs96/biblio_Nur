
using Entidades;
using Negocios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registrar_Libro : System.Web.UI.Page
{
    public E_Libro objEntLibro = new E_Libro();
    public N_Libro objNegLibro = new N_Libro();

    public E_Autor objEntAutor = new E_Autor();
    public N_Autor objNegAutor = new N_Autor();


    //conexion necesaria para el filtro
    //public SqlConnection cn = new SqlConnection("Data Source=HP\SQLEXPRESS;Initial Catalog=BiblioNur;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        libroLista();
        DesHabilitarBotonesLibros();
        DesHabilitarTexBoxLibro();
    }

    protected void btncerrar_Click(object sender, EventArgs e)
    {
        //se borra la cookie de autenticacion
        FormsAuthentication.SignOut();

        //se redirecciona al usuario a la pagina de login
        Response.Redirect(Request.UrlReferrer.ToString());
    }

    #region Metodos Adicionales Producto

    private void DesHabilitarBotonesLibros()
    {
        btn_BorrarLibro.Enabled = false;
        btn_ModificarLibro.Enabled = false;
        grvLibro.Enabled = true;
        btnGrabarLibro.Enabled = false;
        btnCancelarLibro.Enabled = false;
    }
    private void DesHabilitarGrid1()
    {
        btn_BorrarLibro.Enabled = true;
        btn_ModificarLibro.Enabled = true;
        grvLibro.Enabled = false;
        btnGrabarLibro.Enabled = false;
        btnCancelarLibro.Enabled = true;
    }

    private void HabilitarBotonesLibros()
    {
        btn_BorrarLibro.Enabled = true;
        btn_ModificarLibro.Enabled = true;
        grvLibro.Enabled = true;
        btnGrabarLibro.Enabled = true;
        btnCancelarLibro.Enabled = true;
    }
    private void HabilitarTexBoxProducto()
    {
        txt_autor.Enabled = true;
        txt_editorial.Enabled = true;
        txt_mfnLibro.Enabled = true;
        txttitulo.Enabled = true;

    }

    private void DesHabilitarTexBoxLibro()
    {
        txt_autor.Enabled = false;
        txt_editorial.Enabled = false;
        txt_mfnLibro.Enabled = false;
        txttitulo.Enabled = false;

    }
    //metodo que deja en blanco el texbox despues de guardar, borrar o modificar
    private void VaciaTextBoxProducto()
    {
        txt_autor.Text = string.Empty;
        txt_editorial.Text = string.Empty;
        txt_mfnLibro.Text = string.Empty;
        txttitulo.Text = string.Empty;

    }
    //metodo que obtiene lo que este escrito en los txtbox
    private void TextBoxAObjetoLibro()
    {
        objEntLibro.Mfn = txt_mfnLibro.Text;
        objEntLibro.Titulo = txttitulo.Text;
        objEntLibro.Editorial = txt_editorial.Text;
        objEntLibro.Autor = txt_autor.Text;
        objEntLibro.Estados = Convert.ToInt32(cb_Estados.SelectedValue.ToString());

  

    }
    //metodo que pasa los parametros de la entidad  a los textbox
    private void ObjetoATextBoxLibro(DataSet ds)
    {
        txt_mfnLibro.Text = ds.Tables[0].Rows[0]["mfn"].ToString();
        txttitulo.Text = ds.Tables[0].Rows[0]["titulo"].ToString();
        txt_editorial.Text = ds.Tables[0].Rows[0]["editorial"].ToString();


    }


    //metodo que limpia todos los textbox de Libros
    protected void btn_limpieza_Click(object sender, EventArgs e)
    {
        txt_autor.Text = string.Empty;
        txt_editorial.Text = string.Empty;
        txt_mfnLibro.Text = string.Empty;
        txttitulo.Text = string.Empty;
    }


    private void libroLista()
    {
        DataSet ds = new DataSet();
        ds = objNegLibro.listadoLibro();

        if (ds.Tables[0].Rows.Count > 0)
        {
            grvLibro.DataSource = ds.Tables[0];
            grvLibro.DataBind();// esto es lo que hace que la base de dato se pase al datagriview
        }
    } 



    #endregion

    #region Metodos OnClick Libro

    protected void btn_NuevoLibro_Click(object sender, EventArgs e)
    {
        
        pnlAltasLibro.Visible = true;
        btn_BorrarLibro.Enabled = false;
        btn_ModificarLibro.Enabled = false;
        grvLibro.Enabled = false;
        btnGrabarLibro.Enabled = true;
        btnCancelarLibro.Enabled = true;
        HabilitarTexBoxProducto();
        VaciaTextBoxProducto();
    }
    protected void btnGrabarLibro_Click(object sender, EventArgs e)
    {
        int nGrabados = -1;
        TextBoxAObjetoLibro();
        nGrabados = objNegLibro.abmLibro("AGREGAR", objEntLibro);

        libroLista();
        VaciaTextBoxProducto();
        DesHabilitarBotonesLibros();
        DesHabilitarTexBoxLibro();
        if (nGrabados != -1)
            Response.Write("<script>window.alert('AVISO: Libro insertado correctamente.')</script>");
        else
            Response.Write("<script>window.alert('AVISO:  Libro No insertado.')</script>");
    }

    protected void btn_ModificarLibro_Click(object sender, EventArgs e)
    {
        int nresultado = -1;
        TextBoxAObjetoLibro();
        objEntLibro.Mfn = grvLibro.DataKeys[grvLibro.SelectedIndex].Value.ToString();
        nresultado = objNegLibro.abmLibro("MODIFICAR", objEntLibro);

        libroLista();
        DesHabilitarBotonesLibros();
        VaciaTextBoxProducto();
        DesHabilitarTexBoxLibro();

        if (nresultado != -1)
            Response.Write("<script>window.alert('AVISO: El Libro fue modificado.')</script>");
        else
            Response.Write("<script>window.alert('AVISO: El Libro NO fue modificado.')</script>");
    }

    protected void btn_BorrarLibro_Click(object sender, EventArgs e)
    {
        int nResultado = -1;
        TextBoxAObjetoLibro();
        objEntLibro.Mfn = grvLibro.DataKeys[grvLibro.SelectedIndex].Value.ToString();
        nResultado = objNegLibro.abmLibro("BORRAR", objEntLibro);

        libroLista();
        VaciaTextBoxProducto();
        DesHabilitarBotonesLibros();
        DesHabilitarTexBoxLibro();

        if (nResultado != -1)
            Response.Write("<script>window.alert('AVISO: El Libro fue borrado.')</script>");
        else
            Response.Write("<script>window.alert('AVISO: El Libro NO fue borrado.'')</script>");
    }




    #endregion

    protected void btnCancelarLibro_Click(object sender, EventArgs e)
    {
        VaciaTextBoxProducto();
        DesHabilitarBotonesLibros();
        pnlAltasLibro.Visible = false;
    }
    protected void grvLibro_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnGrabarLibro.Enabled = true;
        btnCancelarLibro.Enabled = true;
        btn_ModificarLibro.Enabled = true;
        btn_BorrarLibro.Enabled = true;
        txt_mfnLibro.Enabled = false;
        txt_autor.Enabled = false;

        DataSet ds = new DataSet();
        objEntLibro.Mfn = grvLibro.DataKeys[grvLibro.SelectedIndex].Value.ToString();
        ds = objNegLibro.seleccionaLibro(objEntLibro.Mfn);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ObjetoATextBoxLibro(ds);
            GridViewRow row = grvLibro.SelectedRow;
            txt_autor.Text = row.Cells[1].Text;
            HabilitarTexBoxProducto();
        }

       
    }
}