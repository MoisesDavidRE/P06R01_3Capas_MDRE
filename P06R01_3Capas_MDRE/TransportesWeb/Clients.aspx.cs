using CapaEntidades.Entities;
using CapaNegocios;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace ShopWeb
{
    public partial class Clientes : System.Web.UI.Page
    {
        private N_Client N_Client = new N_Client();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarClientes();
            }
        }

        private void CargarClientes()
        {
            try
            {
                List<Client> listadoClientes = N_Client.ListarClientes();
                gvClientes.DataSource = listadoClientes;
                gvClientes.DataBind();

                if (listadoClientes == null || listadoClientes.Count == 0)
                {
                    MostrarMensaje("No se encontraron clientes", "info");
                }
                else
                {
                    pnlMensaje.Visible = false;
                }
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al cargar clientes: " + ex.Message, "error");
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
            CambiarVista(true);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Client objCliente = new Client
                {
                    Id = int.Parse(hdfIdCliente.Value),
                    Name = txtName.Text.Trim(),
                    Email = txtEmail.Text.Trim(),
                    MidName = txtMidName.Text.Trim()
                };

                bool resultado = N_Client.GuardarProducto(objCliente);

                if (resultado)
                {
                    MostrarMensaje("Cliente guardado exitosamente.", "info ");
                    CambiarVista(false);
                    CargarClientes();
                }
                else
                {
                    MostrarMensaje("No se pudo guardar el cliente.", "error ");
                }
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al guardar: " + ex.Message, "error ");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            CambiarVista(false);
        }

        protected void gvClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int idCliente = Convert.ToInt32(e.CommandArgument);

                if (e.CommandName == "Editar")
                {
                    GridViewRow row = (GridViewRow)((Button)e.CommandSource).NamingContainer;
                    
                    hdfIdCliente.Value = idCliente.ToString();
                    txtName.Text = row.Cells[1].Text;
                    txtMidName.Text = row.Cells[2].Text;
                    txtEmail.Text = row.Cells[3].Text;

                    CambiarVista(true);
                }
                else if (e.CommandName == "Eliminar")
                {
                    bool resultado = N_Client.EliminarCliente(idCliente);
                    if (resultado)
                    {
                        MostrarMensaje("Cliente eliminado correctamente.", "info ");
                        CargarClientes();
                    }
                    else
                    {
                        MostrarMensaje("No se pudo eliminar el cliente.", "error ");
                    }
                }
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al procesar la acción: " + ex.Message, "error ");
            }
        }

        private void MostrarMensaje(string mensaje, string tipo)
        {
            pnlMensaje.Visible = true;
            lblMensaje.Text = mensaje;
            pnlMensaje.CssClass = "info-mensaje " + tipo;
        }

        private void LimpiarFormulario()
        {
            hdfIdCliente.Value = "0";
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtMidName.Text = string.Empty;
        }

        private void CambiarVista(bool mostrarFormulario)
        {
            pnlListado.Visible = !mostrarFormulario;
            pnlFormulario.Visible = mostrarFormulario;
            pnlMensaje.Visible = false;
        }
    }
}