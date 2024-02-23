using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Webapp_01
{
    public partial class IndexWebForm : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        private object column_right;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                BindExpertiseData();
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
            }
        }

        protected void BindExpertiseData()
        {
            try
            {
                // Connection string
                string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

                // Create a new SQL connection and open it
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    // SQL query to fetch data
                    string query = "SELECT Skill_name, Skill_percent FROM Expertise";

                    // Create a SQL data adapter and fill a DataTable with the data
                    SqlDataAdapter sda = new SqlDataAdapter(query, con);
                    DataTable dtbl = new DataTable();
                    sda.Fill(dtbl);

                    // Loop through the DataTable and add progress bars dynamically
                    foreach (DataRow row in dtbl.Rows)
                    {
                        string skillName = row["Skill_name"].ToString();
                        int skillPercent = Convert.ToInt32(row["Skill_percent"]);

                        // Create the bars container div
                        System.Web.UI.HtmlControls.HtmlGenericControl barsContainer = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                        barsContainer.Attributes["class"] = "bars";
                        barsContainer.InnerHtml = "<div class='progress-name'>" + skillName + "</div>" +
                            "<div class='progress'>" +
                            "<div class='progress-in' style='width: " + skillPercent + "%;'></div>" +
                            "<div class='skill-percent'><span>" + skillPercent + "%</span></div>" +
                            "</div>";

                        // Find the control with ID "column_right" in the page hierarchy
                        Control column_right = FindControl("column_right");

                        // Check if the control was found
                        if (column_right != null)
                        {
                            // Add the bars container to the found control
                            column_right.Controls.Add(barsContainer);
                        }
                        else
                        {
                            // Handle the case where the control was not found
                            // For example, display an error message or log a warning
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
            }
        }




        protected void btnSend_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();


            SqlCommand cmd = new SqlCommand("INSERT INTO Contact ([Name], [Email], [Subject], [msg]) VALUES(@Name, @Email, @Subject, @msg)", con);

            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Subject", txtSubject.Text.Trim());
            cmd.Parameters.AddWithValue("@msg", txtMessage.Text.Trim());


            cmd.ExecuteNonQuery();

            // Close the connection
            con.Close();

            // Success message in alerts
            Response.Write("<script>alert('Course added!');</script>");



        }
    }

}