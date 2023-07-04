using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HairStudio
{
    public partial class userSignUp : System.Web.UI.Page
    {

        string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //signUp button click event

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            if (checkUserExist())
            {
                Response.Write("<script> alert('User ID already exists . Please Use Another ID'); </script>");
            }
            else
            {
                addUser();
            }

        }

        bool checkUserExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from userTBL where userId='" + TextBox9.Text.Trim() + "'", con);
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
            catch(Exception ex){

                Response.Write("<script> alert('" + ex.Message + "'); </script>");
                return false;
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

                SqlCommand cmd = new SqlCommand("INSERT INTO userTBL(userId,name,birthDate,phone,email,state,city,zipCode,adress,accountStatus,password) values(@userId,@name,@birthDate,@phone,@email,@state,@city,@zipCode,@adress,@accountStatus,@password)", con);
                cmd.Parameters.AddWithValue("@userId", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@birthDate", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@phone", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@state", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@city", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@zipCode", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@adress", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@accountStatus", "pending");


                string hashedPassword = BCrypt.Net.BCrypt.HashPassword(TextBox10.Text.Trim());


                cmd.Parameters.AddWithValue("@password", hashedPassword);

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script> alert('Sign Up Succesful. Go to Login User Page'); </script>");

            }
            catch (Exception ex)
            {

                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }
    }
}