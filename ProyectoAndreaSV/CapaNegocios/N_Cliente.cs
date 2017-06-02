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
    public class N_Cliente
    {
        D_Cliente objNegocioCliente = new D_Cliente();
        
        //Llama al metodo de insertar, modificar y eliminar de la capa datos
        public int abmCliente(string pAccion, E_Cliente objE_Cliente)
        {
            return objNegocioCliente.abmCliente(pAccion, objE_Cliente);
        }


        //metodo que muestra el listado de cliente, llamado desde la capa datos
        public DataSet listadoCliente()
        {
            return objNegocioCliente.listadoCliente();
        }

        //metodo que selecciona al cliente, desde la capa datos
        public DataSet seleccionaCliente(int pIdCliente)
        {
            return objNegocioCliente.seleccionaCliente(pIdCliente);
        }

        



    }
}
