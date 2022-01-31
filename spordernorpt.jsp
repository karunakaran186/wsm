  <%@ page language="java" import="java.sql.*,java.util.Calendar"%>
  <p align="center"><b><i><font face="Book Antiqua" size="4">Reports based on customer code</font></i></b>
  <br>
  <br>
   <table border=0>
     <tr>
        <td><b><i><font face="Book Antiqua" size="1">Customer Code</font></i></b></td><td><%="  "%></td>
        <td><b><i><font face="Book Antiqua" size="1">Server Code</font/</i></b></td><td><%="  "%></td>
        <td><b><i><font face="Book Antiqua" size="1">Order No</font></i></b></td><td><%="  "%></td>
        <td><center><b><i><font face="Book Antiqua" size="1">Order Date</font></i></b></center></td><td><%="  "%></td>
        <td><b><i><font face="Book Antiqua" size="1">Amount</font></i></b></td><td><%="  "%></td>
        <td><b><i><font face="Book Antiqua" size="1">Paid</font></i></b></td><td><%="  "%></td>
        <td><b><i><font face="Book Antiqua" size="1">Balance</font></i></b></td>
     </tr>
     <tr>
     <td>
     </td>
     </tr>
     <%
       int yya=Integer.parseInt(request.getParameter("T1"));
      
         Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
         Connection cs=DriverManager.getConnection("jdbc:odbc:espace","sa","");
         Connection cs1=DriverManager.getConnection("jdbc:odbc:espace","sa",""); 
         Statement stat=cs.createStatement();
         
         ResultSet rs=stat.executeQuery("select * from payment");
         
         while(rs.next())
         {
             int ccode=rs.getInt(1);
             int scode =rs.getInt(2);
             int si=rs.getInt(3);
             int amt=rs.getInt(4);
             int orno=rs.getInt(5);
             Date ddd=rs.getDate(6);
             String dat=String.valueOf(ddd);
       %>
       
       <%
             if(orno==yya)
             {
                PreparedStatement sta=cs1.prepareStatement("select sum(paid) from pay1 where orderno=?");
                sta.setInt(1,orno);
                ResultSet rss=sta.executeQuery();
                
                if(rss.next())
                {
                  int hh=rss.getInt(1);
                  int mm=amt-hh;
              %>
              <tr>
              <td><center><% out.println(ccode);%></center></td>
              <td><%=" "%></td>
              <td><center><% 	 out.println(scode);%></center></td><td>&nbsp;&nbsp;</td>
              <td><center><%out.println(orno);%></center></td><td>&nbsp;&nbsp;</td>
 	      <td><% out.println(dat);%></td><td>&nbsp;&nbsp;</td>
              <td><%  	 out.println(amt);%></td><td>&nbsp;&nbsp;</td>
              <td><%  	 out.println(hh);%></td><td>&nbsp;&nbsp;</td>
              <td><%  	 out.println(mm);%></td>     	 
              </tr>
              <%
                }
                  
             }
             }
          
     %>            
                
                 
         
                   
            
         
        
