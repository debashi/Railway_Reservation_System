<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Train</title>
<link rel="stylesheet" href="Stylesheet.css">
<style>

body, html {
    height: 100%;
    margin: 0;
}

.bgbook {
    background-image: url("imgs/r66.jpg");
	height: 100%; 
	background-position: center;
    background-repeat: repeat;
    background-size: cover;
}
</style>
</head>
<body class="bgbook">
<div style="text-align: left;">
<img src="imgs/icon.png" height="50" width="50"><b><font color="navy" size="10">GLOBSYN RAILWAY RESERVATION</font></b>
</div>
<nav class="topnav">
  <a href='TrainSchedule.jsp'>Search Trains</a>
  <a href='Pnr.jsp'>PNR Enquiry</a>
  <a href='Alert.html'>Alerts and Updates</a>
  <a href='Rules.html'>Rules and Policies</a>
  <a href='Contact.html'>Contact us</a>
  <a href='Feedback.jsp'>Feedback</a>
  <a href='UpdateProfile.html'>Update Profile</a>
  <a href='ChangePassword.html'>Change Password</a>
  <a href='Logout.jsp'>Logout</a>
</nav>
<%String tr_no=null;
String train_name=null;
String src_stn=null;
String dest_stn=null;%>
<form name="booking" action="BookTrain.jsp">
<table align="center">
	<tr>
		<td style="font-family: Century Schoolbook; font-size: 20px; font-variant: bold">
<%				HttpSession session2=request.getSession(false);
				tr_no=(String) session2.getAttribute("train_no").toString();
				int train_no=Integer.parseInt(tr_no);
				train_name= (String) session2.getAttribute("train_name");
				src_stn=(String) session2.getAttribute("train_source");
				dest_stn=(String) session2.getAttribute("train_destination");
				%>
				<%=train_no %>
		</td>
		<td style="font-family: Century Schoolbook; font-size: 20px; font-variant: bold; color: white">
			<%=train_name %>
		</td>
		<td style="font-family: Century Schoolbook; font-size: 20px; font-variant: bold; color: white">
			<%=src_stn %> to <%=dest_stn %>
		</td>
	</tr>
</table>
<table style="margin-top: 10px">
	<thead style="font-variant: bold; font-size: 30px; font-family: Century Schoolbook; color: white;">
		<th>Passenger Details of journey</th>
	</thead>
	<tr>
		<td style="color: white">
			Adults
		</td>
		<td style="color: white">
			Child
		</td>
		<td style="color: white">
			Senior Citizen
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="adult_no" required="required" placeholder="No of Adults">
		</td>
		<td>
			<input type="text" name="child_no" required="required" placeholder="No of Children">
		</td>
		<td>
			<input type="text" name="sr_citizen_no" required="required" placeholder="No of Senior Citizen">
		</td>
	</tr>
	<tr>
		<td colspan="3" align="center">
			<input type="submit" name="submit" value="Submit" class="btn_submit">
		</td>
	</tr>
</table>
</form>
</body>
</html>