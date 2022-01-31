<%@ page language="java" import="java.sql.*,java.util.Date" %>
<html>

<body bgcolor="#ffffd">
<%
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch(ClassNotFoundException ex){}
try
{
	Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:espace","sa","");
	Statement s=cc.createStatement();
	int  code=Integer.parseInt((String)session.getAttribute("ccode"));   	
	
	int ono11=Integer.parseInt((String)session.getAttribute("onno"));
	
	String jfd=(String)session.getAttribute("ggg");
	
	if(jfd.equals("10"))
	{
		out.println("your order no is " + ono11);
		out.println("<br>");
		out.println("you should specify this during payment");
		out.println("<br>");
		String amo=(String)session.getAttribute("amm");
		out.println("you have to pay the amount of" + amo);
		
	}
}
catch(SQLException ee){out.println(ee);}
%>

<form name="pay" method="post" action="http://localhost:7000/examples/krishna/pay.jsp">
<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font face="Book Antiqua" size="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<u>PAYMENT INFORMATION </u></font></h1>

<center>
<table align="center">
<tr>
<td>CUSTOM CODE</td>
<td><input type="text" name="T1" value=<%=session.getAttribute("ccode")%> size="20"></td>
</tr>
<tr>
<td>PAID</td>
<td><input type="text" name="T2" value="0" size="20"></td>
</tr>
<tr>
<td>PAY TYPE</td>
<td>
<select name="C1" size="1" tabindex="50">
<option value="cash">Cash</option>
<option value="DD">DD</option>
<option value="Cheq">Cheque</option>
</select>
</td>
</tr>
<tr>
<td>CHEQUE/DD No</td>
<td><input type="text" name="T4" value="0" size="20"></td>
</tr>
<tr>
<td>BANK INFORMATION</td>
<td><input type="text" name="T5" size="20"></td>
</tr>
</table>
<input type="submit" name="submit">
<input type="reset" name="r1">
</form>
</BODY>
</HTML>
