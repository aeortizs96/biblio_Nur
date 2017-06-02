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
    public class D_Venta : D_ConexionBD
    {
        public D_Venta()
        {

        }

        //Insertar, Modifica y Elimina Venta (Procedimiento)
        #region Abm
        public int abmVenta(string pAccion, E_Venta objE_Venta)
        {
            
            int Resultado = 0;
            SqlCommand cmd = new SqlCommand("usp_Ventas_abmVentas", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Accion", pAccion);
            cmd.Parameters.AddWithValue("@ventaId", objE_Venta.VentaId);
            cmd.Parameters.AddWithValue("@clienteId", objE_Venta.ClienteId.ClienteId);
            cmd.Parameters.AddWithValue("@fechaVenta", objE_Venta.FechaVenta);
            cmd.Parameters.AddWithValue("@numeroDocumento", objE_Venta.NumeroDocumento);
            cmd.Parameters.AddWithValue("@tipoDocumento", objE_Venta.TipoDocumento);
           
            try
            {
                AbrirConexion();
                Resultado = cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Error al tratar de almacenar, Borrar o Modificar datos de Ventas", e);
            }
            finally
            {
                CerrarConexion();
                cmd.Dispose();
            }
            return Resultado;
        }
        #endregion

        //muestra una lista completa de todas las ventas (Procedimiento)
        #region Lista
        public DataSet listadoVenta()
        {
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();

            try
            {
                AbrirConexion();
                cmd.Connection = Conexion;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_Ventas_listadoVenta";
                                 

                da.SelectCommand = cmd;
                da.Fill(ds);
            }
            catch (Exception e)
            {
                throw new Exception("Error al solicitar los datos de ventas", e);
            }
            finally
            {
                Conexion.Close();
                cmd.Dispose();
            }
            return ds;
        }
        #endregion

        //Permite seleccionar las ventas segun su id (Procedimiento)
        #region Seleccion
        public DataSet seleccionaVenta(int pIdVenta)
        {
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();

            try
            {
                AbrirConexion();
                cmd.Connection = Conexion;
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.CommandText = "usp_Ventas_seleccionaVenta";

                cmd.Parameters.AddWithValue("@ventaId", pIdVenta);

                da.SelectCommand = cmd;
                da.Fill(ds);
            }
            catch (Exception e)
            {
                throw new Exception("Error al solicitar los datos de Ventas ", e);
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
