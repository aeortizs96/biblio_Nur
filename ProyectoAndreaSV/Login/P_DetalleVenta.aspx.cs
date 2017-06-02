
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

public partial class P_DetalleVenta : System.Web.UI.Page
{

    public E_DetalleVenta objEntDetalleVenta = new E_DetalleVenta();
    public N_DetalleVenta objNegDetalleVenta = new N_DetalleVenta();

    public E_Producto objEntProducto = new E_Producto();
    private N_Producto1 objNegProducto = new N_Producto1();


    //conexion necesaria para el filtro
    public SqlConnection cn = new SqlConnection("Data Source=ANDREA\\SQLEXPRESS;Initial Catalog=SistemasDeVentas;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        ListadoProducto();
        ListadoDetalleVenta();
        DesHabilitarBotonesVenta();
        DesHabilitarTexBoxVenta();
    }

    #region Metodos Adicionales Detalle de venta

    private void DesHabilitarBotonesVenta()
    {
        btn_BorrarVenta.Enabled = false;
        btn_ModificarVenta.Enabled = false;
        grvDetalleVenta.Enabled = true;
        btnGrabarVenta.Enabled = false;
        btnCancelarVenta.Enabled = false;

    }
    private void DesHabilitarGrid1()
    {
        btn_BorrarVenta.Enabled = true;
        btn_ModificarVenta.Enabled = true;
        grvDetalleVenta.Enabled = false;
        btnGrabarVenta.Enabled = false;
        btnCancelarVenta.Enabled = true;
    }

    private void HabilitarBotonesVenta()
    {
        btn_BorrarVenta.Enabled = true;
        btn_ModificarVenta.Enabled = true;
        grvDetalleVenta.Enabled = true;
        btnGrabarVenta.Enabled = true;
        btnCancelarVenta.Enabled = true;


    }

    private void HabilitarTexBoxVenta()
    {
        txt_ventaId.Enabled = false;
        txt_clienteId.Enabled = false;
        txt_nombreCliente.Enabled = false;
        txt_fechaVencimiento.Enabled = true;
        txt_numeroDocumento.Enabled = true;
        DropDownListtipoDocumento.Enabled = true;

    }

    private void DesHabilitarTexBoxVenta()
    {
        txt_ventaId.Enabled = false;
        txt_clienteId.Enabled = false;
        txt_nombreCliente.Enabled = false;
        txt_fechaVencimiento.Enabled = false;
        txt_numeroDocumento.Enabled = false;
        DropDownListtipoDocumento.Enabled = false;

    }
    //metodo que deja en blanco el texbox despues de guardar, borrar o modificar
    private void VaciaTextBoxVenta()
    {
        txt_ventaId.Text = string.Empty;
        txt_clienteId.Text = string.Empty;
        txt_nombreCliente.Text = string.Empty;
        txt_fechaVencimiento.Text = string.Empty;
        txt_numeroDocumento.Text = string.Empty;


    }
    //metodo que obtiene lo que este escrito en los txtbox
    //private void TextBoxAObjetoVenta()
    //{
    //    objEntDetalleVenta.ClienteId.ClienteId = Convert.ToInt32(txt_clienteId.Text);
    //    objEntDetalleVenta.FechaVenta = txt_fechaVencimiento.Text;
    //    objEntDetalleVenta.NumeroDocumento = txt_numeroDocumento.Text;
    //    //objEntVenta.TipoDocumento = txt_tipoDocumento.Text;
    //    objEntDetalleVenta.TipoDocumento = DropDownListtipoDocumento.Text;
    //}
    //metodo que pasa los parametros de la entidad  a los textbox

    private void ObjetoATextBoxDetalleVenta(DataSet ds)
    {


        //txt_.Text = ds.Tables[0].Rows[0]["detalleId"].ToString();
        //txt_clienteId.Text = ds.Tables[0].Rows[0]["ventaId"].ToString();
        ////txt_nombreCliente.Text = ds.Tables[0].Rows[0]["nombres"].ToString() + ds.Tables[0].Rows[0]["apellidos"].ToString();
        //txt_fechaVencimiento.Text = ds.Tables[0].Rows[0]["productoId"].ToString();
        //txt_numeroDocumento.Text = ds.Tables[0].Rows[0]["cantidad"].ToString();
        //txt_numeroDocumento.Text = ds.Tables[0].Rows[0]["precioUnitario"].ToString();

    }

    // METODO QUE SEGUN LA FILA QUE SEA SELECCIONADA EN EL MODAL SE RELLENARAN LOS TXT DE LA PAGINA
    private void ObjetoATextBoxClienteVenta(DataSet ds)
    {
        txt_clienteId.Text = ds.Tables[0].Rows[0]["productoId"].ToString();
        txt_nombreCliente.Text = ds.Tables[0].Rows[0]["descripcionP"].ToString();
    }

    //metodo que limpia todos los textbox de productos
    protected void btn_limpieza_Click(object sender, EventArgs e)
    {
        txt_ventaId.Text = string.Empty;
        txt_clienteId.Text = string.Empty;
        txt_nombreCliente.Text = string.Empty;
        txt_fechaVencimiento.Text = string.Empty;
        txt_numeroDocumento.Text = string.Empty;



    }


    private void ListadoDetalleVenta()
    {
        DataSet ds = new DataSet();
        ds = objNegDetalleVenta.listaDetalleVenta();

        if (ds.Tables[0].Rows.Count > 0)
        {
            grvDetalleVenta.DataSource = ds.Tables[0];
            grvDetalleVenta.DataBind();// esto es lo que hace que la base de dato se pase al datagriview
        }
    }


    private void CargarDetalle(E_Venta venta)
    {

    }

    #endregion

    //#region Metodos OnClick Detalle de venta

    //protected void btn_NuevoVenta_Click(object sender, EventArgs e)
    //{
    //    btn_BorrarVenta.Enabled = false;
    //    btn_ModificarVenta.Enabled = false;
    //    grvDetalleVenta.Enabled = false;
    //    btnGrabarVenta.Enabled = true;
    //    btnCancelarVenta.Enabled = true;
    //    HabilitarTexBoxVenta();
    //    VaciaTextBoxVenta();

    //}


    //protected void btnGrabarVenta_Click(object sender, EventArgs e)
    //{
    //    //int nGrabados = -1;
    //    //TextBoxAObjetoVenta();
    //    //nGrabados = objNegVenta.abmVenta("AGREGAR", objEntVenta);

    //    //ListadoDetalleVenta();
    //    //VaciaTextBoxVenta();
    //    //DesHabilitarBotonesVenta();
    //    //DesHabilitarTexBoxVenta();



    //    //if (nGrabados != -1)
    //    //    //Response.Write("<script>window.alert('AVISO: Venta insertada correctamente.')</script>");
    //    //    CargarDetalle(objEntVenta);
    //    //else
    //    //    Response.Write("<script>window.alert('AVISO:  Venta No insertada.')</script>");
    //}
    //protected void btn_ModificarVenta_Click(object sender, EventArgs e)
    //{
    //    //int nresultado = -1;
    //    //TextBoxAObjetoVenta();
    //    //objEntVenta.VentaId = Convert.ToInt16(grvDetalleVenta.DataKeys[grvDetalleVenta.SelectedIndex].Value.ToString());
    //    //nresultado = objNegVenta.abmVenta("MODIFICAR", objEntVenta);

    //    //ListadoDetalleVenta();
    //    //DesHabilitarBotonesVenta();
    //    //VaciaTextBoxVenta();
    //    //DesHabilitarTexBoxVenta();


    //    //if (nresultado != -1)
    //    //    Response.Write("<script>window.alert('AVISO: La venta fue modificada.')</script>");
    //    //else
    //    //    Response.Write("<script>window.alert('AVISO: La venta NO fue modificada.')</script>");
    //}
    //protected void btn_BorrarVenta_Click(object sender, EventArgs e)
    //{
    //    //int nResultado = -1;
    //    //TextBoxAObjetoVenta();
    //    //objEntVenta.VentaId = Convert.ToInt16(grvDetalleVenta.DataKeys[grvDetalleVenta.SelectedIndex].Value.ToString());
    //    //nResultado = objNegVenta.abmVenta("BORRAR", objEntVenta);

    //    //ListadoDetalleVenta();
    //    //VaciaTextBoxVenta();
    //    //DesHabilitarBotonesVenta();
    //    //DesHabilitarTexBoxVenta();


    //    //if (nResultado != -1)
    //    //    Response.Write("<script>window.alert('AVISO: La venta fue borrada.')</script>");
    //    //else
    //    //    Response.Write("<script>window.alert('AVISO: La venta NO fue borrada.'')</script>");
    //}
    //protected void btnCancelarVenta_Click(object sender, EventArgs e)
    //{
    //    VaciaTextBoxVenta();
    //    DesHabilitarBotonesVenta();

    //}

    //protected void btn_fecha_Click(object sender, EventArgs e)
    //{
    //    Calendar1.Visible = true;
    //    HabilitarTexBoxVenta();
    //    HabilitarBotonesVenta();
    //}

    ////Metodo que permite seleccionar los item del grid y asignarselos a los texbo
    //protected void grvVenta_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    //HabilitarTexBoxVenta();
    //    //DesHabilitarGrid1();


    //    //DataSet ds = new DataSet();
    //    //objEntVenta.VentaId = Convert.ToInt32(grvDetalleVenta.DataKeys[grvDetalleVenta.SelectedIndex].Value.ToString());
    //    //ds = objNegVenta.seleccionaVenta(objEntVenta.VentaId);
    //    //if (ds.Tables[0].Rows.Count > 0)
    //    //{
    //    //    ObjetoATextBoxDetalleVenta(ds);
    //    //    //traspasar Nombre y apellido a los textbox
    //    //    GridViewRow row = grvDetalleVenta.SelectedRow;
    //    //    txt_nombreCliente.Text = row.Cells[5].Text + row.Cells[6].Text;

    //    //}
    //}


    //protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    //{
    //    txt_fechaVencimiento.Text = Calendar1.SelectedDate.ToString("dd MMMM yyyy");
    //    Calendar1.Visible = false;
    //    DesHabilitarGrid1();
    //    HabilitarTexBoxVenta();
    //    HabilitarBotonesVenta();
    //}

    //protected void btn_busquedaVenta_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        String sql = "SELECT dbo.tbl_Clientes.clienteId AS Expr1, dbo.tbl_Clientes.nombres, dbo.tbl_Clientes.apellidos, dbo.tbl_Ventas.clienteId, dbo.tbl_Ventas.ventaId, dbo.tbl_Ventas.fechaVenta, dbo.tbl_Ventas.numeroDocumento, dbo.tbl_Ventas.tipoDocumento FROM dbo.tbl_Clientes INNER JOIN dbo.tbl_Ventas ON dbo.tbl_Clientes.clienteId = dbo.tbl_Ventas.clienteId where "
    //            + DropDownListVenta.SelectedValue.ToString() + " like '%" + txt_busquedaDetalleVenta.Text + "%'";

    //        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
    //        DataTable dt = new DataTable();
    //        da.Fill(dt);
    //        this.grvDetalleVenta.DataSource = dt;
    //        grvDetalleVenta.DataBind();
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}

    //#endregion

    #region Metodos Adicionales Producto
    //metodo que llama a la consulta para mostrar la lista de categorias
    private void ListadoProducto()
    {
        DataSet ds = new DataSet();
        ds = objNegProducto.productosLista();
        if (ds.Tables[0].Rows.Count > 0)
        {
            grvListadoProducto.DataSource = ds.Tables[0];
            grvListadoProducto.DataBind();// esto es lo que hace que la base de dato se pase al datagriview
        }

    }
    #endregion

    #region Metodos OnClick Producto


    protected void btn_busqueda_Click(object sender, EventArgs e)
    {
        try
        {
            String sql = "select * from tbl_Productos where descripcion like '%" + txt_busqueda.Text + "%'";
            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            this.grvListadoProducto.DataSource = dt;
            grvListadoProducto.DataBind();

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }




    #endregion


    protected void grvListadoProducto_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        objEntProducto.ProductoId = Convert.ToInt32(grvListadoProducto.DataKeys[grvListadoProducto.SelectedIndex].Value.ToString());
        ds = objNegProducto.productoSeleccionado(objEntProducto.ProductoId);
        if (ds.Tables[0].Rows.Count > 0)
        {

            ObjetoATextBoxClienteVenta(ds);
            HabilitarTexBoxVenta();
            HabilitarBotonesVenta();

        }
    }
}