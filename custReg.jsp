<%@ page language="java" import="java.sql.*"%>
<html>
<body>
<%! int i=0;%>
<%
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch(ClassNotFoundException ee){}
try
{
int ii=0;
int a=Integer.parseInt(request.getParameter("T1"));
String b=request.getParameter("T2");
String c=request.getParameter("T3");
String d=request.getParameter("T4");
String e=request.getParameter("T5");
String f=request.getParameter("T6");
String pass=request.getParameter("T7");
Connection cc=null;
cc=DriverManager.getConnection("jdbc:odbc:espace","sa","");
Statement s=cc.createStatement();
ResultSet rs=s.executeQuery("select * from customer");
while(rs.next())
{    
 	i=rs.getInt("custcode");
	if(a==i)
	{   
	ii=1;break;
	}
}
if(ii==0)
{			
	String sq=("insert into customer values(?,?,?,?,?,?,?)");
	PreparedStatement p=cc.prepareStatement(sq);
	out.println("Connection Created");
	p.setInt(1,a);
	p.setString(2,b);
	p.setString(3,pass);
	p.setString(4,c);
	p.setString(5,d);
	p.setInt(6,Integer.parseInt(e));
	p.setString(7,f);
	int i=p.executeUpdate();
        if(i>0)
        {
 	       response.sendRedirect("http://localhost:7000/examples/krishna/login.html");      
        } 
}
if(ii==1)
{
	response.sendRedirect("http://localhost:7000/examples/krishtml/cust.html");  
}
}
catch(SQLException ee)
{}

%>

</body>
</html>


 

