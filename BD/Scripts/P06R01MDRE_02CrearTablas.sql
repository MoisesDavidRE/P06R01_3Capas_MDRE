USE ShopDB
GO
-- =========================================================================
-- Author: Moisés David Ramón Esteban
-- Create Date: 2026-03-29
-- Description: Creación de tablas "Product", "Client" y "Order"
-- P06R01_BD_MDRE: 02CrearTablas 
-- =========================================================================

-- Crear la tabla Product
BEGIN TRANSACTION
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Product')
    BEGIN
        CREATE TABLE [dbo].[Product](
            [Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
            [Name] [varchar](50) NOT NULL,
            [Description] [varchar](250) NOT NULL,
            [Price] [decimal] NOT NULL
        )
    END
    ELSE
        PRINT 'La tabla [dbo].[Product] ya existe'
    COMMIT TRANSACTION;
END TRY 
BEGIN CATCH 
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
        THROW;
END CATCH;
GO

-- Crear la tabla Client
BEGIN TRANSACTION
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Client')
    BEGIN
        CREATE TABLE [dbo].[Client](
            [Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
            [Name] [varchar](50) NOT NULL,
            [MidName] [varchar](50) NOT NULL,
            [Email] [varchar](50) NOT NULL
        )
    END
    ELSE
        PRINT 'La tabla [dbo].[Client] ya existe'
    COMMIT TRANSACTION;
END TRY 
BEGIN CATCH 
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
        THROW;
END CATCH;
GO

-- Crear la tabla Order
BEGIN TRANSACTION
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Order')
    BEGIN
        CREATE TABLE [dbo].[Order](
            [Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
            [IdProduct] [int] NOT NULL,
            [IdClient] [int] NOT NULL,
            [Fecha] [datetime] NOT NULL,
            [Quantity] [int] NOT NULL,
            CONSTRAINT [FK_Order_Product] FOREIGN KEY ([IdProduct]) REFERENCES [dbo].[Product]([Id]),
            CONSTRAINT [FK_Order_Client] FOREIGN KEY ([IdClient]) REFERENCES [dbo].[Client]([Id])
        )
    END
    ELSE
        PRINT 'La tabla [dbo].[Order] ya existe'
    COMMIT TRANSACTION;
END TRY 
BEGIN CATCH 
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
        THROW;
END CATCH;
GO