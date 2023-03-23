using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalLibrary_CristhianHurtado
{
    public class product
    {
        public string prodName { get; set; }
        public string prodDescription { get; set; }
        public string prodBrand { get; set; }

        public static void InsertNewProduct(string pName, string pDesc, string pBrand)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Data.conn;

            try
            {
                Data.conn.Open();
                cmd.CommandText = $"insert into product (prodName, prodDescription, prodBrand) values('" + pName + "', '" + pDesc + "', '" + pBrand + "')";
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex) { throw; }
            finally
            {
                if (Data.conn.State == System.Data.ConnectionState.Open)
                    Data.conn.Close();
            }
        }

        public static void DeleteProduct(int pId, out string status)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Data.conn;

            try
            {
                Data.conn.Open();
                cmd.CommandText = $"delete from product where id = {pId}";
                cmd.ExecuteNonQuery();
                status = "Delete Succes";

            }
            catch (Exception ex) { status = ex.Message; }
            finally
            {
                if (Data.conn.State == System.Data.ConnectionState.Open)
                    Data.conn.Close();
            }
        }
    }
}
