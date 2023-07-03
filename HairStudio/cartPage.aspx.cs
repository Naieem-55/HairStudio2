using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;

namespace HairStudio
{
    public partial class cartPage : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            showUserProfile();

        }


        // update User Details
        protected void Button3_Click(object sender, EventArgs e)
        {
            updateUser();
            showUserProfile();
        }

        // button delete

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkOrder())
            {
                removeOrder();
            }
            else
            {
                Response.Write("<script> alert('Please enter valid Order ID.'); </script>");
            }
        }

        void removeOrder()
        {
            try
            {

                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from orderTBL WHERE orderId = '" + TextBox5.Text.ToString() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();

                Response.Write("<script> alert('Order Removed Successfully.'); </script>");

            }
            catch (Exception ex)
            {

                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }

        bool checkOrder()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from orderTBL where orderId = '" + TextBox5.Text.Trim() + "'", con);
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

        void showUserProfile()
        {

            string id = Session["userId"].ToString();

            try
            {

                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from userTBL WHERE userId = @id", con);
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox1.Text = dt.Rows[0][0].ToString();
                    TextBox7.Text = dt.Rows[0][9].ToString();
                    TextBox2.Text = dt.Rows[0][1].ToString();
                    TextBox3.Text = dt.Rows[0][3].ToString();
                    TextBox4.Text = dt.Rows[0][4].ToString();
                    TextBox11.Text = dt.Rows[0][8].ToString();
                }
                else
                {
                    Response.Write("<script> alert('Error occured!'); </script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "') </script>");
            }
        }

        void updateUser()
        {

            try
            {
                //string id = Session["userId"].ToString();

                string filePath = "~/imageStore/founder2.jpg";
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("imageStore" + fileName));
                filePath = "~/imageStore/" + fileName;

                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd2 = new SqlCommand("UPDATE userTBL SET phone=@phone,email=@email,adress=@adress,imgLink=@imgLink WHERE userId= '" + TextBox1.Text.Trim()+ "'", con);

                //cmd2.Parameters.AddWithValue("@id", id);
                cmd2.Parameters.AddWithValue("@phone", TextBox3.Text.Trim());
                cmd2.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                cmd2.Parameters.AddWithValue("@adress", TextBox11.Text.Trim());
                cmd2.Parameters.AddWithValue("@imgLink", filePath);

                cmd2.ExecuteNonQuery();
                con.Close();
                //GridView1.DataBind();

                Response.Write("<script> alert('User info Updated Succesfully.'); </script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("makePayment.aspx");
        }
    }
}