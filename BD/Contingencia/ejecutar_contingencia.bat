@echo off
set SERVER=(localdb)\MSSQLLocalDB

sqlcmd -S %SERVER% -E -i P06R01MDRE_A_DropViews.sql
sqlcmd -S %SERVER% -E -i P06R01MDRE_B_DropStoreProcedures.sql
sqlcmd -S %SERVER% -E -i P06R01MDRE_C_DropTables.sql
sqlcmd -S %SERVER% -E -i P06R01MDRE_D_DropDataBase.sql

pause