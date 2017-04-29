using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public static class Autentificacion
{
    static string esteUsuario;
    static string esteContrasena;


    public static bool Autenticar(string usuario, string password)
    {
        esteUsuario = usuario;
        esteContrasena = password;
        //consulta a la base de datos
        string sql = @"SELECT COUNT(*)
                              FROM tbl_Usuarios
                              WHERE nombreUsuario = @user AND contrasena = @pass";
     
        //cadena conexion
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SisVentasDBConnectionString"].ToString()))
        {
            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
           
            cmd.Parameters.AddWithValue("@user", usuario); //enviamos los parametros
            cmd.Parameters.AddWithValue("@pass", password);

            int count = Convert.ToInt32(cmd.ExecuteScalar()); //devuelve la fila afectada

            if (count == 0)
                return false;
            else
                return true;

        }
    }



}