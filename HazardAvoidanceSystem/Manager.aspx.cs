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
    public partial class Manager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void btnUploadRoute_OnClick(object sender, EventArgs e)
        {
            mvOptions.SetActiveView(viewUploadRoute);
        }

        public void btnChooseDriver_OnClick(object sender, EventArgs e)
        {
            mvOptions.SetActiveView(viewChooseDriver);
        }

        public void btnChangeRoute_OnClick(object sender, EventArgs e)
        {
            mvOptions.SetActiveView(viewChangeRoute);
        }

        public void btnSeeRoute_OnClick(object sender, EventArgs e)
        {
            mvOptions.SetActiveView(viewSeeRoute);
            ddlRoutes.Visible = false;
            var id = Int32.Parse(Context.Request.QueryString["id"].ToString());
            getDriverList(id);
            

        }

        public void btnConfirmUpload_OnClick(object sender, EventArgs e)
        {

        }

        public void btnConfirmDriverMap_OnClick(object sender, EventArgs e)
        {
            var id = Int32.Parse(ddlRoutes.SelectedItem.Value);
            if (id > 0)
            {
                hfRouteID.Value = id.ToString();
            }
            //map.Visible = true;
        }

        public void ddlDrivers_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            var id = Int32.Parse(ddlDrivers.SelectedItem.Value);
            if (id > 0)
            {
                getRouteList(id);
            }
            ddlRoutes.Visible = true;
        }

        private void getDriverList(int id)
        {
            DataTable table = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT DriverID, FirstName, LastName FROM Driver WHERE ManagerID = @ManagerID", con);
                cmd.CommandType = System.Data.CommandType.Text;

                cmd.Parameters.AddWithValue("@ManagerID", id);
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
                ddlDrivers.Items.Add(lst);
            }
        }

        private void getRouteList(int id)
        {
            DataTable table = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT RouteID FROM Route WHERE DriverID = @DriverID", con);
                cmd.CommandType = System.Data.CommandType.Text;

                cmd.Parameters.AddWithValue("@DriverID", id);
                con.Open();

                using (cmd)
                {
                    SqlDataAdapter ds = new SqlDataAdapter(cmd);
                    ds.Fill(table);
                }
            }

            foreach(DataRow row in table.Rows)
            {
                ListItem lst = new ListItem("Route " + row[0].ToString(), row[0].ToString());
                ddlRoutes.Items.Add(lst);
            }
        }
    }
}