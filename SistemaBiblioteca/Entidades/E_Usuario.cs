using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class E_Usuario
    {
        #region Atributos
        private int _usuarioId;

        private string _correo;

        private string _contrasena;

        private string _nombreCompleto;

        private string _nombreUsuario;

        #endregion

        #region Constructor
        public E_Usuario()
        {
            _usuarioId = 0;
            _correo = string.Empty;
            _contrasena = string.Empty;
            _nombreCompleto = string.Empty;
            _nombreUsuario = string.Empty;
        }
        #endregion

        #region Encapsulamiento

        public int UsuarioId
        {
            get { return _usuarioId; }
            set { _usuarioId = value; }
        }



        public string NombreCompleto
        {
            get { return _nombreCompleto; }
            set { _nombreCompleto = value; }
        }


        public string Contrasena
        {
            get { return _contrasena; }
            set { _contrasena = value; }
        }

        public string Correo
        {
            get { return _correo; }
            set { _correo = value; }
        }

        public string NombreUsuario
        {
            get { return _nombreUsuario; }
            set { _nombreUsuario = value; }
        }

        #endregion
    }
}
