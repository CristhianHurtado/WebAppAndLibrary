using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace FinalLibrary_CristhianHurtado
{
    public class customer
    {
        public string custFirst { get; set; }
        public string custLast { get; set;}
        public string custPhone { get; set;}
        public string custAddress { get; set;}
        public string custCity { get; set;}
        public string custPostal { get; set;}
        public string custEmail { get; set;}

        public static void InsertNewCust(string cF, string cL, string cP, string cA, string cC, string cPos, string cE)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Data.conn;
            try
            {
                Data.conn.Open();
                cmd.CommandText = $"insert into customer (custFirst, custLast, custPhone, custAddress, custCity, custPostal, custEmail) values('" + cF + "', '" + cL + "', '" + cP + "', '" + cA + "','" + cC + "', '" + cPos + "', '" + cE + "')";
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex) { throw; }
            finally
            {
                if (Data.conn.State == System.Data.ConnectionState.Open)
                    Data.conn.Close();
            }
        }

        public static void DeleteCust(int cId, out string status)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Data.conn;

            try
            {
                Data.conn.Open();
                cmd.CommandText = $"delete from customer where id = {cId}";
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
