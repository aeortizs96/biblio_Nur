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
    public class N_Categoria
    {
        D_Categoria objNegocioCategoria = new D_Categoria();
        public int abmCategoria(string pAccion, E_Categoria objE_Categoria)
        {
            return objNegocioCategoria.abmCategoria(pAccion,objE_Categoria);
        }

        public DataSet listadoCategoria()
        {
            return objNegocioCategoria.listadoCategoria();
        }

        public DataSet seleccionaCategoria(int pIdCategoria)
        {
            return objNegocioCategoria.seleccionaCategoria(pIdCategoria);
        }

    }
}
