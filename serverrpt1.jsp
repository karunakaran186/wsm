  <%@ page language="java" import="java.sql.*,java.util.Calendar"%>
  <p align="center"><b><i><font face="Book Antiqua" size="4">Reports based on customer code</font></i></b>
  <br>
  <br>
   <table border=0>
     <tr>
        <td><b><i><font face="Book Antiqua" size="1">Client Code</font></i></b></td><td><%="  "%></td>
        <td><b><i><font face="Book Antiqua" size="1">Size</font></i></b></td><td><%="  "%></td>
        <td><b><i><font face="Book Antiqua" size="1">Duration</font></i></b></td><td><%="  "%></td>
        <td><b><i><font face="Book Antiqua" size="1">Date</font></i></b></td><td><%="  "%></td>
      </tr>
     <tr>
     <td>
     </td>
     </tr>
     <%
       int yya=Integer.parseInt(request.getParameter("sna"));
      
         Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
         Connection cs=DriverManager.getConnection("jdbc:odbc:espace","sa","");
         Connection cs1=DriverManager.getConnection("jdbc:odbc:espace","sa",""); 
         Statement stat=cs.createStatement();
         
         ResultSet rs=stat.executeQuery("select * from url1");
         
         while(rs.next())
         {
             
             int ccode=rs.getInt(1);
             int scoe=rs.getInt(2);
             int si=rs.getInt(3);
             int dur=rs.getInt(4);
             Date ddd=rs.getDate(5);
             String dat=String.valueOf(ddd);
       %>
       
       <%
             if(scoe==yya)
             {
                
              %>
              <tr>
              <td><center><% out.println(ccode);%></center></td><td><%=" "%></td>
              <td><center><%out.println(si);%></center></td><td>&nbsp;&nbsp;</td>
 	      <td><% out.println(dur);%></td><td>&nbsp;&nbsp;</td>
              <td><%  	 out.println(ddd);%></td><td>&nbsp;&nbsp;</td>
              
              </tr>
              <%
              
             }
          }
     %>            
                
                 