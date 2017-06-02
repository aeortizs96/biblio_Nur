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
    public class D_DetalleVenta : D_ConexionBD
    {
        public D_DetalleVenta()
        {

        }

        //Insertar, Modifica y Elimina Venta (Procedimiento)
        #region Abm
        public int abmDetalleVenta(string pAccion, E_DetalleVenta objE_DetalleVenta)
        {
            int Resultado = 0;

            SqlCommand cmd = new SqlCommand("usp_Ventas_abmDetalleVentas", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Accion", pAccion);
            cmd.Parameters.AddWithValue("@detalleId", objE_DetalleVenta.DetalleId);
            cmd.Parameters.AddWithValue("@ventaId", objE_DetalleVenta.VentaId.VentaId);
            cmd.Parameters.AddWithValue("@productoId", objE_DetalleVenta.ProductoId.ProductoId);
            cmd.Parameters.AddWithValue("@cantidad", objE_DetalleVenta.Cantidad);
            cmd.Parameters.AddWithValue("@precioUnitario", objE_DetalleVenta.PrecioUnitario);

            try
            {
                AbrirConexion();
                Resultado = cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Error al tratar de almacenar, Borrar o Modificar datos de Detalle de Ventas", e);
            }
            finally
            {
                CerrarConexion();
                cmd.Dispose();
            }
            return Resultado;
        }
        #endregion

        //muestra una lista completa de todos los detalles de ventas (Procedimiento)
        #region Lista
        public DataSet listaDetalleVenta()
        {
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();

            try
            {
                AbrirConexion();
                cmd.Connection = Conexion;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_Ventas_listadoDetalleVenta";


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

        //Permite seleccionar los detalles de ventas segun su id (Procedimiento)
        #region Seleccion
        public DataSet seleccionaDetalleVenta(int pIdDetalleVenta)
        {
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();

            try
            {
                AbrirConexion();
                cmd.Connection = Conexion;
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.CommandText = "usp_Ventas_seleccionaDetalleVenta";

                cmd.Parameters.AddWithValue("@detalleId", pIdDetalleVenta);

                da.SelectCommand = cmd;
                da.Fill(ds);
            }
            catch (Exception e)
            {
                throw new Exception("Error al solicitar los datos de Detalle de ventas ", e);
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
