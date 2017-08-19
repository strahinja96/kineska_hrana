using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KineskaHrana.Admin_Panel
{
    public partial class Admin_panel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUloga"] != null && (Convert.ToInt32(Session["idUloga"]) == 1))
            {
            }
            else
            {
                Response.Redirect("../Pocetna.aspx");
            }
        }
    }
}