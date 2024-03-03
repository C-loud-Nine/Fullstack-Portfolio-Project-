<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Webapp_01.admin" %>



<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Panel</title>
    <link rel="stylesheet" href="admin.css" />
     <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/typed.js/2.0.11/typed.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>     
        <asp:Button ID="Button1" runat="server" Text="Log Out" CssClass="delete-btn" OnClick="logoutButton_Click" />
        <h1>Admin Panel</h1>  




<!-- Social Media Link Section -->


<div class="section">
    <h2>Social Links</h2>
    <div class="actions">
        <asp:Button ID="addSocialLinkBtn" runat="server" CssClass="add-btn" Text="Add Social Link" OnClientClick="showAddSocialLinkModal(); return false;" />


    </div>
    <asp:GridView ID="socialLinksTable" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:TemplateField HeaderText="Alt Text">
                <ItemTemplate>
                    <asp:Label ID="lblAltText" runat="server" Text='<%# Eval("AltText") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image Path">
                <ItemTemplate>
                    <asp:Label ID="lblImagePath" runat="server" Text='<%# Eval("ImagePath") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Link">
                <ItemTemplate>
                    <asp:Label ID="lblLink" runat="server" Text='<%# Eval("Link") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="editSocialButton" runat="server" Text="Edit" CssClass="edit-btn" OnClientClick='<%# "showEditSocialLinkModal(\"" + Eval("AltText") + "\", \"" + Eval("ImagePath") + "\", \"" + Eval("Link") + "\"); return false;" %>' />
                    <asp:Button ID="deleteSocialButton" runat="server" Text="Delete" CssClass="delete-btn" OnClick="deleteSocialLink_Click" />

                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>



<!-- Add Social Link Modal -->
<asp:Panel ID="addSocialLinkModal" runat="server" CssClass="modal">
    <div class="modal-content">
        <span class="close" onclick="closeSocialLinkModal()">&times;</span>
        <h2>Add Social Link</h2>
        <label for="altText">Alt Text:</label>
        <asp:TextBox ID="altText" runat="server"></asp:TextBox>
        <label for="imagePath">Image Path:</label>
        <asp:TextBox ID="imagePath" runat="server"></asp:TextBox>
        <label for="link">Link:</label>
        <asp:TextBox ID="link" runat="server"></asp:TextBox>
        <asp:Button ID="addSocialLink" runat="server" Text="Add" OnClick="AddSocialLink_Click" />
    </div>
</asp:Panel>


<!-- Edit Social Link Modal -->
<asp:Panel ID="editSocialLinkModal" runat="server" CssClass="modal">
    <div class="modal-content">
        <span class="close" onclick="closeSocialLinkeditModal()">&times;</span>
        <h2>Edit Social Link</h2>
        <asp:HiddenField ID="editSocialLinkId" runat="server" />
        <label for="editAltText">Alt Text:</label>
        <asp:TextBox ID="editAltText" runat="server"></asp:TextBox>
        <label for="editImagePath">Image Path:</label>
        <asp:TextBox ID="editImagePath" runat="server"></asp:TextBox>
        <label for="editLink">Link:</label>
        <asp:TextBox ID="editLink" runat="server"></asp:TextBox>
        <asp:Button ID="editSocialLink" runat="server" Text="Update" OnClick="EditSocialLink_Click" />
    </div>
</asp:Panel>




<!-- Projects Section -->




<div class="section">
    <h2>Projects</h2>
    <div class="actions">
        <asp:Button ID="addProjectBtn" runat="server" CssClass="add-btn" Text="Add Project" OnClientClick="showAddProjectModal(); return false;" />
    </div>
    <asp:GridView ID="projectGridView" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:BoundField DataField="Link" HeaderText="Link" />
            <asp:BoundField DataField="ImagePath" HeaderText="Image Path" />
            <asp:BoundField DataField="AltText" HeaderText="Alt Text" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="editProjectBtn" runat="server" Text="Edit" CssClass="edit-btn" OnClientClick='<%# "showEditProjectModal(\"" + Eval("Title") + "\", \"" + Eval("Description") + "\", \"" + Eval("Link") + "\", \"" + Eval("ImagePath") + "\", \"" + Eval("AltText") + "\"); return false;" %>' />
                    <asp:Button ID="deleteProjectBtn" runat="server" Text="Delete" CssClass="delete-btn" OnClick="deleteProject_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>

<!-- Add Project Modal -->
<asp:Panel ID="addProjectModal" runat="server" CssClass="modal">
    <div class="modal-content">
        <span class="close" onclick="closeAddProjectModal()">&times;</span>
        <h2>Add Project</h2>
        <asp:Panel ID="addProjectPanel" runat="server">
            <label for="addTitle">Title:</label>
            <asp:TextBox ID="addTitle" runat="server"></asp:TextBox>
            <label for="addDescription">Description:</label>
            <asp:TextBox ID="addDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
            <label for="addLink">Link:</label>
            <asp:TextBox ID="addLink" runat="server"></asp:TextBox>
            <label for="addImagePath">Image Path:</label>
            <asp:TextBox ID="addImagePath" runat="server"></asp:TextBox>
            <label for="addAltText">Alt Text:</label>
            <asp:TextBox ID="addAltText" runat="server"></asp:TextBox>
            <asp:Button ID="addProject" runat="server" Text="Add" OnClick="AddProject_Click" />
        </asp:Panel>
    </div>
</asp:Panel>

<!-- Edit Project Modal -->
<asp:Panel ID="editProjectModal" runat="server" CssClass="modal">
    <div class="modal-content">
        <span class="close" onclick="closeEditProjectModal()">&times;</span>
        <h2>Edit Project</h2>
        <asp:Panel ID="editProjectPanel" runat="server">
            <asp:HiddenField ID="editProjectId" runat="server" />
            <label for="editTitle">Title:</label>
            <asp:TextBox ID="editTitle" runat="server"></asp:TextBox>
            <label for="editDescription">Description:</label>
            <asp:TextBox ID="editDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
            <label for="editLink">Link:</label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <label for="editImagePath">Image Path:</label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <label for="editAltText">Alt Text:</label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:Button ID="editProject" runat="server" Text="Edit" OnClick="EditProject_Click" />
        </asp:Panel>
    </div>
</asp:Panel>





<!-- Expertise Details Section -->



<div class="section">
    <h2>Expertise Details</h2>
    <div class="actions">
        <asp:Button ID="addExpertiseBtn" runat="server" CssClass="add-btn" Text="Add Expertise" OnClientClick="showAddExpertiseModal(); return false;" />
    </div>
    <asp:GridView ID="expertiseGridView" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Project" HeaderText="Project" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="editExpertiseBtn" runat="server" Text="Edit" CssClass="edit-btn" OnClientClick='<%# "showEditExpertiseModal(\"" + Eval("Project") + "\", \"" + Eval("Description") + "\"); return false;" %>' />
                    <asp:Button ID="deleteExpertiseBtn" runat="server" Text="Delete" CssClass="delete-btn" OnClick="deleteExpertise_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>

<!-- Add Expertise Modal -->
<asp:Panel ID="addExpertiseModal" runat="server" CssClass="modal">
    <div class="modal-content">
        <span class="close" onclick="closeAddExpertiseModal()">&times;</span>
        <h2>Add Expertise</h2>
        <asp:Panel ID="addExpertisePanel" runat="server">
            <label for="addProject">Project:</label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <label for="addDescription">Description:</label>
            <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:Button ID="addExpertise" runat="server" Text="Add" OnClick="AddExpertise_Click" />
        </asp:Panel>
    </div>
</asp:Panel>

<!-- Edit Expertise Modal -->
<asp:Panel ID="editExpertiseModal" runat="server" CssClass="modal">
    <div class="modal-content">
        <span class="close" onclick="closeEditExpertiseModal()">&times;</span>
        <h2>Edit Expertise</h2>
        <asp:Panel ID="editExpertisePanel" runat="server">
            <asp:HiddenField ID="editExpertiseId" runat="server" />
            <label for="editProject">Project:</label>
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <label for="editDescription">Description:</label>
            <asp:TextBox ID="TextBox7" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:Button ID="editExpertise" runat="server" Text="Update" OnClick="EditExpertise_Click" />
        </asp:Panel>
    </div>
</asp:Panel>









<!-- Skill Percentage Section -->


<div class="section">
    <h2>Skills</h2>
    <div class="actions">
        <asp:Button ID="addSkillBtn" runat="server" CssClass="add-btn" Text="Add Skill" OnClientClick="showAddSkillModal(); return false" />
    </div>
    <asp:GridView ID="skillsGridView" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Skill_name" HeaderText="Skill Name" />
            <asp:BoundField DataField="Skill_percent" HeaderText="Skill Percent" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="editSkillBtn" runat="server" Text="Edit" CssClass="edit-btn" OnClientClick='<%# "showEditSkillModal(\"" + Eval("Skill_name") + "\", \"" + Eval("Skill_percent") + "\"); return false;" %>' />

                    <asp:Button ID="deleteSkillBtn" runat="server" Text="Delete" CssClass="delete-btn" OnClick="deleteSkill_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <!-- Add Skill Modal -->
    <asp:Panel ID="addSkillModal" runat="server" CssClass="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('addSkillModal')">&times;</span>
            <h2>Add Skill</h2>
            <asp:Panel ID="addSkillPanel" runat="server">
                <label for="addSkillName">Skill Name:</label>
                <asp:TextBox ID="addSkillName" runat="server" CssClass="textbox"></asp:TextBox>
                <label for="addSkillPercent">Skill Percent:</label>
                <asp:TextBox ID="addSkillPercent" runat="server" CssClass="textbox"></asp:TextBox>
                <asp:Button ID="btnAddSkill" runat="server" Text="Add" CssClass="btn" OnClick="AddSkill_Click" />
            </asp:Panel>
        </div>
    </asp:Panel>

    <!-- Edit Skill Modal -->
    <asp:Panel ID="editSkillModal" runat="server" CssClass="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('editSkillModal')">&times;</span>
            <h2>Edit Skill</h2>
            <asp:Panel ID="editSkillPanel" runat="server">
                <asp:HiddenField ID="editSkillId" runat="server" />
                <label for="editSkillName">Skill Name:</label>
                <asp:TextBox ID="editSkillName" runat="server" CssClass="textbox"></asp:TextBox>
                <label for="editSkillPercent">Skill Percent:</label>
                <asp:TextBox ID="editSkillPercent" runat="server" CssClass="textbox"></asp:TextBox>
                <asp:Button ID="btnEditSkill" runat="server" Text="Update" CssClass="btn" OnClick="EditSkill_Click" />
            </asp:Panel>
        </div>
    </asp:Panel>









        <!-- Mail Section -->



<div class="section">
    <h2>Inbox</h2>
    <asp:GridView ID="mailGridView" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" />
            <asp:BoundField DataField="msg" HeaderText="Message" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="deleteMailBtn" runat="server" Text="Delete" CssClass="delete-btn" OnClick="deleteMail_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>










    
    
    
    
    </form>
    <script src="admin.js"></script>
</body>
</html>

