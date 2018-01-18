<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="Stylesheet.css"> -->
<style>
.bgs {
    background-image: url("imgs/r66.jpg"); 
	background-repeat: repeat-x repeat-y;
    background-size: cover;
}
th{
	color: navy;
	border-collapse: collapse;
	border-color: black; 
}
.table{
	border-color: black;
	margin-top: 20px;
	font: small;	
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
    background-color: #4CAF50;
    color: white;
}
</style>
<script type="text/javascript">
function disable(){
	alert("You need to login first");
	return false;
}
</script>
</head>
<body class="bgs">
<div style="text-align: left;">
<img src="imgs/icon.png" height="50" width="50"><b><font color="navy" size="10">GLOBSYN RAILWAY RESERVATION</font></b>
</div>
<nav class="topnav">
  <a href='Welcome.html'>Home</a>
  <a href='TrainSchedule.jsp'>Search Trains</a>
  <a href='Pnr.html'>PNR Enquiry</a>
  <a href='UpdateProfile.html'>Update Profile</a>
  <a href='ChangePassword.html' style="margin-left: 6.8in">Change Password</a>
  <a href='Logout.jsp'>Logout</a>
</nav>

<%! Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;
String src_stn=null;
String dest_stn=null;
String train_class=null;
int train_no=0;
String train_name=null;
String op_basis=null;
int distance=0;
String arrival_time=null;
String depart_time=null;
int adult_fare=0;
int child_fare=0;
int sr_citizen_fare=0;
%>
<% src_stn=request.getParameter("source");
dest_stn=request.getParameter("destination");
train_class=request.getParameter("train_class");
%>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/railway_reservation_system","root","");
	ps=con.prepareStatement("select trains.*,timings.Distance, timings.Arrival_Time, timings.Departure_Time, fares.Class, fares.Adult, fares.Child, fares.Senior_Citizen from trains inner join timings on trains.Train_No=timings.Train_No inner join fares on timings.Train_No=fares.Train_No where trains.Source=? and trains.Destination=? and fares.Class=?");
	ps.setString(1, src_stn);
	ps.setString(2, dest_stn);
	ps.setString(3, train_class);
	rs=ps.executeQuery();
%>
	<table class="table" border="5" align="center" style="color: navy; margin-top: 10px; border-color:black;">
	<thead>
		<th>Train No</th>
		<th>Train Name</th>
		<th>Source</th>
		<th>Destination</th>
		<th>Days Run</th>
		<th>Distance</th>
		<th>Arrival Time</th>
		<th>Departure Time</th>
		<th>Class</th>
		<th>Adult<br>Fare</th>
		<th>Child<br>Fare</th>
		<th>Senior Citizen<br>Fare</th>
	</thead>
	<%
	while(rs.next())
	{
		train_no=rs.getInt(1);
		train_name=rs.getString(2);
		src_stn=rs.getString(3);
		dest_stn=rs.getString(4);
		op_basis=rs.getString(5);
		distance=rs.getInt(6);
		arrival_time=rs.getString(7);
		depart_time=rs.getString(8);
		train_class=rs.getString(9);
		adult_fare=rs.getInt(10);
		child_fare=rs.getInt(11);
		sr_citizen_fare=rs.getInt(12);
	%>
		<tr>
			<td bgcolor="white"><%=train_no %></td>
			<td bgcolor="white"><%=train_name %></td>
			<td bgcolor="white"><%=src_stn %></td>
			<td bgcolor="white"><%=dest_stn %></td>
			<td bgcolor="white"><%=op_basis %></td>
			<td bgcolor="white"><%=distance %></td>
			<td bgcolor="white"><%=arrival_time %></td>
			<td bgcolor="white"><%=depart_time %></td>
			<td bgcolor="white"><%=train_class %></td>
			<td bgcolor="white"><%=adult_fare %></td>
			<td bgcolor="white"><%=child_fare %></td>
			<td bgcolor="white"><%=sr_citizen_fare %></td>
			
	<% 		HttpSession session2=request.getSession(false);
			String user_id=(String) session2.getAttribute("user_id");
			if(user_id != null)
			{
	%>
		  		<td bgcolor="white"  rowspan="2"><button name="check_availabilty">Check<br>Availability</button><br>
		  		&nbsp&nbsp&nbsp&nbsp&nbsp<font color="red"><a href='Booking.jsp'>Book</a></font></td>
	<%
				session2.setAttribute("train_no", train_no);
				session2.setAttribute("train_name", train_name);
				session2.setAttribute("train_source", src_stn);
				session2.setAttribute("train_destination", dest_stn);
				session2.setAttribute("train_class", train_class);
			}
			else
			{
	%>
			<!--  <td bgcolor="white" rowspan="2"><button name="check_availabilty">Check<br>Availability</button><br>-->
		 	&nbsp&nbsp&nbsp&nbsp&nbsp<font color="red"><a href='Booking.jsp' onclick="return disable();">Book</a></font></td>
		</tr>
	</table> 
	<% 		
		}
	}
}catch(Exception e)
{
	e.printStackTrace();
}

%>

</body>
</html>