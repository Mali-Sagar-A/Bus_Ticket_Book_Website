<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body{
background-color:#BAF3E0;


}
</style>
</head>
<body>
<header align="right"><a href="index.html"><input type="submit" value="Home"></a>
<a href="AdminPage.html"><input type="submit" value="Admin"></a></header>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bus","root","root");
	Statement stat=con.createStatement();
	ResultSet rs=stat.executeQuery("select * from busrec");
out.println("<table border='4' padding='15' hight='400' width='800'>");
out.println("<tr><td>busid</td><td>from</td><td>to</td><td>deprature</td><td>arival</td><td>date</td><td>busType</td><td>Price</td><td>Update</td></tr>");
while(rs.next())
{
	%>
	<tr><td><%=rs.getInt(1) %></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(4)%></td>
	<td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td>
	<td><%=rs.getString(7)%></td>
	<td><%=rs.getString(8)%></td>
	<td><a href="updateshedule1.jsp?busid=<%=rs.getInt("busid")%>" class="btn-btn-denger">Update</a></td>
	</tr>
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