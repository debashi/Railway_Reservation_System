<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout</title>
</head>
<body>
<%! String user_name=null; %>
<% HttpSession session2=request.getSession(false);
user_name=(String) session2.getAttribute("user_id");
user_name=null;
session2.invalidate();
response.sendRedirect("Welcome.html");
%>
</body>
</html>