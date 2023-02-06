using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using HMSB.Models;
using System.Data;

namespace HMSB.DAL
{
    public class BloodGroupGetWay
    {
        SqlConnection con = new SqlConnection(Connection.GetConnectionString());
        public IQueryable<BloodGroup> Get()
        {
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter("select * from BloodGroup", con);
            sda.Fill(dt);
            return dt.AsEnumerable()
                .Select(r => new BloodGroup
                {
                    bg_id = r.Field<int>("bg_id"),
                    bloodgroup = r.Field<string>("bloodgroup")

                })
                .AsQueryable();
        }
        public void Insert(BloodGroup b)
        {
            SqlCommand cmd = new SqlCommand(@"INSERT INTO BloodGroup VALUES(@n)", con);
            cmd.Parameters.AddWithValue("@n", b.bloodgroup);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }
        public void Update(BloodGroup b)
        {
            SqlCommand cmd = new SqlCommand(@"UPDATE bloodgroup SET BloodGroup=@n WHERE id=@i", con);
            cmd.Parameters.AddWithValue("@n", b.bloodgroup);
            cmd.Parameters.AddWithValue("@n", b.bg_id);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }
        public void Delete(BloodGroup b)
        {
            SqlCommand cmd = new SqlCommand(@"DELETE from BloodGroup WHERE id=@i", con);
            cmd.Parameters.AddWithValue("@n", b.bg_id);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }
    }
}