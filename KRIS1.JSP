<%@ page language="java" import="java.sql.*"%>
<html>
<body>
<%
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch(ClassNotFoundException ee){}

String a1=request.getParameter("T1");
String b1=request.getParameter("T2");
String c1=request.getParameter("R1");
String d1=request.getParameter("T3");
String e1=request.getParameter("T4");
String f1=request.getParameter("T5");
String g1=request.getParameter("D1");
String h1=request.getParameter("T6");
String i1=request.getParameter("T7");
String j1=request.getParameter("T8");

Connection cc=null;
cc=DriverManager.getConnection("jdbc:odbc:sacs");
Statement s1=cc.createStatement();
ResultSet rs=s1.executeQuery("select * from server1");
out.println("Connection Created");
String sq=("insert into server1(servercode,servername,servertype,serversize,serverlocation,company,authority,address,phoneno,mailId) values(?,?,?,?,?,?,?,?,?,?)");
PreparedStatement p=cc.prepareStatement(sq);
out.println("Connection Created");

p.setInt(1,Integer.parseInt(a1));
p.setString(2,b1);
p.setString(3,c1);
p.setString(4,d1);
p.setString(5,e1);
p.setString(6,f1);
p.setString(7,g1);
p.setString(8,h1);
p.setInt(9,Integer.parseInt(i1));
p.setString(10,j1);
int xx=p.executeUpdate();
if(xx>0)
{
out.println("inserted");
}
else
{
out.println("not inserted");
}

%>
<head>
<script language="javascript">
var td=null;

function check()
{       if(
	
        alert("error message");
        	
	
}

</script>
<body onload="check();"> 

</body>
</head>

</body></html>


