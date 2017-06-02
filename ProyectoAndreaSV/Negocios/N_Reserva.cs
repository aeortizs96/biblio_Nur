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
    public class N_Reserva
    {
        D_Reserva objNegocioReserva = new D_Reserva();

        public int abmReserva(string pAccion, E_Reserva objE_Reserva)
        {
            return objNegocioReserva.abmReserva(pAccion, objE_Reserva);
        }
    }
}
