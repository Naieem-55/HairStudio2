using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;


namespace HairStudio
{
    public partial class cartPage : System.Web.UI.Page
    {
        private readonly string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            if (Session["userId"] == null)
            {
                Response.Redirect("userLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                ViewState["CSRFToken"] = Guid.NewGuid().ToString("N");
                showUserProfile();
            }
        }

        // Update User Details
        protected void Button3_Click(object sender, EventArgs e)
        {
            updateUser();
            showUserProfile();
        }

        // Delete button
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (!SecurityHelper.IsValidId(TextBox5.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Invalid Order ID format."));
                return;
            }

            if (checkOrder())
            {
                removeOrder();
            }
            else
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Please enter valid Order ID."));
            }
        }

        void removeOrder()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    // Parameterized query to prevent SQL injection
                    string query = "DELETE FROM orderTBL WHERE orderId = @orderId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@orderId", TextBox5.Text.Trim());
                        cmd.ExecuteNonQuery();
                    }
                }

                GridView1.DataBind();
                Response.Write(SecurityHelper.CreateSafeAlert("Order Removed Successfully."));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Remove Order Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
            }
        }

        bool checkOrder()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    // Parameterized query to prevent SQL injection
                    string query = "SELECT COUNT(*) FROM orderTBL WHERE orderId = @orderId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@orderId", TextBox5.Text.Trim());
                        int count = (int)cmd.ExecuteScalar();
                        return count > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Check Order Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
                return false;
            }
        }

        void showUserProfile()
        {
            string id = SecurityHelper.GetSessionValue(Session, "userId");

            if (string.IsNullOrEmpty(id))
            {
                Response.Redirect("userLogin.aspx");
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    // Parameterized query to prevent SQL injection
                    string query = "SELECT userId, name, phone, email, adress, accountStatus FROM userTBL WHERE userId = @id";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@id", id);

                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count >= 1)
                        {
                            TextBox1.Text = dt.Rows[0]["userId"].ToString();
                            TextBox7.Text = dt.Rows[0]["accountStatus"].ToString();
                            TextBox2.Text = dt.Rows[0]["name"].ToString();
                            TextBox3.Text = dt.Rows[0]["phone"].ToString();
                            TextBox4.Text = dt.Rows[0]["email"].ToString();
                            TextBox11.Text = dt.Rows[0]["adress"].ToString();
                        }
                        else
                        {
                            Response.Write(SecurityHelper.CreateSafeAlert("Error occurred!"));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Show Profile Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
            }
        }

        void updateUser()
        {
            try
            {
                // Validate inputs
                if (!SecurityHelper.IsValidPhone(TextBox3.Text.Trim()))
                {
                    Response.Write(SecurityHelper.CreateSafeAlert("Please enter a valid phone number."));
                    return;
                }

                if (!SecurityHelper.IsValidEmail(TextBox4.Text.Trim()))
                {
                    Response.Write(SecurityHelper.CreateSafeAlert("Please enter a valid email address."));
                    return;
                }

                string filePath = "~/imageStore/founder2.jpg"; // Default image

                // Handle file upload with security validation
                if (FileUpload1.HasFile)
                {
                    var fileResult = SecurityHelper.ValidateUploadedFile(FileUpload1.PostedFile);

                    if (!fileResult.IsValid)
                    {
                        Response.Write(SecurityHelper.CreateSafeAlert(fileResult.ErrorMessage));
                        return;
                    }

                    // Save file securely
                    string uploadPath = Server.MapPath("~/imageStore/");
                    var saveResult = SecurityHelper.SaveUploadedFile(FileUpload1.PostedFile, uploadPath);

                    if (!saveResult.Success)
                    {
                        Response.Write(SecurityHelper.CreateSafeAlert(saveResult.ErrorMessage));
                        return;
                    }

                    filePath = saveResult.RelativePath;
                }

                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    // Parameterized query to prevent SQL injection
                    string query = "UPDATE userTBL SET phone = @phone, email = @email, adress = @adress, imgLink = @imgLink WHERE userId = @userId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@userId", TextBox1.Text.Trim());
                        cmd.Parameters.AddWithValue("@phone", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                        cmd.Parameters.AddWithValue("@adress", TextBox11.Text.Trim());
                        cmd.Parameters.AddWithValue("@imgLink", filePath);

                        cmd.ExecuteNonQuery();
                    }
                }

                Response.Write(SecurityHelper.CreateSafeAlert("User info Updated Successfully."));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Update User Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("makePayment.aspx");
        }
    }
}
