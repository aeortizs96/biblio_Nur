using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocios
{
    public class N_Loggin
    {

        D_Loggin objNegocioLoggin = new D_Loggin();

        public int abmLoggin(E_Usuario objE_Usuario)
        {
            return objNegocioLoggin.abmLoggin(objE_Usuario);
        }


    }
}
