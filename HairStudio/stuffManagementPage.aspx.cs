using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;


namespace HairStudio
{
    public partial class stuffManagementPage : System.Web.UI.Page
    {
        private readonly string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is staff
            if (Session["role"] == null || Session["role"].ToString() != "stuff")
            {
                Response.Redirect("stuffLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                ViewState["CSRFToken"] = Guid.NewGuid().ToString("N");
            }
        }

        // Add button
        protected void Button12_Click(object sender, EventArgs e)
        {
            if (!ValidateProductInput())
                return;

            if (checkProduct())
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Product item already exists."));
            }
            else
            {
                addNewProduct();
            }
        }

        // Update button
        protected void Button13_Click(object sender, EventArgs e)
        {
            if (!ValidateProductInput())
                return;

            if (checkProduct())
            {
                updateProduct();
            }
            else
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Product ID does not exist."));
            }
        }

        // Delete button
        protected void Button14_Click(object sender, EventArgs e)
        {
            if (!SecurityHelper.IsValidId(TextBox1.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Invalid Product ID format."));
                return;
            }

            if (checkProduct())
            {
                deleteProduct();
            }
            else
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Product ID does not exist."));
            }
        }

        // Go button
        protected void Button11_Click(object sender, EventArgs e)
        {
            if (!SecurityHelper.IsValidId(TextBox1.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Invalid Product ID format."));
                return;
            }
            getproductById();
        }

        private bool ValidateProductInput()
        {
            if (!SecurityHelper.IsValidId(TextBox1.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Invalid Product ID format."));
                return false;
            }

            if (!SecurityHelper.IsNotEmpty(TextBox2.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Please enter product name."));
                return false;
            }

            if (!SecurityHelper.IsValidDecimal(TextBox3.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Please enter a valid price."));
                return false;
            }

            if (!SecurityHelper.IsValidNumber(TextBox4.Text.Trim()))
            {
                Response.Write(SecurityHelper.CreateSafeAlert("Please enter a valid quantity."));
                return false;
            }

            return true;
        }

        bool checkProduct()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    // Parameterized query to prevent SQL injection
                    string query = "SELECT COUNT(*) FROM productTBL WHERE productId = @productId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@productId", TextBox1.Text.Trim());
                        int count = (int)cmd.ExecuteScalar();
                        return count > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Check Product Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
                return false;
            }
        }

        void addNewProduct()
        {
            try
            {
                string filePath = "~/imageStore/product16.jpg"; // Default image

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

                    string query = "INSERT INTO productTBL(productId, name, price, quantity, origin, issueDate, imgLink) VALUES(@productId, @name, @price, @quantity, @origin, @issueDate, @imgLink)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@productId", TextBox1.Text.Trim());
                        cmd.Parameters.AddWithValue("@name", TextBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@price", decimal.Parse(TextBox3.Text.Trim()));
                        cmd.Parameters.AddWithValue("@quantity", int.Parse(TextBox4.Text.Trim()));
                        cmd.Parameters.AddWithValue("@origin", TextBox5.Text.Trim());
                        cmd.Parameters.AddWithValue("@issueDate", TextBox6.Text.Trim());
                        cmd.Parameters.AddWithValue("@imgLink", filePath);

                        cmd.ExecuteNonQuery();
                    }
                }

                GridView1.DataBind();
                Response.Write(SecurityHelper.CreateSafeAlert("Product added Successfully."));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Add Product Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
            }
        }

        void deleteProduct()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    // Parameterized query to prevent SQL injection
                    string query = "DELETE FROM productTBL WHERE productId = @productId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@productId", TextBox1.Text.Trim());
                        cmd.ExecuteNonQuery();
                    }
                }

                GridView1.DataBind();
                Response.Write(SecurityHelper.CreateSafeAlert("Product Deleted Successfully."));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Delete Product Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
            }
        }

        void getproductById()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    // Parameterized query to prevent SQL injection
                    string query = "SELECT * FROM productTBL WHERE productId = @productId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@productId", TextBox1.Text.Trim());

                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count >= 1)
                        {
                            TextBox2.Text = dt.Rows[0]["name"].ToString();
                            TextBox3.Text = dt.Rows[0]["price"].ToString();
                            TextBox4.Text = dt.Rows[0]["quantity"].ToString();
                            TextBox5.Text = dt.Rows[0]["origin"].ToString();
                            TextBox6.Text = dt.Rows[0]["issueDate"].ToString();
                        }
                        else
                        {
                            Response.Write(SecurityHelper.CreateSafeAlert("Please enter valid Product ID."));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Get Product Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
            }
        }

        void updateProduct()
        {
            try
            {
                string filePath = "~/imageStore/product16.jpg"; // Default image

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
                    string query = "UPDATE productTBL SET price = @price, quantity = @quantity, imgLink = @imgLink WHERE productId = @productId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@price", decimal.Parse(TextBox3.Text.Trim()));
                        cmd.Parameters.AddWithValue("@quantity", int.Parse(TextBox4.Text.Trim()));
                        cmd.Parameters.AddWithValue("@imgLink", filePath);
                        cmd.Parameters.AddWithValue("@productId", TextBox1.Text.Trim());

                        cmd.ExecuteNonQuery();
                    }
                }

                GridView1.DataBind();
                Response.Write(SecurityHelper.CreateSafeAlert("Product Updated Successfully."));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Update Product Error: {ex.Message}");
                Response.Write(SecurityHelper.CreateSafeAlert("An error occurred. Please try again."));
            }
        }
    }
}
