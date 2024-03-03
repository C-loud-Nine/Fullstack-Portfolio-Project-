using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webapp_01
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if there is an existing cookie for the email address
                HttpCookie emailCookie = Request.Cookies["Email"];
                if (emailCookie != null)
                {
                    // If a cookie exists, populate the email textbox with the cookie value
                    email.Text = emailCookie.Value;
                }

                // Check if there is an existing session for the password
                if (Session["Password"] != null)
                {
                    // If a session exists, populate the password textbox with the session value
                    password.Text = Session["Password"].ToString();
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Get the entered email and password
            string enteredEmail = email.Text.Trim();
            string enteredPassword = password.Text.Trim();

            // Check if the email and password match the specific credentials
            if (enteredEmail == "abdullah.shafi99@gmail.com" && enteredPassword == "12345")
            {
                // Create a cookie for the email address to remember it
                HttpCookie emailCookie = new HttpCookie("Email", enteredEmail);
                emailCookie.Expires = DateTime.Now.AddDays(7); // Set cookie expiration to 7 days
                Response.Cookies.Add(emailCookie);

                // Store the password in a session variable
                Session["LoggedIn"] = true;

                // Redirect to the admin.aspx page upon successful login
                Response.Redirect("admin.aspx");
            }
            else
            {
                // Display an error message if the email or password is incorrect
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid email or password. Please try again.');", true);
            }
        }
    }
}