using SOM.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SOM.Admin.Classes
{
    public class DataHandler
    {

        public static int AddProduct(string strName,int intCategoryID,string strPath,bool NewLaunch,bool Speciality,bool IsPopular,bool InStock,bool IsActive)
        {
            try
            {
                int intResult = 0;
                using (SqlConnection Con = Connection.GetConnection())
                {
                    if (Con.State != ConnectionState.Open)
                        Con.Open();

                    string strQuery = "INSERT INTO MastProducts (ProductName,ProductCategoryID,ProductDescription,ProductImagePath,NewLaunch,OurSpeciality,MostPopular,InStock,IsActive) values" +
                                "(@ProductName,@ProductCategoryID,@ProductDescription,@ProductImagePath,@NewLaunch,@OurSpeciality,@MostPopular,@InStock,@IsActive)";

                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@ProductName", strName);
                        cmd.Parameters.AddWithValue("@ProductCategoryID", intCategoryID);
                        cmd.Parameters.AddWithValue("@ProductDescription", DBNull.Value);
                        cmd.Parameters.AddWithValue("@ProductImagePath", strPath);
                        cmd.Parameters.AddWithValue("@NewLaunch", NewLaunch);
                        cmd.Parameters.AddWithValue("@OurSpeciality", Speciality);
                        cmd.Parameters.AddWithValue("@MostPopular", IsPopular);
                        cmd.Parameters.AddWithValue("@InStock", InStock);



                        cmd.Parameters.AddWithValue("@IsActive", IsActive);
                        intResult = cmd.ExecuteNonQuery();
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

        public static int EditProduct(string strName, int intCategoryID, string strPath, bool IsActive, int intProductID)
        {
            try
            {
                int intResult = 0;
                using (SqlConnection Con = Connection.GetConnection())
                {
                    if (Con.State != ConnectionState.Open)
                        Con.Open();

                    string strQuery = "Update MastProducts set ProductName = @ProductName,ProductCategoryID = @ProductCategoryID,ProductImagePath = @ProductImagePath, IsActive = @IsActive Where ProductID = @ProductID";

                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@ProductName", strName);
                        cmd.Parameters.AddWithValue("@ProductCategoryID", intCategoryID);
                        cmd.Parameters.AddWithValue("@ProductImagePath", strPath);
                        cmd.Parameters.AddWithValue("@IsActive", IsActive);
                        cmd.Parameters.AddWithValue("@ProductID", intProductID);

                        intResult = cmd.ExecuteNonQuery();
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


        public static int AddPackages(int intProductID, int intWeight, double dblMRP, bool IsRecommended, bool IsInStock, bool IsActive)
        {
            try
            {
                int intResult = 0;
                using (SqlConnection Con = Connection.GetConnection())
                {
                    if (Con.State != ConnectionState.Open)
                        Con.Open();

                    string strQuery = "INSERT INTO MastProductPackaging (ProductID, WeightInGrams, MRP, RecommendedPack, InStock, IsActive) values (@ProductID, @WeightInGrams, @MRP, @RecommendedPack, @InStock, @IsActive)";

                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@ProductID", intProductID);
                        cmd.Parameters.AddWithValue("@WeightInGrams", intWeight);
                        cmd.Parameters.AddWithValue("@MRP", dblMRP);
                        cmd.Parameters.AddWithValue("@RecommendedPack", IsRecommended);
                        cmd.Parameters.AddWithValue("@InStock", IsInStock);
                        cmd.Parameters.AddWithValue("@IsActive", IsActive);
                        
                        intResult = cmd.ExecuteNonQuery();
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


        public static int UpdatePackages(int intProductID, int intWeight, double dblMRP, bool IsRecommended, bool IsInStock, bool IsActive, int intProductPackagingID)
        {
            try
            {
                int intResult = 0;
                using (SqlConnection Con = Connection.GetConnection())
                {
                    if (Con.State != ConnectionState.Open)
                        Con.Open();

                    string strQuery = "Update MastProductPackaging SET ProductID = @ProductID, WeightInGrams = @WeightInGrams, MRP = @MRP, RecommendedPack = @RecommendedPack, InStock = @InStock, IsActive = @IsActive WHERE ProductPackagingID = @PackagingID";

                    using (SqlCommand cmd = new SqlCommand(strQuery, Con))
                    {
                        cmd.Parameters.AddWithValue("@ProductID", intProductID);
                        cmd.Parameters.AddWithValue("@WeightInGrams", intWeight);
                        cmd.Parameters.AddWithValue("@MRP", dblMRP);
                        cmd.Parameters.AddWithValue("@RecommendedPack", IsRecommended);
                        cmd.Parameters.AddWithValue("@InStock", IsInStock);
                        cmd.Parameters.AddWithValue("@IsActive", IsActive);
                        cmd.Parameters.AddWithValue("@PackagingID", intProductPackagingID);
                        
                        intResult = cmd.ExecuteNonQuery();
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