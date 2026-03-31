USE ShopDB
GO

-- =========================================================================
-- Author: Moisés David Ramón Esteban
-- Create Date: 03/29/2026
-- Description: Inserción de datos en tablas
-- P06R01MDRE: 03CargaInicial  
-- =========================================================================

-- Insertar datos para la tabla Product
INSERT INTO [dbo].[Product] ([Name], [Description], [Price])
VALUES 
('Laptop', 'Computadora portatil de 15 pulgadas', 1200.50),
('Mouse', 'Mouse inalambrico ergonomico', 25.00),
('Teclado', 'Teclado mecanico retroiluminado', 85.99),
('Monitor', 'Monitor 27 pulgadas 4K', 350.00),
('Audifonos', 'Audifonos con cancelacion de ruido', 150.75);
GO

-- Insertar datos para la tabla Choferes
INSERT INTO [dbo].[Client] ([Name], [MidName], [Email])
VALUES 
('Juan', 'Perez', 'juan.perez@email.com'),
('Maria', 'Gomez', 'maria.gomez@email.com'),
('Carlos', 'Lopez', 'carlos.lopez@email.com'),
('Ana', 'Martinez', 'ana.martinez@email.com'),
('Luis', 'Garcia', 'luis.garcia@email.com');
GO

-- Insertar datos para la tabla Rutas
INSERT INTO [dbo].[Order] ([IdProduct], [IdClient], [Fecha], [Quantity])
VALUES 
(1, 1, '2026-03-31 10:00:00', 1),
(2, 2, '2026-03-31 10:30:00', 2),
(3, 3, '2026-03-31 11:15:00', 1),
(4, 4, '2026-03-31 14:20:00', 1),
(5, 5, '2026-03-31 16:45:00', 3);
GO