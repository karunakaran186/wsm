<%
  String ono=request.getParameter("orr");
  session.setAttribute("onno",ono);
  session.setAttribute("ggg","11");
  response.sendRedirect("http://localhost:7000/examples/krishna/paym.jsp");
  %>
