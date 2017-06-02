using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class E_Usuario
    {
        #region Atributos
        private int _usuarioId;

        private string _cI;

        private string _nombres;

        private string _apellidos;

        private string _telefono;

        private string _direccion;

        private string _email;

        private string _contrasena;

        private string _nombreUsuario;

        private string _sexo;

        private string _tipo;

        #endregion

        #region Constructor
        public E_Usuario()
        {
            _usuarioId = 0;
            _cI = string.Empty;
            _email = string.Empty;
            _contrasena = string.Empty;
            _nombres = string.Empty;
            _apellidos = string.Empty;
            _nombreUsuario = string.Empty;
            _sexo = string.Empty;
            _tipo = string.Empty;
            _telefono = string.Empty;
            _direccion = string.Empty;
        }
        #endregion

        #region Encapsulamiento

        public int UsuarioId
        {
            get { return _usuarioId; }
            set { _usuarioId = value; }
        }

        public string CI
        {
            get { return _cI; }
            set { _cI = value; }
        }

        public string Nombres
        {
            get { return _nombres; }
            set { _nombres = value; }
        }
        public string Apellidos
        {
            get { return _apellidos; }
            set { _apellidos = value; }
        }


        public string Contrasena
        {
            get { return _contrasena; }
            set { _contrasena = value; }
        }



        public string NombreUsuario
        {
            get { return _nombreUsuario; }
            set { _nombreUsuario = value; }
        }

        public string Sexo
        {
            get { return _sexo; }
            set { _sexo = value; }
        }
        public string Tipo
        {
            get { return _tipo; }
            set { _tipo = value; }
        }

        public string Telefono
        {
            get { return _telefono; }
            set { _telefono = value; }
        }

        public string Direccion
        {
            get { return _direccion; }
            set { _direccion = value; }
        }

        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }

        #endregion
    }
}
