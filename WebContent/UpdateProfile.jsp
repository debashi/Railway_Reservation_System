<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="com.UserDAO.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="Stylesheet.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! Connection con=null; 
String user_id=null;
String email=null;
String mobile=null;
String address=null;
String pin=null;
String nationality=null;
String maritial_status=null;
%>
<%
	HttpSession session2=request.getSession(false);
	Object obj=session2.getAttribute("user_id");
	user_id=obj.toString();
	email=request.getParameter("email");
	mobile=request.getParameter("contact_no");
	long mob=Long.parseLong(mobile);
	address=request.getParameter("address");
	pin=request.getParameter("pin");
	int pin_code=Integer.parseInt(pin);
	nationality=request.getParameter("nationality");
	maritial_status=request.getParameter("maritial_status");
	con=UserDAO.connect();
	UserDAO user=new UserDAO();
	boolean b=user.updateProfile(user_id, mob, email, address, pin_code, nationality, maritial_status);
	if(b)
	{%>
		<center><h1><font style="font-weight: bold;" color="black">Profile Updated Successfully</font></h1><br>
	<form action="UpdateProfile.jsp">
	<input type="submit" value="Back" class="btn_submit">
	</form>
	</center>
	<% }
%>

</body>
</html>