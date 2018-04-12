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
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void btnAddManager_OnClick(object sender, EventArgs e)
        {
            mvOptions.SetActiveView(viewAddManager);
        }

        public void btnAddDriver_OnClick(object sender, EventArgs e)
        {
            mvOptions.SetActiveView(viewAddDriver);

            DataTable table = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT ManagerID, FirstName, LastName FROM Manager WHERE AdminID = @adminID", con);
                cmd.CommandType = System.Data.CommandType.Text;

                cmd.Parameters.AddWithValue("@adminID", Int32.Parse(Context.Request.QueryString["id"]));
                con.Open();

                using (cmd)
                {
                    SqlDataAdapter ds = new SqlDataAdapter(cmd);
                    ds.Fill(table);
                }
            }

            foreach(DataRow row in table.Rows)
            {
                ListItem lst = new ListItem(row[1].ToString() + " " + row[2].ToString(), row[0].ToString());
            }
        }

        public void btnBackup_OnClick(object sender, EventArgs e)
        {
            mvOptions.SetActiveView(viewBackup);
        }

        public void btnTestRoute_OnClick(object sender, EventArgs e)
        {
            mvOptions.SetActiveView(viewTestRoute);
        }

        public void btnAddManagerConfirm_OnClick(object sender, EventArgs e)
        {
            var managerID = Int32.Parse(txtManagerID.Text);
            var firstName = txtManagerFirst.Text;
            var lastName = txtManagerLast.Text;
            var email = txtManagerEmail.Text;
            var password = "TeamWhales1";
            var adminID = Int32.Parse(Context.Request.QueryString["id"].ToString());
            var msg = "";

            var cmdName = "dbo.AddManager";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(cmdName, con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@managerID", managerID);
                cmd.Parameters.AddWithValue("@first", firstName);
                cmd.Parameters.AddWithValue("@last", lastName);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@adminID", adminID);

                con.Open();
                var success = cmd.ExecuteNonQuery();
            }

        }

        public void btnAddDriverConfirm_OnClick(object sender, EventArgs e)
        {
            var managerID = Int32.Parse(ddlManagerID.SelectedItem.Value);
            var driverID = Int32.Parse(txtDriverID.Text);
            var firstName = txtDriverFirst.Text;
            var lastName = txtDriverLast.Text;
            var email = txtDriverEmail.Text;
            var password = "TeamWhales1";

            var msg = "";
            if (managerID > 0)
            {
                var cmdName = "dbo.AddDriver";
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand(cmdName, con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@driverID", driverID);
                    cmd.Parameters.AddWithValue("@first", firstName);
                    cmd.Parameters.AddWithValue("@last", lastName);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@managerID", managerID);

                    SqlParameter output = new SqlParameter();
                    output.ParameterName = "@msg";
                    output.Size = 200;
                    output.Direction = System.Data.ParameterDirection.Output;
                    output.SqlDbType = System.Data.SqlDbType.VarChar;
                    cmd.Parameters.Add(output);

                    con.Open();
                    cmd.ExecuteScalar();

                    msg = output.Value.ToString();
                }
            }
        }
    }
}