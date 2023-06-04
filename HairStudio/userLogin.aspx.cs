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
    public partial class userLogin : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Response.Write("<script> alert('Testing'); </script>");

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
                        Response.Write("<script> alert('Login  Successful.'); </script>");
                        Session["username"] = dr.GetValue(1).ToString();
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
    }
}