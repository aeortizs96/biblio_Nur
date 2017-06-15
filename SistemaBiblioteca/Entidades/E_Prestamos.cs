using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class E_Prestamos
    {



        #region Atributos
        private string _fechaInicio;
        private string _fechaFin;
        private string _libroMFN;
        private string _usuarioId;
        #endregion

        #region Constructor

        public E_Prestamos()
        {
            _fechaInicio = string.Empty;
            _fechaFin = string.Empty;
            _libroMFN = string.Empty;
            _usuarioId = string.Empty;
        }
        #endregion

        #region Encapsulamiento



        public string FechaInicio
        {
            get { return _fechaInicio; }
            set { _fechaInicio = value; }
        }


        public string FechaFin
        {
            get { return _fechaFin; }
            set { _fechaFin = value; }
        }


        public string LibroMFN
        {
            get { return _libroMFN; }
            set { _libroMFN = value; }
        }


        public string UsuarioId
        {
            get { return _usuarioId; }
            set { _usuarioId = value; }
        }
        #endregion
    }
}