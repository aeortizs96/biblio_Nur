using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Entidades;


namespace Datos
{
    public class D_Libro : D_ConexionBD
    {

        public D_Libro()
        {

        }


        //Metodo que Inserta Modifica y Elimina Libro
        public int abmLibro(string pAccion, E_Libro objE_Libro)
        {

            int Resultado = 0;
            SqlCommand cmd = new SqlCommand("usp_Biblioteca_abmLibro", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Accion", pAccion);
            cmd.Parameters.AddWithValue("@mfn", objE_Libro.Mfn);
            cmd.Parameters.AddWithValue("@titulo", objE_Libro.Titulo);
            cmd.Parameters.AddWithValue("@autor", objE_Libro.Autor);
            cmd.Parameters.AddWithValue("@editorial", objE_Libro.Editorial);
            cmd.Parameters.AddWithValue("@estados", objE_Libro.Estados);


            try
            {
                AbrirConexion();
                Resultado = cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Error al tratar de Insertar Borrar o Modificar datos de Libro", e);
            }
            finally
            {
                CerrarConexion();
                cmd.Dispose();
            }
            return Resultado;
        }

        //metodo que muestra una lista completa de todos los libro
        public DataSet listadoLibro()
        {
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();

            try
            {
                AbrirConexion();
                cmd.Connection = Conexion;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_Biblioteca_listadoLibros";

                da.SelectCommand = cmd;
                da.Fill(ds);
            }
            catch (Exception e)
            {
                throw new Exception("Error al solicitar los datos de libros", e);
            }
            finally
            {
                Conexion.Close();
                cmd.Dispose();
            }
            return ds;
        }

        //Metodo que permite seleccionar los libros segun su id
        public DataSet seleccionaLibro(string pIdLibro)
        {
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();

            try
            {
                AbrirConexion();
                cmd.Connection = Conexion;
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.CommandText = "usp_Biblioteca_seleccionaLibro";

                cmd.Parameters.AddWithValue("@mfn", pIdLibro);

                da.SelectCommand = cmd;
                da.Fill(ds);
            }
            catch (Exception e)
            {
                throw new Exception("Error al solicitar los datos del libro ", e);
            }
            finally
            {
                Conexion.Close();
                cmd.Dispose();
            }
            return ds;
        }




    }
}
