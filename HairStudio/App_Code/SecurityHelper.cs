using System;
using System.IO;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;

namespace HairStudio.App_Code
{
    /// <summary>
    /// Security helper class providing input validation, CSRF protection, and file upload sanitization
    /// </summary>
    public static class SecurityHelper
    {
        #region Input Validation

        /// <summary>
        /// Validates that a string is not null or empty
        /// </summary>
        public static bool IsNotEmpty(string input)
        {
            return !string.IsNullOrWhiteSpace(input);
        }

        /// <summary>
        /// Validates email format
        /// </summary>
        public static bool IsValidEmail(string email)
        {
            if (string.IsNullOrWhiteSpace(email))
                return false;

            string pattern = @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
            return Regex.IsMatch(email, pattern);
        }

        /// <summary>
        /// Validates phone number format (allows digits, spaces, dashes, parentheses)
        /// </summary>
        public static bool IsValidPhone(string phone)
        {
            if (string.IsNullOrWhiteSpace(phone))
                return false;

            string pattern = @"^[\d\s\-\(\)\+]{7,20}$";
            return Regex.IsMatch(phone, pattern);
        }

        /// <summary>
        /// Validates that input contains only alphanumeric characters and basic punctuation
        /// </summary>
        public static bool IsValidAlphanumeric(string input)
        {
            if (string.IsNullOrWhiteSpace(input))
                return false;

            string pattern = @"^[a-zA-Z0-9\s\-_\.]+$";
            return Regex.IsMatch(input, pattern);
        }

        /// <summary>
        /// Validates numeric input
        /// </summary>
        public static bool IsValidNumber(string input)
        {
            if (string.IsNullOrWhiteSpace(input))
                return false;

            return int.TryParse(input, out _);
        }

        /// <summary>
        /// Validates decimal/price input
        /// </summary>
        public static bool IsValidDecimal(string input)
        {
            if (string.IsNullOrWhiteSpace(input))
                return false;

            return decimal.TryParse(input, out _);
        }

        /// <summary>
        /// Validates date format
        /// </summary>
        public static bool IsValidDate(string input)
        {
            if (string.IsNullOrWhiteSpace(input))
                return false;

            return DateTime.TryParse(input, out _);
        }

        /// <summary>
        /// Validates zip code format
        /// </summary>
        public static bool IsValidZipCode(string zipCode)
        {
            if (string.IsNullOrWhiteSpace(zipCode))
                return false;

            string pattern = @"^[\d\-]{4,10}$";
            return Regex.IsMatch(zipCode, pattern);
        }

        /// <summary>
        /// Validates password strength (minimum 8 characters, at least one letter and one number)
        /// </summary>
        public static bool IsValidPassword(string password)
        {
            if (string.IsNullOrWhiteSpace(password) || password.Length < 8)
                return false;

            bool hasLetter = Regex.IsMatch(password, @"[a-zA-Z]");
            bool hasDigit = Regex.IsMatch(password, @"\d");

            return hasLetter && hasDigit;
        }

        /// <summary>
        /// Validates ID format (alphanumeric, no special characters except underscore)
        /// </summary>
        public static bool IsValidId(string id)
        {
            if (string.IsNullOrWhiteSpace(id))
                return false;

            string pattern = @"^[a-zA-Z0-9_]{1,50}$";
            return Regex.IsMatch(id, pattern);
        }

        /// <summary>
        /// Sanitizes input by removing potentially dangerous characters
        /// </summary>
        public static string SanitizeInput(string input)
        {
            if (string.IsNullOrEmpty(input))
                return string.Empty;

            // Remove potentially dangerous characters
            input = input.Replace("'", "''");
            input = HttpUtility.HtmlEncode(input);
            return input.Trim();
        }

        /// <summary>
        /// HTML encodes a string for safe display
        /// </summary>
        public static string HtmlEncode(string input)
        {
            if (string.IsNullOrEmpty(input))
                return string.Empty;

            return HttpUtility.HtmlEncode(input);
        }

        #endregion

        #region CSRF Protection

        private const string CsrfTokenKey = "CSRFToken";
        private const string CsrfTokenFormKey = "__CSRFToken";

        /// <summary>
        /// Generates a new CSRF token and stores it in the session
        /// </summary>
        public static string GenerateCsrfToken(HttpSessionStateBase session)
        {
            string token = Guid.NewGuid().ToString("N");
            session[CsrfTokenKey] = token;
            return token;
        }

        /// <summary>
        /// Generates a new CSRF token and stores it in the session (for WebForms)
        /// </summary>
        public static string GenerateCsrfToken(System.Web.SessionState.HttpSessionState session)
        {
            string token = Guid.NewGuid().ToString("N");
            session[CsrfTokenKey] = token;
            return token;
        }

        /// <summary>
        /// Validates the CSRF token from the request against the session token
        /// </summary>
        public static bool ValidateCsrfToken(System.Web.SessionState.HttpSessionState session, string submittedToken)
        {
            if (session[CsrfTokenKey] == null || string.IsNullOrEmpty(submittedToken))
                return false;

            string sessionToken = session[CsrfTokenKey].ToString();
            return string.Equals(sessionToken, submittedToken, StringComparison.Ordinal);
        }

        /// <summary>
        /// Gets the hidden field HTML for CSRF token
        /// </summary>
        public static string GetCsrfTokenHiddenField(System.Web.SessionState.HttpSessionState session)
        {
            string token = GenerateCsrfToken(session);
            return string.Format("<input type=\"hidden\" name=\"{0}\" value=\"{1}\" />", CsrfTokenFormKey, token);
        }

        /// <summary>
        /// Gets the CSRF token form key name
        /// </summary>
        public static string GetCsrfTokenFormKey()
        {
            return CsrfTokenFormKey;
        }

        #endregion

        #region File Upload Validation

        // Allowed file extensions for images
        private static readonly string[] AllowedImageExtensions = { ".jpg", ".jpeg", ".png", ".gif", ".bmp" };

        // Maximum file size in bytes (5MB)
        private const int MaxFileSize = 5 * 1024 * 1024;

        /// <summary>
        /// Validates an uploaded file for security
        /// </summary>
        public static FileValidationResult ValidateUploadedFile(HttpPostedFile file)
        {
            var result = new FileValidationResult();

            if (file == null || file.ContentLength == 0)
            {
                result.IsValid = false;
                result.ErrorMessage = "No file was uploaded.";
                return result;
            }

            // Check file size
            if (file.ContentLength > MaxFileSize)
            {
                result.IsValid = false;
                result.ErrorMessage = "File size exceeds the maximum allowed size of 5MB.";
                return result;
            }

            // Get and validate file extension
            string fileName = Path.GetFileName(file.FileName);
            string extension = Path.GetExtension(fileName).ToLowerInvariant();

            if (!IsAllowedExtension(extension))
            {
                result.IsValid = false;
                result.ErrorMessage = "File type not allowed. Only image files (jpg, jpeg, png, gif, bmp) are permitted.";
                return result;
            }

            // Validate content type
            if (!IsValidImageContentType(file.ContentType))
            {
                result.IsValid = false;
                result.ErrorMessage = "Invalid file content type.";
                return result;
            }

            // Check for double extensions (e.g., file.jpg.exe)
            if (HasDoubleExtension(fileName))
            {
                result.IsValid = false;
                result.ErrorMessage = "File name contains invalid characters.";
                return result;
            }

            result.IsValid = true;
            result.SanitizedFileName = SanitizeFileName(fileName);
            return result;
        }

        /// <summary>
        /// Checks if the file extension is allowed
        /// </summary>
        private static bool IsAllowedExtension(string extension)
        {
            foreach (string allowed in AllowedImageExtensions)
            {
                if (extension.Equals(allowed, StringComparison.OrdinalIgnoreCase))
                    return true;
            }
            return false;
        }

        /// <summary>
        /// Validates the content type is an image
        /// </summary>
        private static bool IsValidImageContentType(string contentType)
        {
            if (string.IsNullOrEmpty(contentType))
                return false;

            string[] validTypes = { "image/jpeg", "image/png", "image/gif", "image/bmp", "image/jpg" };
            foreach (string type in validTypes)
            {
                if (contentType.Equals(type, StringComparison.OrdinalIgnoreCase))
                    return true;
            }
            return false;
        }

        /// <summary>
        /// Checks for double extensions which could be used to bypass security
        /// </summary>
        private static bool HasDoubleExtension(string fileName)
        {
            string[] dangerousExtensions = { ".exe", ".dll", ".bat", ".cmd", ".ps1", ".vbs", ".js", ".aspx", ".asp", ".php" };
            string lowerFileName = fileName.ToLowerInvariant();

            foreach (string ext in dangerousExtensions)
            {
                if (lowerFileName.Contains(ext))
                    return true;
            }
            return false;
        }

        /// <summary>
        /// Sanitizes the file name by removing dangerous characters and generating a unique name
        /// </summary>
        public static string SanitizeFileName(string fileName)
        {
            // Get the extension
            string extension = Path.GetExtension(fileName).ToLowerInvariant();

            // Generate a unique file name using GUID to prevent overwrites and directory traversal
            string uniqueName = Guid.NewGuid().ToString("N");

            return uniqueName + extension;
        }

        /// <summary>
        /// Safely saves an uploaded file
        /// </summary>
        public static SaveFileResult SaveUploadedFile(HttpPostedFile file, string uploadDirectory)
        {
            var result = new SaveFileResult();

            // First validate the file
            var validationResult = ValidateUploadedFile(file);
            if (!validationResult.IsValid)
            {
                result.Success = false;
                result.ErrorMessage = validationResult.ErrorMessage;
                return result;
            }

            try
            {
                // Ensure directory exists
                if (!Directory.Exists(uploadDirectory))
                {
                    Directory.CreateDirectory(uploadDirectory);
                }

                // Generate safe file path
                string safeFileName = validationResult.SanitizedFileName;
                string fullPath = Path.Combine(uploadDirectory, safeFileName);

                // Save the file
                file.SaveAs(fullPath);

                result.Success = true;
                result.SavedFileName = safeFileName;
                result.RelativePath = "~/imageStore/" + safeFileName;
            }
            catch (Exception ex)
            {
                result.Success = false;
                result.ErrorMessage = "Error saving file: " + ex.Message;
            }

            return result;
        }

        #endregion

        #region Session Security

        /// <summary>
        /// Safely gets a session value with null check
        /// </summary>
        public static string GetSessionValue(System.Web.SessionState.HttpSessionState session, string key)
        {
            if (session == null || session[key] == null)
                return string.Empty;

            return session[key].ToString();
        }

        /// <summary>
        /// Checks if user is authenticated
        /// </summary>
        public static bool IsAuthenticated(System.Web.SessionState.HttpSessionState session)
        {
            return session != null &&
                   session["userId"] != null &&
                   !string.IsNullOrEmpty(session["userId"].ToString());
        }

        /// <summary>
        /// Checks if user has specific role
        /// </summary>
        public static bool HasRole(System.Web.SessionState.HttpSessionState session, string role)
        {
            if (session == null || session["role"] == null)
                return false;

            return session["role"].ToString().Equals(role, StringComparison.OrdinalIgnoreCase);
        }

        /// <summary>
        /// Properly clears all session data (for logout)
        /// </summary>
        public static void ClearSession(System.Web.SessionState.HttpSessionState session)
        {
            if (session != null)
            {
                session.Clear();
                session.Abandon();
            }
        }

        #endregion

        #region Error Handling

        /// <summary>
        /// Returns a safe error message for display (hides sensitive details)
        /// </summary>
        public static string GetSafeErrorMessage(Exception ex)
        {
            // Log the actual error (in production, use a proper logging framework)
            System.Diagnostics.Debug.WriteLine($"Error: {ex.Message}\nStackTrace: {ex.StackTrace}");

            // Return a generic message to the user
            return "An error occurred while processing your request. Please try again.";
        }

        /// <summary>
        /// Creates a safe JavaScript alert (prevents XSS) - Legacy support
        /// </summary>
        public static string CreateSafeAlert(string message)
        {
            // Use toast notification instead of alert
            return CreateToast(message, "info");
        }

        #endregion

        #region Toast Notifications

        /// <summary>
        /// Toast notification types
        /// </summary>
        public enum ToastType
        {
            Success,
            Error,
            Warning,
            Info
        }

        /// <summary>
        /// Creates a toast notification script
        /// </summary>
        public static string CreateToast(string message, string type = "info")
        {
            // Escape any quotes and special characters
            string safeMessage = message
                .Replace("\\", "\\\\")
                .Replace("'", "\\'")
                .Replace("\"", "\\\"")
                .Replace("\r", "")
                .Replace("\n", "");

            return string.Format("<script>if(typeof Toast !== 'undefined') {{ Toast.{0}('{1}'); }} else {{ alert('{1}'); }}</script>",
                type.ToLower(), safeMessage);
        }

        /// <summary>
        /// Creates a success toast notification
        /// </summary>
        public static string ShowSuccess(string message)
        {
            return CreateToast(message, "success");
        }

        /// <summary>
        /// Creates an error toast notification
        /// </summary>
        public static string ShowError(string message)
        {
            return CreateToast(message, "error");
        }

        /// <summary>
        /// Creates a warning toast notification
        /// </summary>
        public static string ShowWarning(string message)
        {
            return CreateToast(message, "warning");
        }

        /// <summary>
        /// Creates an info toast notification
        /// </summary>
        public static string ShowInfo(string message)
        {
            return CreateToast(message, "info");
        }

        #endregion
    }

    #region Result Classes

    /// <summary>
    /// Result class for file validation
    /// </summary>
    public class FileValidationResult
    {
        public bool IsValid { get; set; }
        public string ErrorMessage { get; set; }
        public string SanitizedFileName { get; set; }
    }

    /// <summary>
    /// Result class for file save operation
    /// </summary>
    public class SaveFileResult
    {
        public bool Success { get; set; }
        public string ErrorMessage { get; set; }
        public string SavedFileName { get; set; }
        public string RelativePath { get; set; }
    }

    #endregion
}
