using SOM.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SOM.Admin.Classes
{
    public class AdminLogin
    {
        public static DataTable login(string strUsername,string strPassword)
        {
            DataSet dsResult = new DataSet();
            try
            {

                string strQuery = "SELECT * FROM MastAdminUsers where UserName = @UserName and Password = @Password";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@UserName", strUsername);
                        cmd.Parameters.AddWithValue("@Password", strPassword);
                        using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                        {
                            adp.Fill(dsResult);
                        }
                    }
                }


            }
            catch (Exception ex)
            {
                return null;
            }
            if (dsResult == null || dsResult.Tables.Count == 0)
                return null;
            else
                return dsResult.Tables[0];

        }
    }
}