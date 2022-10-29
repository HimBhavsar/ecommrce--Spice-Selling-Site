using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting;
using System.Web;

namespace SOM.Classes
{
    public class CustomerLogin
    {
        public static DataTable login(string strMobileNumber)
        {
            DataSet dsResult = new DataSet();
            try
            {

                string strQuery = "SELECT * FROM MastCustomer where MobileNumber = @Mob";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@Mob", strMobileNumber);
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


        public static int userRegistration(string strFName, string strLName, string strMobileNumber, string strAddress1, string strAddress2, string strArea, string strCity, string strPin, string strState)
        {
            try
            {

                int intResult = 0;
                using (SqlConnection Con = Connection.GetConnection())
                {
                    if (Con.State != ConnectionState.Open)
                        Con.Open();

                    string strQuery = "INSERT INTO MastCustomer (FirstName,[LastName],[MobileNumber],[Password],[Address1],[Address2],[Area],[City],[Pin],[State]) VALUES (@FName, @LName, @MobileNumber, @Password, @Address1,@Address2,@Area,@City,@Pin,@State); Select SCOPE_IDENTITY();";


                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@FName", strFName);
                        cmd.Parameters.AddWithValue("@LName", strLName);
                        cmd.Parameters.AddWithValue("@MobileNumber", strMobileNumber);
                        cmd.Parameters.AddWithValue("@Password", DBNull.Value);
                        cmd.Parameters.AddWithValue("@Address1", strAddress1);
                        cmd.Parameters.AddWithValue("@Address2", strAddress2);
                        cmd.Parameters.AddWithValue("@Area", strArea);
                        cmd.Parameters.AddWithValue("@City", strCity);
                        cmd.Parameters.AddWithValue("@Pin", strPin);
                        cmd.Parameters.AddWithValue("@State", strState);


                        object obj = cmd.ExecuteScalar();

                        if (obj != DBNull.Value && obj != null)
                            intResult = Convert.ToInt32(obj);
                    }

                    if (Con.State != ConnectionState.Closed)
                        Con.Close();
                }

                return intResult;
            }
            catch (Exception ex)
            {
                return 0;
            }
            

        }

    }
}