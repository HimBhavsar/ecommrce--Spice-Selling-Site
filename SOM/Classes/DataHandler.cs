using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SOM.Classes
{
    public class DataHandler
    {

        
        public static int addOrderDetails(int intOrderID,int intProductPackagingID, int intQty, double dblMRP, double dblDiscount)
        {
            try
            {
                int intResult = 0;
                using (SqlConnection Con = Connection.GetConnection())
                {
                    if (Con.State != ConnectionState.Open)
                        Con.Open();

                    string strQuery = "INSERT INTO OrderDetails (OrderID,ProductPackagingID,Qty,MRP,Discount,FinalRate,Amount) values" +
                                "(@OrderID,@ProductPackagingID,@Qty,@MRP,@Discount,@FinalRate,@Amount)";

                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@OrderID", intOrderID);
                        cmd.Parameters.AddWithValue("@ProductPackagingID", intProductPackagingID);
                        cmd.Parameters.AddWithValue("@Qty", intQty);
                        cmd.Parameters.AddWithValue("@MRP", dblMRP);
                        cmd.Parameters.AddWithValue("@Discount", dblDiscount);
                        double FinalRate = dblMRP - (dblMRP * dblDiscount / 100);
                        cmd.Parameters.AddWithValue("@FinalRate", FinalRate);
                        double Amount = FinalRate * intQty;
                        cmd.Parameters.AddWithValue("@Amount", Amount);

                        intResult = cmd.ExecuteNonQuery();

                        

                        
                    }

                    if (Con.State != ConnectionState.Closed)
                        Con.Close();

                }
                return intResult;
            }
            catch (Exception ex)
            {
                string err = ex.ToString();
                return 0;
            }
        }

        public static int addOrder(string strCustomerID, string strValue, string strIsCancelled,string strCancellationReason)
        {
            try
            {
                int intResult = 0;
                using (SqlConnection Con = Connection.GetConnection())
                {
                    if (Con.State != ConnectionState.Open)
                        Con.Open();

                    string strQuery = "Declare @ISM as varchar(15) = (Select * from Settings);"+
                        "Declare @NOR as int = (select COUNT(OrderID) from Orders) +1;"+
                        "INSERT INTO Orders([OrderNumber],[CustomerID],[OrderDateTime],[OrderValue],[IsCancelled],[CancellationReason]) values"+
                        "(Concat(@ISM, '00000' + Convert(varchar(11),@NOR)), @CustomerID, GETDATE(), @Value, @IsCancelled, @CancellationReason); select SCOPE_IDENTITY();";

                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@CustomerID", strCustomerID);
                        cmd.Parameters.AddWithValue("@Value", strValue);
                        cmd.Parameters.AddWithValue("@IsCancelled", strIsCancelled);
                        cmd.Parameters.AddWithValue("@CancellationReason", strCancellationReason);

                        object obj = cmd.ExecuteScalar();

                        if (obj != DBNull.Value && obj != null)
                            intResult = Convert.ToInt32(obj);
                    }

                    if (Con.State != ConnectionState.Closed)
                        Con.Close();

                }
                return intResult;
            }
            catch (Exception)
            {

                return 0;
            }
        }


        public static int cancelOrder(int intOrderID,bool IsCancelled, string strCancellationReason)
        {
            try
            {
                int intResult = 0;
                using (SqlConnection Con = Connection.GetConnection())
                {
                    if (Con.State != ConnectionState.Open)
                        Con.Open();

                    string strQuery = "UPDATE Orders SET IsCancelled = @IsCancelled, CancellationReason = @CancellationReason WHERE OrderID = @OrderID";

                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@OrderID", intOrderID);
                        cmd.Parameters.AddWithValue("@IsCancelled", IsCancelled);
                        cmd.Parameters.AddWithValue("@CancellationReason", strCancellationReason);

                        object obj = cmd.ExecuteScalar();

                        if (obj != DBNull.Value && obj != null)
                            intResult = Convert.ToInt32(obj);
                    }

                    if (Con.State != ConnectionState.Closed)
                        Con.Close();

                }
                return intResult;
            }
            catch (Exception)
            {

                return 0;
            }
        }

    }
}