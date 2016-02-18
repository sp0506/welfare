/**
 * 
 *//*

var userNameVar= /^[A-Za-z0-9_]{2,8}$/;
var passwordVar= /^[A-Za-z0-9!@#$%^&*()_]{6,10}$/;

function validateLogin() {

	var checkUserName = form.userNameLogin.value;
	var checkPassword = form.passwordLogin.value;
	
 if(!userNameVar.test(checkUserName))  
 {   document.getElementById('log').innerHTML = "enter your username";  
 form.userNameLogin.focus();  
 alert("enter username between 2 to 8 characters ");
 return(false);  }
 
 if(!passwordVar.test(checkPassword))   
 {   document.getElementById('log').innerHTML = "enter your password"; 
 form.passwordLogin.focus();
 alert("enter password 6 to 10 characters");
 return(false);    } 
  
 if ((document.form.roleLogin.value == 0)) {
		document.getElementById('log').innerHTML = "role is required";
		form.roleLogin.focus();
		return (false);
	} else {
		return (true);
	}
}*/