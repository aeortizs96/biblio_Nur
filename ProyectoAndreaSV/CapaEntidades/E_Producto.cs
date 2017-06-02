using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class E_Producto
    {

        #region Atributos
        private int _productoId;
        private int _categoriaId;
        private string _nombre;
        private string _descripcion;
        private int _stock;
        private double _precioCompra;
        private double _precioVenta;
        private string _fechaVencimiento;
        private string _imagen;

        //private byte _imagen;
        #endregion

        #region constructor
        public E_Producto()
        {
            _productoId = 0;
            _categoriaId = 0;
            _nombre = string.Empty;
            _descripcion = string.Empty;
            _stock = 0;
            _precioCompra = 0;
            _precioVenta = 0;
            _fechaVencimiento = string.Empty;
            _imagen = string.Empty;
        }


        #endregion

        #region Getters y Setters

        public int ProductoId
        {
            get { return _productoId; }
            set { _productoId = value; }
        }

        public int CategoriaId
        {
            get { return _categoriaId; }
            set { _categoriaId = value; }
        }

        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        public string Descripcion
        {
            get { return _descripcion; }
            set { _descripcion = value; }
        }

        public int Stock
        {
            get { return _stock; }
            set { _stock = value; }
        }

        public double PrecioCompra
        {
            get { return _precioCompra; }
            set { _precioCompra = value; }
        }

        public double PrecioVenta
        {
            get { return _precioVenta; }
            set { _precioVenta = value; }
        }

        public string FechaVencimiento
        {
            get { return _fechaVencimiento; }
            set { _fechaVencimiento = value; }
        }
        //public byte Imagen
        //{
        //    get { return _imagen; }
        //    set { _imagen = value; }
        //}

        public string Imagen
        {
            get { return _imagen; }
            set { _imagen = value; }
        }
        #endregion



    }
}
