using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using System.Data;
using System.Data.Sql;
using CapaEntidades;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class D_Categoria : D_ConexionBD
    {
        public D_Categoria()
        {

        }
        //Metodo que Insertar, Modifica y Elimina (Procedimiento)
        #region Abm
        public int abmCategoria(string pAccion, E_Categoria objE_Categoria)
        {
            int Resultado = 0;
            SqlCommand cmd = new SqlCommand("usp_Ventas_abmCategoria", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Accion", pAccion);
            cmd.Parameters.AddWithValue("@categoriaId", objE_Categoria.CategoriaId);
            cmd.Parameters.AddWithValue("@descripcion", objE_Categoria.Descripcion);
            try
            {
                AbrirConexion();
                Resultado = cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Error al tratar de almacenar, Borrar o Modificar datos de Categoria", e);
            }
            finally
            {
                CerrarConexion();
                cmd.Dispose();
            }
            return Resultado;
        } 
        #endregion

        //muestra una lista completa de todas las categorias (Procedimiento)
        #region Lista
        public DataSet listadoCategoria()
        {
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();

            try
            {
                AbrirConexion();
                cmd.Connection = Conexion;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_Ventas_listadoCategoria";

                da.SelectCommand = cmd;
                da.Fill(ds);
            }
            catch (Exception e)
            {
                throw new Exception("Error al solicitar los datos de categoria", e);
            }
            finally
            {
                Conexion.Close();
                cmd.Dispose();
            }
            return ds;
        } 
        #endregion

        //Permite seleccionar las categorias segun su id (Procedimiento)
        #region Seleccion
        public DataSet seleccionaCategoria(int pIdCategoria)
        {
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();

            try
            {
                AbrirConexion();
                cmd.Connection = Conexion;
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.CommandText = "usp_Ventas_seleccionaCategoria";

                cmd.Parameters.AddWithValue("@categoriaId", pIdCategoria);

                da.SelectCommand = cmd;
                da.Fill(ds);
            }
            catch (Exception e)
            {
                throw new Exception("Error al solicitar los datos de categoria ", e);
            }
            finally
            {
                Conexion.Close();
                cmd.Dispose();
            }
            return ds;
        } 
        #endregion



    }
}
