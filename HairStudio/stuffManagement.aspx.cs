using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace HairStudio
{

    public partial class stuffManagement : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        //add button
        protected void Button12_Click(object sender, EventArgs e)
        {
            if (checkProductFun())
            {
                Response.Write("<script> alert('Product item aleady exists.'); </script>");
            }
            else
            {
                addNewProductFun();
            }
        }

        //update button
        protected void Button13_Click(object sender, EventArgs e)
        {
            if (checkProductFun())
            {
                updateProductFun();
            }
            else
            {
                Response.Write("<script> alert('Product item aleady exists.'); </script>");
            }
        }

        //delete button
        protected void Button14_Click(object sender, EventArgs e)
        {
            if (checkProductFun())
            {
                deleteProductFun();
            }
            else
            {
                Response.Write("<script> alert('Product Id not exists.'); </script>");
            }
        }

        //go button
        protected void Button11_Click(object sender, EventArgs e)
        {
            getproductByIdFun();
        }

        bool checkProductFun()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from productTBL where productId = '" + TextBox11.Text.Trim() + "'", con);
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


        void addNewProductFun()
        {
            try
            {
                string filePath = "~/imageStore/product16.jpg";
                string fileName = Path.GetFileName(FileUpload2.PostedFile.FileName);
                FileUpload2.SaveAs(Server.MapPath("imageStore" + fileName));
                filePath = "~/imageStore/" + fileName;

                SqlConnection con = new SqlConnection(strCon);

                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO productTBL(productId,name,price,quantity,origin,issueDate,imgLink) values(@productId,@name,@price,@quantity,@origin,@issueDate,@imgLink)", con);
                cmd.Parameters.AddWithValue("@productId", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@name", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@price", TextBox13.Text.Trim());
                cmd.Parameters.AddWithValue("@quantity", TextBox14.Text.Trim());
                cmd.Parameters.AddWithValue("@origin", TextBox15.Text.Trim());
                cmd.Parameters.AddWithValue("@issueDate", TextBox16.Text.Trim());
                cmd.Parameters.AddWithValue("@imgLink", filePath);

                cmd.ExecuteNonQuery();
                con.Close();
                GridView11.DataBind();

                Response.Write("<script> alert('Product added Succesfully.'); </script>");

            }
            catch (Exception ex)
            {

                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }


        }

        void deleteProductFun()
        {
            try
            {

                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from productTBL WHERE productId = '" + TextBox11.Text.ToString() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                GridView11.DataBind();

                Response.Write("<script> alert('Product Deleted Succesfully.'); </script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }

        void getproductByIdFun()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from productTBL where productId = '" + TextBox11.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox12.Text = dt.Rows[0][1].ToString();
                    TextBox13.Text = dt.Rows[0][2].ToString();
                    TextBox14.Text = dt.Rows[0][3].ToString();
                    TextBox15.Text = dt.Rows[0][4].ToString();
                    TextBox16.Text = dt.Rows[0][5].ToString();
                }
                else
                {
                    Response.Write("<script> alert('Please enter valid Stuff ID.'); </script>");
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script> alert('" + ex.Message + "'); </script>");

            }
        }


        void updateProductFun()
        {
            try
            {
                string filePath = "~/imageStore/product16.jpg";
                string fileName = Path.GetFileName(FileUpload2.PostedFile.FileName);
                FileUpload2.SaveAs(Server.MapPath("imageStore" + fileName));
                filePath = "~/imageStore/" + fileName;

                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE productTBL SET price = @price,quantity = @quantity, imgLink=@imgLink WHERE productId = '" + TextBox11.Text.ToString() + "'", con);
                cmd.Parameters.AddWithValue("@price", TextBox13.Text.Trim());
                cmd.Parameters.AddWithValue("@quantity", TextBox14.Text.Trim());
                cmd.Parameters.AddWithValue("@imgLink", filePath);

                cmd.ExecuteNonQuery();
                con.Close();
                GridView11.DataBind();

                Response.Write("<script> alert('Product Updated Succesfully.'); </script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }

    }      
}