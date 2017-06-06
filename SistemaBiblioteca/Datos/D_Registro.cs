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
    public class D_Registro : D_ConexionBD
    {

        public D_Registro()
        {

        }
        //Metodo que inserta usuarios
        public int abmRegistro(E_Usuario objE_Usuario)
        {
            int Resultado = 0;
            SqlCommand cmd = new SqlCommand("usp_Seguridad_insRegistro", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@correo", objE_Usuario.Correo);
            cmd.Parameters.AddWithValue("@contrasena", objE_Usuario.Contrasena);
            cmd.Parameters.AddWithValue("@nombreCompleto", objE_Usuario.NombreCompleto);
            cmd.Parameters.AddWithValue("@nombreUsuario", objE_Usuario.NombreUsuario);
            cmd.Parameters.AddWithValue("@sexo", objE_Usuario.Sexo);
            cmd.Parameters.AddWithValue("@tipo", objE_Usuario.Tipo);
            try
            {
                AbrirConexion();
                Resultado = cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Error al tratar de almacenar, Borrar o Modificar datos de Atencion", e);
            }
            finally
            {
                CerrarConexion();
                cmd.Dispose();
            }
            return Resultado;
        }

        //Metodo que Modifica y Elimina usuario
        public int abmUsuario(string pAccion, E_Usuario objE_Usuario)
        {
            int Resultado = 0;
            SqlCommand cmd = new SqlCommand("usp_Seguridad_abmUsuario", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Accion", pAccion);
            cmd.Parameters.AddWithValue("@usuarioId", objE_Usuario.UsuarioId);
            cmd.Parameters.AddWithValue("@correo", objE_Usuario.Correo);
            cmd.Parameters.AddWithValue("@contrasena", objE_Usuario.Contrasena);
            cmd.Parameters.AddWithValue("@nombreCompleto", objE_Usuario.NombreCompleto);
            cmd.Parameters.AddWithValue("@nombreUsuario", objE_Usuario.NombreUsuario);
            cmd.Parameters.AddWithValue("@sexo", objE_Usuario.Sexo);
            cmd.Parameters.AddWithValue("@tipo", objE_Usuario.Tipo);


            try
            {
                AbrirConexion();
                Resultado = cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Error al tratar de Borrar o Modificar datos de Usuarios", e);
            }
            finally
            {
                CerrarConexion();
                cmd.Dispose();
            }
            return Resultado;
        }

        //metodo que muestra una lista completa de todos los usuarios
        public DataSet listadoUsuario()
        {
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();

            try
            {
                AbrirConexion();
                cmd.Connection = Conexion;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_Seguridad_listadoUsuarios";

                da.SelectCommand = cmd;
                da.Fill(ds);
            }
            catch (Exception e)
            {
                throw new Exception("Error al solicitar los datos de usuario", e);
            }
            finally
            {
                Conexion.Close();
                cmd.Dispose();
            }
            return ds;
        }

        //Metodo que permite seleccionar los usuarios segun su id
        public DataSet seleccionaUsuario(int pIdUsuario)
        {
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();

            try
            {
                AbrirConexion();
                cmd.Connection = Conexion;
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.CommandText = "usp_Seguridad_seleccionaUsuario";

                cmd.Parameters.AddWithValue("@usuarioId", pIdUsuario);

                da.SelectCommand = cmd;
                da.Fill(ds);
            }
            catch (Exception e)
            {
                throw new Exception("Error al solicitar los datos del usuario ", e);
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
