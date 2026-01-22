using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using HairStudio.App_Code;

namespace HairStudio
{
    public partial class adminLogin : System.Web.UI.Page
    {
        private readonly string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Generate CSRF token on page load
            if (!IsPostBack)
            {
                ViewState["CSRFToken"] = Guid.NewGuid().ToString("N");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Validate CSRF token
            if (ViewState["CSRFToken"] == null)
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Invalid request. Please refresh and try again."));
                return;
            }

            // Input validation
            string adminId = TextBox1.Text.Trim();
            string password = TextBox2.Text.Trim();

            if (!SecurityHelper.IsNotEmpty(adminId) || !SecurityHelper.IsNotEmpty(password))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Please enter both Admin ID and Password."));
                return;
            }

            if (!SecurityHelper.IsValidId(adminId))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Invalid Admin ID format."));
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    // Parameterized query to prevent SQL injection
                    string query = "SELECT adminId, password, name FROM adminTBL WHERE adminId = @adminId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@adminId", adminId);

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.HasRows && dr.Read())
                            {
                                string storedPassword = dr["password"].ToString();
                                string adminName = dr["name"] != DBNull.Value ? dr["name"].ToString() : adminId;

                                // Verify password using BCrypt
                                bool isPasswordValid = false;
                                try
                                {
                                    isPasswordValid = BCrypt.Net.BCrypt.Verify(password, storedPassword);
                                }
                                catch
                                {
                                    // If BCrypt verification fails, check if it's a legacy plaintext password
                                    // This allows migration from plaintext to hashed passwords
                                    if (storedPassword == password)
                                    {
                                        isPasswordValid = true;
                                        // Update to hashed password for security
                                        UpdateAdminPasswordToHash(adminId, password);
                                    }
                                }

                                if (isPasswordValid)
                                {
                                    // Regenerate session ID to prevent session fixation
                                    Session.Clear();
                                    Session["username"] = SecurityHelper.HtmlEncode(adminName);
                                    Session["adminId"] = adminId;
                                    Session["role"] = "admin";
                                    Session["loginTime"] = DateTime.Now;

                                    Response.Redirect("homePage.aspx", false);
                                }
                                else
                                {
                                    Response.Write(SecurityHelper.CreateSafeAlert("Invalid Admin ID or Password."));
                                }
                            }
                            else
                            {
                                Response.Write(SecurityHelper.CreateSafeAlert("Invalid Admin ID or Password."));
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the actual error securely (in production, use proper logging)
                System.Diagnostics.Debug.WriteLine($"Admin Login Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred during login. Please try again."));
            }

            // Regenerate CSRF token after each request
            ViewState["CSRFToken"] = Guid.NewGuid().ToString("N");
        }

        /// <summary>
        /// Updates admin password from plaintext to BCrypt hash (migration helper)
        /// </summary>
        private void UpdateAdminPasswordToHash(string adminId, string plainPassword)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    string hashedPassword = BCrypt.Net.BCrypt.HashPassword(plainPassword);

                    string query = "UPDATE adminTBL SET password = @password WHERE adminId = @adminId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@password", hashedPassword);
                        cmd.Parameters.AddWithValue("@adminId", adminId);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Password migration error: {ex.Message}");
            }
        }
    }
}
