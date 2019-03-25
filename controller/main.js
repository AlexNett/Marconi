function setpass() {
    var btn = document.getElementById("eye-btn");
    if(btn.classList.contains("fa-eye")) {
        btn.classList.remove("fa-eye");
        btn.classList.add("fa-eye-clicked");
    }
    else {
        btn.classList.remove("fa-eye-clicked");
        btn.classList.add("fa-eye");
    }
    var x = document.getElementById("pass");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
  }
