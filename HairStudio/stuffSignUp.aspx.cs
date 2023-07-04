using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HairStudio
{
    public partial class stuffSignUp : System.Web.UI.Page
    {

        string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        // Stuff sign up
        protected void Button1_Click(object sender, EventArgs e)
        {
            //clearFormForStuff();

                addUser();
            

        }

        bool checkStuffExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from stuffTBL where stuffId = '" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script> alert('" + ex.Message + "'); </script>");
                return false;
            }
        }

        void clearFormForStuff()
        {
            try
            {
                TextBox1.Text = "";
                TextBox2.Text = "";

            }
            catch (Exception ex)
            {
                Response.Redirect("<script> alert('" + ex.Message + "'); </script>");
            }
        }


        void updateStuff()
        {
            try
            {

                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE stuffTBL SET password = @password WHERE stuffId = '" + TextBox1.Text.ToString() + "'", con);
                cmd.Parameters.AddWithValue("@password", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script> alert('Stuff Password Updated Succesfully.'); </script>");

            }
            catch (Exception ex)
            {

                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }


        void addUser()
        {
            try
            {

                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO stuffTBL(stuffId,password) values(@stuffId,@password)", con);
                cmd.Parameters.AddWithValue("@stuffId", TextBox1.Text.Trim());


                string hashedPassword = BCrypt.Net.BCrypt.HashPassword(TextBox2.Text.Trim());


                cmd.Parameters.AddWithValue("@password", hashedPassword);

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script> alert('Sign Up Succesful. Go to Login Page'); </script>");
                Response.Redirect("stuffLogin.aspx");

            }
            catch (Exception ex)
            {

                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }
    }
}