<%@ page language="java" import="java.sql.*"%>
<% 
    int onn=Integer.parseInt(request.getParameter("order"));
    session.setAttribute("onno",String.valueOf(onn));
    response.sendRedirect("http://localhost:7000/examples/krishna/paym.jsp");
 %>
