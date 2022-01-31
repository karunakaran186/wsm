<%@ page language="java" import="java.sql.*"%>
<html>
<body>
<% 
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch(ClassNotFoundException ee){out.println(ee);}
try
{
int ii=0;
int b=Integer.parseInt(request.getParameter("uname"));
String c=request.getParameter("pass");
session.setAttribute("ccode",String.valueOf(b));
Connection cc=null;
cc=DriverManager.getConnection("jdbc:odbc:espace","sa","");
Statement s=cc.createStatement();
/*ResultSet rs=s.executeQuery("select * from customer");
int i;
 
while(rs.next())
{    
 	i=rs.getInt("custcode");
 	out.println(rs.getInt("custcode"));
	if( b==i )
	{   
		String pp;
		pp=rs.getString("pass");
		out.println(rs.getString("pass"));
		if(c.equals(pp))
			ii=1;break;
	}
	
}*/
PreparedStatement ps=cc.prepareStatement("select * from customer where custcode=? and pass=?");
ps.setInt(1,b);
ps.setString(2,c);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
   //out.println(b);
    response.sendRedirect("http://localhost:7000/examples/krishna/choosePath.jsp");      
}
else
{
    response.sendRedirect("http://localhost:7000/examples/krishna/failedlogin.html");      
}   
}catch(SQLException e){out.println(e);}
%>
</body>
</html>
