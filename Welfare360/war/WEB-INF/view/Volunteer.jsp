<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List" %>
<%@ page import="com.welfare.project.HelpRequests" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>welfare360-Volunteer</title>

<link href="../css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="../css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="../css/login.css" rel="stylesheet" type="text/css" media="all" />
<link href="../css/css-table.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="index">welfare360</a></h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="index"  title="">home</a></li>
				
				<li><a href="#"  title="">logout</a></li>
				
			</ul>
		</div>
	</div>
</div>

<div id="page-wrapper">

	<div id="featured" class="container" >

	<div class="headings"><h2>Help the victim</h2></div>
	
	<table id="table">

	<caption></caption>
    
    <thead>    
    	<tr>
           
            <th scope="col" colspan="6">List of Requests</th>
        </tr>
        
        <tr>
            <th scope="col">Help Seeker</th>
            <th scope="col">Request</th>
            <th scope="col">Mobile</th>
            <th scope="col">Address</th>
           
        </tr>        
    </thead>
   	<%
			
		if(request.getAttribute("requestsList")!=null){
				
			List<HelpRequests> reqListObj = 
                           (List<HelpRequests>)request.getAttribute("requestsList");
				
			if(!reqListObj.isEmpty()){
				 for(HelpRequests helpReqObj : reqListObj){
						// out.println("check list");
		%>
				<tr>
				  <td><%=helpReqObj.getHSName() %></td>
				  <td><%=helpReqObj.getHelpRequest() %></td>
				  <td><%=helpReqObj.getMobile() %></td>
				  <td><%=helpReqObj.getAddress() %></td>
				  
				</tr>
		<%	
			
				}
		    
			}
			
		   }
		%>
         
        </tr>
     
	</table> 
	
	
<%-- 	<table border="1" class="table">
		<thead>
			<tr>
				<td align="center"><b>Help Seeker</b></td>
				<td align="center"><b>Request</b></td>
				<td align="center"><b>Mobile</b></td>
				<td align="center"><b>Address</b></td>
				
			</tr>
		</thead>
		
		<%
			
		if(request.getAttribute("requestsList")!=null){
				
			List<HelpRequests> reqListObj = 
                           (List<HelpRequests>)request.getAttribute("requestsList");
				
			if(!reqListObj.isEmpty()){
				 for(HelpRequests helpReqObj : reqListObj){
						// out.println("check list");
		%>
				<tr>
				  <td><%=helpReqObj.getHSName() %></td>
				  <td><%=helpReqObj.getHelpRequest() %></td>
				  <td><%=helpReqObj.getMobile() %></td>
				  <td><%=helpReqObj.getAddress() %></td>
				  
				</tr>
		<%	
			
				}
		    
			}
			
		   }
		%>
         
        </tr>
     
	</table> --%>
	</div>
	</div>
	<script type="text/javascript"> (function() {var stag = document.createElement
('script'); stag.type = "text/javascript"; stag.async = true; stag.src=
"http://webchat.answerconnect.com/livechat/script/1930007709";
var s = document.getElementsByTagName('script')[0]; 
s.parentNode.insertBefore(stag,s);})();</script>

</body>

</html>