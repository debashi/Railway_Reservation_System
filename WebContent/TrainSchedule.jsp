<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Train Schedule</title>
<link rel="stylesheet" href="Stylesheet.css">
<script type="text/javascript">
	function validator(){
		var train_class=document.train_schedule.train_class.value;
		if(train_class == "--Select--"){
			alert("Choose Your Train Class");
			return false;
		}
		return true;
	}
</script>
<style type="text/css">
.bgs {
    background-image: url("imgs/r66.jpg"); 
	background-repeat: repeat-x repeat-y;
    background-size: cover;
}
</style>
</head>
<body class="bgs">
<div style="text-align: left;">
<img src="imgs/icon.png" height="50" width="50"><b><font color="navy" size="10">GLOBSYN RAILWAY RESERVATION</font></b>
</div>
<nav class="topnav">
<%!String user_id=null; %>
<%	HttpSession session2=request.getSession(false);
	user_id=(String) session2.getAttribute("user_id");
	if(user_id == null)
	{
%>	
		<a href='Welcome.html'>Home</a>	
		<a href='Pnr.jsp'>PNR Enquiry</a>
		<a class="active" href='TrainSchedule.jsp'>Search Trains</a>
		<a href='Alert.html'>Alerts and Updates</a>
		<a href='Rules.html'>Rules and Policies</a>
		<a href='Contact_us.html'>Contact us</a>
		<a href='About_us.html'>About us</a>
		<a href='Feedback.jsp'>Feedback</a>
  <%	
	}
  	else
  	{
  %>
	  	<a href='Pnr.jsp'>PNR Enquiry</a>
	  	<a class="active" href='TrainSchedule.jsp'>Search Trains</a>
		<a href='Alert.html'>Alerts and Updates</a>
		<a href='Rules.html'>Rules and Policies</a>
		<a href='Contact_us.html'>Contact us</a>
		<a href='About_us.html'>About us</a>
		<!--  <a href='Feedback.html'>Feedback</a>-->
  	  	<a href='UpdateProfile.html'>Update Profile</a>
	  	<a href='ChangePassword.html'>Change Password</a>
	  	<a href='Logout.jsp'>Logout</a>
<%	} %>
</nav>
<form name="train_schedule" action="TrainSearch.jsp" onsubmit="myfunction();">
<table border="4" align="center" style="border-color: black; margin-top: 10px; font-size: 30px" class="tbl">
	<tr>
		<td colspan="2" bgcolor="blue" class="td">
			<font color="white">TRAIN SCHEDULE</font>
		</td>
	</tr>
	<tr> 
		<td colspan="2" style="color: white">
			Source
		</td>
	</tr>
	<tr>
		<td align="left" colspan="2" style="color: white">
				<select name="source" required="required">
					<option value="--Select--">--Select--</option>
					<option>HOWRAH</option>
					<option>MALDA</option>
					<option>ALLAHABAD</option>
					<option>VARANASI</option>
					<option>MUMBAI</option>
					<option>PATNA</option>
					<option>MUZAFFARPUR</option>
					<option>SULTANPUR</option>
				</select>
		</td>
	<tr>
		<td colspan="2" style="color: white">
			Destination
		</td>
	</tr>
	<tr>
		<td colspan="2" align="left" class="td">
			<select name="destination" required="required">
					<option value="--Select--">--Select--</option>
					<option>AMRITSAR</option>
					<option>BHIWANI</option>
					<option>FAIZABAD</option>
					<option>JAMMUTAWI</option>
					<option>LUCKNOW</option>
					<option>NEW DELHI</option>
					<option>PATNA</option>
				</select>
		</td>
	<tr>
		<td colspan="2" style="color: white">
			Journey Date
		</td>
	</tr>
	<tr>
		<td align="left" colspan="2" class="td">
			<input type="date" name="journey_date" required="required">
		</td>
	</tr>
	<tr>
		<td colspan="2" style="color: white">
			Choose Class
		</td>
	</tr>
	<tr>
		<td colspan="2" align="left" style="color: white">
			<select name="train_class" required="required">
				<option value="--Select--">--Select--</option>
				<option>General</option>
				<option>I Class</option>
				<option>II Class</option>
				<option>II Sitting</option>
				<option>II Sleeper</option>
				<option>III Tier AC</option>
				<option>II Tire AC</option>
				<option>I AC</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="color: white">
			<input type="submit" value="Find" class="btn_submit" onclick="return validator();">
		</td>
	</tr>
</table>
</form>
</body>
</html>