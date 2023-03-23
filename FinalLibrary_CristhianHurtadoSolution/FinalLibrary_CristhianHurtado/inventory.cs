using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalLibrary_CristhianHurtado
{
    public class inventory
    {
        public int invQuantity { get; set; }
        public SqlDecimal  invSize { get; set; }
        public string invMeasure { get; set; }
        public SqlMoney invPrice { get; set; }
        public int productID { get; set; }

        public static void InsertNewInv(int iQuan, SqlDecimal iSize, string iMea, SqlMoney iPr, int pID)
        {

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Data.conn;

            try
            {
                Data.conn.Open();
                cmd.CommandText = $"insert into inventory (invQuantity, invSize, invMeasure, invPrice, productID) values("+iQuan+", "+iSize+", '"+iMea+"'. "+iPr+", "+pID+")";
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex) { throw; }
            finally
            {
                if (Data.conn.State == System.Data.ConnectionState.Open)
                    Data.conn.Close();
            }
        }

        public static void DeleteInv(int iId, out string status)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Data.conn;

            try
            {
                Data.conn.Open();
                cmd.CommandText = $"delete from product where id = {iId}";
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
