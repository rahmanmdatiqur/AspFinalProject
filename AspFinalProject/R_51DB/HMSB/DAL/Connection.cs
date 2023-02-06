using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HMSB.DAL
{
    public static class Connection
    {
        public static string GetConnectionString()
        {
            string conStr = "Data Source=.;Initial Catalog=HMSB;Integrated Security=True";
            return conStr;
        }
    }
}