using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class E_Autor
    {
        

        #region Atributos

        private int _autorId;
        private string _nombre;
        private string _nacionalidad;
       
        #endregion

        #region Constructor
        public E_Autor()
        {
            _autorId = 0;
            _nombre = string.Empty;
            _nacionalidad = string.Empty;
        }
        #endregion

        #region Encapsulamiento


        public int AutorId
        {
            get { return _autorId; }
            set { _autorId = value; }
        }

        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }


        public string Nacionalidad
        {
            get { return _nacionalidad; }
            set { _nacionalidad = value; }
        }
        #endregion
    }
}
