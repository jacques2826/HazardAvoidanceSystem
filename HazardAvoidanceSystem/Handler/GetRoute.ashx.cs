using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace HazardAvoidanceSystem.Handler
{
    /// <summary>
    /// Summary description for GetRoute
    /// </summary>
    public class GetRoute : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            var routeID = context.Request.Form["routeID"].ToString();

            string routeInfo = getRouteInfo(1);

            context.Response.ContentType = "text/json";
            context.Response.Write(routeInfo);
        }

        private string getRouteInfo(int routeID)
        {
            string routeInfo = "";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT [Route] FROM [Route] WHERE RouteID = @routeID", con);
                cmd.CommandType = System.Data.CommandType.Text;

                cmd.Parameters.AddWithValue("@routeID", routeID);
                con.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    routeInfo = reader["Route"].ToString();
                }
            }

                return routeInfo;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}