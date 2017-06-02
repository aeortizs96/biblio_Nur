using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class E_Categoria
    {

        #region Atributos
        private int _categoriaId;
        private string _descripcion;
        #endregion

        #region Constructor
        public E_Categoria()
        {
            _categoriaId = 0;
            _descripcion = string.Empty;
        }
        #endregion

        #region Getters y Setters

        public int CategoriaId
        {
            get { return _categoriaId; }
            set { _categoriaId = value; }
        }
        public string Descripcion
        {
            get { return _descripcion; }
            set { _descripcion = value; }
        }

        #endregion

    }

}
