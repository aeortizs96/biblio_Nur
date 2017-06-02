using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class E_DetalleVenta
    {

        #region Atributos
        private int _detalleId;
        private E_Venta _ventaId;
        private E_Producto _productoId;
        private double _cantidad;
        private double _precioUnitario;
        #endregion

        #region Constructor
        public E_DetalleVenta()
        {

            _detalleId = 0;
            _ventaId = new E_Venta();
            _productoId = new E_Producto();
            _cantidad = 0;
            _precioUnitario = 0;
        }
        #endregion

        #region Getters y Setters
        public int DetalleId
        {
            get { return _detalleId; }
            set { _detalleId = value; }
        }


        public double Cantidad
        {
            get { return _cantidad; }
            set { _cantidad = value; }
        }

        public double PrecioUnitario
        {
            get { return _precioUnitario; }
            set { _precioUnitario = value; }
        }

        public E_Venta VentaId
        {
            get { return _ventaId; }
            set { _ventaId = value; }
        }

        //public int VentaId
        //{
        //    get { return _ventaId; }
        //    set { _ventaId = value; }
        //}
        //public int ProductoId
        //{
        //    get { return _productoId; }
        //    set { _productoId = value; }
        //}

        public E_Producto ProductoId
        {
            get { return _productoId; }
            set { _productoId = value; }
        }

        #endregion


    }
}
