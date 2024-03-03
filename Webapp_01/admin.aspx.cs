using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webapp_01
{
    public partial class admin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSocialMediaLinks();
                BindProjects();
                BindExpertise();
                BindSkills();
                BindMailData();
            }


        }


        protected void logoutButton_Click(object sender, EventArgs e)
        {

            Session.Clear();
            // Perform any logout actions, such as clearing session or authentication cookies

            // Redirect the user to the login page
            Response.Redirect("login.aspx");
        }


        //   Social Media Link Section  //

        protected void BindSocialMediaLinks()
        {
            try
            {
                string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                string query = "SELECT AltText, ImagePath, Link FROM SocialMediaLinks";

                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    // Open the connection
                    connection.Open();

                    // Create a SqlDataAdapter
                    using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        // Bind the data to the GridView
                        socialLinksTable.DataSource = dataTable;
                        socialLinksTable.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Console.WriteLine("An error occurred: " + ex.Message);
            }
        }


        protected void addSocialLink_Click(object sender, EventArgs e)
        {
            // Display the addSocialLinkModal
            addSocialLinkModal.Visible = true;

        }




        protected void AddSocialLink_Click(object sender, EventArgs e)
        {
            try
            {
                // Retrieve values from the textboxes using their server-side IDs
                string altTextValue = altText.Text;
                string imagePathValue = imagePath.Text;
                string linkValue = link.Text;

                // Check if any of the textboxes are empty
                if (string.IsNullOrEmpty(altTextValue) || string.IsNullOrEmpty(imagePathValue) || string.IsNullOrEmpty(linkValue))
                {
                    // Display a message indicating that all fields are required
                    ScriptManager.RegisterStartupScript(this, GetType(), "Validation", "alert('Please fill in all fields.');", true);
                    return;
                }

                // Construct the SQL query
                string query = "INSERT INTO SocialMediaLinks (AltText, ImagePath, Link) VALUES (@AltText, @ImagePath, @Link)";

                // Establish connection and command objects
                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to the command
                        command.Parameters.AddWithValue("@AltText", altTextValue);
                        command.Parameters.AddWithValue("@ImagePath", imagePathValue);
                        command.Parameters.AddWithValue("@Link", linkValue);

                        // Open connection and execute the command
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                // Clear the textboxes
                altText.Text = "";
                imagePath.Text = "";
                link.Text = "";

                // Rebind the data to update the GridView
                BindSocialMediaLinks();
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Console.WriteLine("An error occurred: " + ex.Message);
            }
        }







        protected void socialLinksTable_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView rowView = (DataRowView)e.Row.DataItem;
                if (rowView != null)
                {
                    string altText = rowView["AltText"].ToString();
                    string imagePath = rowView["ImagePath"].ToString();
                    string link = rowView["Link"].ToString();

                    Button editButton = (Button)e.Row.FindControl("editSocialButton");
                    if (editButton != null)
                    {
                        editButton.Attributes["onclick"] = string.Format("showEditSocialLinkModal('{0}', '{1}', '{2}'); return false;", altText, imagePath, link);
                    }
                }
            }
        }



        protected void editSocialLink_Click(object sender, EventArgs e)
        {

        }




        protected void EditSocialLink_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the values from the textboxes
                string altText = editAltText.Text;
                string imagePath = editImagePath.Text;
                string link = editLink.Text;

                // Construct the SQL query to update the record based on the values in the current row
                string query = "UPDATE SocialMediaLinks SET AltText = @AltText , Link=@Link WHERE ImagePath = @ImagePath ";

                // Establish connection and command objects
                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to the command
                        command.Parameters.AddWithValue("@AltText", altText);
                        command.Parameters.AddWithValue("@ImagePath", imagePath);
                        command.Parameters.AddWithValue("@Link", link);

                        // Open the connection
                        connection.Open();

                        // Execute the command to update the record
                        int rowsAffected = command.ExecuteNonQuery();

                        // Rebind the GridView to reflect the changes
                        if (rowsAffected > 0)
                        {
                            BindSocialMediaLinks();
                            ScriptManager.RegisterStartupScript(this, GetType(), "editSuccess", "alert('Social link updated successfully.'); closeSocialLinkeditModal();", true);
                        }
                        else
                        {
                            // Optionally, provide feedback if no rows were affected (record not found)
                            ScriptManager.RegisterStartupScript(this, GetType(), "editError", "alert('No social links were updated.');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                ScriptManager.RegisterStartupScript(this, GetType(), "editError", $"alert('An error occurred: {ex.Message}');", true);
            }
        }


        protected void deleteSocialLink_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the button that raised the event
                Button deleteButton = (Button)sender;

                // Find the row in which the delete button was clicked
                GridViewRow row = (GridViewRow)deleteButton.NamingContainer;

                // Get the data values of the row to identify the record to delete
                string altText = ((Label)row.FindControl("lblAltText")).Text;
                string imagePath = ((Label)row.FindControl("lblImagePath")).Text;
                string link = ((Label)row.FindControl("lblLink")).Text;

                // Construct the SQL query to delete the record based on values of AltText, ImagePath, and Link
                string query = "DELETE FROM SocialMediaLinks WHERE AltText = @AltText AND ImagePath = @ImagePath AND Link = @Link";

                // Establish connection and command objects
                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to the command
                        command.Parameters.AddWithValue("@AltText", altText);
                        command.Parameters.AddWithValue("@ImagePath", imagePath);
                        command.Parameters.AddWithValue("@Link", link);

                        // Open the connection
                        connection.Open();

                        // Execute the command to delete the record
                        int rowsAffected = command.ExecuteNonQuery();

                        // Rebind the GridView to reflect the changes
                        if (rowsAffected > 0)
                        {
                            BindSocialMediaLinks();
                            ScriptManager.RegisterStartupScript(this, GetType(), "deleteSuccess", "alert('Social link deleted successfully.');", true);
                        }
                        else
                        {
                            // Optionally, provide feedback if no rows were affected (record not found)
                            ScriptManager.RegisterStartupScript(this, GetType(), "deleteError", "alert('Social link not found or already deleted.');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                ScriptManager.RegisterStartupScript(this, GetType(), "deleteError", $"alert('An error occurred: {ex.Message}');", true);
            }
        }








        //   Project Section  //



        protected void BindProjects()
        {
            try
            {
                string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                string query = "SELECT Title, Description, Link, ImagePath, AltText FROM Projects";

                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    connection.Open();
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            DataTable dataTable = new DataTable();
                            adapter.Fill(dataTable);

                            projectGridView.DataSource = dataTable;
                            projectGridView.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Console.WriteLine("An error occurred: " + ex.Message);
            }
        }



        protected void addProject_Click(object sender, EventArgs e)
        {
            // Add project logic here
            Response.Write("<script>alert('Message sent!');</script>");
        }

        protected void editProject_Click(object sender, EventArgs e)
        {
            // Edit project logic here
            Response.Write("<script>alert('Message sent!');</script>");
        }



        protected void AddProject_Click(object sender, EventArgs e)
        {
            try
            {
                string title = addTitle.Text;
                string description = addDescription.Text;
                string link = addLink.Text;
                string imagePath = addImagePath.Text;
                string altText = addAltText.Text;

                // Perform validation if needed

                // Insert into the database
                string query = "INSERT INTO Projects (Title, Description, Link, ImagePath, AltText) VALUES (@Title, @Description, @Link, @ImagePath, @AltText)";

                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Title", title);
                        command.Parameters.AddWithValue("@Description", description);
                        command.Parameters.AddWithValue("@Link", link);
                        command.Parameters.AddWithValue("@ImagePath", imagePath);
                        command.Parameters.AddWithValue("@AltText", altText);

                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                // After successful insertion, rebind the GridView
                BindProjects();

                // Close the modal
                ScriptManager.RegisterStartupScript(this, GetType(), "addProjectModal", "closeAddProjectModal();", true);
            }
            catch (Exception ex)
            {
                // Handle exceptions
                ScriptManager.RegisterStartupScript(this, GetType(), "addProjectError", $"alert('An error occurred: {ex.Message}');", true);
            }
        }

        protected void EditProject_Click(object sender, EventArgs e)
        {
            try
            {
                string title = editTitle.Text;
                string description = editDescription.Text;
                string link = TextBox1.Text;
                string imagePath = TextBox2.Text;
                string altText = TextBox3.Text;

                // Perform validation if needed

                // Update the database record
                string query = "UPDATE Projects SET Description = @Description, Link = @Link, Title = @Title , AltText = @AltText WHERE ImagePath = @ImagePath";

                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Description", description);
                        command.Parameters.AddWithValue("@Link", link);
                        command.Parameters.AddWithValue("@ImagePath", imagePath);
                        command.Parameters.AddWithValue("@AltText", altText);
                        command.Parameters.AddWithValue("@Title", title);

                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                // After successful update, rebind the GridView
                BindProjects();

                // Close the modal
                ScriptManager.RegisterStartupScript(this, GetType(), "editProjectModal", "closeEditProjectModal();", true);
            }
            catch (Exception ex)
            {
                // Handle exceptions
                ScriptManager.RegisterStartupScript(this, GetType(), "editProjectError", $"alert('An error occurred: {ex.Message}');", true);
            }
        }




        protected void deleteProject_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the button that raised the event
                Button deleteButton = (Button)sender;

                // Find the row in which the delete button was clicked
                GridViewRow row = (GridViewRow)deleteButton.NamingContainer;

                // Get the data values of the row to identify the record to delete
                string title = row.Cells[0].Text; // Assuming Title is in the first cell
                string description = row.Cells[1].Text; // Assuming Description is in the second cell

                // Construct the SQL query to delete the record based on the title and description
                string query = "DELETE FROM Projects WHERE Title = @Title AND Description = @Description";

                // Establish connection and command objects
                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to the command
                        command.Parameters.AddWithValue("@Title", title);
                        command.Parameters.AddWithValue("@Description", description);

                        // Open the connection
                        connection.Open();

                        // Execute the command to delete the record
                        int rowsAffected = command.ExecuteNonQuery();

                        // Rebind the GridView to reflect the changes
                        if (rowsAffected > 0)
                        {
                            BindProjects();
                            ScriptManager.RegisterStartupScript(this, GetType(), "deleteProjectSuccess", "alert('Project deleted successfully.');", true);
                        }
                        else
                        {
                            // Optionally, provide feedback if no rows were affected (record not found)
                            ScriptManager.RegisterStartupScript(this, GetType(), "deleteProjectError", "alert('Project not found or already deleted.');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                ScriptManager.RegisterStartupScript(this, GetType(), "deleteProjectError", $"alert('An error occurred: {ex.Message}');", true);
            }
        }









        //   Expertise Details Section  //


        protected void BindExpertise()
        {
            try
            {
                string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                string query = "SELECT Project, Description FROM Expertise_details";

                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        connection.Open();
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            DataTable dataTable = new DataTable();
                            adapter.Fill(dataTable);

                            expertiseGridView.DataSource = dataTable;
                            expertiseGridView.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Console.WriteLine("An error occurred: " + ex.Message);
            }
        }

        protected void AddExpertise_Click(object sender, EventArgs e)
        {
            try
            {
                // Retrieve values from the textboxes using their server-side IDs
                string project = TextBox4.Text;
                string description = TextBox5.Text;

                // Check if any of the textboxes are empty
                if (string.IsNullOrEmpty(project) || string.IsNullOrEmpty(description))
                {
                    // Display a message indicating that all fields are required
                    ScriptManager.RegisterStartupScript(this, GetType(), "Validation", "alert('Please fill in all fields.');", true);
                    return;
                }

                // Construct the SQL query
                string query = "INSERT INTO Expertise_details (Project, Description) VALUES (@Project, @Description)";

                // Establish connection and command objects
                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to the command
                        command.Parameters.AddWithValue("@Project", project);
                        command.Parameters.AddWithValue("@Description", description);

                        // Open connection and execute the command
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                // Clear the textboxes
                TextBox4.Text = "";
                TextBox5.Text = "";

                // Rebind the data to update the GridView
                BindExpertise();
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Console.WriteLine("An error occurred: " + ex.Message);
            }
        }

        protected void expertiseGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView rowView = (DataRowView)e.Row.DataItem;
                if (rowView != null)
                {
                    string project = rowView["Project"].ToString();
                    string description = rowView["Description"].ToString();

                    Button editButton = (Button)e.Row.FindControl("editExpertiseBtn");
                    if (editButton != null)
                    {
                        editButton.Attributes["onclick"] = string.Format("showEditExpertiseModal('{0}', '{1}'); return false;", project, description);
                    }
                }
            }
        }

        protected void EditExpertise_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the values from the textboxes
                string project = TextBox6.Text;
                string description = TextBox7.Text;

                // Construct the SQL query to update the record based on the values in the current row
                string query = "UPDATE Expertise_details SET Description = @Description WHERE Project = @Project";

                // Establish connection and command objects
                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to the command
                        command.Parameters.AddWithValue("@Project", project);
                        command.Parameters.AddWithValue("@Description", description);

                        // Open the connection
                        connection.Open();

                        // Execute the command to update the record
                        int rowsAffected = command.ExecuteNonQuery();

                        // Rebind the GridView to reflect the changes
                        if (rowsAffected > 0)
                        {
                            BindExpertise();
                            ScriptManager.RegisterStartupScript(this, GetType(), "editSuccess", "alert('Expertise updated successfully.'); closeEditExpertiseModal();", true);
                        }
                        else
                        {
                            // Optionally, provide feedback if no rows were affected (record not found)
                            ScriptManager.RegisterStartupScript(this, GetType(), "editError", "alert('No expertise were updated.');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                ScriptManager.RegisterStartupScript(this, GetType(), "editError", $"alert('An error occurred: {ex.Message}');", true);
            }
        }

        protected void deleteExpertise_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the button that raised the event
                Button deleteButton = (Button)sender;

                // Find the row in which the delete button was clicked
                GridViewRow row = (GridViewRow)deleteButton.NamingContainer;

                // Get the data values of the row to identify the record to delete
                string project = row.Cells[0].Text;
                string description = row.Cells[1].Text;

                // Construct the SQL query to delete the record based on the project
                string query = "DELETE FROM Expertise_details WHERE Project = @Project AND Description = @Description";

                // Establish connection and command objects
                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to the command
                        command.Parameters.AddWithValue("@Project", project);
                        command.Parameters.AddWithValue("@Description", description);

                        // Open the connection
                        connection.Open();

                        // Execute the command to delete the record
                        int rowsAffected = command.ExecuteNonQuery();

                        // Rebind the GridView to reflect the changes
                        if (rowsAffected > 0)
                        {
                            BindExpertise();
                            ScriptManager.RegisterStartupScript(this, GetType(), "deleteSuccess", "alert('Expertise deleted successfully.');", true);
                        }
                        else
                        {
                            // Optionally, provide feedback if no rows were affected (record not found)
                            ScriptManager.RegisterStartupScript(this, GetType(), "deleteError", "alert('Expertise not found or already deleted.');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                ScriptManager.RegisterStartupScript(this, GetType(), "deleteError", $"alert('An error occurred: {ex.Message}');", true);
            }
        }






        //   Skills Percentage Section  //




        protected void BindSkills()
        {
            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            string query = "SELECT Skill_name, Skill_percent FROM Expertise";

            using (SqlConnection connection = new SqlConnection(strcon))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable skillsDataTable = new DataTable();
                    adapter.Fill(skillsDataTable);

                    skillsGridView.DataSource = skillsDataTable;
                    skillsGridView.DataBind();
                }
            }
        }
        protected void addSkill_Click(object sender, EventArgs e)
        {
            // Method to handle adding a new skill
        }

        protected void editSkill_Click(object sender, EventArgs e)
        {
            // Method to handle editing an existing skill
        }





        protected void AddSkill_Click(object sender, EventArgs e)
        {
            try
            {
                // Retrieve values from the textboxes using their server-side IDs
                string skillName = addSkillName.Text;
                string skillPercent = addSkillPercent.Text;

                // Construct the SQL query to insert the new skill into the database
                string query = "INSERT INTO Expertise (Skill_name, Skill_percent) VALUES (@SkillName, @SkillPercent)";

                // Establish connection and command objects
                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to the command
                        command.Parameters.AddWithValue("@SkillName", skillName);
                        command.Parameters.AddWithValue("@SkillPercent", skillPercent);

                        // Open connection and execute the command
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                // Clear the textboxes
                addSkillName.Text = "";
                addSkillPercent.Text = "";

                // Rebind the data to update the GridView
                BindSkills();
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Console.WriteLine("An error occurred: " + ex.Message);
            }
        }


        protected void skilsTable_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Check if the row is a data row
                DataRowView rowView = e.Row.DataItem as DataRowView;
                if (rowView != null)
                {
                    // Retrieve data from the row
                    string skillName = rowView["Skill_name"].ToString();
                    string skillPercent = rowView["Skill_percent"].ToString();

                    // Find the edit button in the row
                    Button editButton = e.Row.FindControl("editSkillBtn") as Button;
                    if (editButton != null)
                    {
                        // Set the onclick event to trigger the JavaScript function and pass skillName and skillPercent
                        editButton.Attributes["onclick"] = string.Format("showEditSkillModal('{0}', '{1}'); return false;", skillName, skillPercent);
                    }
                }
            }
        }


        protected void EditSkill_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the values from the textboxes
                string skillName = editSkillName.Text;
                string updatedSkillPercent = editSkillPercent.Text;

                // Validate the updated skill percent
                if (!IsValidSkillPercent(updatedSkillPercent))
                {
                    // Show an error message if the skill percent is invalid
                    ScriptManager.RegisterStartupScript(this, GetType(), "editError", "alert('Skill percent must be between 0 and 100.');", true);
                    return;
                }

                // Construct the SQL query to update the record based on the values in the current row
                string query = "UPDATE Expertise SET Skill_percent = @UpdatedSkillPercent WHERE Skill_name = @SkillName";

                // Establish connection and command objects
                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to the command
                        command.Parameters.AddWithValue("@UpdatedSkillPercent", updatedSkillPercent);
                        command.Parameters.AddWithValue("@SkillName", skillName);

                        // Open the connection
                        connection.Open();

                        // Execute the command to update the record
                        int rowsAffected = command.ExecuteNonQuery();

                        // Rebind the GridView to reflect the changes
                        if (rowsAffected > 0)
                        {
                            BindSkills();
                            ScriptManager.RegisterStartupScript(this, GetType(), "editSuccess", "alert('Skill updated successfully.');", true);
                        }
                        else
                        {
                            // Optionally, provide feedback if no rows were affected (record not found)
                            ScriptManager.RegisterStartupScript(this, GetType(), "editError", "alert('Skill not found or already updated.');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                ScriptManager.RegisterStartupScript(this, GetType(), "editError", $"alert('An error occurred: {ex.Message}');", true);
            }
        }

        // Method to validate the skill percent
        private bool IsValidSkillPercent(string skillPercent)
        {
            if (!int.TryParse(skillPercent, out int percentValue))
            {
                // Skill percent is not a valid integer
                return false;
            }

            // Check if the skill percent is within the valid range (0 to 100)
            return percentValue >= 0 && percentValue <= 100;
        }






        protected void deleteSkill_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the button that raised the event
                Button deleteButton = sender as Button;

                // Find the row in which the delete button was clicked
                GridViewRow row = deleteButton?.NamingContainer as GridViewRow;

                if (row != null)
                {
                    // Get the data values of the row to identify the record to delete
                    string skillName = row.Cells[0].Text; // Assuming Skill Name is in the first column
                    string skillPercent = row.Cells[1].Text; // Assuming Skill Percent is in the second column

                    // Construct the SQL query to delete the record based on values of Skill_name and Skill_percent
                    string query = "DELETE FROM Expertise WHERE Skill_name = @SkillName AND Skill_percent = @SkillPercent";

                    // Establish connection and command objects
                    using (SqlConnection connection = new SqlConnection(strcon))
                    {
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            // Add parameters to the command
                            command.Parameters.AddWithValue("@SkillName", skillName);
                            command.Parameters.AddWithValue("@SkillPercent", skillPercent);

                            // Open the connection
                            connection.Open();

                            // Execute the command to delete the record
                            int rowsAffected = command.ExecuteNonQuery();

                            // Rebind the GridView to reflect the changes
                            if (rowsAffected > 0)
                            {
                                BindSkills();
                                ScriptManager.RegisterStartupScript(this, GetType(), "deleteSkillSuccess", "alert('Skill deleted successfully.');", true);
                            }
                            else
                            {
                                // Optionally, provide feedback if no rows were affected (record not found)
                                ScriptManager.RegisterStartupScript(this, GetType(), "deleteSkillError", "alert('Skill not found or already deleted.');", true);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                ScriptManager.RegisterStartupScript(this, GetType(), "deleteSkillError", $"alert('An error occurred: {ex.Message}');", true);
            }
        }




        // Mail Section


        protected void BindMailData()
        {
            try
            {
                // Connection string to your database
                string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

                // SQL query to select data from the Contact table
                string query = "SELECT [Name], [Email], [Subject], [msg] FROM Contact";

                // Establishing connection and command objects
                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Opening the connection
                        connection.Open();

                        // Creating a SqlDataAdapter to fill the DataTable
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            // Creating a DataTable to hold the retrieved data
                            DataTable mailData = new DataTable();

                            // Filling the DataTable with data from the database
                            adapter.Fill(mailData);

                            // Binding the DataTable to the GridView
                            mailGridView.DataSource = mailData;
                            mailGridView.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions
                Console.WriteLine("An error occurred while retrieving mail data: " + ex.Message);
            }
        }

        protected void deleteMail_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the button that raised the event
                Button deleteButton = (Button)sender;

                // Find the row in which the delete button was clicked
                GridViewRow row = (GridViewRow)deleteButton.NamingContainer;

                // Get the email address of the mail to be deleted from the row's data
                string email = row.Cells[1].Text; // Assuming the email address is in the second cell

                // Construct the SQL query to delete the mail
                string query = "DELETE FROM Contact WHERE Email = @Email";

                // Establish connection and command objects
                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameter to the command
                        command.Parameters.AddWithValue("@Email", email);

                        // Open the connection
                        connection.Open();

                        // Execute the command to delete the mail
                        int rowsAffected = command.ExecuteNonQuery();

                        // Optionally, check if any rows were affected
                        if (rowsAffected > 0)
                        {
                            // Optionally, provide feedback to the user
                            ScriptManager.RegisterStartupScript(this, GetType(), "deleteSuccess", "alert('Mail deleted successfully.');", true);

                            // Rebind the GridView to reflect the changes
                            BindMailData();
                        }
                        else
                        {
                            // Optionally, provide feedback if no rows were affected (record not found)
                            ScriptManager.RegisterStartupScript(this, GetType(), "deleteError", "alert('Mail not found or already deleted.');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                ScriptManager.RegisterStartupScript(this, GetType(), "deleteError", $"alert('An error occurred: {ex.Message}');", true);
            }
        }
    }
}