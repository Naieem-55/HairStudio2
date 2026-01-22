using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using HairStudio.App_Code;

namespace HairStudio
{
    public partial class stuffLogin : System.Web.UI.Page
    {
        private readonly string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["CSRFToken"] = Guid.NewGuid().ToString("N");
            }
        }

        // Staff login
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Validate CSRF token
            if (ViewState["CSRFToken"] == null)
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Invalid request. Please refresh and try again."));
                return;
            }

            // Input validation
            string stuffId = TextBox1.Text.Trim();
            string password = TextBox2.Text.Trim();

            if (!SecurityHelper.IsNotEmpty(stuffId) || !SecurityHelper.IsNotEmpty(password))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Please enter both Staff ID and Password."));
                return;
            }

            if (!SecurityHelper.IsValidId(stuffId))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Invalid Staff ID format."));
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    // Parameterized query to prevent SQL injection
                    string query = "SELECT stuffId, password, name FROM stuffTBL WHERE stuffId = @stuffId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@stuffId", stuffId);

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.HasRows && dr.Read())
                            {
                                string storedPassword = dr["password"].ToString();
                                string staffName = dr["name"] != DBNull.Value ? dr["name"].ToString() : stuffId;

                                // Verify password using BCrypt
                                bool isPasswordValid = BCrypt.Net.BCrypt.Verify(password, storedPassword);

                                if (isPasswordValid)
                                {
                                    Session.Clear();
                                    Session["username"] = SecurityHelper.HtmlEncode(staffName);
                                    Session["stuffId"] = stuffId;
                                    Session["role"] = "stuff";
                                    Session["loginTime"] = DateTime.Now;

                                    Response.Redirect("homePage.aspx", false);
                                }
                                else
                                {
                                    Response.Write(SecurityHelper.CreateSafeAlert("Invalid Staff ID or Password."));
                                }
                            }
                            else
                            {
                                Response.Write(SecurityHelper.CreateSafeAlert("Invalid Staff ID or Password."));
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Staff Login Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred during login. Please try again."));
            }

            // Regenerate CSRF token
            ViewState["CSRFToken"] = Guid.NewGuid().ToString("N");
        }

        // Staff sign up
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("stuffSignUp.aspx");
        }
    }
}
