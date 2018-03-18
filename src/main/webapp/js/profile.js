var userNameDiv;
var oldUserName;
var newUserName;

window.onload = function () {
    userNameDiv = document.getElementById("userNameDiv");
    oldUserName = document.getElementById("userName");
    newUserName = document.createElement("INPUT");
}

function editOrSaveProfileData() {
    var profileBtnValue = document.getElementById("profileBtn").value;
    if (profileBtnValue == "Edit Profile")
        editUserProfile();
    else if (profileBtnValue == "Save Changes")
        saveUserProfileChanges();
}

function editUserProfile() {
    document.getElementById("profileBtn").value = "Save Changes";
    editUserName();
}

function editUserName() {
    newUserName.setAttribute("type", "text");
    newUserName.className = "newInput";
    newUserName.value = oldUserName.innerHTML;
    userNameDiv.replaceChild(newUserName, oldUserName);
}

function saveUserProfileChanges() {
    alert("Save Data");
}