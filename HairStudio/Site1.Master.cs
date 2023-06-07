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
            try
            {
                if (Session["role"].Equals("user"))
                {
                    LinkButton1.Visible = false; //user login
                    LinkButton2.Visible = false; //sign up
                    LinkButton4.Visible = true; //our product
                    LinkButton5.Visible = true; // about us
                    LinkButton7.Visible = true; // hello user
                    LinkButton3.Visible = true; // log out
                    LinkButton8.Visible = true; //  hair styles

                    LinkButton7.Text = "Hello " + Session["username"].ToString();

                    LinkButton10.Visible = false;  // user login    
                    LinkButton6.Visible = false;  // admin login
                    LinkButton9.Visible = false;  // stuff login
                    LinkButton11.Visible = false;  //admin management
                    LinkButton12.Visible = false;  // stuff management 
                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = false; //user login
                    LinkButton2.Visible = false; //sign up
                    LinkButton4.Visible = true; //our product
                    LinkButton5.Visible = true; // about us
                    LinkButton7.Visible = true; // hello user
                    LinkButton3.Visible = true; // log out
                    LinkButton8.Visible = true; //  hair styles

                    LinkButton7.Text = "Hello Admin";

                    LinkButton10.Visible = false;  // user login    
                    LinkButton6.Visible = false;  // admin login
                    LinkButton9.Visible = false;  // stuff login
                    LinkButton11.Visible = true;  //admin management
                    LinkButton12.Visible = true;  // stuff management 
                }
                else if (Session["role"].Equals("stuff"))
                {
                    LinkButton1.Visible = false; //user login
                    LinkButton2.Visible = false; //sign up
                    LinkButton4.Visible = true; //our product
                    LinkButton5.Visible = true; // about us
                    LinkButton7.Visible = true; // hello user
                    LinkButton3.Visible = true; // log out
                    LinkButton8.Visible = true; //  hair styles

                    LinkButton7.Text = "Hello " + Session["username"].ToString();

                    LinkButton10.Visible = false;  // user login    
                    LinkButton6.Visible = false;  // admin login
                    LinkButton9.Visible = false;  // stuff login
                    LinkButton11.Visible = false;  //admin management
                    LinkButton12.Visible = true;  // stuff management 
                }
            }
            catch (Exception ex)
            {
                //Response.Write("<script> alert('" + ex.Message + "'); </script>");
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
            Response.Redirect("stuffManagement.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            try
            {
                Session["username"] = "";
                Session["status"] = "";
                Session["role"] = "";

                LinkButton1.Visible = true; //user login
                LinkButton2.Visible = true; //sign up
                LinkButton4.Visible = true; //our product
                LinkButton5.Visible = true; // about us
                LinkButton7.Visible = false; // hello user
                LinkButton3.Visible = false; // log out
                LinkButton8.Visible = true; //  hair styles

                //LinkButton7.Text = "Hello " + Session["username"].ToString();

                LinkButton10.Visible = true;  // user login    
                LinkButton6.Visible = true;  // admin login
                LinkButton9.Visible = true;  // stuff login
                LinkButton11.Visible = false;  //admin management
                LinkButton12.Visible = false;  // stuff management

               
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }

            Response.Redirect("homePage.aspx");


        }
    }
}