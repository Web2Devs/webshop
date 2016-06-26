using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppWeb.Framework.Data.DB.Model;

namespace AppWeb.Framework.Data.DB.Control
{
    public class UnitOfWork
    {
        public UnitOfWork()
        {
            this.context = new BDWebShopEntities();
        }

        private Cliente _cliente;
        public Cliente Cliente
        {
            get
            {
                if (_cliente == null)
                    _cliente = new Cliente(this.context);
                return _cliente;
            }
        }

        private Categoria _categoria;
        public Categoria Categoria
        {
            get
            {
                if (_categoria == null)
                    _categoria = new Categoria(this.context);
                return _categoria;
            }
        }

        private Producto _producto;
        public Producto Producto
        {
            get
            {
                if (_producto == null)
                    _producto = new Producto(this.context);
                return _producto;
            }
        }

        private SubCategoria _subcategoria;
        public SubCategoria SubCategoria
        {
            get
            {
                if (_subcategoria == null)
                    _subcategoria = new SubCategoria(this.context);
                return _subcategoria;
            }
        }

        private Venta _venta;
        public Venta Venta
        {
            get
            {
                if (_venta == null)
                    _venta = new Venta(this.context);
                return _venta;
            }
        }

        public void SaveChanges()
        {
            this.context.SaveChanges();
        }

        private readonly BDWebShopEntities context;
    }
}
