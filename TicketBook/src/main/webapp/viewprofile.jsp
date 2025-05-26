<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
body{
background-color:#BAF3E0;


}
input.button {
width:100px;

right:20px;
bottom:20px;
background:#09C;
color:#fff;
font-family: Tahoma, Geneva, sans-serif;
height:30px;
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
border-radius: 5px;
border: 1p solid #999;
}
input.button:hover {
background:#fff;
color:#09C;
}
</style>
</head>
<body>
<header align="right"><a href="index.html"><input  class="button" type="submit" value="Home"></a>
<a href="contact.html"><input class="button" type="submit" value="Contact"></a></header>

<%
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bus","root","root");
	PreparedStatement stat=con.prepareStatement("select *from user where uid=? and pwd=?");
	stat.setString(1,request.getParameter("d1"));
	stat.setString(2,request.getParameter("d2"));
	ResultSet rs=stat.executeQuery();
	out.println("<table border='2' padding='10' hight='400' width='800'>");
	out.println("<tr><td>First_Name</td><td>Last_Name</td><td>Mail</td><td>USerID</td><td>Password</td><td>Phone</td><td></td></tr>");
	while(rs.next())
	{
		%>
		<tr><td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><%=rs.getString(6)%></td>
		<% 
	}
	out.println("</table>");
	rs.close();
	con.close();
	}
	catch(Exception e)
{
		out.println(e);
}
%>

</body>
</html>