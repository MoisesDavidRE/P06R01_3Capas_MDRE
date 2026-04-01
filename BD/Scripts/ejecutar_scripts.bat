@echo off
set SERVER=(localdb)\MSSQLLocalDB

sqlcmd -S %SERVER% -E -i P06R01MDRE_01CrearDB.sql
sqlcmd -S %SERVER% -E -i P06R01MDRE_02CrearTablas.sql
sqlcmd -S %SERVER% -E -i P06R01MDRE_03CargaInicial.sql
sqlcmd -S %SERVER% -E -i P06R01MDRE_04CrearSPs.sql
sqlcmd -S %SERVER% -E -i P06R01MDRE_05CrearViews.sql

pause