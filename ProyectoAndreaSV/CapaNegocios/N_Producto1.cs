using CapaDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocios
{
    public class N_Producto1
    {
        D_Producto objNegocioProducto = new D_Producto();
        public int abmProducto(string pAccion, E_Producto objE_Producto)
        {
            return objNegocioProducto.abmProducto(pAccion, objE_Producto);
        }


        public DataSet productosLista()
        {
            return objNegocioProducto.productosLista();
        }

        public DataSet productoSeleccionado(int pIdProducto)
        {
            return objNegocioProducto.productoSeleccionado(pIdProducto);
        }

    }
}