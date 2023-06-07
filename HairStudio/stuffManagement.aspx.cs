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

    public partial class stuffManagement : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
             
        }


        // add button click
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkProduct())
            {
                Response.Write("<script> alert('Product item aleady exists.'); </script>");
            }
            else
            {
                addNewProduct();
            }
        }


        // delete button click
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkProduct())
            {
                deleteProduct();
            }
            else
            {
                Response.Write("<script> alert('Product Id not exists.'); </script>");
            }
        }

        // update button click
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkProduct())
            {
                updateProduct();
            }
            else
            { 
                Response.Write("<script> alert('Product item aleady exists.'); </script>");
            }
        }

        // go button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            getproductById();
        }

        bool checkProduct()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from productTBL where productId = '" + TextBox1.Text.Trim() + "'", con);
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

        void addNewProduct()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO productTBL(productId,name,price,quantity,origin,issueDate) values(@productId,@name,@price,@quantity,@origin,@issueDate)", con);
                cmd.Parameters.AddWithValue("@productId", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@price", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@quantity", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@origin", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@issueDate", TextBox6.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();

                Response.Write("<script> alert('Product added Succesfully.'); </script>");

            }
            catch (Exception ex)
            {

                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }

        void updateProduct()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE productTBL SET price = @price,quantity = @quantity WHERE productId = '" + TextBox1.Text.ToString() + "'", con);
                cmd.Parameters.AddWithValue("@price", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@quantity", TextBox4.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();

                Response.Write("<script> alert('Product Updated Succesfully.'); </script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }

        void deleteProduct()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from productTBL WHERE productId = '" + TextBox1.Text.ToString() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();

                Response.Write("<script> alert('Product Deleted Succesfully.'); </script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        void getproductById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from productTBL where productId = '" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0][1].ToString();
                    TextBox3.Text = dt.Rows[0][2].ToString();
                    TextBox4.Text = dt.Rows[0][3].ToString();
                    TextBox5.Text = dt.Rows[0][4].ToString();
                    TextBox6.Text = dt.Rows[0][5].ToString();
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
    }
}