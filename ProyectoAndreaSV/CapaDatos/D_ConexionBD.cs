using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace CapaDatos
{
    public class D_ConexionBD
    {

        public SqlConnection Conexion;

        public D_ConexionBD()
        {
            Conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ConnectionString);
        }

        public void AbrirConexion()
         {
            try
            {
                if (Conexion.State == ConnectionState.Broken || Conexion.State == ConnectionState.Closed)
                    Conexion.Open();
            }
            catch (Exception e)
            {

                throw new Exception("Error al tratar de abrir la conexion", e);
            }
        }

        public void CerrarConexion()
        {
            try
            {
                if (Conexion.State == ConnectionState.Open)
                    Conexion.Close();
            }
            catch (Exception e)
            {

                throw new Exception("Error al tratar de cerrar la conexion", e);
            }
        }
    }
}

//ctor = constructor 
//c + k + c = comentar
//c + k + u = descomentar 
// ctrol +r + e = encapsulamiento