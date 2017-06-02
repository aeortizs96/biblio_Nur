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
    public class N_Venta
    {
        D_Venta objNegocioVenta = new D_Venta();
        //Llama al metodo de insertar, modificar y eliminar de la capa datos
        public int abmVenta(string pAccion, E_Venta objE_Venta)
        {
            return objNegocioVenta.abmVenta(pAccion, objE_Venta);
        }

        //metodo que muestra el listado de ventas, llamado desde la capa datos
        public DataSet listadoVenta()
        {
            return objNegocioVenta.listadoVenta();
        }

        //metodo que selecciona al ventas, desde la capa datos
        public DataSet seleccionaVenta(int pIdVenta)
        {
            return objNegocioVenta.seleccionaVenta(pIdVenta);
        }
    }
}
