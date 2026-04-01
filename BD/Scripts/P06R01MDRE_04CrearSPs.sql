USE ShopDB;
GO
-- =========================================================================
-- Author: Moisés David Ramón Esteban
-- Create Date: 03/29/2026
-- Description: Creación de procedimientos almacenados INSERT, UPDATE, DELETE Y SELECT
-- P0601MDRE: 04CrearSPs
-- =========================================================================

-- Store Procedures Para la tabla Product
CREATE OR ALTER PROCEDURE [dbo].[ListProductSP]
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        SELECT [Id],[Name],[Description],[Price] FROM [dbo].[Product];
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[ListProductByIdSP]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        SELECT [Id],[Name],[Description],[Price] FROM [dbo].[Product] WHERE Id = @Id;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[InsertProductSP] 
    @Name VARCHAR(100), 
    @Description VARCHAR(100), 
    @Price DECIMAL
AS
BEGIN 
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO [dbo].[Product] ([Name], [Description], [Price]) 
        VALUES (@Name, @Description, @Price);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[UpdateProductSP]
    @Id INT,
    @Name VARCHAR(100),
    @Description VARCHAR(100),
    @Price DECIMAL
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE [dbo].[Product] SET
            [Name] = @Name,
            [Description] = @Description,
            [Price] = @Price
        WHERE Id = @Id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[DeleteProductSP] 
    @IdProduct INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DELETE FROM [dbo].[Product] WHERE Id = @IdProduct;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

-- Store Procedures Para la tabla Client

CREATE OR ALTER PROCEDURE [dbo].[ListClientsSP]
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        SELECT * FROM [dbo].[Client];
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[InsertClientSP] 
    @Name VARCHAR(50),
    @MidName VARCHAR(50),
    @Email VARCHAR(50)
AS
BEGIN 
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO [dbo].[Client] ([Name], [MidName], [Email]) 
        VALUES (@Name, @MidName, @Email);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[UpdateClientSP] 
    @IdClient INT,
    @Name VARCHAR(50),
    @MidName VARCHAR(50),
    @Email VARCHAR(50)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE [dbo].[Client] SET
            [Name] = @Name, 
            [MidName] = @MidName,
            [Email] = @Email
        WHERE Id = @IdClient;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[DeleteClientSP] 
    @IdClient INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DELETE FROM [dbo].[Client] WHERE Id = @IdClient;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

-- Store Procedures Para la tabla Rutas

CREATE OR ALTER PROCEDURE [dbo].[ListOrdersSP]
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        SELECT * FROM [dbo].[Order];
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[InsertOrderSP] 
    @IdProduct INT,
    @IdClient INT,
    @Fecha DATETIME,
    @Quantity INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO [dbo].[Order] (IdProduct, IdClient, Fecha, Quantity) 
        VALUES (@IdProduct, @IdClient, @Fecha, @Quantity);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[UpdateOrderSP]
    @IdOrder INT,
    @IdProducto INT,
    @IdClient INT, 
    @Fecha DATETIME,
    @Quantity INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE [dbo].[Order] SET
            IdProduct = @IdProducto, 
            IdClient = @IdClient,
            Fecha = @Fecha,
            Quantity = @Quantity
        WHERE Id = @IdOrder;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[DeleteOrderSP] 
    @IdOrder INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DELETE FROM [dbo].[Order] WHERE Id = @IdOrder;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

-- SP Adicionales

CREATE OR ALTER   PROCEDURE [dbo].[ListProductByIdSP]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        SELECT [Id],[Name],[Description],[Price] FROM [dbo].[Product] WHERE Id = @Id;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

PRINT ('Procedimientos almacenados creados exitosamente')