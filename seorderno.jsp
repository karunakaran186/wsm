<%@ language="java" import="java.sql.*"%>

<%

  String orno=request.getParameter("or");
  out.pritln(orno);
  session.setAttribute("orderno",orno);
  /*try
  {
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  }catch(ClassNotFoundException e){out.println(e);}
  try
  {
     Connection cc=DriverManager.getConnection("jdbc:odbc:espace","sa","");
     PreparedStatement p=cc.prepareStatement("select * from orderprocess where orderno=?");
     p.setInt(1,Integer.parseInt(orno);
     ResultSet result=p.executeQuery();
     if(result.next())
     {
         String ss=result.getString(2);
         Session.setAttribute("pcodes",ss);
         out.pritln(ss);
     }
         response.sendRedirect("http://localhost:7000/examples/krishna/productpayment.jsp");
     }
     else
     {
         response.sendRedirect("http://localhost:7000/examples/krishna/getorderno.jsp");     }   
    }
   catch(SQLException e){out.println(e);}
      */
 %>
