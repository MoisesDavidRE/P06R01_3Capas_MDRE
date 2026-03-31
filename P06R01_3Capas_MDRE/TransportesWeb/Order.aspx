<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ordenes.aspx.cs" Inherits="ShopWeb.Ordenes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Órdenes</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; }
        .container { max-width: 1200px; margin: 0 auto; background-color: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        h1 { color: #333; border-bottom: 3px solid #007bff; padding-bottom: 10px; }
        .filtros, .formulario { margin: 20px 0; padding: 15px; background-color: #f8f9fa; border-radius: 5px; }
        .filtros label, .formulario label { font-weight: bold; margin-right: 10px; display: block; margin-bottom: 5px; }
        .btn { background-color: #007bff; color: white; cursor: pointer; border: none; padding: 8px 15px; border-radius: 4px; text-decoration: none; display: inline-block; }
        .btn:hover { background-color: #0056b3; }
        .btn-danger { background-color: #dc3545; }
        .btn-danger:hover { background-color: #c82333; }
        .btn-success { background-color: #28a745; }
        .btn-success:hover { background-color: #218838; }
        .gridview { width: 100%; border-collapse: collapse; margin-top: 20px; }
        .gridview th { background-color: #007bff; color: white; padding: 12px; text-align: left; }
        .gridview td { padding: 10px; border-bottom: 1px solid #ddd; }
        .info-mensaje { padding: 15px; margin: 20px 0; border-radius: 5px; text-align: center; }
        .info-mensaje.info { background-color: #d1ecf1; color: #0c5460; border: 1px solid #bee5eb; }
        .info-mensaje.error { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
        .form-group { margin-bottom: 15px; }
        .form-control { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Gestión de Órdenes</h1>
            
            <asp:Panel ID="pnlMensaje" runat="server" Visible="false">
                <asp:Label ID="lblMensaje" runat="server"></asp:Label>
            </asp:Panel>

            <asp:Panel ID="pnlListado" runat="server">
                <div class="filtros">
                    <asp:Button ID="btnNuevo" runat="server" Text="+ Nueva Orden" CssClass="btn btn-success" OnClick="btnNuevo_Click" style="float: right;" />
                    <div style="clear:both;"></div>
                </div>
                
                <asp:GridView ID="gvOrdenes" runat="server" 
                              CssClass="gridview" 
                              AutoGenerateColumns="False"
                              EmptyDataText="No hay órdenes registradas."
                              OnRowCommand="gvOrdenes_RowCommand"
                              DataKeyNames="Id">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px" />
                        <asp:BoundField DataField="IdProduct" HeaderText="ID Producto" />
                        <asp:BoundField DataField="IdClient" HeaderText="ID Cliente" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="Quantity" HeaderText="Cantidad" />
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <asp:Button ID="btnEditar" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("Id") %>' CssClass="btn" />
                                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-danger" OnClientClick="return confirm('¿Eliminar esta orden de forma permanente?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:Panel>

            <asp:Panel ID="pnlFormulario" runat="server" Visible="false" CssClass="formulario">
                <h2>Detalles de la Orden</h2>
                <asp:HiddenField ID="hdfIdOrden" runat="server" Value="0" />
                
                <div class="form-group">
                    <label>Producto:</label>
                    <asp:DropDownList ID="ddlProduct" runat="server" CssClass="form-control" required="true"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Cliente:</label>
                    <asp:DropDownList ID="ddlClient" runat="server" CssClass="form-control" required="true"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Fecha:</label>
                    <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" type="date" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Cantidad:</label>
                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" type="number" required="true"></asp:TextBox>
                </div>
                <div style="margin-top: 20px;">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar Orden" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
                    <asp:Button ID="btnCancelar" runat="server" Text="Volver al listado" CssClass="btn" OnClick="btnCancelar_Click" formnovalidate="true" />
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>