<%@ page language="java" import="java.sql.*"%>
<html>
<body>
<%
String a4=request.getParameter("T1");
String b4=request.getParameter("T2");
String c4=request.getParameter("T3");
String d4=request.getParameter("T4");
String e4=request.getParameter("T5");
out.println(a4);
out.println(b4);
out.println(c4);
out.println(d4);
out.println(e4);
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}catch(ClassNotFoundException ex){}
try
{
Connection cc=null;
cc=DriverManager.getConnection("jdbc:odbc:espace","sa","");
PreparedStatement pp=cc.prepareStatement("insert into renewal values(?,?,?,?,?)");
pp.setInt(1,Integer.parseInt(a4));
pp.setInt(2,Integer.parseInt(b4));
pp.setString(3,c4);
pp.setString(4,d4);
pp.setInt(5,Integer.parseInt(e4));
int ii=pp.executeUpdate();
if(ii>0)
out.println("inserted");
else
out.println("cannot inserted");
}catch(SQLException ed){}
%>
</body></html>


