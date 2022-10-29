using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SOM.Classes
{
    public class Connection
    {
        public Connection()
        {
                
        }
        public static SqlConnection GetConnection()
        {
            SqlConnection con;
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
                return con;
            }
            catch (Exception ex)
            {
                //   throw ex;
                return null;
            }
        }
    }
}