<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShopWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        :root {
            --primary-color: #4e54c8;
            --secondary-color: #8f94fb;
            --text-dark: #2d3436;
            --text-light: #636e72;
            --card-bg: #ffffff;
        }

        .dashboard-header {
            font-size: 2.5em;
            background: -webkit-linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 10px;
            font-weight: 800;
            animation: fadeInDown 0.8s ease-out;
        }

        .lead-text {
            font-size: 1.2em;
            color: var(--text-light);
            margin-bottom: 40px;
            animation: fadeIn 1s ease-out 0.3s both;
        }

        .modules-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            padding: 10px;
        }

        .module-card {
            background: var(--card-bg);
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            z-index: 1;
            display: flex;
            flex-direction: column;
            min-height: 250px;
            animation: fadeInUp 0.8s ease-out both;
        }

        .module-card::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            transition: height 0.3s ease;
            z-index: -1;
        }

        .module-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(78, 84, 200, 0.2);
        }

        .module-card:hover::before {
            height: 100%;
            opacity: 0.05;
        }

        .module-icon {
            font-size: 3em;
            margin-bottom: 15px;
            display: inline-block;
        }

        .module-title {
            color: var(--text-dark);
            font-size: 1.5em;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .module-desc {
            color: var(--text-light);
            line-height: 1.6;
            flex-grow: 1;
            margin-bottom: 25px;
        }

        .btn-formal {
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: bold;
            transition: transform 0.2s, box-shadow 0.2s;
            display: inline-block;
            text-align: center;
        }

        .btn-formal:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(78, 84, 200, 0.4);
            color: white;
        }

        .card-1 { animation-delay: 0.2s; }
        .card-2 { animation-delay: 0.4s; }
        .card-3 { animation-delay: 0.6s; }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>

    <main style="padding: 30px 0;">
        <section aria-labelledby="aspnetTitle" style="text-align: center; margin-bottom: 50px;">
            <h1 id="aspnetTitle" class="dashboard-header">Panel de Administración</h1>
            <p class="lead-text">Bienvenido al sistema de gestión integral. Seleccione el módulo que desea operar.</p>
        </section>

        <div class="modules-container">
            <section class="module-card card-1" aria-labelledby="clientesTitle">
                <div class="module-icon">👥</div>
                <h2 id="clientesTitle" class="module-title">Clientes</h2>
                <p class="module-desc">
                    Administre el registro, la información de contacto y el seguimiento de su cartera de clientes en el sistema.
                </p>
                <div style="text-align: left; margin-top: auto;">
                    <a class="btn-formal" href="Clients.aspx">Gestionar Clientes &rarr;</a>
                </div>
            </section>
            
            <section class="module-card card-2" aria-labelledby="productosTitle">
                <div class="module-icon">📦</div>
                <h2 id="productosTitle" class="module-title">Productos</h2>
                <p class="module-desc">
                    Mantenga actualizado el catálogo de artículos, controlando las descripciones técnicas y los precios unitarios.
                </p>
                <div style="text-align: left; margin-top: auto;">
                    <a class="btn-formal" href="Productos.aspx">Gestionar Productos &rarr;</a>
                </div>
            </section>
            
            <section class="module-card card-3" aria-labelledby="ordenesTitle">
                <div class="module-icon">🛒</div>
                <h2 id="ordenesTitle" class="module-title">Órdenes</h2>
                <p class="module-desc">
                    Procese transacciones, vincule artículos con compradores y supervise el flujo del inventario y ventas.
                </p>
                <div style="text-align: left; margin-top: auto;">
                    <a class="btn-formal" href="Order.aspx">Gestionar Órdenes &rarr;</a>
                </div>
            </section>
        </div>
    </main>
</asp:Content>