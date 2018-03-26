using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HazardAvoidanceSystem
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void btnLogin_OnClick(object sender, EventArgs e)
        {
            var email = txtEmail.Text;
            var password = txtPassword.Text;
            User user = Login(email, password);
            if (Page.IsPostBack)
            {
                if (user.role == "admin")
                {
                    Response.Redirect("~/Admin.aspx?id=" + user.id);
                }
                else if (user.role == "manager")
                {
                    Response.Redirect("~/Manager.aspx?id=" + user.id);
                }
                else if (user.role == "driver")
                {
                    Response.Redirect("~/Driver.aspx?id=" + user.id);
                }
            }
        }


        private User Login(string email, string password)
        {
            User user = new HazardAvoidanceSystem.User();
            var cmdText = "dbo.Login";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(cmdText, con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password);
                con.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        user.email = reader["email"].ToString();
                        if (ColumnExists(reader, "AdminID"))
                        {
                            user.role = "admin";
                            user.id = Int32.Parse(reader["AdminID"].ToString());
                        }
                        else if (ColumnExists(reader, "ManagerID"))
                        {
                            user.role = "manager";
                            user.id = Int32.Parse(reader["ManagerID"].ToString());
                        }
                        else if (ColumnExists(reader, "DriverID"))
                        {
                            user.role = "driver";
                            user.id = Int32.Parse(reader["ManagerID"].ToString());
                        }
                    }
                }
            }

            return user;
        }

        private bool ColumnExists(IDataReader reader, string ColumnName)
        {
            for (int i = 0; i < reader.FieldCount; i++)
            {
                if (reader.GetName(i).Equals(ColumnName, StringComparison.InvariantCultureIgnoreCase))
                {
                    return true;
                }
            }
            return false;
        }
    }
}