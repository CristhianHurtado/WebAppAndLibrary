using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppCristhianHurtado_FinalRAD
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = $"Orders for {Session["Name"]}:";
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer");
        }
    }
}