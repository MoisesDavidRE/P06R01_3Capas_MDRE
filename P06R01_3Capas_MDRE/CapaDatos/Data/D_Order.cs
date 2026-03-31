using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos.Data
{
    public class D_Order
    {
        public List<CapaEntidades.Entities.Order> ListarOrder()
        {
            List<CapaEntidades.Entities.Order> Orders = new List<CapaEntidades.Entities.Order>();
            using (SqlConnection Connection = Conection.ObtenerConexion())
            {
                SqlCommand Command = new SqlCommand("ListOrdersSP", Connection);
                Command.CommandType = CommandType.StoredProcedure;

                SqlDataReader DataReader = Command.ExecuteReader();
                while (DataReader.Read())
                {
                    Orders.Add(new CapaEntidades.Entities.Order
                    {
                        Id = Convert.ToInt32(DataReader["Id"]),
                        IdProduct = Convert.ToInt32(DataReader["IdProduct"]),
                        IdClient = Convert.ToInt32(DataReader["IdClient"]),
                        Fecha = Convert.ToDateTime(DataReader["Fecha"]),
                        Quantity = Convert.ToInt32(DataReader["Quantity"])
                    });
                }
            }
            return Orders;
        }

        public bool InsertarCliente(CapaEntidades.Entities.Order order)
        {
            using (SqlConnection Connection = Conection.ObtenerConexion())
            {
                SqlCommand Command = new SqlCommand("InsertOrderSP", Connection);

                Command.CommandType = CommandType.StoredProcedure;

                Command.Parameters.AddWithValue("@IdProduct", order.IdProduct);
                Command.Parameters.AddWithValue("@IdClient", order.IdClient);
                Command.Parameters.AddWithValue("@Fecha", order.Fecha);
                Command.Parameters.AddWithValue("@Quantity", order.Quantity);

                return Command.ExecuteNonQuery() > 0;
            }
        }

        public bool ActualizarOrden(CapaEntidades.Entities.Order order)
        {
            using (SqlConnection Connection = Conection.ObtenerConexion())
            {
                SqlCommand Command = new SqlCommand("UpdateOrderSP", Connection);

                Command.CommandType = CommandType.StoredProcedure;

                Command.Parameters.AddWithValue("@IdOrder", order.Id);
                Command.Parameters.AddWithValue("@IdProducto", order.IdProduct);
                Command.Parameters.AddWithValue("@IdClient", order.IdClient);
                Command.Parameters.AddWithValue("@Fecha", order.Fecha);
                Command.Parameters.AddWithValue("@Quantity", order.Quantity);

                return Command.ExecuteNonQuery() > 0;
            }
        }

        public bool EliminarOrden(int orderId)
        {
            using (SqlConnection Connection = Conection.ObtenerConexion())
            {
                SqlCommand Command = new SqlCommand("DeleteOrderSP", Connection);

                Command.CommandType = CommandType.StoredProcedure;

                Command.Parameters.AddWithValue("@IdOrder", orderId);
                return Command.ExecuteNonQuery() > 0;
            }
        }
    }
}
