//   Social Link Section


function showAddSocialLinkModal() {
    var modal = document.getElementById("addSocialLinkModal");
    modal.style.display = "block";
}
function closeSocialLinkModal() {
    var modal = document.getElementById("addSocialLinkModal");
    modal.style.display = "none";
}
function showEditSocialLinkModal(altText, imagePath, link) {
    var modal = document.getElementById("editSocialLinkModal");
    modal.style.display = "block";

    // Populate textboxes with current data
    document.getElementById("editAltText").value = altText;
    document.getElementById("editImagePath").value = imagePath;
    document.getElementById("editLink").value = link;
}

function closeSocialLinkeditModal() {
    var modal = document.getElementById("editSocialLinkModal");
    modal.style.display = "none";
}




// Skill Percentage Section

function closeModal(modalId) {
    var modal = document.getElementById(modalId);
    modal.style.display = "none";
}
function showAddSkillModal() {
    var modal = document.getElementById("addSkillModal");
    modal.style.display = "block";
}
function showEditSkillModal(skillName, skillPercent) {
    var modal = document.getElementById("editSkillModal");
    modal.style.display = "block";


    document.getElementById("editSkillName").value = skillName;
    document.getElementById("editSkillPercent").value = skillPercent;
}





// Expertise Section


function showAddExpertiseModal() {
    var modal = document.getElementById("addExpertiseModal");
    modal.style.display = "block";
}


function closeAddExpertiseModal() {
    var modal = document.getElementById("addExpertiseModal");
    modal.style.display = "none";
}


function showEditExpertiseModal(project, description) {
    var modal = document.getElementById("editExpertiseModal");
    modal.style.display = "block";

    // Populate fields with current data
    document.getElementById("TextBox6").value = project;
    document.getElementById("TextBox7").value = description;
}


function closeEditExpertiseModal() {
    var modal = document.getElementById("editExpertiseModal");
    modal.style.display = "none";
}


// Projects Section


function showAddProjectModal() {
    var modal = document.getElementById('addProjectModal');
    modal.style.display = 'block';
}

function closeAddProjectModal() {
    var modal = document.getElementById('addProjectModal');
    modal.style.display = 'none';
}

function showEditProjectModal(title, description, link, imagePath, altText) {
    var modal = document.getElementById("editProjectModal");
    modal.style.display = 'block';

    // Populate the textboxes with current values
    document.getElementById("editTitle").value = title;
    document.getElementById("editDescription").value = description;
    document.getElementById("TextBox1").value = link;
    document.getElementById("TextBox2").value = imagePath;
    document.getElementById("TextBox3").value = altText;
}


function closeEditProjectModal() {
    var modal = document.getElementById('editProjectModal');
    modal.style.display = 'none';
}


