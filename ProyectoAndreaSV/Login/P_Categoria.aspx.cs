using CapaEntidades;
using CapaNegocios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class P_Categoria : System.Web.UI.Page
{
    public E_Categoria objEntCategoria = new E_Categoria();
    public N_Categoria objNegCategoria = new N_Categoria();

    public E_Producto objEntProducto = new E_Producto();
    public N_Producto1 objNegProducto = new N_Producto1();


    //conexion necesaria para el filtro
    public SqlConnection cn = new SqlConnection("Data Source=ANDREA\\SQLEXPRESS;Initial Catalog=SistemasDeVentas;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {

        ListadoCategorias();
        DesHabilitarBotonesCategoria();

    }



    #region Metodos Adicionales Categoria

    private void DesHabilitarBotonesCategoria()
    {
        btn_Borrar.Enabled = false;
        btn_Modificar.Enabled = false;
        grvListadoCategoria.Enabled = true;
        btnGrabar.Enabled = false;
        btnCancelar.Enabled = false;
    }
    //metodo que deja en blanco el texbox despues de guardar, borrar o modificar
    private void VaciaTextBox()
    {
        txt_CategoriaId.Text = string.Empty;
        txt_descripcion.Text = string.Empty;
    }
    //metodo que obtiene lo que este escrito en los txtbox
    private void TextBoxAObjeto()
    {
        objEntCategoria.Descripcion = txt_descripcion.Text;
    }
    //metodo que pasa los parametros de la entidad  a los textbox
    private void ObjetoATextBox(DataSet ds)
    {
        txt_CategoriaId.Text = ds.Tables[0].Rows[0]["categoriaId"].ToString();
        txt_descripcion.Text = ds.Tables[0].Rows[0]["descripcion"].ToString();
    }

    //metodo que llama a la consulta para mostrar la lista de categorias
    private void ListadoCategorias()
    {
        DataSet ds = new DataSet();
        ds = objNegCategoria.listadoCategoria();
        if (ds.Tables[0].Rows.Count > 0)
        {
            grvListadoCategoria.DataSource = ds.Tables[0];
            grvListadoCategoria.DataBind();// esto es lo que hace que la base de dato se pase al datagriview
        }
        //else
        //    Response.Write("<script>window.alert('AVISO: No existe categorias en el sistema.')</script>");
    }
    #endregion

    #region Metodos OnClick Categoria


    protected void btn_NuevaCategoria_Click(object sender, EventArgs e)
    {
        btn_Borrar.Enabled = false;
        btn_Modificar.Enabled = false;
        grvListadoCategoria.Enabled = false;
        btnGrabar.Enabled = true;
        btnCancelar.Enabled = true;
        txt_descripcion.Enabled = true;
        VaciaTextBox();
    }
    protected void btn_Borrar_Click(object sender, EventArgs e)
    {
        int nResultado = -1;
        TextBoxAObjeto();
        objEntCategoria.CategoriaId = Convert.ToInt16(grvListadoCategoria.DataKeys[grvListadoCategoria.SelectedIndex].Value.ToString());
        nResultado = objNegCategoria.abmCategoria("BORRAR", objEntCategoria);

        ListadoCategorias();
        VaciaTextBox();
        DesHabilitarBotonesCategoria();
        txt_descripcion.Enabled = false;

        if (nResultado != -1)
            Response.Write("<script>window.alert('AVISO: La categoria fue borrada.')</script>");
        else
            Response.Write("<script>window.alert('AVISO: La categoria fue borrada.')</script>");
    }

    protected void btn_Modificar_Click(object sender, EventArgs e)
    {
        int nresultado = -1;
        TextBoxAObjeto();
        objEntCategoria.CategoriaId = Convert.ToInt32(grvListadoCategoria.DataKeys[grvListadoCategoria.SelectedIndex].Value.ToString());
        nresultado = objNegCategoria.abmCategoria("MODIFICAR", objEntCategoria);

        ListadoCategorias();
        DesHabilitarBotonesCategoria();
        VaciaTextBox();
        txt_descripcion.Enabled = false;

        if (nresultado != -1)
            Response.Write("<script>window.alert('AVISO: La categoria fue modificada.')</script>");
        else
            Response.Write("<script>window.alert('AVISO: La categoria no fue modificada.')</script>");
    }


    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        VaciaTextBox();
        DesHabilitarBotonesCategoria();
    }

    protected void btnGrabar_Click(object sender, EventArgs e)
    {
        int nGrabados = -1;
        TextBoxAObjeto();
        nGrabados = objNegCategoria.abmCategoria("AGREGAR", objEntCategoria);

        ListadoCategorias();
        VaciaTextBox();
        DesHabilitarBotonesCategoria();
        txt_descripcion.Enabled = false;

        if (nGrabados != -1)
            Response.Write("<script>window.alert('AVISO: Categoria insertada correctamente.')</script>");
        else
            Response.Write("<script>window.alert('AVISO:  Categoria No insertada.')</script>");

    }

    protected void btn_busqueda_Click(object sender, EventArgs e)
    {
        try
        {
            String sql = "select * from tbl_Categorias where descripcion like '%" + txt_busqueda.Text + "%'";
            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            this.grvListadoCategoria.DataSource = dt;
            grvListadoCategoria.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }



    protected void grvListadoCategoria_SelectedIndexChanged(object sender, EventArgs e)
    {
        btn_Borrar.Enabled = true;
        btn_Modificar.Enabled = true;
        btnGrabar.Enabled = false;
        btnCancelar.Enabled = true;
        txt_descripcion.Enabled = true;




        DataSet ds = new DataSet();
        objEntCategoria.CategoriaId = Convert.ToInt32(grvListadoCategoria.DataKeys[grvListadoCategoria.SelectedIndex].Value.ToString());
        ds = objNegCategoria.seleccionaCategoria(objEntCategoria.CategoriaId);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ObjetoATextBox(ds);

        }
    }


    #endregion





    
}