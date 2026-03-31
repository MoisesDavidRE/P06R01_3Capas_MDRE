using System;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class Conection
    {
        private static string CadenaConexion = "Server=(localdb)\\MSSQLLocalDB;Database=ShopDB;Trusted_Connection=True;";

        public static SqlConnection ObtenerConexion() 
        {
            SqlConnection Connection;
            try
            {
                Connection = new SqlConnection(CadenaConexion);
                Connection.Open();
            }
            catch (Exception ex) 
            {
                throw new Exception("Error al conectar con la base de datos: " + ex.Message);
            }
            return Connection;
        }
        public void CerrarConexion(SqlConnection Connection) 
        {
            try
            {
                Connection.Close();
            }
            catch (Exception ex) 
            {
                throw new Exception("Error al cerrar la conexión con la base de datos");
            }
        }
        public bool ProbarConexion() 
        {
            try
            {
                using (SqlConnection Connection = ObtenerConexion())
                {
                    return Connection.State == System.Data.ConnectionState.Open;
                }
            }
            catch 
            {
                return false;
            }
        }
    }
}
