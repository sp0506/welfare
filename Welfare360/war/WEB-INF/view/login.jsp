<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>welfare360</title>

<link href="../css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="../css/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="../css/login.css" rel="stylesheet" type="text/css"
	media="all" />
<script src="../js/login-validate.js" /></script>
<script type="text/javascript">
function doAjaxPost() {  
	  // get the form values  
	  var userNameLog = $('#userNameLogin').val();
	  var passwordLog = $('#passwordLogin').val();
	   
	  $.ajax({  
	    type: "POST",  
	    url: "/loginValidate",  
	   data: "userNameLogin=" + userNameLog + "&passwordLogin=" + passwordLog,  
	    success: function(response){  
	      // we have the response 
	      $('#somediv').jsp(Volunteer); 
	    	/* if(data=='True'){
                $(location).attr('href','Volunteer.jsp');
              }
	    	else{
                alert('Fail....'); */
            }
	     /*  alert(response);
	      $('#info').html(response);
	      $('#name').val('');
	      $('#education').val(''); */
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  
	}  
</script>
</head>
<body>

	<div id="somediv"></div>
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<h1>
					<a href="index">welfare360</a>
				</h1>
			</div>
			<div id="menu">
				<ul>
					<li><a href="index"  title="">home</a></li>
					<li><a href="charity" title="">Charity-Orgs</a></li>
					<li><a href="volunteerList" title="" method="POST">volunteers</a></li>
					<li><a href="register" method="POST" title="">join us</a></li>
					<li class="active"><a href="login" method="POST">Sign In</a></li>
				</ul>
			</div>
		</div>
	</div>



	<div id="page-wrapper">
		<h2 align="center">login here</h2>
		<div id="featured" class="container">
			<form method="POST" action="loginValidate" class="form" name="form"
				onsubmit="return validateLogin()">
				<table class="form-table" align="center">

					<tr>
						<td><font color='red'>
								<div id="log"></div>
						</font></td>
					</tr>

					<tr>
						<td>
							<p class="userName">
								<input type="text" name="userNameLogin" id="userNameLogin"
									placeholder="( your username )" />
						<td><label for="userNameLogin">username</label>
							</p>
					</tr>


					<tr>
						<td>
							<p class="password">
								<input type="password" name="passwordLogin" id="passwordLogin"
									placeholder="( your password )" />
						<td><label for="passwordLogin">password</label>
							</p>
					</tr>

					<tr>
						<td>
							<p class="role">
								<select id="roleLogin" name="roleLogin" value="roleLogin">
									<option value="0" selected>--choose--</option>
									<option value="1" id="volunteer" name="volunteer">Volunteer</option>
									<option value="2" id="helpseeker" name="helpseeker">HelpSeeker</option>

								</select>
						<td><label for="roleLogin">iam a</label>
							</p>
					</tr>

					<tr>
						<td>
							<p class="submit">
								<input type="submit" value="Login" name="Login"
									onclick="doAjaxPost()" />
						</td>
						</p>
					</tr>

				</table>
			</form>
		</div>
	</div>
	<!-- 
			<form method="POST" action="loginValidate" class="form">

				<p class="username">
					<input type="text" name="userNameLogin" id="userNameLogin"
						placeholder="( your username )" /> <label for="userNameLogin">username</label>
				</p>



				<p class="password">
					<input type="password" name="passwordLogin" id="passwordLogin"
						placeholder="( your password )" /> <label for="passwordLogin">password</label>
				</p>


				<p class="role">
					<select id="roleLogin" name="roleLogin" value="roleLogin">
						<option disabled selected>-- choose --</option>
						<option value="volunteer">Volunteer</option>
						<option value="helpseeker">HelpSeeker</option>

					</select> <label for="password">iam a</label>
				</p>
				<font color='red'>
					<div id="une"></div>
				</font>
				<p class="submit">
					<input type="submit" value="Login" />
				</p>

				</table>

			</form>
 -->
	<script type="text/javascript"> (function() {var stag = document.createElement
('script'); stag.type = "text/javascript"; stag.async = true; stag.src=
"http://webchat.answerconnect.com/livechat/script/1930007709";
var s = document.getElementsByTagName('script')[0]; 
s.parentNode.insertBefore(stag,s);})();</script>
</body>

</html>