using CapaEntidades.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocios
{
    public class N_Product
    {
        private CapaDatos.Data.D_Product d_Product = new CapaDatos.Data.D_Product();

        public List<Product> ListarProductos()
        {
            return d_Product.ListarProductos();
        }

        public bool GuardarProducto(Product producto)
        {
            if (producto.Id == 0)
            {
                return d_Product.InsertarProducto(producto);
            }
            else
            {
                return d_Product.ActualizarProducto(producto);
            }
        }
        public Product ObtenerProductoPorID(int idProducto)
        {
            return d_Product.ObtenerProductoPorID(idProducto);
        }
        public bool EliminarProducto(int idProducto)
        {
            return d_Product.EliminarProducto(idProducto);
        }
    }
}
