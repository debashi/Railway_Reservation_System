<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.UserDAO.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! Connection con=null; 
long pnr_no=0;
String train=null;
int no_of_adults=0;
int no_of_child=0;
int no_of_sr_citizen=0;
int fare=0;
String source=null;
String destination=null;
String berth_preference=null;
String train_class=null;
String psngr_name,gender;
int age;
String str="t";
int j=0;
int m=0;
%>
<%
HttpSession session2=request.getSession(false);
String pnr=(String) session2.getAttribute("pnr").toString();
pnr_no= Long.parseLong(pnr);
String tr_no=(String) session2.getAttribute("train_no").toString();
int train_no=Integer.parseInt(tr_no);
String adults=(String)session2.getAttribute("adult_no").toString();
no_of_adults=Integer.parseInt(adults);
String child=(String) session2.getAttribute("child_no").toString();
no_of_child=Integer.parseInt(child);
String sr_citizen=(String) session2.getAttribute("sr_citizen_no").toString();
no_of_sr_citizen=Integer.parseInt(sr_citizen);
String fare1=(String) session2.getAttribute("fare").toString();
fare=Integer.parseInt(fare1);
out.println("<script>alert('Total fare: '+fare)</script>");
source=(String) session2.getAttribute("train_source");
destination=(String) session2.getAttribute("train_destination");
train_class=(String) session2.getAttribute("train_class");
UserDAO user=new UserDAO();
for(int i=1;i<=no_of_adults;i++)
{
	psngr_name=request.getParameter(str+i);
	gender=request.getParameter(str+i+1);
	age=Integer.parseInt(request.getParameter(str+i+2));
	berth_preference=request.getParameter(str+i+3);	
	//m=user.addReservation(pnr_no, train_no, no_of_adults, no_of_child, no_of_sr_citizen, fare, source,
		//	destination, berth_preference, train_class);
	
	 j=user.addPassengerDetails(pnr_no,train_no, psngr_name,source,destination, gender, age, berth_preference,train_class);
	 //System.out.print(j);
}
if(j==1)
{
	out.println("<script>alert('Pnr Number: '+pnr_no)</script>");
	out.println("<script type=\"text/javascript\">");
 	out.println("alert('Train Booking has been succesfully done');");
 
 	out.println("location='/Railway_Reservation_System/TrainSchedule.jsp';");
 	out.println("</script>");
}
else
{
	out.println("<script type=\"text/javascript\">");
 	out.println("alert('Ticket Booking is failed');");
 	out.println("location='/Railway_Reservation_System/TrainSchedule.jsp';");
 	out.println("</script>");
}
%>
</body>
</html>