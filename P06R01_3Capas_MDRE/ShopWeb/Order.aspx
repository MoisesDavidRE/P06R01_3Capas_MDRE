<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ordenes.aspx.cs" Inherits="ShopWeb.Ordenes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Gestión de Órdenes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>🛒 Gestión de Órdenes</h1>
    
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
                      DataKeyNames="Id"
                      GridLines="None">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px" />
                
                <asp:TemplateField HeaderText="Producto">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfIdProduct" runat="server" Value='<%# Eval("IdProduct") %>' />
                        <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Cliente">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfIdClient" runat="server" Value='<%# Eval("IdClient") %>' />
                        <asp:Label ID="lblClientName" runat="server" Text='<%# Eval("ClientName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Quantity" HeaderText="Cantidad" />
                
                <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="200px">
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
        <div style="margin-top: 30px;">
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Orden" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
            <asp:Button ID="btnCancelar" runat="server" Text="Volver al listado" CssClass="btn" OnClick="btnCancelar_Click" formnovalidate="true" />
        </div>
    </asp:Panel>
</asp:Content>