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
    public class D_Cliente : D_ConexionBD
    {

        public D_Cliente()
        {

        }
        //Insertar, Modifica y Elimina cliente (Procedimiento)
        #region Abm
        public int abmCliente(string pAccion, E_Cliente objE_Cliente)
        {
            int Resultado = 0;
            SqlCommand cmd = new SqlCommand("usp_Ventas_abmCliente", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Accion", pAccion);
            cmd.Parameters.AddWithValue("@clienteId", objE_Cliente.ClienteId);
            cmd.Parameters.AddWithValue("@nit", objE_Cliente.Nit);
            cmd.Parameters.AddWithValue("@nombres", objE_Cliente.Nombres);
            cmd.Parameters.AddWithValue("@apellidos", objE_Cliente.Apellidos);
            cmd.Parameters.AddWithValue("@telefono", objE_Cliente.Telefono);
            cmd.Parameters.AddWithValue("@direccion", objE_Cliente.Direccion);
            cmd.Parameters.AddWithValue("@email", objE_Cliente.Email);
            cmd.Parameters.AddWithValue("@sexo", objE_Cliente.Sexo);
            try
            {
                AbrirConexion();
                Resultado = cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Error al tratar de almacenar, Borrar o Modificar datos de Clientes", e);
            }
            finally
            {
                CerrarConexion();
                cmd.Dispose();
            }
            return Resultado;
        }
        #endregion

        //muestra una lista completa de todos los clientes (Procedimiento)
        #region Lista
        public DataSet listadoCliente()
        {
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();

            try
            {
                AbrirConexion();
                cmd.Connection = Conexion;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_Ventas_listadoCliente";

                da.SelectCommand = cmd;
                da.Fill(ds);
            }
            catch (Exception e)
            {
                throw new Exception("Error al solicitar los datos de cliente", e);
            }
            finally
            {
                Conexion.Close();
                cmd.Dispose();
            }
            return ds;
        }
        #endregion

        //Permite seleccionar los clientes segun su id (Procedimiento)
        #region Seleccion
        public DataSet seleccionaCliente(int pIdCliente)
        {
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();

            try
            {
                AbrirConexion();
                cmd.Connection = Conexion;
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.CommandText = "usp_Ventas_seleccionaCliente";

                cmd.Parameters.AddWithValue("@clienteId", pIdCliente);

                da.SelectCommand = cmd;
                da.Fill(ds);
            }
            catch (Exception e)
            {
                throw new Exception("Error al solicitar los datos de cliente ", e);
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
