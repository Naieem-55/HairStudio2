using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using HairStudio.App_Code;

namespace HairStudio
{
    public partial class userSignUp : System.Web.UI.Page
    {
        private readonly string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["CSRFToken"] = Guid.NewGuid().ToString("N");
            }
        }

        // SignUp button click event
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Validate CSRF token
            if (ViewState["CSRFToken"] == null)
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Invalid request. Please refresh and try again."));
                return;
            }

            // Validate all inputs
            if (!ValidateInputs())
            {
                return;
            }

            if (checkUserExist())
            {
                Response.Write(SecurityHelper.CreateSafeAlert("User ID already exists. Please use another ID."));
            }
            else
            {
                addUser();
            }

            // Regenerate CSRF token
            ViewState["CSRFToken"] = Guid.NewGuid().ToString("N");
        }

        private bool ValidateInputs()
        {
            // Validate User ID
            if (!SecurityHelper.IsValidId(TextBox9.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Invalid User ID. Use only letters, numbers, and underscores."));
                return false;
            }

            // Validate Name
            if (!SecurityHelper.IsNotEmpty(TextBox1.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Please enter your name."));
                return false;
            }

            // Validate Phone
            if (!SecurityHelper.IsValidPhone(TextBox2.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Please enter a valid phone number."));
                return false;
            }

            // Validate Email
            if (!SecurityHelper.IsValidEmail(TextBox4.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Please enter a valid email address."));
                return false;
            }

            // Validate Zip Code
            if (!SecurityHelper.IsNotEmpty(TextBox7.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Please enter a zip code."));
                return false;
            }

            // Validate Password
            if (!SecurityHelper.IsValidPassword(TextBox10.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Password must be at least 8 characters with at least one letter and one number."));
                return false;
            }

            return true;
        }

        bool checkUserExist()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    // Parameterized query to prevent SQL injection
                    string query = "SELECT COUNT(*) FROM userTBL WHERE userId = @userId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@userId", TextBox9.Text.Trim());
                        int count = (int)cmd.ExecuteScalar();
                        return count > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Check User Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
                return true; // Return true to prevent registration on error
            }
        }

        void addUser()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    string query = @"INSERT INTO userTBL(userId, name, birthDate, phone, email, state, city, zipCode, adress, accountStatus, password)
                                    VALUES(@userId, @name, @birthDate, @phone, @email, @state, @city, @zipCode, @adress, @accountStatus, @password)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@userId", TextBox9.Text.Trim());
                        cmd.Parameters.AddWithValue("@name", TextBox1.Text.Trim());
                        cmd.Parameters.AddWithValue("@birthDate", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@phone", TextBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                        cmd.Parameters.AddWithValue("@state", TextBox5.Text.Trim());
                        cmd.Parameters.AddWithValue("@city", TextBox6.Text.Trim());
                        cmd.Parameters.AddWithValue("@zipCode", TextBox7.Text.Trim());
                        cmd.Parameters.AddWithValue("@adress", TextBox8.Text.Trim());
                        cmd.Parameters.AddWithValue("@accountStatus", "pending");

                        // Hash password with BCrypt
                        string hashedPassword = BCrypt.Net.BCrypt.HashPassword(TextBox10.Text.Trim());
                        cmd.Parameters.AddWithValue("@password", hashedPassword);

                        cmd.ExecuteNonQuery();
                    }
                }

                Response.Write(SecurityHelper.CreateSafeAlert("Sign Up Successful! Please go to the Login page."));
                ClearForm();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Add User Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred during registration. Please try again."));
            }
        }

        private void ClearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
        }
    }
}
