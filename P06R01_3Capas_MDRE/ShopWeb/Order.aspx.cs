using CapaEntidades.Entities;
using CapaNegocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace ShopWeb
{
    public partial class Ordenes : System.Web.UI.Page
    {
        private N_Order N_Order = new N_Order();
        private N_Product N_Product = new N_Product();
        private N_Client N_Client = new N_Client();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarOrdenes();
                CargarListasDesplegables();
            }
        }

        private void CargarOrdenes()
        {
            try
            {
                var listadoOrdenes = N_Order.ListarOrdenes();
                var listadoProductos = N_Product.ListarProductos();
                var listadoClientes = N_Client.ListarClientes();

                if (listadoOrdenes == null || listadoOrdenes.Count == 0)
                {
                    gvOrdenes.DataSource = null;
                    gvOrdenes.DataBind();
                    MostrarMensaje("No se encontraron órdenes", "info");
                }
                else
                {
                    var ordenesConNombres = from o in listadoOrdenes
                                            join p in listadoProductos on o.IdProduct equals p.Id
                                            join c in listadoClientes on o.IdClient equals c.Id
                                            select new
                                            {
                                                Id = o.Id,
                                                IdProduct = o.IdProduct,
                                                ProductName = p.Name,
                                                IdClient = o.IdClient,
                                                ClientName = c.Name,
                                                Fecha = o.Fecha,
                                                Quantity = o.Quantity
                                            };

                    gvOrdenes.DataSource = ordenesConNombres.ToList();
                    gvOrdenes.DataBind();
                    pnlMensaje.Visible = false;
                }
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al cargar órdenes: " + ex.Message, "error");
            }
        }

        private void CargarListasDesplegables()
        {
            try
            {
                ddlProduct.DataSource = N_Product.ListarProductos();
                ddlProduct.DataTextField = "Name";
                ddlProduct.DataValueField = "Id";
                ddlProduct.DataBind();
                ddlProduct.Items.Insert(0, new ListItem("-- Seleccione un Producto --", ""));

                ddlClient.DataSource = N_Client.ListarClientes();
                ddlClient.DataTextField = "Name";
                ddlClient.DataValueField = "Id";
                ddlClient.DataBind();
                ddlClient.Items.Insert(0, new ListItem("-- Seleccione un Cliente --", ""));
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al cargar listas: " + ex.Message, "error");
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
                Order objOrden = new Order
                {
                    Id = int.Parse(hdfIdOrden.Value),
                    IdProduct = int.Parse(ddlProduct.SelectedValue),
                    IdClient = int.Parse(ddlClient.SelectedValue),
                    Fecha = DateTime.Parse(txtFecha.Text.Trim()),
                    Quantity = int.Parse(txtQuantity.Text.Trim())
                };

                bool resultado = N_Order.GuardarOrden(objOrden);

                if (resultado)
                {
                    MostrarMensaje("Orden guardada exitosamente.", "info ");
                    CambiarVista(false);
                    CargarOrdenes();
                }
                else
                {
                    MostrarMensaje("No se pudo guardar la orden.", "error ");
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

        protected void gvOrdenes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int idOrden = Convert.ToInt32(e.CommandArgument);

                if (e.CommandName == "Editar")
                {
                    GridViewRow row = (GridViewRow)((Button)e.CommandSource).NamingContainer;

                    hdfIdOrden.Value = idOrden.ToString();

                    ddlProduct.SelectedValue = row.Cells[1].Text;
                    ddlClient.SelectedValue = row.Cells[2].Text;

                    DateTime fechaParseada;
                    if (DateTime.TryParse(row.Cells[3].Text, out fechaParseada))
                    {
                        txtFecha.Text = fechaParseada.ToString("yyyy-MM-dd");
                    }

                    txtQuantity.Text = row.Cells[4].Text;

                    CambiarVista(true);
                }
                else if (e.CommandName == "Eliminar")
                {
                    bool resultado = N_Order.EliminarOrden(idOrden);
                    if (resultado)
                    {
                        MostrarMensaje("Orden eliminada correctamente.", "info ");
                        CargarOrdenes();
                    }
                    else
                    {
                        MostrarMensaje("No se pudo eliminar la orden.", "error ");
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
            hdfIdOrden.Value = "0";
            ddlProduct.SelectedIndex = 0;
            ddlClient.SelectedIndex = 0;
            txtFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txtQuantity.Text = string.Empty;
        }

        private void CambiarVista(bool mostrarFormulario)
        {
            pnlListado.Visible = !mostrarFormulario;
            pnlFormulario.Visible = mostrarFormulario;
            pnlMensaje.Visible = false;
        }
    }
}