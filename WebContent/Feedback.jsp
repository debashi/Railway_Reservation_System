<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Feedback</title>
<link rel="stylesheet" href="Stylesheet.css">
<style>
body, html {
    height: 100%;
    margin: 0;
}

.bg {
    background-image: url("imgs/r6.jpg");
	height: 100%; 
    background-repeat: repeat-x repeat-y;
    background-size: cover;
    background-position: center;
}
td{
	color: white;
}
</style>
</head>
<body class="bg">
<div align="left">
<img src="imgs/icon.png" height="50" width="50"><b><font color="#DC143C" size="10">GLOBSYN RAILWAY RESERVATION</font></b>
</div>
<nav class="topnav">
<%!String user_id=null; %>
<% 	 HttpSession session2=request.getSession(false);
	 user_id=(String) session2.getAttribute("user_id");
	 if(user_id == null)
	 {
%>		 	
		<a href='Welcome.html'>Home</a>
<%	 }
%>	 
	<a href='Pnr.jsp'>PNR Enquiry</a>
	<a href='TrainSchedule.jsp'>Search Trains</a>
 <% 
 if(user_id != null)
 {
%>
	<a href='Alert.html'>Alerts and Updates</a>
	<a href='Rules.html'>Rules and Policies</a>
	<a href='Contact.html'>Contact us</a>
	<a class="active" href='Feedback.jsp'>Feedback</a>
	<a href='UpdateProfile.html'>Update Profile</a>
  	<a href='ChangePassword.html'>Change Password</a>
  	<a href='Logout.jsp'>Logout</a>
<% }
 else
 {
%>
	<a href='Alert.html'>Alerts and Updates</a>
	<a href='Rules.html'>Rules and Policies</a>
	<a href='Contact.html'>Contact us</a>
	<a href='Feedback.jsp'>Feedback</a>
<%	
 }
 %>
</nav>
<form style="size: 250" action="Feedback.jsp">
<table align="right" style="margin-top:100px; margin-right: 10px; border-color: teal" border="1">
	<thead align="center">
		<th colspan="2">
			<font color="navy">Feedback Form</font>
		</th>
	</thead>
	<tr>
	<td>User ID</td>
	<td><input type="text" name="user_id"></td>
	</tr>
	<tr>
	<td> Name</td>
	<td><input type="text" name="name"></td>
	</tr>
	<tr>
	<td>Mobile No</td>
	<td><input type="text" name="mobile_no"></td>
	</tr>
	<tr>
	<td>Email</td>
	<td><input type="text" name="email"></td>
	</tr>
	<tr>
	<td>City</td>
	<td><input type="text" name="city"></td>
	</tr>
	<tr>
	<td>Pin Code</td>
	<td><input type="text" name="pin_code"></td>
	</tr>
	<tr>
	<td colspan="2">Are you satisfied by our service</td>
	</tr>
	<tr>
	<td align="center"><input type="radio" name="Satisfied">Yes</td>
	<td align="center"><input type="radio" name="Satisfied">No</td>
	</tr>
		<tr align="center">
			<td colspan="2">
				<input type="submit" value="Send" class="btn_submit">
			</td>
		</tr>
</table>
</form>
</body>  
</html>