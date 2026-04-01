<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="ShopWeb.Clientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Gestión de Clientes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>👥 Gestión de Clientes</h1>
    
    <asp:Panel ID="pnlMensaje" runat="server" Visible="false">
        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    </asp:Panel>

    <asp:Panel ID="pnlListado" runat="server">
        <div class="filtros">
            <asp:Button ID="btnNuevo" runat="server" Text="+ Nuevo Cliente" CssClass="btn btn-success" OnClick="btnNuevo_Click" style="float: right;" />
            <div style="clear:both;"></div>
        </div>
        
        <asp:GridView ID="gvClientes" runat="server" 
                      CssClass="gridview" 
                      AutoGenerateColumns="False"
                      EmptyDataText="No hay clientes registrados."
                      OnRowCommand="gvClientes_RowCommand"
                      DataKeyNames="Id"
                      GridLines="None">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px" />
                <asp:BoundField DataField="Name" HeaderText="Nombre" />
                <asp:BoundField DataField="MidName" HeaderText="Apellido" />
                <asp:BoundField DataField="Email" HeaderText="Correo Electrónico" />
                <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="200px">
                    <ItemTemplate>
                        <asp:Button ID="btnEditar" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("Id") %>' CssClass="btn" />
                        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-danger" OnClientClick="return confirm('¿Eliminar este cliente de forma permanente?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>

    <asp:Panel ID="pnlFormulario" runat="server" Visible="false" CssClass="formulario">
        <h2>Detalles del Cliente</h2>
        <asp:HiddenField ID="hdfIdCliente" runat="server" Value="0" />
        
        <div class="form-group">
            <label>Nombre Completo:</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" required="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Apellido:</label>
            <asp:TextBox ID="txtMidName" runat="server" CssClass="form-control" required="true"></asp:TextBox>
        </div>
        <div class="form-group">    
            <label>Correo Electrónico:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" type="email" required="true"></asp:TextBox>
        </div>
        <div style="margin-top: 30px;">
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cliente" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
            <asp:Button ID="btnCancelar" runat="server" Text="Volver al listado" CssClass="btn" OnClick="btnCancelar_Click" formnovalidate="true" />
        </div>
    </asp:Panel>
</asp:Content>