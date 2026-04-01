<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="ShopWeb.Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Gestión de Productos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>📦 Gestión de Productos</h1>
    
    <asp:Panel ID="pnlMensaje" runat="server" Visible="false">
        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    </asp:Panel>

    <asp:Panel ID="pnlListado" runat="server">
        <div class="filtros">
            <asp:Button ID="btnNuevo" runat="server" Text="+ Nuevo Producto" CssClass="btn btn-success" OnClick="btnNuevo_Click" style="float: right;" CausesValidation="false" formnovalidate="true" />
            <div style="clear:both;"></div>
        </div>
        
        <asp:GridView ID="gvProductos" runat="server" 
                      CssClass="gridview" 
                      AutoGenerateColumns="False"
                      EmptyDataText="No hay productos disponibles en el catálogo"
                      OnRowCommand="gvProductos_RowCommand"
                      DataKeyNames="Id"
                      GridLines="None">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px" />
                <asp:BoundField DataField="Name" HeaderText="Producto" />
                <asp:BoundField DataField="Description" HeaderText="Descripción" />
                <asp:BoundField DataField="Price" HeaderText="Precio" DataFormatString="{0:C}" />
                <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="200px">
                    <ItemTemplate>
                        <asp:Button ID="btnEditar" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("Id") %>' CssClass="btn" CausesValidation="false" formnovalidate="true" />
                        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-danger" OnClientClick="return confirm('¿Eliminar este producto?');" CausesValidation="false" formnovalidate="true" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>

    <asp:Panel ID="pnlFormulario" runat="server" Visible="false" CssClass="formulario">
        <h2>Detalles del Producto</h2>
        <asp:HiddenField ID="hdfIdProducto" runat="server" Value="0" />
        
        <div class="form-group">
            <label>Nombre del Producto:</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Ej: Monitor LED" required="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Descripción:</label>
            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" placeholder="Detalles técnicos..." required="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Precio Unitario:</label>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" type="number" step="0.01" required="true"></asp:TextBox>
        </div>
        <div style="margin-top: 30px;">
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Producto" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
            <asp:Button ID="btnCancelar" runat="server" Text="Volver al listado" CssClass="btn" OnClick="btnCancelar_Click" CausesValidation="false" formnovalidate="true" />
        </div>
    </asp:Panel>
</asp:Content>