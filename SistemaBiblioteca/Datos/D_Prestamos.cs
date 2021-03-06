﻿using System;
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
    public class D_Prestamos : D_ConexionBD
    {


        //Metodo que Inserta Modifica y Elimina Reserva
        public int abmPrestamos(string pAccion, E_Prestamos objE_Prestamos)
        {
            
            int Resultado = 0;
            SqlCommand cmd = new SqlCommand("usp_Biblioteca_abmPrestamo", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Accion", pAccion);
            cmd.Parameters.AddWithValue("@fechaInicio", objE_Prestamos.FechaInicio);
            cmd.Parameters.AddWithValue("@fechaFin", objE_Prestamos.FechaFin);
            cmd.Parameters.AddWithValue("@mfnLibro", objE_Prestamos.LibroMFN);
            cmd.Parameters.AddWithValue("@usuarioId", objE_Prestamos.UsuarioId);

            try
            {
                AbrirConexion();
                Resultado = cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Error al tratar de Insertar Borrar o Modificar datos de reserva", e);
            }
            finally
            {
                CerrarConexion();
                cmd.Dispose();
            }
            return Resultado;
        }

        ////metodo que muestra una lista completa de todos los libro
        //public DataSet listadoLibro()
        //{
        //    SqlCommand cmd = new SqlCommand();
        //    DataSet ds = new DataSet();
        //    SqlDataAdapter da = new SqlDataAdapter();

        //    try
        //    {
        //        AbrirConexion();
        //        cmd.Connection = Conexion;
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.CommandText = "usp_Biblioteca_listadoLibros";

        //        da.SelectCommand = cmd;
        //        da.Fill(ds);
        //    }
        //    catch (Exception e)
        //    {
        //        throw new Exception("Error al solicitar los datos de libros", e);
        //    }
        //    finally
        //    {
        //        Conexion.Close();
        //        cmd.Dispose();
        //    }
        //    return ds;
        //}

        ////Metodo que permite seleccionar los libros segun su id
        //public DataSet seleccionaLibro(string pIdLibro)
        //{
        //    SqlCommand cmd = new SqlCommand();
        //    DataSet ds = new DataSet();
        //    SqlDataAdapter da = new SqlDataAdapter();

        //    try
        //    {
        //        AbrirConexion();
        //        cmd.Connection = Conexion;
        //        cmd.CommandType = CommandType.StoredProcedure;

        //        cmd.CommandText = "usp_Biblioteca_seleccionaLibro";

        //        cmd.Parameters.AddWithValue("@mfn", pIdLibro);

        //        da.SelectCommand = cmd;
        //        da.Fill(ds);
        //    }
        //    catch (Exception e)
        //    {
        //        throw new Exception("Error al solicitar los datos del libro ", e);
        //    }
        //    finally
        //    {
        //        Conexion.Close();
        //        cmd.Dispose();
        //    }
        //    return ds;
        //}




    }
}
