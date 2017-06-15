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
    public class N_Prestamos
    {
        D_Prestamos objNegocioPrestamos = new D_Prestamos();
        public int abmPrestamos(string pAccion, E_Prestamos objE_Prestamos)
        {
            return objNegocioPrestamos.abmPrestamos(pAccion, objE_Prestamos);
        }
    }
}
