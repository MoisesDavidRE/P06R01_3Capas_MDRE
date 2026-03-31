<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShopWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .dashboard-header { border-bottom: 3px solid #2c3e50; padding-bottom: 15px; margin-bottom: 20px; color: #2c3e50; font-weight: bold; }
        .module-card { background: #fff; border: 1px solid #e0e0e0; border-radius: 8px; padding: 25px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); transition: all 0.3s ease; height: 100%; display: flex; flex-direction: column; justify-content: space-between; }
        .module-card:hover { box-shadow: 0 8px 15px rgba(0,0,0,0.1); transform: translateY(-2px); border-color: #2c3e50; }
        .module-title { color: #2c3e50; font-size: 1.5em; font-weight: bold; margin-bottom: 15px; border-bottom: 1px solid #eee; padding-bottom: 10px; }
        .module-desc { color: #555; line-height: 1.6; margin-bottom: 20px; flex-grow: 1; }
        .btn-formal { background-color: #2c3e50; color: #fff; border: none; padding: 10px 20px; border-radius: 4px; text-decoration: none; display: inline-block; font-weight: bold; transition: background 0.2s; text-align: center; }
        .btn-formal:hover { background-color: #1a252f; color: #fff; text-decoration: none; }
        .lead-text { font-size: 1.2em; color: #666; margin-bottom: 40px; }
        .modules-container { display: flex; flex-wrap: wrap; gap: 20px; margin-top: 20px; }
        .module-col { flex: 1; min-width: 300px; }
    </style>

    <main style="padding: 20px 0;">
        <section aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle" class="dashboard-header">Panel de Administración</h1>
            <p class="lead-text">Bienvenido al sistema de gestión integral. Seleccione el módulo que desea operar.</p>
        </section>

        <div class="modules-container">
            <section class="module-col" aria-labelledby="clientesTitle">
                <div class="module-card">
                    <div>
                        <h2 id="clientesTitle" class="module-title">Clientes</h2>
                        <p class="module-desc">
                            Administre el registro, la información de contacto y el seguimiento de su cartera de clientes en el sistema.
                        </p>
                    </div>
                    <div style="text-align: right;">
                        <a class="btn-formal" href="Clients.aspx">Acceder a Clientes &raquo;</a>
                    </div>
                </div>
            </section>
            
            <section class="module-col" aria-labelledby="productosTitle">
                <div class="module-card">
                    <div>
                        <h2 id="productosTitle" class="module-title">Productos</h2>
                        <p class="module-desc">
                            Mantenga actualizado el catálogo de artículos, controlando las descripciones técnicas y los precios unitarios.
                        </p>
                    </div>
                    <div style="text-align: right;">
                        <a class="btn-formal" href="Productos.aspx">Acceder a Productos &raquo;</a>
                    </div>
                </div>
            </section>
            
            <section class="module-col" aria-labelledby="ordenesTitle">
                <div class="module-card">
                    <div>
                        <h2 id="ordenesTitle" class="module-title">Órdenes</h2>
                        <p class="module-desc">
                            Procese transacciones, vincule artículos con compradores y supervise el flujo del inventario y ventas.
                        </p>
                    </div>
                    <div style="text-align: right;">
                        <a class="btn-formal" href="Order.aspx">Acceder a Órdenes &raquo;</a>
                    </div>
                </div>
            </section>
        </div>
    </main>
</asp:Content>