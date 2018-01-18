<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.UserDAO.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PNR Details</title>
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
th{
	border: 1;
}
</style>
</head>
<body class="bgbook">
<%! Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;
int pnr=0;
long p_no=0;
int train_no=0;
String psngr_name=null;
String source=null;
String dest=null;
int age=0;
String berth=null;
String gender=null;
String train_class=null;
%>
<%	String pnr_no=request.getParameter("pnr_no");
	pnr=Integer.parseInt(pnr_no);
	con=UserDAO.connect();
	try {
		ps=con.prepareStatement("select * from Passenger where Pnr_no=?");
		ps.setInt(1, pnr);
		rs=ps.executeQuery();
%>
	<table align="center" border="4" cellpadding="4" cellspacing="4" bordercolor="white">
		<thead>
			<th>Pnr Number</th>
			<th>Train No</th>
			<th>Passenger Name</th>
			<th>Source</th>
			<th>Destination</th>
			<th>Gender</th>
			<th>Age</th>
			<th>Berth Preference</th>
			<th>Train Class</th>
		</thead>
<% 
		if(!rs.first())
		{
			 out.println("<script type=\"text/javascript\">");
        	 out.println("alert('No details found');");
        	 out.println("location='/Railway_Reservation_System/Pnr.jsp';");
        	 out.println("</script>");
		}
		while(rs.next())
		{
			p_no=rs.getLong(1);
			train_no=rs.getInt(2);
			psngr_name=rs.getString(3);
			source=rs.getString(4);
			dest=rs.getString(5);
			gender=rs.getString(6);
			age=rs.getInt(7);
			berth=rs.getString(8);
			train_class=rs.getString(9);
%>
		<tr>
			<td><font color="white"><%=p_no %></font></td>
			<td><font color="white"><%=train_no %></font></td>
			<td><font color="white"><%=psngr_name %></font></td>
			<td><font color="white"><%=source %></font></td>
			<td><font color="white"><%=dest %></font></td>
			<td><font color="white"><%=gender %></font></td>
			<td><font color="white"><%=age %></font></td>
			<td><font color="white"><%=berth %></font></td>
			<td><font color="white"><%=train_class %></font></td>
		</tr>	
<%
		}
	 
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>
	</table>
	<form action="Pnr.jsp">
		<table align="center">
			<tr>
				<td>
					<input type="submit" value="Back" class="btn_submit">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>