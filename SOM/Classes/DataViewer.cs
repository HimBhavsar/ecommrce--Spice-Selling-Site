using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SOM.Classes
{
    public class DataViewer
    {
        public static DataTable ViewProducts()
        {
            DataSet dsResult = new DataSet();
            try
            {

                string strQuery = "SELECT ProductID, ProductName, ProductCategoryID, ProductDescription, ProductImagePath, NewLaunch, OurSpeciality, MostPopular, StarRating, RelatedProducts, InStock, IsActive FROM MastProducts Where IsActive = 'True'";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        //cmd.Parameters.AddWithValue("@ProductCategoryID", ProductCategoryID);

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


        public static DataTable isRegistered(string strMobileNumber)
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


        public static DataTable ViewCart(string strProductID)
        {
            DataSet dsResult = new DataSet();
            try
            {

                string strQuery = "SELECT ProductID, ProductName, ProductCategoryID, ProductDescription, ProductImagePath, NewLaunch, OurSpeciality, MostPopular, StarRating, RelatedProducts, InStock, IsActive FROM MastProducts Where ProductID = @PID";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        //cmd.Parameters.AddWithValue("@CID", ProductCategoryID);
                        cmd.Parameters.AddWithValue("@PID", strProductID);

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


        public static DataTable filterProducts( string strText)
        {
            DataSet dsResult = new DataSet();
            try
            {

                string strQuery = "SELECT ProductID, ProductName, ProductCategoryID, ProductDescription, ProductImagePath, NewLaunch, OurSpeciality, MostPopular, StarRating, RelatedProducts, InStock, IsActive FROM MastProducts Where  [ProductName] Like '%'+@Text+'%'";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        //cmd.Parameters.AddWithValue("@ProductCategoryID", ProductCategoryID);
                        cmd.Parameters.AddWithValue("@Text", strText);

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



        public static DataTable ViewMyOrder(string strCustomerID)
        {
            DataSet dsResult = new DataSet();
            try
            {
                string strQuery = "SELECT * FROM Orders WHERE CustomerID = @CustomerID Order By OrderDateTime desc";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@CustomerID", strCustomerID);

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

        public static DataTable ViewSpecificOrder(string strCustomerID,string strOrderID)
        {
            DataSet dsResult = new DataSet();
            try
            {
                string strQuery = "select OrderID,OrderNumber,MastCustomer.FirstName+' '+MastCustomer.LastName as Name,MastCustomer.MobileNumber,CONCAT(MastCustomer.Address1 ,', ' ,MastCustomer.Area , ', ' , MastCustomer.City , ', ' , MastCustomer.Pin , ', ' ,MastCustomer.State) as Address,OrderDateTime,Orders.OrderValue " +
                                    "from Orders " +
                                    "INNER JOIN MastCustomer " +
                                    "ON Orders.CustomerID = MastCustomer.CustomerID " +
                                    "WHERE OrderID = @OrderID";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@CustomerID", strCustomerID);
                        cmd.Parameters.AddWithValue("@OrderID", strOrderID);

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

        public static DataTable ViewOrderDetails(string strCustomerID, string strOrderID)
        {
            DataSet dsResult = new DataSet();
            try
            {
                string strQuery = "SELECT MastCustomer.CustomerID,MastCustomer.FirstName + ' ' +MastCustomer.LastName as CustomerName,MastCustomer.MobileNumber,MastCustomer.Address1 +', '+MastCustomer.Area+', '+MastCustomer.City+', '+MastCustomer.Pin+'.' as DeliveryAddress,Orders.OrderNumber,Orders.OrderDateTime,Orders.OrderValue,Orders.IsCancelled,Orders.CancellationReason,MastProducts.ProductName + ' - ' +MastProductCategory.ProductCategory As Product, MastProducts.ProductImagePath as Path, OrderDetails.Qty,MastProductPackaging.WeightInGrams,OrderDetails.MRP,OrderDetails.Discount,OrderDetails.FinalRate,OrderDetails.Amount " +
                                    "FROM Orders " +
                                    "INNER JOIN OrderDetails " +
                                        "ON Orders.OrderID = OrderDetails.OrderID " +
                                    "INNER JOIN MastCustomer " +
                                        "ON Orders.CustomerID = MastCustomer.CustomerID " +
                                    "INNER JOIN MastProductPackaging " +
                                        "ON OrderDetails.ProductPackagingID = MastProductPackaging.ProductPackagingID " +
                                    "INNER JOIN MastProducts " +
                                        "ON MastProductPackaging.ProductID = MastProducts.ProductID " +
                                    "INNER JOIN MastProductCategory " +
                                        "ON MastProducts.ProductCategoryID = MastProductCategory.ProductCategoryID " +
                                    "Where Orders.OrderID = @OrderID and Orders.CustomerID = @CustomerID";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@CustomerID", strCustomerID);
                        cmd.Parameters.AddWithValue("@OrderID", strOrderID);

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

        public static DataTable ProductPackagingDDL(string strProductID)
        {
            try
            {
                DataSet dsResult = new DataSet();
                DataTable dt = new DataTable();
                using (SqlConnection Con = Connection.GetConnection())
                {
                    if (Con.State != ConnectionState.Open)
                        Con.Open();

                    string strQuery = "select '0' as ProductPackagingID,'0' as ProductID,'-- Packages List --' as WeightInGrams, '0' as MRP, '0' as Discount,'0' as RecommendedPack,'0' as InStock,'0' as IsActive UNION SELECT ProductPackagingID, ProductID, CONVERT(varchar(10), WeightInGrams) as WeightInGrams, CONVERT(varchar(10), MRP) as MRP, Discount, RecommendedPack, InStock, IsActive FROM MastProductPackaging WHERE ProductID = @ProductID AND IsActive = 1";
                    //+"AND ProductPackagingID = @ProductPackagingID";

                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@ProductID", strProductID);
                        //cmd.Parameters.AddWithValue("@ProductPackagingID", strProductPackagingID);

                        using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                        {
                            adp.Fill(dsResult);
                        }
                    }


                    if (Con.State != ConnectionState.Closed)
                        Con.Close();

                    if (dsResult == null || dsResult.Tables.Count == 0)
                        return null;
                    else
                        return dsResult.Tables[0];
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public static DataTable GetProductDetails(int intProductID)
        {
            DataSet dsResult = new DataSet();

            try
            {
                string strQuery = "SELECT ProductID, ProductName, ProductCategoryID, ProductDescription, ProductImagePath, NewLaunch, OurSpeciality, MostPopular, StarRating, RelatedProducts, InStock, MastProducts.IsActive FROM MastProducts Where ProductID= @ProductID";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@ProductID", intProductID);
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