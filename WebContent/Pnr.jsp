<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>PNR Details</title>
<link rel="stylesheet" href="Stylesheet.css">
<style>
body, html {
    height: 100%;
    margin: 0;
}

.bgp {
    background-image: url("imgs/r66.jpg");
	height: 100%; 
	background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}

</style>

</head>
<body class="bgp">
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
	<a class="active" href='Pnr.jsp'>PNR Enquiry</a>
	<a href='TrainSchedule.jsp'>Search Trains</a>
 <% 
 if(user_id != null)
 {
%>
	<a href='Alert.html'>Alerts and Updates</a>
	<a href='Rules.html'>Rules and Policies</a>
	<a href='Contact.html'>Contact us</a>
	<a href='About_us.html'>About Us</a>
	<a href='Feedback.jsp'>Feedback</a>
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
	<a href='About_us.html'>About Us</a>
	<a href='Feedback.html'>Feedback</a>
<%	
 }
 %>
</nav>
<form action="PnrDetails.jsp">
<table width="320"  style="margin-top:200px; height:150px" border="1" bordercolor="white">
<tr>
<td colspan="2" bgcolor="blue"><font color="white">CHECK PNR STATUS</font></td>
</tr>
<tr>
<td style="color: white">PNR No:</td>
<td align="right"><input size="20" type="text" name="pnr_no" required="required"></td>
</tr>
<tr ><td colspan="2" align="center"><input type="submit" value="Go" class="btn_submit"></td></tr>
</table>
</form>
</body>  
</html>