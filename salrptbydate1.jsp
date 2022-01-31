<%@ page language="java" import="java.sql.*"%>
<%
   String daa=request.getParameter("da");
   try
   {
      Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
   }catch(ClassNotFoundException e){out.println(e);}
  %>
  <center>
  
  <table border=1>
  <%
   try
   {
      
      Connection cc=null;
      cc=DriverManager.getConnection("jdbc:odbc:espace","sa","");
      PreparedStatement ps=cc.prepareStatement("select * from sales where saledate=?");
      ps.setString(1,daa);
      
      ResultSet rs=ps.executeQuery();
      out.println("<p align=center><b><i><font face=Book Antiqua size=4>");
      out.println("Sales Report Based On Date " + daa);
   %>
   
   <br>
   <br>
   <tr>
   <td>Product Code</td>
   <td>Product Name</td>
   <td>Price</td>
   <td>Amount</td>
   <td>Quantity</td>
   </tr>
   <%
      while(rs.next())
      {
   %>
   <tr>
   <td><%=rs.getString(1)%></td>
   <td><%=rs.getString(2)%></td>
   <td><%=rs.getInt(3)%></td>
   <td><%=rs.getInt(4)%></td>
   <td><%=rs.getInt(5)%></td>
   </tr>
   
   <%   	 
      	      }
    }catch(SQLException e){out.println(e);}
    
%>
</table>
   </center>
   </body>
</html>