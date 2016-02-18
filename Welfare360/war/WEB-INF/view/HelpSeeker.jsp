<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>welfare360-Help</title>

<link href="../css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="../css/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="../css/login.css" rel="stylesheet" type="text/css"
	media="all" />

<script type="text/javascript" src="../js/requests-validate.js"></script>
</head>


<body>
	<%
	 
		String userNameLog = null;
	String s =  (String) session.getAttribute("username");
	//out.println(s);
		if (s == null) {
		out.println(s);
			response.sendRedirect("/login");
			//String s = (String) session.getAttribute("username");
			//Object s = session.getAttribute("username");
			//out.println("in help seeker page"+s);
		} else{
			userNameLog = (String) session.getAttribute("username");
		out.println("in help seeker page"+ userNameLog);
		}
		String userName = null;
		String sessionID = null;
		
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
			//out.println(cookies);
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("username"))
				//	out.println(cookies);
					userName = cookie.getValue();
				//out.println(userName);
				 if (cookie.getName().equals("JSESSIONID"))
					sessionID = cookie.getValue(); 
				// out.println(sessionID);
			}
		} else {
			sessionID = session.getId();
		} 
	%>
	
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<h1>
					<a href="index">welfare360</a>
				</h1>
			</div>
			<div id="menu">
				<ul>
					<li><a href="index" title="">home</a></li>


					<li><a href="logout" title="" method="POST">logout</a></li>
					

				</ul>
			</div>
			
		</div>
	</div>
	<div class="headings"
		style="padding: 0.2cm 0cm 0cm 0.2cm; color: #EDEDCC">
		<h3 align="center">
			<i>Hi <%=userNameLog %>,"don't thank us, instead contribute something" - welfare360</i>
		</h3>
		<div id="page-wrapper">

			<div id="featured" class="container">

				<div class="headings">
					<h2 align="center">post your help request</h2>

					<!-- <h3 align="center">post your help request</h3> -->
				</div>

				<form method="POST" action="requests" name=hsform class="form"
					onsubmit="return  validateRequests()">


					<table align="center">
						<tr>
							<td>
								<p class="name">
									<label for="hsname">name</label>
							</td>
							<td><input type="text" name="hsname" id="hsname"
								placeholder="your name" /></td>
							</p>
						</tr>
						<tr>
							<td>
								<p class="username">
									<label for="hsusername">username</label>
							</td>
							<td><input type="text" name="hsusername" id="hsusername"
								placeholder="your username" /></td>
							</p>
						</tr>


						<tr>
							<td>
								<p class="location">
									<label for="address">location</label>
							</td>
							<td><input type=text name="address" id="address"
								placeholder="city" /></td>
							</p>
						</tr>


						<tr>
							<td>
								<p class="mobile">
									<label for="mobile">phone</label>
							</td>
							<td><input type="number" name="mobile" id="web"
								placeholder="9876543210" /></td>
							</p>
						</tr>


						<tr>
							<td colspan="2" align="right">
								<p class="text">
									<textarea name="helprequest" id="helprequest"
										placeholder="post you request here.." /></textarea>
							</td>
							</p>
						</tr>

						<p>
							<font>
								<div id="req" style="color: red;"></div>
							</font>
						</p>
						<tr>
							<td colspan="2" align="center"><p class="submit">
									<input type="submit" value="Post" />
								</p></td>
						</tr>

					</table>
				</form>


			</div>
		</div>
	</div>
	<script type="text/javascript"> (function() {var stag = document.createElement
('script'); stag.type = "text/javascript"; stag.async = true; stag.src=
"http://webchat.answerconnect.com/livechat/script/1930007709";
var s = document.getElementsByTagName('script')[0]; 
s.parentNode.insertBefore(stag,s);})();</script>

</body>

</html>