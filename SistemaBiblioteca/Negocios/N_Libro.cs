using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocios
{
    public class N_Libro
    {

        D_Libro objNegocioLibro = new D_Libro();

        public int abmLibro(string pAccion, E_Libro objE_Libro)
        {
            return objNegocioLibro.abmLibro(pAccion, objE_Libro);
        }

        public DataSet listadoLibro()
        {
            return objNegocioLibro.listadoLibro();
        }

        public DataSet seleccionaLibro(string pIdLibro)
        {
            return objNegocioLibro.seleccionaLibro(pIdLibro);
        }
    }
}
