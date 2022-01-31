 <%@ page language="java" import="java.sql.*,java.util.Calendar"%>
 <p align="center"><b><i><font face="Book Antiqua" size="4">Reports based on Month</font></i></b>
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
    String daa=request.getParameter("mon1");
    String yya=request.getParameter("yyy");
    
   String mon= "";
           
       if(daa.equals("January"))
           mon="01";
       if(daa.equals("February"))
           mon="02";
       if(daa.equals("March"))
           mon="03";
       if(daa.equals("April"))
           mon="04";
       if(daa.equals("May"))
           mon="05";
       if(daa.equals("June"))
           mon="06";
       if(daa.equals("July"))
           mon="07";
       if(daa.equals("August"))
           mon="08";
       if(daa.equals("September"))
           mon="09";
       if(daa.equals("October"))
           mon="10";
       if(daa.equals("November"))
           mon="11";
       if(daa.equals("December"))
           mon="12";
       
       
          
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
               int la=sss.lastIndexOf('-');
               String yys=sss.substring(0,find);
               String mons=sss.substring(find+1,la);
               if(mons.equals(mon))
               {
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
         	   	}
         	
   	%>
     
