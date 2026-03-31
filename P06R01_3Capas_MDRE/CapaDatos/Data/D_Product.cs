using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos.Data
{
    public class D_Product
    {
        public List<CapaEntidades.Entities.Product> ListarProductos()
        {
            List<CapaEntidades.Entities.Product> Productos = new List<CapaEntidades.Entities.Product>();
            using (SqlConnection Connection = Conection.ObtenerConexion())
            {
                SqlCommand Command = new SqlCommand("ListProductSP", Connection);
                Command.CommandType = CommandType.StoredProcedure;

                SqlDataReader DataReader = Command.ExecuteReader();
                while (DataReader.Read())
                {
                    Productos.Add(new CapaEntidades.Entities.Product
                    {
                        Id = Convert.ToInt32(DataReader["Id"]),
                        Name = DataReader["Name"].ToString(),
                        Description = DataReader["Description"].ToString(),
                        Price = Convert.ToDecimal(DataReader["Price"])
                    });
                }
            }
            return Productos;
        }

        public bool InsertarProducto(CapaEntidades.Entities.Product product)
        {
            using (SqlConnection Connection = Conection.ObtenerConexion())
            {
                SqlCommand Command = new SqlCommand("InsertProductSP", Connection);

                Command.CommandType = CommandType.StoredProcedure;

                Command.Parameters.AddWithValue("@Name", product.Name);
                Command.Parameters.AddWithValue("@Description", product.Description);
                Command.Parameters.AddWithValue("@Price", product.Price);

                return Command.ExecuteNonQuery() > 0;
            }
        }

        public bool ActualizarProducto(CapaEntidades.Entities.Product product)
        {
            using (SqlConnection Connection = Conection.ObtenerConexion())
            {
                SqlCommand Command = new SqlCommand("UpdateProductSP", Connection);

                Command.CommandType = CommandType.StoredProcedure;

                Command.Parameters.AddWithValue("@Id", product.Id);
                Command.Parameters.AddWithValue("@Name", product.Name);
                Command.Parameters.AddWithValue("@Description", product.Description);
                Command.Parameters.AddWithValue("@Price", product.Price);

                return Command.ExecuteNonQuery() > 0;
            }
        }
        public bool EliminarProducto(int productoId)
        {
            using (SqlConnection Connection = Conection.ObtenerConexion())
            {
                SqlCommand Command = new SqlCommand("DeleteProductSP", Connection);

                Command.CommandType = CommandType.StoredProcedure;

                Command.Parameters.AddWithValue("@IdProduct", productoId);
                return Command.ExecuteNonQuery() > 0;
            }
        }
        public CapaEntidades.Entities.Product ObtenerProductoPorID(int idProducto)
        {
            using (SqlConnection Connection = Conection.ObtenerConexion())
            {
                SqlCommand Command = new SqlCommand("ListProductByIdSP", Connection);

                Command.CommandType = CommandType.StoredProcedure;

                Command.Parameters.AddWithValue("@Id", idProducto);

                SqlDataReader DataReader = Command.ExecuteReader();
                if (DataReader.Read())
                {
                    return new CapaEntidades.Entities.Product
                    {
                        Id = Convert.ToInt32(DataReader["Id"]),
                        Name = DataReader["Name"].ToString(),
                        Description = DataReader["Description"].ToString(),
                        Price = Convert.ToDecimal(DataReader["Price"])
                    };
                }
                return null;
            }
        }
    }
}