using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;


namespace HairStudio
{
    public partial class userLogin : System.Web.UI.Page
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

        // User login button
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Validate CSRF token
            if (ViewState["CSRFToken"] == null)
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Invalid request. Please refresh and try again."));
                return;
            }

            // Input validation
            string userId = TextBox1.Text.Trim();
            string password = TextBox2.Text.Trim();

            if (!SecurityHelper.IsNotEmpty(userId) || !SecurityHelper.IsNotEmpty(password))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Please enter both User ID and Password."));
                return;
            }

            if (!SecurityHelper.IsValidId(userId))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Invalid User ID format."));
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    // Parameterized query to prevent SQL injection
                    string query = "SELECT userId, name, password, accountStatus FROM userTBL WHERE userId = @userId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@userId", userId);

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.HasRows && dr.Read())
                            {
                                string storedPassword = dr["password"].ToString();
                                string userName = dr["name"].ToString();
                                string accountStatus = dr["accountStatus"].ToString();

                                // Verify password using BCrypt
                                bool isPasswordValid = BCrypt.Net.BCrypt.Verify(password, storedPassword);

                                if (isPasswordValid)
                                {
                                    // Clear existing session and set new values
                                    Session.Clear();
                                    Session["username"] = SecurityHelper.HtmlEncode(userName);
                                    Session["userId"] = userId;
                                    Session["status"] = accountStatus;
                                    Session["role"] = "user";
                                    Session["loginTime"] = DateTime.Now;

                                    Response.Redirect("homePage.aspx", false);
                                }
                                else
                                {
                                    Response.Write(SecurityHelper.CreateSafeAlert("Invalid User ID or Password."));
                                }
                            }
                            else
                            {
                                Response.Write(SecurityHelper.CreateSafeAlert("Invalid User ID or Password."));
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"User Login Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred during login. Please try again."));
            }

            // Regenerate CSRF token
            ViewState["CSRFToken"] = Guid.NewGuid().ToString("N");
        }

        // User signUp button
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("userSignUp.aspx");
        }

        void clearFormForUser()
        {
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
        }
    }
}
