using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class E_Libro
    {




        #region Atributos

        private string _mfn;
        private string _titulo;
        private string _editorial;
        private int _estados;
        private string _autor;

        #endregion

        #region Constructor
        public E_Libro()
        {
            _mfn = string.Empty;
            _titulo = string.Empty;
            _editorial = string.Empty;
            _estados = 0;
            _autor = string.Empty;
        }
        #endregion

        #region Encapsulamiento



        public string Mfn
        {
            get { return _mfn; }
            set { _mfn = value; }
        }



        public string Titulo
        {
            get { return _titulo; }
            set { _titulo = value; }
        }



        public string Editorial
        {
            get { return _editorial; }
            set { _editorial = value; }
        }



        public int Estados
        {
            get { return _estados; }
            set { _estados = value; }
        }



        public string Autor
        {
            get { return _autor; }
            set { _autor = value; }
        }


        #endregion
    }
}
