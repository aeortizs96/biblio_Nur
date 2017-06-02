using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidades;
using System.Data;

namespace CapaNegocios
{
    public class N_DetalleVenta
    {
        D_DetalleVenta objNegocioDetalleVenta = new D_DetalleVenta();

        //Llama al metodo de insertar, modificar y eliminar de la capa datos
        public int abmDetalleVenta(string pAccion, E_DetalleVenta objE_DetalleVenta)
        {
            return objNegocioDetalleVenta.abmDetalleVenta(pAccion, objE_DetalleVenta);
        }


        //metodo que muestra el listado de DetalleVenta, llamado desde la capa datos
        public DataSet listaDetalleVenta()
        {
            return objNegocioDetalleVenta.listaDetalleVenta();
        }

        //metodo que selecciona al DetalleVenta, desde la capa datos
        public DataSet seleccionaDetalleVenta(int pIdDetalleVenta)
        {
            return objNegocioDetalleVenta.seleccionaDetalleVenta(pIdDetalleVenta);
        }


    }
}
