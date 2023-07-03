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
    public partial class aboutUs : System.Web.UI.Page
    {

        string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void addComment()
        {
            int num = 1;
            try
            {

                SqlConnection con = new SqlConnection(strCon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO commentTBL(serial,name,email,message) values(@serial,@name,@email,@message)", con);
                cmd.Parameters.AddWithValue("@serial", num++);
                cmd.Parameters.AddWithValue("@name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@message", TextBox3.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script> alert('Comment sent Succesfully.'); </script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            addComment();
        }
    }
}