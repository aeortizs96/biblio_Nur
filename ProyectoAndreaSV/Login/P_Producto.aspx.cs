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

public partial class P_Producto : System.Web.UI.Page
{
    public E_Categoria objEntCategoria = new E_Categoria();
    public N_Categoria objNegCategoria = new N_Categoria();

    public E_Producto objEntProducto = new E_Producto();
    public N_Producto1 objNegProducto = new N_Producto1();


    //conexion necesaria para el filtro
    public SqlConnection cn = new SqlConnection("Data Source=ANDREA\\SQLEXPRESS;Initial Catalog=SistemasDeVentas;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        productosLista();
        ListadoCategorias();
        DesHabilitarBotonesProducto();
        DesHabilitarTexBoxProducto();
    }

    #region Metodos Adicionales Producto

    private void DesHabilitarBotonesProducto()
    {
        btn_BorrarProducto.Enabled = false;
        btn_ModificarProducto.Enabled = false;
        grvProducto.Enabled = true;
        btnGrabarProducto.Enabled = false;
        btnCancelarProducto.Enabled = false;
    }
    private void DesHabilitarGrid1()
    {
        btn_BorrarProducto.Enabled = true;
        btn_ModificarProducto.Enabled = true;
        grvProducto.Enabled = false;
        btnGrabarProducto.Enabled = false;
        btnCancelarProducto.Enabled = true;
    }

    private void HabilitarBotonesProductos()
    {
        btn_BorrarProducto.Enabled = true;
        btn_ModificarProducto.Enabled = true;
        grvProducto.Enabled = true;
        btnGrabarProducto.Enabled = true;
        btnCancelarProducto.Enabled = true;
    }
    private void HabilitarTexBoxProducto()
    {
        txt_descripcionProducto.Enabled = true;
        txt_nombre.Enabled = true;
        txt_codigoCategoria.Enabled = true;
        txt_nombreCategoria.Enabled = true;
        txt_precioCompra.Enabled = true;
        txt_precioVenta.Enabled = true;
        txt_stock.Enabled = true;
        txt_fechaVencimiento.Enabled = true;
        txt_imagen.Enabled = true;

    }

    private void DesHabilitarTexBoxProducto()
    {
        txt_descripcionProducto.Enabled = false;
        txt_nombre.Enabled = false;
        txt_codigoCategoria.Enabled = false;
        txt_nombreCategoria.Enabled = false;
        txt_precioCompra.Enabled = false;
        txt_precioVenta.Enabled = false;
        txt_stock.Enabled = false;
        txt_fechaVencimiento.Enabled = false;
        txt_imagen.Enabled = false;

    }
    //metodo que deja en blanco el texbox despues de guardar, borrar o modificar
    private void VaciaTextBoxProducto()
    {
        txt_productoId.Text = string.Empty;
        txt_nombre.Text = string.Empty;
        txt_descripcionProducto.Text = string.Empty;
        txt_stock.Text = string.Empty;
        txt_precioCompra.Text = string.Empty;
        txt_precioVenta.Text = string.Empty;

    }
    //metodo que obtiene lo que este escrito en los txtbox
    private void TextBoxAObjetoProducto()
    {
        objEntProducto.CategoriaId = Convert.ToInt32(txt_codigoCategoria.Text);
        objEntProducto.Nombre = txt_nombre.Text;
        objEntProducto.Descripcion = txt_descripcionProducto.Text;
        objEntProducto.Stock = Convert.ToInt32(txt_stock.Text);
        objEntProducto.PrecioCompra = Convert.ToDouble(txt_precioCompra.Text);
        objEntProducto.PrecioVenta = Convert.ToDouble(txt_precioVenta.Text);
        objEntProducto.FechaVencimiento = txt_fechaVencimiento.Text;
        objEntProducto.Imagen = txt_imagen.Text;

    }
    //metodo que pasa los parametros de la entidad  a los textbox
    private void ObjetoATextBoxProducto(DataSet ds)
    {
        txt_productoId.Text = ds.Tables[0].Rows[0]["productoId"].ToString();
        txt_codigoCategoria.Text = ds.Tables[0].Rows[0]["categoriaId"].ToString();
        txt_nombre.Text = ds.Tables[0].Rows[0]["nombre"].ToString();
        txt_descripcionProducto.Text = ds.Tables[0].Rows[0]["descripcionP"].ToString();
        txt_stock.Text = ds.Tables[0].Rows[0]["stock"].ToString();
        txt_precioCompra.Text = ds.Tables[0].Rows[0]["precioCompra"].ToString();
        txt_precioVenta.Text = ds.Tables[0].Rows[0]["precioVenta"].ToString();
        txt_fechaVencimiento.Text = ds.Tables[0].Rows[0]["fechaVencimiento"].ToString();

        txt_imagen.Text = ds.Tables[0].Rows[0]["imagen"].ToString();
    }


    private void ObjetoATextBoxCategoriaProducto(DataSet ds)
    {
        txt_codigoCategoria.Text = ds.Tables[0].Rows[0]["categoriaId"].ToString();
        txt_nombreCategoria.Text = ds.Tables[0].Rows[0]["descripcion"].ToString();
    }

    //metodo que limpia todos los textbox de productos
    protected void btn_limpieza_Click(object sender, EventArgs e)
    {
        txt_codigoCategoria.Text = string.Empty;
        txt_productoId.Text = string.Empty;
        txt_nombreCategoria.Text = string.Empty;
        txt_nombre.Text = string.Empty;
        txt_descripcionProducto.Text = string.Empty;
        txt_stock.Text = string.Empty;
        txt_precioCompra.Text = string.Empty;
        txt_precioVenta.Text = string.Empty;
        txt_fechaVencimiento.Text = string.Empty;
    }


    private void productosLista()
    {
        DataSet ds = new DataSet();
        ds = objNegProducto.productosLista();

        if (ds.Tables[0].Rows.Count > 0)
        {
            grvProducto.DataSource = ds.Tables[0];
            grvProducto.DataBind();// esto es lo que hace que la base de dato se pase al datagriview
        }
        //else
        //    Response.Write("<script>window.alert('AVISO: No existe Productos en el sistema.')</script>");
    }



    #endregion

    #region Metodos OnClick Producto

    protected void btn_NuevoProducto_Click(object sender, EventArgs e)
    {
        btn_BorrarProducto.Enabled = false;
        btn_ModificarProducto.Enabled = false;
        grvProducto.Enabled = false;
        btnGrabarProducto.Enabled = true;
        btnCancelarProducto.Enabled = true;
        HabilitarTexBoxProducto();
        VaciaTextBoxProducto();
    }
    protected void btnGrabarProducto_Click(object sender, EventArgs e)
    {
        int nGrabados = -1;
        TextBoxAObjetoProducto();
        nGrabados = objNegProducto.abmProducto("AGREGAR", objEntProducto);

        productosLista();
        VaciaTextBoxProducto();
        DesHabilitarBotonesProducto();
        DesHabilitarTexBoxProducto();
        if (nGrabados != -1)
            Response.Write("<script>window.alert('AVISO: Producto insertado correctamente.')</script>");
        else
            Response.Write("<script>window.alert('AVISO:  Producto No insertado.')</script>");
    }

    protected void btn_ModificarProcuto_Click(object sender, EventArgs e)
    {
        int nresultado = -1;
        TextBoxAObjetoProducto();
        objEntProducto.ProductoId = Convert.ToInt16(grvProducto.DataKeys[grvProducto.SelectedIndex].Value.ToString());
        nresultado = objNegProducto.abmProducto("MODIFICAR", objEntProducto);

        productosLista();
        DesHabilitarBotonesProducto();
        VaciaTextBoxProducto();
        DesHabilitarTexBoxProducto();

        if (nresultado != -1)
            Response.Write("<script>window.alert('AVISO: El producto fue modificado.')</script>");
        else
            Response.Write("<script>window.alert('AVISO: El producto NO fue modificado.')</script>");
    }

    protected void btn_BorrarProducto_Click(object sender, EventArgs e)
    {
        int nResultado = -1;
        TextBoxAObjetoProducto();
        objEntProducto.ProductoId = Convert.ToInt16(grvProducto.DataKeys[grvProducto.SelectedIndex].Value.ToString());
        nResultado = objNegProducto.abmProducto("BORRAR", objEntProducto);

        productosLista();
        VaciaTextBoxProducto();
        DesHabilitarBotonesProducto();
        DesHabilitarTexBoxProducto();

        if (nResultado != -1)
            Response.Write("<script>window.alert('AVISO: El producto fue borrado.')</script>");
        else
            Response.Write("<script>window.alert('AVISO: El producto NO fue borrado.'')</script>");
    }
    protected void btnCancelarProducto_Click(object sender, EventArgs e)
    {
        VaciaTextBoxProducto();
        DesHabilitarBotonesProducto();
    }
    protected void btn_busquedaProducto_Click(object sender, EventArgs e)
    {
        try
        {
            String sql = "select * from tbl_Productos where " + DropDownListProducto.SelectedValue.ToString() + " like '%" + txt_busquedaProducto.Text + "%'";

            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            this.grvProducto.DataSource = dt;
            grvProducto.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }



    protected void btn_fecha_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
        HabilitarTexBoxProducto();
        HabilitarBotonesProductos();
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        txt_fechaVencimiento.Text = Calendar1.SelectedDate.ToString("dd MMMM yyyy");
        Calendar1.Visible = false;
        DesHabilitarGrid1();
        HabilitarTexBoxProducto();
        HabilitarBotonesProductos();
    }

    protected void grvProducto_SelectedIndexChanged(object sender, EventArgs e)
    {
        HabilitarTexBoxProducto();
        DesHabilitarGrid1();


        DataSet ds = new DataSet();
        objEntProducto.ProductoId = Convert.ToInt32(grvProducto.DataKeys[grvProducto.SelectedIndex].Value.ToString());
        ds = objNegProducto.productoSeleccionado(objEntProducto.ProductoId);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ObjetoATextBoxProducto(ds);

        }
    }

    #endregion

    #region Metodos Adicionales Categoria

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
      
    }
    #endregion

    #region Metodos OnClick Categoria


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

        btnGrabarProducto.Enabled = true;
        btnCancelarProducto.Enabled = true;
        btn_ModificarProducto.Enabled = true;
        btn_BorrarProducto.Enabled = false;

        DataSet ds = new DataSet();
        objEntCategoria.CategoriaId = Convert.ToInt32(grvListadoCategoria.DataKeys[grvListadoCategoria.SelectedIndex].Value.ToString());
        ds = objNegCategoria.seleccionaCategoria(objEntCategoria.CategoriaId);
        if (ds.Tables[0].Rows.Count > 0)
        {
            // ObjetoATextBox(ds);
            ObjetoATextBoxCategoriaProducto(ds);
            HabilitarTexBoxProducto();
        }
    }

    #endregion





}