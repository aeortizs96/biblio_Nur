using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class D_Producto : D_ConexionBD
    {
        public D_Producto()
        {

        }


        //Metodo que Insertar, Modifica y Elimina producto (Procedimiento)
        #region ABM
        public int abmProducto(string pAccion, E_Producto objE_Producto)
        {
            int Resultado = 0;
            SqlCommand cmd = new SqlCommand("usp_Ventas_abmProducto", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Accion", pAccion);
            cmd.Parameters.AddWithValue("@productoId", objE_Producto.ProductoId);
            cmd.Parameters.AddWithValue("@categoriaId", objE_Producto.CategoriaId);
            cmd.Parameters.AddWithValue("@nombre", objE_Producto.Nombre);
            cmd.Parameters.AddWithValue("@descripcionP", objE_Producto.Descripcion);
            cmd.Parameters.AddWithValue("@stock", objE_Producto.Stock);
            cmd.Parameters.AddWithValue("@precioCompra", objE_Producto.PrecioCompra);
            cmd.Parameters.AddWithValue("@precioVenta", objE_Producto.PrecioVenta);
            cmd.Parameters.AddWithValue("@fechaVencimiento", objE_Producto.FechaVencimiento);
            cmd.Parameters.AddWithValue("@imagen", objE_Producto.Imagen);
            try
            {
                AbrirConexion();
                Resultado = cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Error al tratar de almacenar, Borrar o Modificar datos de Productos", e);
            }
            finally
            {
                CerrarConexion();
                cmd.Dispose();
            }
            return Resultado;
        } 
        #endregion

        //muestra una lista completa de todas las Productos (Procedimiento)
        #region Lista
        public DataSet productosLista()
        {
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();

            try
            {
                AbrirConexion();
                cmd.Connection = Conexion;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_Ventas_listadoProducto";

                da.SelectCommand = cmd;
                da.Fill(ds);
            }
            catch (Exception e)
            {
                throw new Exception("Error al solicitar los datos de Producto", e);
            }
            finally
            {
                Conexion.Close();
                cmd.Dispose();
            }
            return ds;
        } 
        #endregion

        //Permite seleccionar los productos segun su id (Procedimiento)
        #region Seleccion
        public DataSet productoSeleccionado(int pIdProducto)
        {
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();

            try
            {
                AbrirConexion();
                cmd.Connection = Conexion;
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.CommandText = "usp_Ventas_productoSeleccionado";

                cmd.Parameters.AddWithValue("@productoId", pIdProducto);

                da.SelectCommand = cmd;
                da.Fill(ds);
            }
            catch (Exception e)
            {
                throw new Exception("Error al solicitar los datos de Producto", e);
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

