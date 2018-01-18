<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.omg.CORBA.NO_IMPLEMENT"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.UserDAO.*,java.sql.*,java.util.Random"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="Stylesheet.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Passenger Details</title>
<script type="text/javascript">
	function validator(){
		var gender=document.booktrain.gender.value;
		var berth=document.booktrain.berth_choice.value;
		var child_gender=document.booktrain.child_gender.value;
		if(gender == "--Select--"){
			alert("Choose Adult's Gender");
			return false;
		}
		if(berth == "--Select--"){
			alert("Choose preferred berth position");
			return false;
		}
		if(child_gender == "--Select--"){
			alert("Choose Child's gender");
			return false;
		}
		return true;
	}
</script>
<style type="text/css">
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
<%!Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;%>
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
<%!int i;
String str="t";
int fare=0;
String adults=null;
String children=null;
String sr_citizen=null;
%>
<%con=UserDAO.connect();%>
<form name="booktrain" action="FinalBook.jsp">
<table>
<% 	adults=request.getParameter("adult_no");
	children=request.getParameter("child_no");
	sr_citizen=request.getParameter("sr_citizen_no");
	int no_of_adults=Integer.parseInt(adults);
	
	int no_of_children=Integer.parseInt(children);
	int no_of_sr_citizen=Integer.parseInt(sr_citizen);
	HttpSession session2=request.getSession(false);
	String tr_no=(String) session2.getAttribute("train_no").toString();
	int train_no=Integer.parseInt(tr_no);
	String train_class=(String) session2.getAttribute("train_class");
	session2.setAttribute("adult_no", no_of_adults);
	session2.setAttribute("child_no", no_of_children);
	session2.setAttribute("sr_citizen_no", no_of_sr_citizen);
	UserDAO user=new UserDAO();
	int adults_fare=user.adultsFare(train_no, no_of_adults, train_class);
	int child_fare=user.ChildFare(train_no, no_of_children, train_class);
	int sr_citizen__fare=user.Sr_Citizen_Fare(train_no, no_of_sr_citizen, train_class);
	long pnr = (long)(new Random()).nextInt(90000000) + 1000000000;
	session2.setAttribute("pnr", pnr);
	fare=adults_fare+child_fare+sr_citizen__fare;
	session2.setAttribute("fare", fare);
	for(i=1;i<=no_of_adults;i++)
	{
%>
		<tr>
			<td style="color: white">
				Adult <%=i %>
			</td>
			<td>
				<input type="text" name="<%=str+i %>" placeholder="Name" required="required">
			</td>
		</tr>
		<tr>
			<td style="color: white">
				Gender
			</td>
			<td>
				<select name="<%=str+i+1 %>" required="required">
					<option value="--Select--">--Select--</option>
					<option>Male</option>
					<option>Female</option>
				</select>
			</td>
		</tr>
		<tr>
			<td style="color: white">
				Age
			</td>
			<td>
				<input type="text" name="<%=str+i+2 %>" placeholder="Age" required="required">
			</td>
		</tr>
		<tr>
			<td style="color: white">
				Berth Preference
			</td>
			<td>
				<select name="<%=str+i+3 %>" required="required">
					<option value="--Select--">--Select--</option>
					<option>lower</option>
					<option>middle</option>
					<option>upper</option>
					<option>side lower</option>
					<option>side upper</option>
				</select>
			</td>
		</tr>
<%		
	}
	for(i=1;i<=no_of_children;i++)
	{
%>
		<tr>
			<td style="color: white">
				Child <%=i %>
			</td>
			<td>
				<input type="text" name="child_name" placeholder="Name" required="required">
			</td>
		</tr>
		<tr>
			<td style="color: white">
				Gender
			</td>
			<td>
				<select name="child_gender" required="required">
					<option value="--Select--">--Select--</option>
					<option>Male</option>
					<option>Female</option>
				</select>
			</td>
		</tr>
		<tr>
			<td style="color: white">
				Age
			</td>
			<td>
				<input type="text" name="child_age" placeholder="Age" required="required">
			</td>
		</tr>
		<tr>
			<td style="color: white">
				Berth Choice
			</td>
			<td>
				<select name="child_berth_choice" required="required">
					<option value="--Select--">--Select--</option>
					<option>lower</option>
					<option>middle</option>
					<option>upper</option>
					<option>side lower</option>
					<option>side upper</option>
				</select>
			</td>
		</tr>
<%		
	}
	for(i=1;i<=no_of_sr_citizen;i++)
	{
%>
		<tr>
			<td style="color: white">
				Senior Citizen <%=i %>
			</td>
			<td>
				<input type="text" name="sr_citizen_name" placeholder="Name" required="required">
			</td>
		</tr>
		<tr>
			<td style="color: white">
				Gender
			</td>
			<td>
				<select name="snr_citizen_gender" required="required">
					<option value="--Select--">--Select--</option>
					<option>Male</option>
					<option>Female</option>
				</select>
			</td>
		</tr>
		<tr>
			<td style="color: white">
				Age
			</td>
			<td>
				<input type="text" name="sr_citizen_age" placeholder="Age" required="required">
			</td>
		</tr>
		<tr>
			<td style="color: white">
				Berth Choice
			</td>
			<td>
				<select name="sr_citizen_berth_choice" required="required">
					<option value="--Select--">--Select--</option>
					<option>lower</option>
					<option>middle</option>
					<option>upper</option>
					<option>side lower</option>
					<option>side upper</option>
				</select>
			</td>
		</tr>
<%		
	}
%>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" name="book" value="Book" onclick="return validator();" class="btn_submit">
			</td>
		</tr>
</table>
</form>
</body>
</html>