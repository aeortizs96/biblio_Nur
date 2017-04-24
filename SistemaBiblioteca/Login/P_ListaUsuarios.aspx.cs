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

public partial class P_ListaUsuarios : System.Web.UI.Page
{
    public E_Usuario objEntUsuario = new E_Usuario();
    public N_Registro objNegUsuario = new N_Registro();

    public SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        ListadoUsuarios();
    }


    #region Metodos Adicionales

    private void HabilitarBotones()
    {

    }

    private void DesHabilitarTextBox()
    {

    }

    private void HabilitarTextBox()
    {

    }

    //metodo que deja en blanco el texbox despues de guardar, borrar o modificar
    private void VaciaTextBox()
    {
        txt_usuariId.Text = string.Empty;
        txt_nombreCompleto.Text = string.Empty;
        txt_nombreUsuario.Text = string.Empty;
        txt_contrasena.Text = string.Empty;
        txt_correo.Text = string.Empty;
        txt_sexo.Text = string.Empty;
        txt_tipo.Text = string.Empty;
    }


    //metodo que obtiene lo que este escrito en los txtbox
    private void TextBoxAObjeto()
    {

        objEntUsuario.Correo = txt_correo.Text;
        objEntUsuario.Contrasena = txt_contrasena.Text;
        objEntUsuario.NombreCompleto = txt_nombreCompleto.Text;
        objEntUsuario.NombreUsuario = txt_nombreUsuario.Text;
        objEntUsuario.Sexo = txt_sexo.Text;
        objEntUsuario.Tipo = txt_tipo.Text;
    }

    //metodo que pasa los parametros de la entidad  a los textbox
    private void ObjetoATextBox(DataSet ds)
    {
        txt_usuariId.Text = ds.Tables[0].Rows[0]["usuarioId"].ToString();
        txt_correo.Text = ds.Tables[0].Rows[0]["correo"].ToString();
        txt_contrasena.Text = ds.Tables[0].Rows[0]["contrasena"].ToString();
        txt_nombreCompleto.Text = ds.Tables[0].Rows[0]["nombreCompleto"].ToString();
        txt_nombreUsuario.Text = ds.Tables[0].Rows[0]["nombreUsuario"].ToString();
        txt_sexo.Text = ds.Tables[0].Rows[0]["sexo"].ToString();
        txt_tipo.Text = ds.Tables[0].Rows[0]["tipo"].ToString();
    }


    private void ListadoUsuarios()
    {
        DataSet ds = new DataSet();
        ds = objNegUsuario.listadoUsuario();
        if (ds.Tables[0].Rows.Count > 0)
        {
            grvListadoUsuario.DataSource = ds.Tables[0];
            grvListadoUsuario.DataBind();// esto es lo que hace que la base de dato se pase al datagriview
        }
        else
            Response.Write("<script>window.alert('AVISO: No existe Usuarios en el sistema.')</script>");
    }
    #endregion

    #region Metodos Onclick


    protected void btn_busqueda_Click(object sender, EventArgs e)
    {
        try
        {
            String sql = "select * from tbl_Usuario where " + DropDownList2.SelectedValue.ToString() + " like '%" + txt_busqueda.Text + "%'";

            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            this.grvListadoUsuario.DataSource = dt;
            grvListadoUsuario.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void btn_Modificar_Click(object sender, EventArgs e)
    {
        int nresultado = -1;
        TextBoxAObjeto();
        objEntUsuario.UsuarioId = Convert.ToInt32(grvListadoUsuario.DataKeys[grvListadoUsuario.SelectedIndex].Value.ToString());
        nresultado = objNegUsuario.abmUsuario("MODIFICAR", objEntUsuario);

        ListadoUsuarios();
        DesHabilitarTextBox();
        VaciaTextBox();

        if (nresultado != -1)
            Response.Write("<script>window.alert('AVISO: el usuario fue modificado.')</script>");
        else
            Response.Write("<script>window.alert('AVISO: el usuario no fue modificado.')</script>");
    }
    protected void btn_Borrar_Click(object sender, EventArgs e)
    {
        int nResultado = -1;
        TextBoxAObjeto();
        objEntUsuario.UsuarioId = Convert.ToInt16(grvListadoUsuario.DataKeys[grvListadoUsuario.SelectedIndex].Value.ToString());
        nResultado = objNegUsuario.abmUsuario("BORRAR", objEntUsuario);

        ListadoUsuarios();
        VaciaTextBox();
        DesHabilitarTextBox();

        if (nResultado != -1)
            Response.Write("<script>window.alert('AVISO: EL usuario fue borrado.')</script>");
        else
            Response.Write("<script>window.alert('AVISO: El usuario no pudo ser borrado.')</script>");
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        VaciaTextBox();
        HabilitarBotones();
        DesHabilitarTextBox();
        pnlAltas.Visible = false;
    }
    #endregion

    protected void grvListadoUsuario_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        objEntUsuario.UsuarioId = Convert.ToInt32(grvListadoUsuario.DataKeys[grvListadoUsuario.SelectedIndex].Value.ToString());

        btn_Borrar.Enabled = true;
        btn_Modificar.Enabled = true;
        btnCancelar.Enabled = true;
        HabilitarTextBox();

        ds = objNegUsuario.seleccionaUsuario(objEntUsuario.UsuarioId);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ObjetoATextBox(ds);
        }
    }
    protected void btn_editar_Click(object sender, EventArgs e)
    {
        pnlAltas.Visible = true;
    }
}