<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.UserDAO.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%! String user_id=null;
String user=null;
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;
int flag=0;
%>
<%	user_id=request.getParameter("user_id");
	con=UserDAO.connect();
	ps=con.prepareStatement("select User_id from user_login where User_id=?");
	ps.setString(1, user_id);
	rs=ps.executeQuery();
	System.out.print(user_id);
	while(rs.next())
	{
		user=rs.getString("user_id");
		if(user_id.equals(user))
		{
			flag=1;
			break;
		}
		else
		{
			flag=0;
		}
	}
	if(flag==1)
	{
		out.println("<div style='color:red'>");
		out.println("User ID not available");
		out.println("</div>");
	}
	else
	{
		out.println("<div style='color:green'>");
		out.println("User ID is available");
		out.println("</div>");
	}
%>
</body>
</html>