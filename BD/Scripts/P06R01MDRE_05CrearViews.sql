USE ShopDB
GO
-- =========================================================================
-- Author: Moisés David Ramón Esteban
-- Create Date: 03/29/2026
-- Description: Creación de vistas
-- P06R01MDRE: 05CrearViews
-- =========================================================================
CREATE OR ALTER VIEW [dbo].[ViewProduct] AS 
SELECT 
    Id,
    Name,
    Description,
    Price
FROM [dbo].[Product];
GO

CREATE OR ALTER VIEW [dbo].[ViewClient] AS 
SELECT 
    Id,
    Name,
    MidName,
    Email
FROM [dbo].[Client];
GO

CREATE OR ALTER VIEW [dbo].[ViewOrder] AS 
SELECT 
    o.Id,
    o.IdProduct,
    p.Name AS ProductName,
    o.IdClient,
    c.Name AS ClientName,
    c.MidName AS ClientMidName,
    o.Fecha,
    o.Quantity,
    (o.Quantity * p.Price) AS TotalCalculado
FROM [dbo].[Order] o
INNER JOIN [dbo].[Product] p ON o.IdProduct = p.Id
INNER JOIN [dbo].[Client] c ON o.IdClient = c.Id;
GO