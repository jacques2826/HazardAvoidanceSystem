﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HazardAvoidanceSystem
{
    public partial class Map : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Context.Request.QueryString["routeID"].ToString();
            hfRouteID.Value = id;
        }

    }
}