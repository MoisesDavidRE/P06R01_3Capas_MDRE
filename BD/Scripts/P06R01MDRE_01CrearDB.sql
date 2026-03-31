-- =========================================================================
-- Author: Moisés David Ramón Esteban
-- Create Date: 2026-03-29
-- Description: Creación de BD
-- P06R01_BD_MDRE: 01CrearBD 
-- =========================================================================
DECLARE @NombreBD VARCHAR(25) = 'ShopDB';
DECLARE @SQLQuery NVARCHAR(MAX) = 'CREATE DATABASE ' + QUOTENAME(@NombreBD);

BEGIN TRY
    EXEC sp_executesql @SQLQuery;
    PRINT 'La base de datos ' + @NombreBD + ' fue creada exitosamente.';
END TRY
BEGIN CATCH
    PRINT 'La base de datos ' + @NombreBD + ' ya existe o hubo un error.';
    THROW;
END CATCH;
GO