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
        public int abcRegistro(E_Usuario objE_Usuario)
        {
            int Resultado = 0;
            SqlCommand cmd = new SqlCommand("usp-Seguridad-insRegistro", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;
           
            cmd.Parameters.AddWithValue("@correo", objE_Usuario.Correo);
            cmd.Parameters.AddWithValue("@contrasena", objE_Usuario.Contrasena);
            cmd.Parameters.AddWithValue("@nombreCompleto", objE_Usuario.NombreCompleto);
            cmd.Parameters.AddWithValue("@nombreUsuario", objE_Usuario.NombreUsuario);
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

    }
}
