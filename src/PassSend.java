

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PassSend
 */
@WebServlet("/PassSend")
public class PassSend extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String host;
    private String port;
    private String user;
    private String pass;
    Connection con;     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PassSend() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() 
    {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();	 
        String user_id=request.getParameter("user_id");
        String email=request.getParameter("email");
        String security_ques=request.getParameter("security_question");
        String security_ans=request.getParameter("security_ans");
        Properties properties = System.getProperties();
        properties.put("mail.smtp.host", host);
        properties.put( "mail.smtp.host","smtp.gmail.com");
        properties.put( "mail.smtp.socketFactory.port","465");
        properties.put( "mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        //properties.put( "mail.smtp.auth","true");
        properties.put("mail.smtp.auth", true);
        properties.put("mail.smtp.starttls.enable", true);
        Session session = Session.getDefaultInstance(properties,
                new Authenticator(){
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(
                                user, pass);
                    }
                });
 
       try
       {
    	    Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Railway_Reservation_System","root","");
            PreparedStatement ps=con.prepareStatement("select User_Login.Password,User_Profile.Email from User_Profile inner join User_Login on"
            		+ " User_Profile.User_Id=User_Login.User_Id where User_Login.User_Id=? and User_Profile.Email=? and"
            		+ " User_Login.Security_Question=? and User_Login.Security_Answer=?");
            ps.setString(1, user_id);
            ps.setString(2, email);
            ps.setString(3, security_ques);
            ps.setString(4, security_ans);
            ResultSet rs=ps.executeQuery();
         
            if(rs.next())
            {
                 Message message = new MimeMessage(session);
                 message.setFrom(new InternetAddress(user));
                 message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(rs.getString("Email")));
                 message.setSubject("Your Password");
                 message.setContent("Password: "+rs.getString("Password")+"<br>You need to Change your Password after logging to your Account","text/html");
                 Transport transport = session.getTransport("smtp");
                 // sends the e-mail
                 transport.connect(host,user, pass);
                 Transport.send(message);
            	 out.println("<script type=\"text/javascript\">");
            	 out.println("alert('Your Password has been sent to Your Mail Id');");
            	 out.println("location='/Railway_Reservation_System/ForgotPassword.html';");
            	 out.println("</script>");
            }
            else 
            {
            	out.println("<script type=\"text/javascript\">");
           	 	out.println("alert('Account Informaion does not Match');");
           	 	out.println("location='/Railway_Reservation_System/ForgotPassword.html';");
           	 	out.println("</script>");
			}
    
        }catch (Exception e) {
            e.printStackTrace();
        }
	}
}
