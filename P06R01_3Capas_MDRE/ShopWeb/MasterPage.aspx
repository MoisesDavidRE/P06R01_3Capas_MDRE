<%@ Master Language="C#" AutoEventWireup="true" CodeBehind="Site.master.cs" Inherits="ShopWeb.SiteMaster" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><asp:ContentPlaceHolder ID="TitleContent" runat="server"></asp:ContentPlaceHolder></title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; background-color: #f5f5f5; padding-top: 60px; }
        .navbar { background-color: #343a40; overflow: hidden; position: fixed; top: 0; width: 100%; z-index: 1000; }
        .navbar a { float: left; display: block; color: white; text-align: center; padding: 14px 20px; text-decoration: none; font-size: 16px; }
        .navbar a:hover { background-color: #ddd; color: black; }
        .container { max-width: 1200px; margin: 20px auto; background-color: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
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
    <asp:ContentPlaceHolder ID="HeadContent" runat="server"></asp:ContentPlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <a href="Default.aspx">Inicio</a>
            <a href="Productos.aspx">Productos</a>
            <a href="Clientes.aspx">Clientes</a>
            <a href="Ordenes.aspx">Órdenes</a>
        </div>

        <div class="container">
            <asp:ContentPlaceHolder ID="MainContent" runat="server"></asp:ContentPlaceHolder>
        </div>
    </form>
</body>
</html>