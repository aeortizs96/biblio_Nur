using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CapaEntidades;
using CapaNegocios;
using System.Data.SqlClient;


public partial class P_Cliente : System.Web.UI.Page
{
    public E_Cliente objEntCliente = new E_Cliente();
    public N_Cliente objNegCliente = new N_Cliente();

    public SqlConnection cn = new SqlConnection("Data Source=ANDREA\\SQLEXPRESS;Initial Catalog=SistemasDeVentas;Integrated Security=True");


    protected void Page_Load(object sender, EventArgs e)
    {
        ListadoClientes();
        btn_Modificar.Enabled = false;
        btn_Borrar.Enabled = false;
        btnGrabarCliente.Enabled = false;
        btnCancelar.Enabled = false;
        DesHabilitarTextBox();
        HabilitarBotones();
    }

    #region Metodos Adicionales
    private void HabilitarBotones()
    {
        btn_Borrar.Enabled = false;
        btn_Modificar.Enabled = false;
        grvListadoCliente.Enabled = true;
        btnGrabarCliente.Enabled = false;
        btnCancelar.Enabled = false;
    }

    private void DesHabilitarTextBox()
    {
        txt_nit.Enabled = false;
        txt_nombre.Enabled = false;
        txt_apellido.Enabled = false;
        txt_direccion.Enabled = false;
        txt_sexo.Enabled = false;
        txt_telefono.Enabled = false;
        txt_email.Enabled = false;
    }

    private void HabilitarTextBox()
    {
        txt_nit.Enabled = true;
        txt_nombre.Enabled = true;
        txt_apellido.Enabled = true;
        txt_direccion.Enabled = true;
        txt_sexo.Enabled = true;
        txt_telefono.Enabled = true;
        txt_email.Enabled = true;
    }

    //metodo que deja en blanco el texbox despues de guardar, borrar o modificar
    private void VaciaTextBox()
    {
        txt_nit.Text = string.Empty;
        txt_nombre.Text = string.Empty;
        txt_apellido.Text = string.Empty;
        txt_direccion.Text = string.Empty;
        txt_telefono.Text = string.Empty;
        txt_sexo.Text = string.Empty;
        txt_email.Text = string.Empty;
    }
    //metodo que obtiene lo que este escrito en los txtbox
    private void TextBoxAObjeto()
    {
        objEntCliente.Nit = txt_nit.Text;
        objEntCliente.Nombres = txt_nombre.Text;
        objEntCliente.Apellidos = txt_apellido.Text;
        objEntCliente.Telefono = txt_telefono.Text;
        objEntCliente.Email = txt_email.Text;
        objEntCliente.Sexo = txt_sexo.Text;
        objEntCliente.Direccion = txt_direccion.Text;
    }

    //metodo que pasa los parametros de la entidad  a los textbox
    private void ObjetoATextBox(DataSet ds)
    {
        txt_nit.Text = ds.Tables[0].Rows[0]["nit"].ToString();
        txt_nombre.Text = ds.Tables[0].Rows[0]["nombres"].ToString();
        txt_apellido.Text = ds.Tables[0].Rows[0]["apellidos"].ToString();
        txt_telefono.Text = ds.Tables[0].Rows[0]["telefono"].ToString();
        txt_direccion.Text = ds.Tables[0].Rows[0]["direccion"].ToString();
        txt_email.Text = ds.Tables[0].Rows[0]["email"].ToString();
        txt_sexo.Text = ds.Tables[0].Rows[0]["sexo"].ToString();
    }

    //metodo que llama a la consulta para mostrar la lista de categorias
    private void ListadoClientes()
    {
        DataSet ds = new DataSet();
        ds = objNegCliente.listadoCliente();
        if (ds.Tables[0].Rows.Count > 0)
        {
            grvListadoCliente.DataSource = ds.Tables[0];
            grvListadoCliente.DataBind();// esto es lo que hace que la base de dato se pase al datagriview
        }
        else
            Response.Write("<script>window.alert('AVISO: No existe Clientes en el sistema.')</script>");
    }
    #endregion

    #region Metodos OnClick
        protected void btn_NuevoCliente_Click(object sender, EventArgs e)
    {
        VaciaTextBox();
        HabilitarBotones();
        HabilitarTextBox();
        btn_Borrar.Enabled = false;
        btn_Modificar.Enabled = false;
        grvListadoCliente.Enabled = false;
        btnGrabarCliente.Enabled = true;
        btnCancelar.Enabled = true;

    }

    protected void btn_Borrar_Click(object sender, EventArgs e)
    {
        int nResultado = -1;
        TextBoxAObjeto();
        objEntCliente.ClienteId = Convert.ToInt16(grvListadoCliente.DataKeys[grvListadoCliente.SelectedIndex].Value.ToString());
        nResultado = objNegCliente.abmCliente("BORRAR", objEntCliente);

        ListadoClientes();
        VaciaTextBox();
        DesHabilitarTextBox();

        if (nResultado != -1)
            Response.Write("<script>window.alert('AVISO: EL cliente fue borrado.')</script>");
        else
            Response.Write("<script>window.alert('AVISO: El cliente no pudo ser borrado.')</script>");
    }

    protected void btn_Modificar_Click(object sender, EventArgs e)
    {
        int nresultado = -1;
        TextBoxAObjeto();
        objEntCliente.ClienteId = Convert.ToInt32(grvListadoCliente.DataKeys[grvListadoCliente.SelectedIndex].Value.ToString());
        nresultado = objNegCliente.abmCliente("MODIFICAR", objEntCliente);

        ListadoClientes();
        DesHabilitarTextBox();
        VaciaTextBox();

        if (nresultado != -1)
            Response.Write("<script>window.alert('AVISO: el cliente fue modificado.')</script>");
        else
            Response.Write("<script>window.alert('AVISO: el cliente no fue modificado.')</script>");
    }


    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        VaciaTextBox();
        HabilitarBotones();
        DesHabilitarTextBox();
    }
    protected void btnGrabarCliente_Click(object sender, EventArgs e)
    {
        int nGrabados = -1;
        TextBoxAObjeto();
        nGrabados = objNegCliente.abmCliente("AGREGAR", objEntCliente);

        VaciaTextBox();
        ListadoClientes();
        DesHabilitarTextBox();

        if (nGrabados != -1)
            Response.Write("<script>window.alert('AVISO: La consulta Se inserto correctamente.')</script>");
        else
            Response.Write("<script>window.alert('AVISO:  La consulta no se inserto correctamente.')</script>");
    }
    protected void grvListadoCliente_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        objEntCliente.ClienteId = Convert.ToInt32(grvListadoCliente.DataKeys[grvListadoCliente.SelectedIndex].Value.ToString());

        btn_Borrar.Enabled = true;
        btn_Modificar.Enabled = true;
        btnGrabarCliente.Enabled = false;
        btnCancelar.Enabled = true;
        HabilitarTextBox();

        ds = objNegCliente.seleccionaCliente(objEntCliente.ClienteId);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ObjetoATextBox(ds);
        }
    }

    protected void btn_busqueda_Click(object sender, EventArgs e)
    {
        try
        {
            String sql = "select * from tbl_Clientes where " + DropDownList2.SelectedValue.ToString() + " like '%" + txt_busqueda.Text + "%'";

            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            this.grvListadoCliente.DataSource = dt;
            grvListadoCliente.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    #endregion


}