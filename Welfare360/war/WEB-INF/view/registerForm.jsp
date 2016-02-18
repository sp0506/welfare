<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="google-signin-client_id" content="599176377522-a14d4q0genufrqabv9lr5fhgafq030hf.apps.googleusercontent.com">
<title>welfare360</title>

<link href="../css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="../css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="../css/login.css" rel="stylesheet" type="text/css" media="all" />
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script> 
 <script src="../js/reg-validate.js"> </script> 
 <script>function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail());
	}</script>
	
	
<script type="text/javascript">
 
function checkEmail(){

	
	var email=$("#email").val();
  
   if(email)
   {
	  // alert(email);
       $.ajax({
		   type: 'post',
		   url: '/choose/checkEmail?email='+email,
		   data: email,
		  
		  /*  data: {
		   user_email:email,
		   }, */
		   success: function (response) {
		   $( '#email_avail' ).html(response);
		   if(response == "1")
			   
           {
			   $("#email_avail").html("email already registered");
           }
           else if(response == "0")
           {
        	   $("#email_avail").html("email id is vailid");
           }
         }
	   });


    }
    else
    {
	   $( '#email_avail' ).html("enter email");
	   return false;
    }

} 
/* function checkExist(){
    var xmlhttp = new XMLHttpRequest();
    var email = document.forms["form"]["email"].value;
    var url = "exist.jsp?email=" + email;
    xmlhttp.onreadystatechange = function(){
        if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
            if(xmlhttp.responseText == "\n\n\n\n\nUser already exists")
                document.getElementById("isE").style.color = "red";
            else
                document.getElementById("isE").style.color = "green";
            document.getElementById("isE").innerHTML = xmlhttp.responseText;
        }
        
    };
    try{
    xmlhttp.open("GET",url,true);
    xmlhttp.send();
}catch(e){alert("unable to connect to server");
} */
</script>

</head>
<body>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="index">welfare360</a></h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="index"  method="POST" title="">home</a></li>
				<li><a href="charity"  method="POST" title="">charity-orgs</a></li>
				<li><a href="volunteerList"  method="POST" title="">Volunteers</a></li>
				<li  class="active"><a href="register" method="POST" >join us</a></li>
				<li><a href="login" method="POST"  title="">Sign In</a></li>
				
			</ul>
		</div>
	</div>
</div>
     
	
 <div id="page-wrapper">
<h2 align="center">register here</h2>
	<div id="featured" class="container" >
<%-- <div method="POST" name="message" id="message" > <h1><font color='red'> gjhgjh${message} </font></h1></div> --%>
	
	<form method="POST" action="regDetails" class="form" name="form" id="form" >
	
		<table class="form-table" align="center">
		

				<tr><td colspan="2"> <font color='red'> <div id="reg" align="center"> </div> </font></td></tr> 
		    	
		    	<tr><td> <p class="name">
		    		<label for="name">name </label></td>
		    	<td><input type="text" name="name" id="name" placeholder="name"
					required="required" aria-required="true" 
					pattern="[a-zA-Z][a-zA-Z ]{3,}"
					title="Your name (use atlest four characters)" /></td>
						</p></tr>
						
				<tr><td> <p class="userName">
					<label for="userName">username</label></td>
				<td><input type="text" name="userName" id="userName" placeholder="username" 
							required="required" aria-required="true" 
					pattern="^[a-zA-Z][a-zA-Z0-9-_\.]{1,20}$"
					title="Your user name (have min of 2 and  max of 20 characters)"/></td>
						</p></tr>
			
				<tr><td><p class="email">
					<label for="email">email</label></td>
				<td><input type="text" name="email" id="email" placeholder="email" 
							required="required" aria-required="true" 
					pattern="^(([-\w\d]+)(\.[-\w\d]+)*@([-\w\d]+)(\.[-\w\d]+)*(\.([a-zA-Z]{2,5}|[\d]{1,3})){1,2})$"
					title="Your email address" onblur="checkEmail()" /></td>
					<td><span id="email_avail" color="red"></span></td>
						</p></tr>

				<tr><td><p class="password">
					 <label for="password">password</label></td>
				<td><input type="password" name="password" id="password" placeholder="password" 
				required="required" aria-required="true" 
					pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="Atleast 1 upper case letters (A to Z), Lower case(a to z),1 number (0 to 9),1 special character"/></td> 
	  					</p></tr>
		
				<tr><td><p class="confirm">
					 <label for="confirm">confirm </label></td>
				<td><input type="password" name="confirm" id="confirm" placeholder="confirm" 
				required="required" aria-required="true" 
					pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="Atleast 1 upper case letters (A – Z), Lower case(a – z),1 number (0 – 9),1 special character(@‘$%£!’)"/></td> 
						</p></tr>
						
				<tr><td><p class="location">
					 <label for="location">location</label></td>
				<td><input type="text" name="location" id="location" placeholder="location" 
						required="required" aria-required="true" 
					pattern="[a-zA-Z][a-zA-Z ]{4,}"
					title="Your City Name"/></td>
						</p></tr>

				<tr><td><p class="role">
					 <label for="role">you're</label></td>	
				<td><select id="role" name="role" value="role" required="required" aria-required="true">
								<option value="" selected>-- choose --</option>
								<option value="1" id="volunteer" name="volunteer">Volunteer</option>
								<option value="2" id="helpseeker" name="helpseeker">HelpSeeker</option>
					</select></td>
						</p></tr>

		 						
				<tr><td colspan="2" align="right"><p class="submit">
							<input type="submit" value="Register"  /></td>
				
						</p></tr>
		<tr>
		<td colspan="2" align="right"><div class="g-signin2" data-onsuccess="onSignIn"></div></td>
		</tr>
		</table>
		
	</form> 
	</div>
	</div>
		<script type="text/javascript">
	(function()
	{
				
		//add event construct for modern browsers or IE
		//which fires the callback with a pre-converted target reference
		function addEvent(node, type, callback)
		{
			if(node.addEventListener)
			{
				node.addEventListener(type, function(e)
				{
					callback(e, e.target);
					
				}, false);
			}
			else if(node.attachEvent)
			{
				node.attachEvent('on' + type, function(e)
				{
					callback(e, e.srcElement);
				});
			}
		}
		
		
		//identify whether a field should be validated
		//ie. true if the field is neither readonly nor disabled, 
		//and has either "pattern", "required" or "aria-invalid"
		function shouldBeValidated(field)
		{
			return (
				!(field.getAttribute('readonly') || field.readonly)
				&&
				!(field.getAttribute('disabled') || field.disabled)
				&&
				(
					field.getAttribute('pattern')
					||
					field.getAttribute('required')
				)
			); 
		}
		
		
		//field testing and validation function
		function instantValidation(field)
		{
			//if the field should be validated
			if(shouldBeValidated(field))
			{
				//the field is invalid if: 
				//it's required but the value is empty 
				//it has a pattern but the (non-empty) value doesn't pass
				var invalid = 
				(
					(field.getAttribute('required') && !field.value)
					||
					(
						field.getAttribute('pattern') 
						&& 
						field.value 
						&& 
						!new RegExp(field.getAttribute('pattern')).test(field.value)
					)
				);
		
				//add or remove the attribute is indicated by 
				//the invalid flag and the current attribute state
				if(!invalid && field.getAttribute('aria-invalid'))
				{
					field.removeAttribute('aria-invalid');
				}
				else if(invalid && !field.getAttribute('aria-invalid'))
				{
					field.setAttribute('aria-invalid', 'true');
				}
			}
		}
		
		
		//now bind a delegated change event 
		//== THIS FAILS IN INTERNET EXPLORER <= 8 ==//
		//addEvent(document, 'change', function(e, target) 
		//{ 
		//	instantValidation(target); 
		//});
		
		
		//now bind a change event to each applicable for field
		var fields = [
			document.getElementsByTagName('input'), 
			document.getElementsByTagName('select')
			];
		for(var a = fields.length, i = 0; i < a; i ++)
		{
			for(var b = fields[i].length, j = 0; j < b; j ++)
			{
				addEvent(fields[i][j], 'change', function(e, target)
				{
					instantValidation(target);
				});
			}
		}
		
		
	})();
	</script>
	
	<script type="text/javascript"> (function() {var stag = document.createElement
('script'); stag.type = "text/javascript"; stag.async = true; stag.src=
"http://webchat.answerconnect.com/livechat/script/1930007709";
var s = document.getElementsByTagName('script')[0]; 
s.parentNode.insertBefore(stag,s);})();</script>
</body>
</html>