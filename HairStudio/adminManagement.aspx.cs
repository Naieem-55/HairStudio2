using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;


namespace HairStudio
{
    public partial class adminManagement : System.Web.UI.Page
    {
        private readonly string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is admin
            if (Session["role"] == null || Session["role"].ToString() != "admin")
            {
                Response.Redirect("adminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                ViewState["CSRFToken"] = Guid.NewGuid().ToString("N");
            }
        }

        // Add button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (!ValidateStaffInput())
                return;

            if (checkStuff())
            {
                Response.Write(SecurityHelper.CreateSafeAlert("ID already exists. Please try another one."));
            }
            else
            {
                addNewStuff();
            }
        }

        // Update button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (!ValidateStaffInput())
                return;

            if (checkStuff())
            {
                updateStuff();
            }
            else
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Please enter valid Staff ID."));
            }
        }

        // Delete button
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (!SecurityHelper.IsValidId(TextBox1.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Invalid Staff ID format."));
                return;
            }

            if (checkStuff())
            {
                deleteStuff();
            }
            else
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Please enter valid Staff ID."));
            }
        }

        // Go button
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!SecurityHelper.IsValidId(TextBox1.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Invalid Staff ID format."));
                return;
            }
            getStuffById();
        }

        private bool ValidateStaffInput()
        {
            if (!SecurityHelper.IsValidId(TextBox1.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Invalid Staff ID format."));
                return false;
            }

            if (!SecurityHelper.IsNotEmpty(TextBox2.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Please enter staff name."));
                return false;
            }

            if (!SecurityHelper.IsNotEmpty(TextBox4.Text.Trim()) || !SecurityHelper.IsValidEmail(TextBox4.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Please enter a valid email address."));
                return false;
            }

            return true;
        }

        void getStuffById()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    // Parameterized query to prevent SQL injection
                    string query = "SELECT * FROM stuffTBL WHERE stuffId = @stuffId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@stuffId", TextBox1.Text.Trim());

                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count >= 1)
                        {
                            TextBox2.Text = dt.Rows[0]["name"] != DBNull.Value ? dt.Rows[0]["name"].ToString() : "";
                            TextBox3.Text = dt.Rows[0]["joinDate"] != DBNull.Value ? dt.Rows[0]["joinDate"].ToString() : "";
                            TextBox4.Text = dt.Rows[0]["email"] != DBNull.Value ? dt.Rows[0]["email"].ToString() : "";
                            TextBox11.Text = dt.Rows[0]["fullAdress"] != DBNull.Value ? dt.Rows[0]["fullAdress"].ToString() : "";
                        }
                        else
                        {
                            Response.Write(SecurityHelper.CreateSafeAlert("Please enter valid Staff ID."));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Get Staff Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
            }
        }

        void deleteStuff()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    // Parameterized query to prevent SQL injection
                    string query = "DELETE FROM stuffTBL WHERE stuffId = @stuffId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@stuffId", TextBox1.Text.Trim());
                        cmd.ExecuteNonQuery();
                    }
                }

                GridView1.DataBind();
                Response.Write(SecurityHelper.CreateSafeAlert("Staff Deleted Successfully."));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Delete Staff Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
            }
        }

        void updateStuff()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    // Parameterized query to prevent SQL injection
                    string query = "UPDATE stuffTBL SET email = @email, joinDate = @joinDate, name = @name, fullAdress = @fullAdress WHERE stuffId = @stuffId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@stuffId", TextBox1.Text.Trim());
                        cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                        cmd.Parameters.AddWithValue("@joinDate", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@name", TextBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@fullAdress", TextBox11.Text.Trim());

                        cmd.ExecuteNonQuery();
                    }
                }

                GridView1.DataBind();
                Response.Write(SecurityHelper.CreateSafeAlert("Staff Updated Successfully."));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Update Staff Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
            }
        }

        void addNewStuff()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    // Generate a temporary hashed password (staff should change on first login)
                    string tempPassword = BCrypt.Net.BCrypt.HashPassword("TempPass123!");

                    string query = "INSERT INTO stuffTBL(stuffId, email, password, joinDate, name, fullAdress) VALUES(@stuffId, @email, @password, @joinDate, @name, @fullAdress)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@stuffId", TextBox1.Text.Trim());
                        cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                        cmd.Parameters.AddWithValue("@password", tempPassword);
                        cmd.Parameters.AddWithValue("@joinDate", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@name", TextBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@fullAdress", TextBox11.Text.Trim());

                        cmd.ExecuteNonQuery();
                    }
                }

                GridView1.DataBind();
                Response.Write(SecurityHelper.CreateSafeAlert("Staff added Successfully. Default password is TempPass123!"));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Add Staff Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
            }
        }

        bool checkStuff()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    // Parameterized query to prevent SQL injection
                    string query = "SELECT COUNT(*) FROM stuffTBL WHERE stuffId = @stuffId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@stuffId", TextBox1.Text.Trim());
                        int count = (int)cmd.ExecuteScalar();
                        return count > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Check Staff Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
                return false;
            }
        }

        bool checkAdmin()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    // Parameterized query to prevent SQL injection
                    string query = "SELECT COUNT(*) FROM adminTBL WHERE adminId = @adminId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@adminId", TextBox12.Text.Trim());
                        int count = (int)cmd.ExecuteScalar();
                        return count > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Check Admin Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
                return false;
            }
        }

        void updateAdmin()
        {
            try
            {
                // Validate password
                if (!SecurityHelper.IsValidPassword(TextBox18.Text.Trim()))
                {
                    Response.Write(SecurityHelper.CreateSafeAlert("Password must be at least 8 characters with at least one letter and one number."));
                    return;
                }

                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    // Hash the new password with BCrypt
                    string hashedPassword = BCrypt.Net.BCrypt.HashPassword(TextBox18.Text.Trim());

                    // Parameterized query to prevent SQL injection
                    string query = "UPDATE adminTBL SET password = @password WHERE adminId = @adminId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@password", hashedPassword);
                        cmd.Parameters.AddWithValue("@adminId", TextBox12.Text.Trim());
                        cmd.ExecuteNonQuery();
                    }
                }

                GridView1.DataBind();
                Response.Write(SecurityHelper.CreateSafeAlert("Admin Password Updated Successfully."));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Update Admin Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
            }
        }

        void clearFormForStuff()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox11.Text = "";
        }

        void clearFormForAdmin()
        {
            TextBox12.Text = "";
            TextBox18.Text = "";
        }

        // Status update function
        void updateStatusById(string status)
        {
            try
            {
                if (!SecurityHelper.IsValidId(TextBox1.Text.Trim()))
                {
                    Response.Write(SecurityHelper.CreateSafeAlert("Invalid Staff ID format."));
                    return;
                }

                // Validate status value
                string[] validStatuses = { "active", "pending", "deactive" };
                bool isValidStatus = false;
                foreach (string validStatus in validStatuses)
                {
                    if (status.Equals(validStatus, StringComparison.OrdinalIgnoreCase))
                    {
                        isValidStatus = true;
                        break;
                    }
                }

                if (!isValidStatus)
                {
                    Response.Write(SecurityHelper.CreateSafeAlert("Invalid status value."));
                    return;
                }

                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    // Parameterized query to prevent SQL injection
                    string query = "UPDATE stuffTBL SET status = @status WHERE stuffId = @stuffId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@status", status);
                        cmd.Parameters.AddWithValue("@stuffId", TextBox1.Text.Trim());
                        cmd.ExecuteNonQuery();
                    }
                }

                GridView1.DataBind();
                Response.Write(SecurityHelper.CreateSafeAlert("Staff status Updated Successfully."));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Update Status Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
            }
        }

        // Admin update button
        protected void Button5_Click(object sender, EventArgs e)
        {
            if (!SecurityHelper.IsValidId(TextBox12.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Invalid Admin ID format."));
                return;
            }

            if (checkAdmin())
            {
                updateAdmin();
            }
            else
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Please enter valid Admin ID."));
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        // Status Activate button
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            updateStatusById("active");
        }

        // Status Pending button
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            updateStatusById("pending");
        }

        // Status deactive button
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            updateStatusById("deactive");
        }
    }
}
