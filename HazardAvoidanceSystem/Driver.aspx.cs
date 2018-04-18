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
    public partial class Driver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Int32.Parse(Context.Request.QueryString["id"].ToString());
            getRouteList(id);
        }

        public void btnConfirmRoute_OnClick(object sender, EventArgs e)
        {
            var id = Int32.Parse(ddlRoutes.SelectedItem.Value);
            if (id > 0)
            {
                Response.Redirect("~/Map.aspx?routeID=" + id);
            }
        }

        public void btnUploadRoute_OnClick(object sender, EventArgs e)
        {

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