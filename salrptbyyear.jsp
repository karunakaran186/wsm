  <%@ page language="java" import="java.sql.*,java.util.Calendar"%>
  <p align="center"><b><i><font face="Book Antiqua" size="4">Reports based on Year</font></i></b>
 <br>
 <br>
  <table border=1>
                <tr>
                   <td>Product Code</td>
                   <td>Product Name</td>
                   <td>Price</td>
                   <td>Amount</td>
                   <td>Quantity</td>
       </tr>
  <%
      String yya=request.getParameter("yyy");
     
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection cs=DriverManager.getConnection("jdbc:odbc:espace","sa","");
       
        Statement stat=cs.createStatement();
        ResultSet rs=stat.executeQuery("select * from sales");
       while(rs.next())
        {
        String pcode=rs.getString(1);
        String pname=rs.getString(2);
        int pr=rs.getInt(3);
        int am=rs.getInt(4);
        int qu=rs.getInt(5);
        Date ddd=rs.getDate(6);
        String sss=String.valueOf(ddd);
        int find=sss.indexOf('-');
        String yys=sss.substring(0,find);
        if(yys.equals(yya))
        {
       %>
       <tr>
       	<td><%=pcode%></td>
       	<td><%=pname%></td>
       	<td><%=pr%></td>
       	<td><%=am%></td>
       	<td><%=qu%></td>
          	</tr>
      	<%
       	}
    	}
  	%>
     
