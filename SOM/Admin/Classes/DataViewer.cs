using SOM.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SOM.Admin.Classes
{
    public class DataViewer
    {
        public static DataTable ViewOrder()
        {
            DataSet dsResult = new DataSet();
            try
            {
                string strQuery = "select OrderID,OrderNumber,MastCustomer.FirstName+' '+MastCustomer.LastName as Name,MastCustomer.MobileNumber,MastCustomer.Address1+', '+MastCustomer.Area+', '+MastCustomer.City+', '+MastCustomer.Pin+', '+MastCustomer.State as Address,OrderDateTime,Orders.OrderValue from Orders "+
                                    "INNER JOIN MastCustomer "+
                                    "ON Orders.CustomerID = MastCustomer.CustomerID " +
                                    "Order By OrderDateTime Desc";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
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

        public static DataTable ViewCustomers()
        {
            DataSet dsResult = new DataSet();
            try
            {
                string strQuery = "SELECT MastCustomer.CustomerID, MastCustomer.FirstName +' '+MastCustomer.LastName as CustomerName,MastCustomer.MobileNumber, MastCustomer.Address1 + ', '+MastCustomer.Area+ ', '+MastCustomer.City+ ', '+MastCustomer.Pin+ ', '+MastCustomer.State as Address,MastCustomer.Address2 from MastCustomer";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
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



        public static DataTable FilterCustomers(string strText)
        {
            DataSet dsResult = new DataSet();
            try
            {
                string strQuery = "SELECT MastCustomer.CustomerID, MastCustomer.FirstName +' '+MastCustomer.LastName as CustomerName,MastCustomer.MobileNumber, MastCustomer.Address1 + ', '+MastCustomer.Address2 + ', '+MastCustomer.Area+ ', '+MastCustomer.City+ ', '+MastCustomer.Pin+ ', '+MastCustomer.State as Address,MastCustomer.Address2 from MastCustomer WHERE [FirstName] like '%'+ @Text +'%' " +
                    "OR [LastName] LIKE '%' + @Text + '%' " +
                    "OR [MobileNumber] LIKE '%' + @Text + '%' " +
                    "OR [Address1] LIKE '%' + @Text + '%' " +
                    "OR [Address2] LIKE '%' + @Text + '%' " +
                    "OR [Area] LIKE '%' + @Text + '%' " +
                    "OR [Pin] LIKE '%' + @Text + '%' " +
                    "OR [State] LIKE '%' + @Text + '%' " +
                    "OR [City] LIKE '%' + @Text + '%' ";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
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



        public static DataTable ViewSpecificOrder(string strOrderID)
        {
            DataSet dsResult = new DataSet();
            try
            {
                string strQuery = "select OrderID,OrderNumber,MastCustomer.FirstName+' '+MastCustomer.LastName as Name,MastCustomer.MobileNumber,MastCustomer.Address1+', '+MastCustomer.Area+', '+MastCustomer.City+', '+MastCustomer.Pin+', '+MastCustomer.State as Address,OrderDateTime,Orders.OrderValue from Orders " +
                                    "INNER JOIN MastCustomer " +
                                    "ON Orders.CustomerID = MastCustomer.CustomerID "+
                                    "WHERE OrderID = @OrderID";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
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

        public static DataTable ViewOrderDetails(string strOrderID)
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
                                    "Where Orders.OrderID = @OrderID";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        
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


        public static DataTable ViewProduts()
        {
            DataSet dsResult = new DataSet();
            try
            {
                string strQuery = "SELECT ProductID, ProductName, MastProductCategory.ProductCategory, ProductDescription, ProductImagePath, NewLaunch, OurSpeciality, MostPopular, StarRating, RelatedProducts, InStock, CASE WHEN MastProducts.IsActive = 1 then 'Active' ELSE 'Inactive' End as IsActive FROM MastProducts " +
                    "INNER JOIN MastProductCategory " +
                    "ON MastProductCategory.ProductCategoryID = MastProducts.ProductCategoryID ";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
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

        public static DataTable FilterProduts(string strText)
        {
            DataSet dsResult = new DataSet();
            try
            {
                string strQuery = "SELECT ProductID, ProductName, MastProductCategory.ProductCategory, ProductDescription, ProductImagePath, NewLaunch, OurSpeciality, MostPopular, StarRating, RelatedProducts, InStock, CASE WHEN MastProducts.IsActive = 1 then 'Active' ELSE 'Inactive' End as IsActive  FROM MastProducts "+
                                "INNER JOIN MastProductCategory "+
                                "ON MastProductCategory.ProductCategoryID = MastProducts.ProductCategoryID "+
                                "Where ProductName Like '%' + @text + '%' "+
                                "OR MastProductCategory.ProductCategory LIKE '%' + @text + '%' "+
                                "OR CASE WHEN MastProducts.IsActive = 1 THEN 'Active' ELSE 'Inactive' END LIKE @text + '%'";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@text", strText);
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


        public static DataTable DdlProductCategory()
        {
            DataSet dsResult = new DataSet();
            try
            {
                string strQuery = "SELECT '0' AS ProductCategoryID, '-- Select Category --' AS ProductCategory UNION SELECT MastProductCategory.ProductCategoryID, MastProductCategory.ProductCategory FROM MastProductCategory";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
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


        public static DataTable ViewProdutPackaging()
        {
            DataSet dsResult = new DataSet();
            try
            {
                string strQuery = "SELECT MastProductPackaging.ProductPackagingID,MastProducts.ProductName, MastProductPackaging.WeightInGrams, MastProductPackaging.MRP,CASE WHEN MastProductPackaging.IsActive = 1 THEN 'Active' ELSE 'InActive' END AS Status FROM MastProductPackaging " +
                                    "INNER JOIN MastProducts "+
                                    "ON MastProducts.ProductID = MastProductPackaging.ProductID";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
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

        public static DataTable FilterProdutPackaging(string strText)
        {
            DataSet dsResult = new DataSet();
            try
            {
                string strQuery = "SELECT MastProductPackaging.ProductPackagingID,MastProducts.ProductName, MastProductPackaging.WeightInGrams, MastProductPackaging.MRP,CASE WHEN MastProductPackaging.IsActive = 1 THEN 'Active' ELSE 'InActive' END AS Status FROM MastProductPackaging " +
                                    "INNER JOIN MastProducts " +
                                    "ON MastProducts.ProductID = MastProductPackaging.ProductID " +
                                    "WHERE MastProducts.ProductName LIKE '%'+ @text + '%' " +
                                    "OR MastProductPackaging.MRP LIKE '%' + @text + '%' " +
                                    "OR CASE WHEN MastProductPackaging.IsActive = 1 THEN 'Active' ELSE 'InActive' END LIKE @text + '%' ";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@text", strText);
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

        public static DataTable FilterProdutPackaging(string strText,int intWeight)
        {
            DataSet dsResult = new DataSet();
            try
            {
                string strQuery = "SELECT MastProductPackaging.ProductPackagingID,MastProducts.ProductName, MastProductPackaging.WeightInGrams, MastProductPackaging.MRP,CASE WHEN MastProductPackaging.IsActive = 1 THEN 'Active' ELSE 'InActive' END AS Status FROM MastProductPackaging " +
                                    "INNER JOIN MastProducts " +
                                    "ON MastProducts.ProductID = MastProductPackaging.ProductID " +
                                    "WHERE MastProductPackaging.WeightInGrams Like @Weight " +
                                    "And (MastProducts.ProductName LIKE '%'+ @text + '%'  " +
                                    "OR MastProductPackaging.MRP LIKE '%' + @text + '%'  " +
                                    "OR CASE WHEN MastProductPackaging.IsActive = 1 THEN 'Active' ELSE 'InActive' END LIKE @text + '%' ) ";

                using (SqlConnection Con = Connection.GetConnection())
                {

                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@text", strText);
                        cmd.Parameters.AddWithValue("@Weight", intWeight);
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


        public static DataTable ddlWeightList()
        {
            DataSet dsResult = new DataSet();
            try
            {
                string strQuery = "SELECT Distinct WeightInGrams from MastProductPackaging ORDER BY WeightInGrams asc";

                using (SqlConnection Con = Connection.GetConnection())
                {

                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
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

        public static DataTable DdlProduct()
        {
            DataSet dsResult = new DataSet();
            try
            {
                string strQuery = "SELECT '0' as ProductID, '-- Select Products --' as ProductName UNION SELECT ProductID, ProductName FROM MastProducts";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
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

        public static DataTable viewSpecificPackaging(int PackagingID)
        {
            DataSet dsResult = new DataSet();

            try
            {
                string strQuery = "SELECT * FROM MastProductPackaging WHERE ProductPackagingID = @PackagingID";

                using (SqlConnection Con = Connection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@PackagingID", PackagingID);
                        using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                        {
                            adp.Fill(dsResult);
                        }
                    }
                }
            }
            catch (Exception)
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