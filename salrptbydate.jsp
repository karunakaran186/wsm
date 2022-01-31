<%@ page language="java" import="java.sql.*"%> 
<html>
<body>


<form method="post" action="http://localhost:7000/examples/krishna/salrptbydate1.jsp">
<input type="text" name="da">
<input type="submit" value="submit">
</form>

<br>
<hr>
<br>

<form method="post" action="http://localhost:8080/examples/krishna/salrptbymon1.jsp">
  <select size=1 name="mon1">
  <option>January</option>
  <option>February</option>
  <option>March</option>
  <option>April</option>
  <option>May</option>
  <option>June</option>
  <option>July</option>
  <option>August</option>
  <option>September</option>
  <option>October</option>
  <option>Novermber</option>
  <option>December</option>
 </select>
 <input type="submit" value="submit">
</form>

<br>
<hr>
<br>

<form method="post" action="http://localhost:7000/examples/krishna/salrptbyyear.jsp">
Specify the year <input type="text" name="yeara">
<input type="submit" value="submit">
</form>

</body>
</html>

