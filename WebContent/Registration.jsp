<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.UserDAO.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="Stylesheet.css">
</head>
<body>
<%! Connection con=null; 
	PreparedStatement ps=null;
	ResultSet rs=null;
	String first_name=null;
	String last_name=null;
	String email=null;
	String mobile=null;
	String date=null;
	int j=0;
	int i=0;
	String em=null;
	String user=null;
	String user_id=null;
	String gender=null;
	String address=null;
	String password=null;
	String security_ques=null;
	String security_ans=null;
	String pin=null;
	String nationality=null;
	String maritial_status=null;
	
	%>
	<%
	con=UserDAO.connect();
	user_id=request.getParameter("user_id");
	password=request.getParameter("password");
	security_ques=request.getParameter("security_question");
	security_ans=request.getParameter("security_ans");
	first_name=request.getParameter("first_name");
	last_name=request.getParameter("last_name");
	email=request.getParameter("email");
	HttpSession session1=request.getSession();
	session1.setAttribute("key1", email);
	mobile=request.getParameter("contact_no");
	long mob=Long.parseLong(mobile);
	date=request.getParameter("dob");
	gender=request.getParameter("gender");
	address=request.getParameter("address");
	pin=request.getParameter("pin");
	int pin_code=Integer.parseInt(pin);
	nationality=request.getParameter("nationality");
	maritial_status=request.getParameter("maritial_status");
	ps=con.prepareStatement("select user_login.User_Id,user_profile.Email from user_profile inner join user_login on user_profile.User_Id=user_login.User_Id");
	rs=ps.executeQuery();
	while(rs.next())
	{
		user=rs.getString(1);
		em=rs.getString(2);
		if(user_id.equals(user) && email.equals(em))
		{
	%>
	<center><h1><font style="font-weight: bold" color="black">Account aleady exists to an existing Email ID</font></h1><br>
	<a href='Login.jsp'>Click here to login</a>
	</center>
	<%	
		}
		else if(email.equals(em))
			
		{
	%>
	<center><h1><font style="font-weight: bold" color="black">Email already exists</font></h1><br>
	<a href='Login.jsp'>Click here to login</a>
	</center>
	<% 
		}
	} 		
	if(!rs.next())
	{
		UserDAO user=new UserDAO();
		j=user.addUser(user_id,first_name, last_name, mob, email, date, gender,address,pin_code,nationality,maritial_status);
		i=user.addUserLoginDetails(user_id, password, security_ques, security_ans);
		if(i==1 && j==1)
		{
	%>		
		<center><h1><font style="font-weight: bold;" color="black">User Successfully Created</font></h1><br>
	<form action="Login.html">
	<input type="submit" value="Login" class="btn_submit">
	</form>
	</center>
	<% }
		else if(i==1 && j==0)
		{
			ps=con.prepareStatement("delete from User_Login where User_Id=?");
			ps.setString(1, user_id);
			ps.executeUpdate();
		}
	}
	%>
</body>
</html> 