package com.UserDAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO
{
	static Connection con=null; 
	PreparedStatement ps=null;
	ResultSet rs=null;
	public static Connection connect()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Railway_Reservation_System","root","");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
		e.printStackTrace();
		}
		return con;
	}
	public int addUser(String user_id,String first_name,String last_name,long phone,String email,String dob,String gender,String address,int pin_code,String nationalty,String maritial_status)
	{
		int j=0;
		con=connect();
		try {
			ps=con.prepareStatement("insert into User_Profile values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, user_id);
			ps.setString(2, first_name);
			ps.setString(3, last_name);
			ps.setLong(4, phone);
			ps.setString(5, email);
			ps.setString(6, dob);
			ps.setString(7, gender);
			ps.setString(8, address);
			ps.setInt(9, pin_code);
			ps.setString(10, nationalty);
			ps.setString(11, maritial_status);
			j=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return j;
	}
	public int addUserLoginDetails(String user_id,String password,String security_ques,String security_ans)
	{
		int i=0;
		con=connect();
		try {
			ps=con.prepareStatement("insert into User_Login values(?,?,?,?)");
			ps.setString(1, user_id);
			ps.setString(2, password);
			ps.setString(3, security_ques);
			ps.setString(4, security_ans);
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	public boolean doLogin(String user_id,String password)
	{
		int flag=0;
		con=connect();
		try {
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
				return true;
			}
			else
			{
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
	public boolean updateProfile(String user_id,long phone,String email,String address,int pin_code,String nationality,String maritial_status)
	{
		int j=0;
		con=connect();
		try {
			ps=con.prepareStatement("update User_profile set Contact_Number=?,Email=?,Address=?,Pin_code=?,Nationality=?,Maritial_Status=? where User_Id=?");
			ps.setLong(1, phone);
			ps.setString(2, email);
			ps.setString(3, address);
			ps.setInt(4, pin_code);
			ps.setString(5, nationality);
			ps.setString(6, maritial_status);
			ps.setString(7, user_id);
			j=ps.executeUpdate();
			if(j==1)
			{
				return true;
			}
			else
			{
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
	public boolean changePassword(String user_id,String old_pass,String new_pass,String security_ques,String security_ans) 
	{
		int i=0;
		con=connect();
		try {
			ps=con.prepareStatement("update User_Login set Password=?,Security_Question=?,Security_Answer=? where User_Id=? and Password=?");
			ps.setString(1, new_pass);
			ps.setString(2, security_ques);
			ps.setString(3, security_ans);
			ps.setString(4, user_id);
			ps.setString(5, old_pass);
			i=ps.executeUpdate();
			if(i==1)
			{
				return true;
			}
			else
			{
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
	public int adultsFare(int train_no,int no_of_adults,String train_class) {
		int fare=0;
		int adults=0;
		con=connect();
		try {
			ps=con.prepareStatement("select Adult from Fares where Train_no=? and Class=?");
			ps.setInt(1, train_no);
			ps.setString(2, train_class);
			rs=ps.executeQuery();
			while(rs.next())
			{
				 adults=rs.getInt("Adult");
			}
			fare=adults*no_of_adults;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fare;
	}
	public int ChildFare(int train_no,int no_of_child,String train_class) {
		int fare=0;
		int child=0;
		con=connect();
		try {
			ps=con.prepareStatement("select Child from Fares where Train_no=? and Class=?");
			ps.setInt(1, train_no);
			ps.setString(2, train_class);
			rs=ps.executeQuery();
			while(rs.next())
			{
				 child=rs.getInt("Child");
			}
			fare=child*no_of_child;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fare;
	}
	public int Sr_Citizen_Fare(int train_no,int no_of_sr_citizen,String train_class) {
		int fare=0;
		int sr_citizen=0;
		con=connect();
		try {
			ps=con.prepareStatement("select Senior_Citizen from Fares where Train_no=? and Class=?");
			ps.setInt(1, train_no);
			ps.setString(2, train_class);
			rs=ps.executeQuery();
			while(rs.next())
			{
				 sr_citizen=rs.getInt("Senior_Citizen");
			}
			fare=sr_citizen*no_of_sr_citizen;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fare;
	}
	public int addReservation(long pnr,int train_no,int no_of_adults,int no_of_child,int no_of_sr_citizen,int fare,String source,
			String destination,String berth_preference,String train_class)
	{
		int i=0;
		con=connect();
		try {
			ps=con.prepareStatement("insert into Reservation values(?,?,?,?,?,?,?,?,?,?)");
			ps.setLong(1, pnr);
			ps.setInt(2, train_no);
			ps.setInt(3, no_of_adults);
			ps.setInt(4, no_of_child);
			ps.setInt(5, no_of_sr_citizen);
			ps.setInt(6, fare);
			ps.setString(7, source);
			ps.setString(8, destination);
			ps.setString(9, berth_preference);
			ps.setString(10, train_class);
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	public int addPassengerDetails(long pnr,int train_no,String psngr_name,
			String source,String destination,String gender,int age,String berth,String train_class)
	{
		int i=0;
		con=connect();
		try {
			ps=con.prepareStatement("insert into Passenger values(?,?,?,?,?,?,?,?,?)");
			ps.setLong(1, pnr);
			ps.setInt(2, train_no);
			ps.setString(3, psngr_name);
			ps.setString(4, source);
			ps.setString(5, destination);
			ps.setString(6, gender);
			ps.setInt(7, age);
			ps.setString(8, berth);
			ps.setString(9, train_class);
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
}
