<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.UserDAO.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="Stylesheet.css">
</head>
<body>
<%! Connection con=null;
String user_id=null;
String password=null;
PreparedStatement ps=null;
ResultSet rs=null;
int flag=0;
%>
<%try {
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Railway_Reservation_System","root","");
} catch (Exception e) {
	// TODO Auto-generated catch block
e.printStackTrace();
} %>
<% user_id=request.getParameter("user_id");
password=request.getParameter("password");
//UserDAO user=new UserDAO();
//boolean b=user.doLogin(user_id, password);
HttpSession session2=request.getSession();
session2.setAttribute("user_id", user_id);
%>
<%try {
	ps=con.prepareStatement("select User_Id,Password from User_Login");
	rs=ps.executeQuery();
	
	while(rs.next())
	{
		String user=rs.getString(1);
		String pass=rs.getString(2);
		if(user_id.equals(user) && password.equals(pass))
		{
			flag=1;
			break;
		}
		else {
			flag=0;
		}
	}
	if(flag==1)
	{
		response.sendRedirect("TrainSchedule.jsp");	
	}
	else
	{
%>
		<center><h1><font style="font-weight: bold;" color="black">Wrong Credentials</font></h1><br>
		<form action="Welcome.html">
		<input type="submit" value="Login" class="btn_submit">
		</form>
		</center>
<%
	}
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>
</body>
</html>