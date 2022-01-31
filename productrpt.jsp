 <%@ page language="java" import="java.sql.*"%>
 <html>
 <body>
 
 
 
 <form method="post" action="http://localhost:7000/examples/krishna/prodrptbymon.jsp">
 <br>
   <br>
   <p align="center"><b><i><font face="Book Antiqua" size="4">Show Report Based
   On Month</font></i></b>
   <br>
   
   <p align="center">
   <b><i><font face="Book Antiqua" size="2">Product Name :</font></i></b>
   <select size=1 name="pc">
       <option>IW</option>
       <option>Juli</option>
       <option>IM</option>
       <option>EX</option>
 </select>
   
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
  
   <select size=1 name="yyy">
   <option>2000</option>
   <option>2001</option>
   <option>2002</option>
   <option>2003</option>
   <option>2004</option>
 </select>
  <input type="submit" value="submit">
   </p>
 </form>
 
<br>
<br>
<br>
 
 <form method="post" action="http://localhost:8080/examples/krishna/prodrptbyyear.jsp">
 <p align="center"><b><i><font face="Book Antiqua" size="4">Show Report Based On
  Year</font></i></b>
  <br>
  <br>
  <p align="center">&nbsp;
   <b><i><font face="Book Antiqua" size="2">Product Name :</font></i></b>
 <select size=1 name="pc">
    <option>IW</option>
    <option>Juli</option>
    <option>IM</option>
    <option>EX</option>
 </select>
 
 
 <select size=1 name="yyy">
   <option>2000</option>
   <option>2001</option>
   <option>2002</option>
   <option>2003</option>
   <option>2004</option>
 </select>
 
 <input type="submit" value="submit">
 </p>
 </form>
 
 </body>
 </html>

