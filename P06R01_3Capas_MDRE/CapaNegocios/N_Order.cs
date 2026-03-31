using CapaEntidades.Entities;
using System.Collections.Generic;

namespace CapaNegocios
{
    public class N_Order
    {
        private CapaDatos.Data.D_Order d_Order = new CapaDatos.Data.D_Order();

        public List<Order> ListarOrdenes()
        {
            return d_Order.ListarOrder();
        }

        public bool GuardarOrden(Order orden)
        {
            if (orden.Id == 0)
            {
                return d_Order.InsertarCliente(orden);
            }
            else
            {
                return d_Order.ActualizarOrden(orden);
            }
        }

        public bool EliminarOrden(int idOrden)
        {
            return d_Order.EliminarOrden(idOrden);
        }
    }
}
