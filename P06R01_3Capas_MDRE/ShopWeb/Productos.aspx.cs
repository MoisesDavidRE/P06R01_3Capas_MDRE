using CapaEntidades.Entities;
using CapaNegocios;
using System;
using System.Collections.Generic;

namespace ShopWeb
{
    public partial class Productos : System.Web.UI.Page
    {
        private N_Product N_Product = new N_Product();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProductos();
            }
        }

        private void CargarProductos()
        {
            try
            {
                List<Product> listadoProductos = N_Product.ListarProductos();

                gvProductos.DataSource = listadoProductos;
                gvProductos.DataBind();

                if (listadoProductos == null || listadoProductos.Count == 0)
                {
                    MostrarMensaje("No se encontraron productos", "info");
                }
                else
                {
                    pnlMensaje.Visible = false;
                }
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al cargar productos: " + ex.Message, "error");
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
                Product objProducto = new Product
                {
                    Id = int.Parse(hdfIdProducto.Value),
                    Name = txtName.Text.Trim(),
                    Description = txtDescription.Text.Trim(),
                    Price = Convert.ToDecimal(txtPrice.Text)
                };

                bool resultado = N_Product.GuardarProducto(objProducto);

                if (resultado)
                {
                    MostrarMensaje("Producto guardado exitosamente.", "info ");
                    CambiarVista(false);
                    CargarProductos();
                }
                else
                {
                    MostrarMensaje("No se pudo guardar el producto.", "error ");
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

        protected void gvProductos_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Editar" || e.CommandName == "Eliminar")
                {
                    int idProducto = Convert.ToInt32(e.CommandArgument);

                    if (e.CommandName == "Editar")
                    {
                        Product objProducto = N_Product.ObtenerProductoPorID(idProducto);
                        if (objProducto != null)
                        {
                            hdfIdProducto.Value = objProducto.Id.ToString();
                            txtName.Text = objProducto.Name;
                            txtDescription.Text = objProducto.Description;
                            txtPrice.Text = objProducto.Price.ToString();

                            CambiarVista(true);
                        }
                    }
                    else if (e.CommandName == "Eliminar")
                    {
                        bool resultado = N_Product.EliminarProducto(idProducto);
                        if (resultado)
                        {
                            MostrarMensaje("Producto eliminado correctamente.", "info ");
                            CargarProductos();
                        }
                        else
                        {
                            MostrarMensaje("No se pudo eliminar el producto.", "error ");
                        }
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
            hdfIdProducto.Value = "0";
            txtName.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtPrice.Text = string.Empty;
        }

        private void CambiarVista(bool mostrarFormulario)
        {
            pnlListado.Visible = !mostrarFormulario;
            pnlFormulario.Visible = mostrarFormulario;
            pnlMensaje.Visible = false;
        }
    }
}