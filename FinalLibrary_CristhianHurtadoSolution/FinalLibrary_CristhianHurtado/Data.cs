//Cristhian Hurtado Copete
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalLibrary_CristhianHurtado
{
    internal static class Data
    {
        internal static SqlConnection conn = new SqlConnection();

        static Data()
        {
            conn.ConnectionString = global::FinalLibrary_CristhianHurtado.Properties.Settings.Default.EmmasConnectionString;
        }
    }
}
