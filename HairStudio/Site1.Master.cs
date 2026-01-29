using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HairStudio
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string role = Session["role"] != null ? Session["role"].ToString() : "";
            string username = Session["username"] != null ? Session["username"].ToString() : "";

            if (role == "user")
            {
                LinkButton1.Visible = false; //user login
                LinkButton2.Visible = false; //sign up
                LinkButton4.Visible = true; //our product
                LinkButton5.Visible = true; // about us
                LinkButton7.Visible = true; // hello user
                LinkButton3.Visible = true; // log out
                LinkButton8.Visible = true; //  hair styles
                LinkButton13.Visible = true; //  cart page

                LinkButton7.Text = "Hello " + username;

                LinkButton10.Visible = false;  // user login
                LinkButton6.Visible = false;  // admin login
                LinkButton9.Visible = false;  // stuff login
                LinkButton11.Visible = false;  //admin management
                LinkButton12.Visible = false;  // stuff management
            }
            else if (role == "admin")
            {
                LinkButton1.Visible = false; //user login
                LinkButton2.Visible = false; //sign up
                LinkButton4.Visible = true; //our product
                LinkButton5.Visible = true; // about us
                LinkButton7.Visible = true; // hello user
                LinkButton3.Visible = true; // log out
                LinkButton8.Visible = true; //  hair styles
                LinkButton13.Visible = false; //  cart page

                LinkButton7.Text = "Hello Admin";

                LinkButton10.Visible = false;  // user login
                LinkButton6.Visible = false;  // admin login
                LinkButton9.Visible = false;  // stuff login
                LinkButton11.Visible = true;  //admin management
                LinkButton12.Visible = true;  //stuff management
            }
            else if (role == "stuff")
            {
                LinkButton1.Visible = false; //user login
                LinkButton2.Visible = false; //sign up
                LinkButton4.Visible = true; //our product
                LinkButton5.Visible = true; // about us
                LinkButton7.Visible = true; // hello user
                LinkButton3.Visible = true; // log out
                LinkButton8.Visible = true; //  hair styles
                LinkButton13.Visible = false; //  cart page

                LinkButton7.Text = "Hello " + username;

                LinkButton10.Visible = false;  // user login
                LinkButton6.Visible = false;  // admin login
                LinkButton9.Visible = false;  // stuff login
                LinkButton11.Visible = false;  //admin management
                LinkButton12.Visible = true;  // stuff management
            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminLogin.aspx");   

        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("stuffLogin.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("userLogin.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ourProducts.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userLogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("userSignUp.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("cartPage.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("aboutUs.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("hairStyle.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminManagement.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("stuffManagementPage.aspx");
        }

        protected void LinkButton13_Click(object sender, EventArgs e)
        {
            Response.Redirect("cartPage.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("homePage.aspx");
        }
    }
}