using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;


namespace WebAppCristhianHurtado_FinalRAD
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Register_Click(object sender, EventArgs e)
        {
            if (txt_password.Text != txt_confirm.Text)
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Make sure all fields are correct!";
            }
            else
            {
                UserStore<IdentityUser> userStore = new UserStore<IdentityUser>();
                UserManager<IdentityUser> manager = new UserManager<IdentityUser>(userStore);
                IdentityUser user = new IdentityUser(txt_Username.Text);
                IdentityResult idResult = manager.Create(user, txt_password.Text);

                if (idResult.Succeeded)
                {
                    //Label1.ForeColor = System.Drawing.Color.Green;
                    //Label1.Text = $"User {user.UserName} created";
                    var authenticationManager  = HttpContext.Current.GetOwinContext().Authentication;
                    var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                    authenticationManager.SignIn(userIdentity);
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = idResult.Errors.FirstOrDefault();
                }
            }
        }
    }
}