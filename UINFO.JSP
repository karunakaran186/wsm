<%@ page language="java" import="java.sql.*"%>
<html>
<body>

<%

try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch(ClassNotFoundException ex){}
try
{
int ii=0;
String code=request.getParameter("T1");
String nam=request.getParameter("T2");
String com=request.getParameter("T3");
String main=request.getParameter("T4");
Connection cc=null;
cc=DriverManager.getConnection("jdbc:odbc:espace","sa","");
Statement s=cc.createStatement();
ResultSet rs=s.executeQuery("select * from info");
	while(rs.next())
	{    
               String s1=rs.getString("custcode");
               
               	if(code.equals(s1))
		   {   ii=1;}
		
	}
if(ii==0)
	{			
	String sq=("insert into info(custcode,url,comp,main) values(?,?,?,?)");
	PreparedStatement p=cc.prepareStatement(sq);
	p.setInt(1,Integer.parseInt(code));
	p.setString(2,nam);
	p.setString(3,com);
	p.setString(4,main);
int i=p.executeUpdate();
             if(i>0)
             {
         response.sendRedirect("http://localhost:7000/examples/jsp/krishtml/paym.html");      
             } 
	}
else
	{
		
	response.sendRedirect("http://localhost:7000/examples/jsp/krishtml/info.html");  
	}


}
catch(SQLException ed){}
%>
</body></html>


