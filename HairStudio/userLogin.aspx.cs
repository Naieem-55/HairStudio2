using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.EnterpriseServices.Internal;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HairStudio
{
    public partial class userLogin : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        
        public static string ID;

        protected void Page_Load(object sender, EventArgs e)
        {
            //clearFormForUser();
        }

        // user login button 
        protected void Button1_Click(object sender, EventArgs e)
        {
            

            try
            {
                
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from userTBL where userId = '" + TextBox1.Text.Trim() + "' AND password = '"+ TextBox2.Text.Trim() +"'", con);

                SqlDataReader dr = cmd.ExecuteReader(); 
                if (dr.HasRows) {
                    while (dr.Read())
                    {
                        ID = Convert.ToString(TextBox1.Text);
                        Response.Write("<script> alert('Login  Successful.'); </script>");
                        Session["username"] = dr.GetValue(1).ToString();
                        Session["userId"] = dr.GetValue(0).ToString();
                        Session["status"] = dr.GetValue(9).ToString();
                        Session["role"] = "user";
                    }

                    Response.Redirect("homePage.aspx");
                }
                else
                {
                    Response.Write("<script> alert('Invalid User'); </script>");
                }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }


        //user signUp button

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("userSignUp.aspx");
        }

        void clearFormForUser()
        {
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
        }

    }
}