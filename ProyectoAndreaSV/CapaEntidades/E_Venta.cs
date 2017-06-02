using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class E_Venta
    {

        #region Atributos
        private int _ventaId;
        private E_Cliente _clienteId;
        private string _fechaVenta;
        private string _numeroDocumento;
        private string _tipoDocumento;
        #endregion

        #region Constructor
        public E_Venta()
        {
            _ventaId = 0;
            _clienteId = new E_Cliente();
            _fechaVenta = string.Empty;
            _numeroDocumento = string.Empty;
            _tipoDocumento = string.Empty;
        }

        #endregion

        #region Getters y Setters

        public int VentaId
        {
            get { return _ventaId; }
            set { _ventaId = value; }
        }



        public string NumeroDocumento
        {
            get { return _numeroDocumento; }
            set { _numeroDocumento = value; }
        }
        public string TipoDocumento
        {
            get { return _tipoDocumento; }
            set { _tipoDocumento = value; }
        }

        //public int ClienteId
        //{
        //    get { return _clienteId; }
        //    set { _clienteId = value; }
        //}

        public string FechaVenta
        {
            get { return _fechaVenta; }
            set { _fechaVenta = value; }
        }

        public E_Cliente ClienteId
        {
            get { return _clienteId; }
            set { _clienteId = value; }
        }



        #endregion

    }
}
