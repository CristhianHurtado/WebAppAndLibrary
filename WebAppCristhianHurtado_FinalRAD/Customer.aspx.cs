using FinalLibrary_CristhianHurtado;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppCristhianHurtado_FinalRAD
{
    public partial class Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ID"] = GridView1.SelectedIndex;
            Session["Name"] = GridView1.SelectedRow.Cells[1].Text;
            Response.Redirect("~/Orders.aspx");
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            customer.InsertNewCust(TextBoxC.Text, TextBoxL.Text, TextBoxP.Text, TextBoxA.Text, TextBoxC.Text, TextBoxPC.Text, TextBoxE.Text);
            Response.Redirect("Customer.aspx");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string aux = "";
            int a = Convert.ToInt32(GridView1.SelectedRow.Cells[0].Text);
            int x = GridView1.SelectedIndex;

            customer.DeleteCust(a, out aux);

            Label1.Text = aux;

        }
    }
}