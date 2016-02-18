/**
 * 
 */
var nameVar=/^[a-zA-Z\s-, ]{2,15}$/;
var addressVar= /^[A-Za-z0-9()]{2,25}$/;
//var helpRequestVar= /^[A-Za-z0-9!@#$%^&*()_]{6,10}$/;
var mobileVar= /^\d{10}$/;
function validateRequests() {

	var checkName = hsform.hsname.value;
	var checkAddress = hsform.address.value;
	//var checkHelpRequest = hsform.helprequest.value;
	var checkMobile = hsform.mobile.value;
	if (!nameVar.test(checkName)) {
		document.getElementById('req').innerHTML = "enter proper name";
		hsform.hsname.focus();
		alert("enter name between 2 to 20 characters");
		return (false);
	}
	if (!addressVar.test(checkAddress)) {
		document.getElementById('req').innerHTML = "Enter proper address";
		hsform.address.focus();
		alert("enter address between 2 to 25 characters");
		return (false);
	}
	if (!mobileVar.test(checkMobile)) {
		document.getElementById('req').innerHTML = "Enter your contact no.";
		hsform.mobile.focus();
		alert("mobile number with max 10 digits");
		return (false);
	}
	if (document.hsform.helprequest.value=="") {
		document.getElementById('req').innerHTML = "Post your request";
		
		hsform.helprequest.focus();
		alert("use max of 30 characters to post");
		return (false);
	}
 else {
		return (true);
	}
}