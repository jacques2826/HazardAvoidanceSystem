using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace HazardAvoidanceSystem.Handler
{
    /// <summary>
    /// Summary description for GetRoute
    /// </summary>
    public class GetRoute : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //var routeID = context.Request.Form["routeID"].ToString();
            var routeID = Int32.Parse(context.Request.QueryString["routeID"].ToString());

            string routeInfo = getRouteInfo(routeID);

            context.Response.ContentType = "application/json";
            context.Response.Write(JsonConvert.SerializeObject(routeInfo));
        }

        private string getRouteInfo(int routeID)
        {
            string routeInfo = "";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT Route FROM Route WHERE RouteID = @routeID", con);
                cmd.CommandType = System.Data.CommandType.Text;

                cmd.Parameters.AddWithValue("@routeID", routeID);
                con.Open();
                routeInfo = cmd.ExecuteScalar().ToString();

            }
            return routeInfo;
            //return (new JavaScriptSerializer().Serialize(routeInfo));
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