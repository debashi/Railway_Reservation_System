<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="com.UserDAO.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="Stylesheet.css">
</head>
<body>
<%! Connection con=null;
String user_id=null;
String old_password=null;
String new_password=null;
String security_ques=null;
String security_ans=null;
%>
<% con=UserDAO.connect();
HttpSession session2=request.getSession(false);
Object obj=session2.getAttribute("user_id");
user_id=obj.toString();
old_password=request.getParameter("old_password");
new_password=request.getParameter("new_password");
security_ques=request.getParameter("security_question");
security_ans=request.getParameter("security_ans");
UserDAO user=new UserDAO();
boolean b=user.changePassword(user_id, old_password, new_password, security_ques, security_ans);
if(b)
{ %>
	<center><h1><font style="font-weight: bold;" color="black">Password Updated Succesfully</font></h1><br>
	<form action="ChangePassword.html">
	<input type="submit" value="Back" class="btn_submit">
	</form>
	</center>
<% }
else
{
%>
	<center><h1><font style="font-weight: bold;" color="black">Old Password does not match</font></h1><br>
	<form action="ChangePassword.html">
	<input type="submit" value="Back" class="btn_submit">
	</form>
	</center>
<% } %>
</body>
</html>