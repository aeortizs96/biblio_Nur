using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class D_Loggin : D_ConexionBD
    {
        public D_Loggin()
        {

        }

        public int abmLoggin(E_Usuario objE_Usuario)
        {
            int Resultado = 0;
            SqlCommand cmd = new SqlCommand("usp-Seguridad-validarLogin", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@contrasena", objE_Usuario.Contrasena);
            cmd.Parameters.AddWithValue("@nombreUsuario", objE_Usuario.NombreUsuario);

            SqlParameter NroInscritosParametro = new SqlParameter("@usuarioId", 0);
            NroInscritosParametro.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(NroInscritosParametro);

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
