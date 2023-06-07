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
    public partial class adminManagement : System.Web.UI.Page
    {

        string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        // add button
        protected void Button2_Click(object sender, EventArgs e)
        {
            //clearFormForStuff();

            if (checkStuff())
            {
                Response.Write("<script> alert('Id already exixts . Please try another one.'); </script>");

            }
            else
            {
                addNewStuff();
                
            }
        }


        // update button
        protected void Button3_Click(object sender, EventArgs e)
        {
           // clearFormForStuff();

            if (checkStuff())
            {
                updateStuff();
            
            }
            else
            {
                Response.Write("<script> alert('Please enter valid Stuff ID.'); </script>");
            }
        }

        //delete button
        protected void Button4_Click(object sender, EventArgs e)
        {
            //clearFormForStuff();

            if (checkStuff())
            {
                deleteStuff();
            }
            else
            {
                Response.Write("<script> alert('Please enter valid Stuff ID.'); </script>");
            }

        }

        // go button
        protected void Button1_Click(object sender, EventArgs e)
        {
            getStuffById();
        }

        void getStuffById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from stuffTBL where stuffId = '" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0][4].ToString();
                    TextBox3.Text = dt.Rows[0][3].ToString();
                    TextBox4.Text = dt.Rows[0][1].ToString();
                    TextBox11.Text = dt.Rows[0][5].ToString();
                }
                else
                {
                    Response.Write("<script> alert('Please enter valid Stuff ID.'); </script>");
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script> alert('" + ex.Message + "'); </script>");
                //return false;
            }
        }

        void deleteStuff()
        {
            try
            {

                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from stuffTBL WHERE stuffId = '" + TextBox1.Text.ToString() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();

                Response.Write("<script> alert('Stuff Deleted Succesfully.'); </script>");

            }
            catch (Exception ex)
            {

                Response.Write("<script> alert('" + ex.Message + "'); </script>");
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

                SqlCommand cmd = new SqlCommand("UPDATE stuffTBL SET email = @email,joinDate = @joinDate,name = @name,fullAdress = @fullAdress WHERE stuffId = '" + TextBox1.Text.ToString()+"'", con);
                cmd.Parameters.AddWithValue("@stuffId", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@joinDate", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@fullAdress", TextBox11.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();

                Response.Write("<script> alert('Stuff Updated Succesfully.'); </script>");

            }
            catch (Exception ex)
            {

                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }

        void addNewStuff()
        {
            try
            {

                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO stuffTBL(stuffId,email,password,joinDate,name,fullAdress) values(@stuffId,@email,@password,@joinDate,@name,@fullAdress)", con);
                cmd.Parameters.AddWithValue("@stuffId", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@password", "");
                cmd.Parameters.AddWithValue("@joinDate", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@fullAdress", TextBox11.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();

                Response.Write("<script> alert('Stuff added Succesfully.'); </script>");

            }
            catch (Exception ex)
            {

                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }

        bool checkStuff()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from stuffTBL where stuffId = '" + TextBox1.Text.Trim() + "'", con);
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


        bool checkAdmin()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from adminTBL where adminId = '" + TextBox12.Text.Trim() + "'", con);
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


        void updateAdmin()
        {
            try
            {

                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE adminTBL SET password = @password WHERE adminId = '" + TextBox12.Text.ToString() + "'", con);
                cmd.Parameters.AddWithValue("@password", TextBox18.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();

                Response.Write("<script> alert('Admin Password Updated Succesfully.'); </script>");

            }
            catch (Exception ex)
            {

                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }


        void clearFormForStuff()
        {
            try
            {
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox11.Text = "";

            }
            catch (Exception ex)
            {
                Response.Redirect("<script> alert('" + ex.Message + "'); </script>");
            }
        }


        void clearFormForAdmin()
        {
            try
            {
                TextBox12.Text = "";
                TextBox18.Text = "";

            }
            catch (Exception ex)
            {
                Response.Redirect("<script> alert('" + ex.Message + "'); </script>");
            }
        }




        // admin update button
        protected void Button5_Click(object sender, EventArgs e)
        {
            //clearFormForAdmin();

            if (checkAdmin())
            {
                updateAdmin();
            }
            else
            {
                Response.Write("<script> alert('Please enter valid Admin ID.'); </script>");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}