using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class E_Cliente
    {
        #region Atributos


        private int _clienteId;


        private string _nit;

        private string _nombres;


        private string _apellidos;


        private string _telefono;


        private string _direccion;


        private string _email;


        private string _sexo;


        #endregion


        #region Constructor

        public E_Cliente()
        {
            _clienteId = 0;
            _nit = string.Empty;
            _nombres = string.Empty;
            _apellidos = string.Empty;
            _telefono = string.Empty;
            _direccion = string.Empty;
            _email = string.Empty;
            _sexo = string.Empty;

        }

        #endregion

        #region Getters y Setters

        public int ClienteId
        {
            get { return _clienteId; }
            set { _clienteId = value; }
        }


        public string Nit
        {
            get { return _nit; }
            set { _nit = value; }
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


        public string Sexo
        {
            get { return _sexo; }
            set { _sexo = value; }
        }

        #endregion

    }
}
