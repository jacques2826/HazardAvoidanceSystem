using System;
using System.Collections.Generic;
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
            //map.Visible = false;
        }

        public void btnConfirmUpload_OnClick(object sender, EventArgs e)
        {

        }

        public void btnConfirmDriverMap_OnClick(object sender, EventArgs e)
        {
            //map.Visible = true;
        }
    }
}