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
    public class N_Registro
    {
        D_Registro objNegocioRegistro = new D_Registro();

        public int abmRegistro(E_Usuario objE_Usuario)
        {
            return objNegocioRegistro.abmRegistro(objE_Usuario);
        }

        public int abmUsuario(string pAccion, E_Usuario objE_Usuario)
        {
            return objNegocioRegistro.abmUsuario(pAccion,objE_Usuario);
        }

        public DataSet listadoUsuario()
        {
            return objNegocioRegistro.listadoUsuario();
        }

        public DataSet seleccionaUsuario(int pIdUsuario)
        {
            return objNegocioRegistro.seleccionaUsuario(pIdUsuario);
        }

    }
}
