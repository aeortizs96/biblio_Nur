using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using CapaEntidades;



namespace CapaDatos
{
    public class D_Registro : D_ConexionBD
    {

        public D_Registro()
        {

        }
        //Metodo que Insertar usuarios (Procedimiento)
        #region Abm
        public int abcRegistro(E_Usuario objE_Usuario)
        {
            int Resultado = 0;
            SqlCommand cmd = new SqlCommand("usp_Seguridad_InsRegistro", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@cI", objE_Usuario.CI);
            cmd.Parameters.AddWithValue("@nombres", objE_Usuario.Nombres);
            cmd.Parameters.AddWithValue("@apellidos", objE_Usuario.Apellidos);
            cmd.Parameters.AddWithValue("@telefono", objE_Usuario.Telefono);
            cmd.Parameters.AddWithValue("@direccion", objE_Usuario.Direccion);
            cmd.Parameters.AddWithValue("@email", objE_Usuario.Email);
            cmd.Parameters.AddWithValue("@sexo", objE_Usuario.Sexo);
            cmd.Parameters.AddWithValue("@nombreUsuario", objE_Usuario.NombreUsuario);
            cmd.Parameters.AddWithValue("@contrasena", objE_Usuario.Contrasena);
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
        #endregion

    }
}

//falta crear procedimientos que modifiquen y eliminen usuario