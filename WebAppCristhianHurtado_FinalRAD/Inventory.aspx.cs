using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalLibrary_CristhianHurtado;
using FinalLibrary_CristhianHurtado.EmmasDataSetTableAdapters;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace WebAppCristhianHurtado_FinalRAD
{
    public partial class Inventory : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\crisc\OneDrive\Escritorio\FinalRAD_CristhianHurtado\WebAppCristhianHurtado_FinalRAD_Solution\WebAppCristhianHurtado_FinalRAD\App_Data\Emmas.mdf;Integrated Security=True");
        //static EmmasDataSet emmasDataSet= new EmmasDataSet();
        productTableAdapter pTable = new productTableAdapter();
        InvTableAdapter invTable= new InvTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {

            for (int i = 0; i < GridView3.Rows.Count; i++)
            {
                LinkButton btnDel = (LinkButton)GridView3.Rows[i].FindControl("LinkButton3");

                btnDel.Visible= false;
            }

            for (int i = 0; i < GridView4.Rows.Count; i++)
            {
                LinkButton btnDel = (LinkButton)GridView4.Rows[i].FindControl("LinkButton3");

                btnDel.Visible = false;
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            //ObjectDataSource1.InsertParameters.Clear();

            // ObjectDataSource1.InsertParameters.Add("prodName", txtProdName.Text);
            //  ObjectDataSource1.InsertParameters.Add("prodDescription", txtProdDesx.Text);
            // ObjectDataSource1.InsertParameters.Add("prodBrand", txtProdBrand.Text);


            

            product.InsertNewProduct(txtProdName.Text, txtProdDesx.Text, txtProdBrand.Text);

            Response.Redirect("Inventory.aspx");
        }

        protected void btnInvInsert_Click(object sender, EventArgs e)
        {
            int q = Convert.ToInt32(txtQuantity.Text);
            SqlDecimal s = SqlDecimal.Parse(txtSize.Text);
            double p = Convert.ToDouble(txtPrice.Text);
            int pID = dplInvProductId.SelectedIndex;

            //decimal aux = Math.Round(s, 2);
            SqlMoney pricce = SqlMoney.Parse(txtSize.Text);

            //            Convert.ToInt32(txtQuantity.Text), Convert.ToDecimal(txtSize.Text), txtMeasure.Text, Convert.ToDecimal(txtPrice.Text), dplInvProductId.SelectedIndex, 

            inventory.InsertNewInv(q, s, txtMeasure.Text, pricce, pID);

            Response.Redirect("Inventory.aspx");

        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

            int x = GridView3.SelectedIndex;

            LinkButton btnDel = (LinkButton)GridView3.Rows[x].FindControl("LinkButton3");

            btnDel.Visible = true;


        }


        protected void proDelete(object sender, GridViewDeleteEventArgs e)
        {
            string aux = "";
            int a = Convert.ToInt32(GridView3.SelectedRow.Cells[0].Text);
            int x = GridView3.SelectedIndex;

            product.DeleteProduct(a, out aux);

            Label2.Text = aux;

            LinkButton btnDel = (LinkButton)GridView3.Rows[x].FindControl("LinkButton3");

            btnDel.Visible = false;
        }

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {
            int x = GridView4.SelectedIndex;

            LinkButton btnDel = (LinkButton)GridView4.Rows[x].FindControl("LinkButton3");

            btnDel.Visible = true;
        }

        protected void GridView4_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string aux = "";
            int a = Convert.ToInt32(GridView4.SelectedRow.Cells[0].Text);
            int x = GridView4.SelectedIndex;

            inventory.DeleteInv(a, out aux);

            Label2.Text = aux;

            LinkButton btnDel = (LinkButton)GridView4.Rows[x].FindControl("LinkButton3");

            btnDel.Visible = false;
        }
    }
}