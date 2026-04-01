using CapaEntidades.Entities;
using System.Collections.Generic;

namespace CapaNegocios
{
    public class N_Client
    {
        private CapaDatos.Data.D_Client d_Client = new CapaDatos.Data.D_Client();

        public List<Client> ListarClientes()
        {
            return d_Client.ListarClientes();
        }

        public bool GuardarCliente(Client cliente)
        {
            if (cliente.Id == 0)
            {
                return d_Client.InsertarCliente(cliente);
            }
            else
            {
                return d_Client.ActualizarCliente(cliente);
            }
        }

        public bool EliminarCliente(int idCliente)
        {
            return d_Client.EliminarCliente(idCliente);
        }
    }
}
