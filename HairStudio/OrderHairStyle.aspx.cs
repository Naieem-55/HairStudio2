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
    public partial class OrderHairStyle : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Session["userId"].ToString();
            TextBox2.Text = id;
        }


        // button confirm
        protected void Button2_Click(object sender, EventArgs e)
        {
            makeOrderfunc();
        }

        void makeOrderfunc()
        {

            try
            {
                string filePath = "~/imageStore/product16.jpg";
                string statusC = DropDownList1.SelectedValue;
                string id = Session["userId"].ToString();

                SqlConnection con = new SqlConnection(strCon);

                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO orderTBL (orderId, userId, quantity, date, status, imgLink) VALUES (@orderId, @userId, @quantity, @date, @status, @imgLink)", con);
                cmd.Parameters.AddWithValue("@orderId", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@userId", id);
                cmd.Parameters.AddWithValue("@quantity",1);
                cmd.Parameters.AddWithValue("@date", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@status", statusC);
                cmd.Parameters.AddWithValue("@imgLink", filePath);

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Order Placed Successfully.');</script>");
            }
            catch (Exception ex)
            {

                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }
    }
}