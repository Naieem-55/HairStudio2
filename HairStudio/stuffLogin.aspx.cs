using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HairStudio
{
    public partial class stuffLogin : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // stuff login
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from stuffTBL where stuffId = '" + TextBox1.Text.Trim() + "'", con);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        string getpass = dr.GetValue(2).ToString();
                        string enteredPass = TextBox2.Text.Trim();
                        bool isPasswordValid = BCrypt.Net.BCrypt.Verify(enteredPass, getpass);


                        if (isPasswordValid)
                        {
                            Response.Write("<script> alert('Login  Successful.'); </script>");
                            Session["username"] = dr.GetValue(4).ToString();
                            Session["role"] = "stuff";
                            Response.Redirect("homePage.aspx");
                        }
                        else
                        {
                            Response.Write("<script> alert('Invalid password.'); </script>");
                        }
                            
                    }

                    
                }
                else
                {
                    Response.Write("<script> alert('Invalid Stuff.'); </script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }


        // stuff sign up
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("stuffSignUp.aspx");
        }

    }
}