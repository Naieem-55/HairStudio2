using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;


namespace HairStudio
{
    public partial class stuffSignUp : System.Web.UI.Page
    {
        private readonly string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["CSRFToken"] = Guid.NewGuid().ToString("N");
            }
        }

        // Staff sign up
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Validate CSRF token
            if (ViewState["CSRFToken"] == null)
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Invalid request. Please refresh and try again."));
                return;
            }

            // Validate inputs
            string stuffId = TextBox1.Text.Trim();
            string password = TextBox2.Text.Trim();

            if (!SecurityHelper.IsValidId(stuffId))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Invalid Staff ID. Use only letters, numbers, and underscores."));
                return;
            }

            if (!SecurityHelper.IsValidPassword(password))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Password must be at least 8 characters with at least one letter and one number."));
                return;
            }

            if (checkStuffExist())
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Staff ID already exists. Please use another ID."));
            }
            else
            {
                addStaff();
            }

            // Regenerate CSRF token
            ViewState["CSRFToken"] = Guid.NewGuid().ToString("N");
        }

        bool checkStuffExist()
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
                return true;
            }
        }

        void clearFormForStuff()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }

        void updateStuff()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    // Hash the new password
                    string hashedPassword = BCrypt.Net.BCrypt.HashPassword(TextBox2.Text.Trim());

                    // Parameterized query to prevent SQL injection
                    string query = "UPDATE stuffTBL SET password = @password WHERE stuffId = @stuffId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@password", hashedPassword);
                        cmd.Parameters.AddWithValue("@stuffId", TextBox1.Text.Trim());
                        cmd.ExecuteNonQuery();
                    }
                }

                Response.Write(SecurityHelper.CreateSafeAlert("Staff Password Updated Successfully."));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Update Staff Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
            }
        }

        void addStaff()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    string query = "INSERT INTO stuffTBL(stuffId, password) VALUES(@stuffId, @password)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@stuffId", TextBox1.Text.Trim());

                        // Hash password with BCrypt
                        string hashedPassword = BCrypt.Net.BCrypt.HashPassword(TextBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@password", hashedPassword);

                        cmd.ExecuteNonQuery();
                    }
                }

                Response.Write(SecurityHelper.CreateSafeAlert("Sign Up Successful! Please go to the Login page."));
                clearFormForStuff();
                Response.Redirect("stuffLogin.aspx", false);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Add Staff Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred during registration. Please try again."));
            }
        }
    }
}
