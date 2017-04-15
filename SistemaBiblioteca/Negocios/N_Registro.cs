using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocios
{
    public class N_Registro
    {
        D_Registro objNegocioRegistro = new D_Registro();

        public int abmRegistro(E_Usuario objE_Usuario)
        {
            return objNegocioRegistro.abmRegistro(objE_Usuario);
        }


    }
}
