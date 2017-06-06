using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class E_Reserva
    {

        #region Atributos
        private int _reservaId;
        private string _fecha;
        private string _mfnLibro;
        #endregion

        #region Constructor
        public E_Reserva()
        {
            _reservaId = 0;
            _fecha = string.Empty;
            _mfnLibro = string.Empty;
        }
        #endregion

        #region Encapsulamiento

        public int ReservaId
        {
            get { return _reservaId; }
            set { _reservaId = value; }
        }


        public string Fecha
        {
            get { return _fecha; }
            set { _fecha = value; }
        }

        public string MfnLibro
        {
            get { return _mfnLibro; }
            set { _mfnLibro = value; }
        }
        #endregion
    }
}
