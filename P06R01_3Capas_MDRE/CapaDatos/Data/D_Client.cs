using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos.Data
{
    public class D_Client
    {
        public List<CapaEntidades.Entities.Client> ListarClientes()
        {
            List<CapaEntidades.Entities.Client> Clientes = new List<CapaEntidades.Entities.Client>();
            using (SqlConnection Connection = Conection.ObtenerConexion())
            {
                SqlCommand Command = new SqlCommand("ListClientsSP", Connection);
                Command.CommandType = CommandType.StoredProcedure;

                SqlDataReader DataReader = Command.ExecuteReader();
                while (DataReader.Read())
                {
                    Clientes.Add(new CapaEntidades.Entities.Client
                    {
                        Id = Convert.ToInt32(DataReader["Id"]),
                        Name = DataReader["Name"].ToString(),
                        MidName = DataReader["MidName"].ToString(),
                        Email = DataReader["Email"].ToString()
                    });
                }
            }
            return Clientes;
        }

        public bool InsertarCliente(CapaEntidades.Entities.Client client)
        {
            using (SqlConnection Connection = Conection.ObtenerConexion())
            {
                SqlCommand Command = new SqlCommand("InsertClientSP", Connection);

                Command.CommandType = CommandType.StoredProcedure;

                Command.Parameters.AddWithValue("@Name", client.Name);
                Command.Parameters.AddWithValue("@MidName", client.MidName);
                Command.Parameters.AddWithValue("@Email", client.Email);

                return Command.ExecuteNonQuery() > 0;
            }
        }
            
        public bool ActualizarCliente(CapaEntidades.Entities.Client client)
        {
            using (SqlConnection Connection = Conection.ObtenerConexion())
            {
                SqlCommand Command = new SqlCommand("UpdateClientSP", Connection);

                Command.CommandType = CommandType.StoredProcedure;

                Command.Parameters.AddWithValue("@IdClient", client.Id); 
                Command.Parameters.AddWithValue("@Name", client.Name);
                Command.Parameters.AddWithValue("@MidName", client.MidName);
                Command.Parameters.AddWithValue("@Email", client.Email);

                return Command.ExecuteNonQuery() > 0;
            }
        }

        public bool EliminarCliente(int clienteId)
        {
            using (SqlConnection Connection = Conection.ObtenerConexion())
            {
                SqlCommand Command = new SqlCommand("DeleteClientSP", Connection);

                Command.CommandType = CommandType.StoredProcedure;

                Command.Parameters.AddWithValue("@IdClient", clienteId);
                return Command.ExecuteNonQuery() > 0;
            }
        }
    }
}
