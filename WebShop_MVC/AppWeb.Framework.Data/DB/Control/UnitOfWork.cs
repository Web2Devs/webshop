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

        private EntidadGenerica<TCategoria> _categoria;
        public EntidadGenerica<TCategoria> Categoria
        {
            get
            {
                if (_categoria == null)
                    _categoria = new EntidadGenerica<TCategoria>(this.context);
                return _categoria;
            }
        }

        private EntidadGenerica<TProducto> _producto;
        public EntidadGenerica<TProducto> Producto
        {
            get
            {
                if (_producto == null)
                    _producto = new EntidadGenerica<TProducto>(this.context);
                return _producto;
            }
        }

        private EntidadGenerica<TSubCategoria> _subcategoria;
        public EntidadGenerica<TSubCategoria> SubCategoria
        {
            get
            {
                if (_subcategoria == null)
                    _subcategoria = new EntidadGenerica<TSubCategoria>(this.context);
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
