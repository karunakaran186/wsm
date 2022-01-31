<%@ page language="java" import="java.sql.*" %>
<html>
<body>
<%
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

}catch(ClassNotFoundException ex){}
try
{	
	int ii=0;
	String x=request.getParameter("T1");
	String y=request.getParameter("T2");
	Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:espace","sa","");
	Statement s=cc.createStatement();
	
	ResultSet rs=s.executeQuery("select * from server1");
	out.println("<table border='1'>");
	out.println("<th>servercode </th>");
	out.println("<th> new </th>");
	while(rs.next())
	{    
               String s1=rs.getString("servercode");
               String s2=rs.getString("new");
		if(s1.equals(x))
		   {   ii=1;}
		
	}
	if(ii==0)
	{			
	String sq=("insert into server1(servercode,new)values(?,?)");
	PreparedStatement p=cc.prepareStatement(sq);
	p.setString(1,x);
	p.setString(2,y);
	int i=p.executeUpdate();
	}
	if(ii==1)
	{
		out.println("cannot insert"+x);
	}
	ResultSet rs1=s.executeQuery("select * from server1");
	while(rs1.next())
	{    
               
	       String s1=rs1.getString("servercode");
               String s2=rs1.getString("new");
		out.println("<tr>");
		out.println("<td>"+s1+"</td>");
		out.println("<td>"+s2+"</td>");
		out.println("</tr>");
	}
}
catch(SQLException ee){}
%>
</table>
</body>
</html>
