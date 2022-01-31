<html>
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>New Page 4</title>
<base target="verify">
</head>
<script language="vbs">
sub S_onclick()
'msgbox "clicked"
end sub
</script>
<form method="post" action="http:\\localhost:7000\examples\krishna\url.jsp">

<body bgcolor="#FFFFDE">
<p align="center"><br>
<br>
<br>
  
 <%String cs=(String)session.getAttribute("ccode");
 String ss=(String)session.getAttribute("scode");
 %>
   
<u><font size="4">URL MEMORY ALLOCATION</font> </u></p>
<p align="center">&nbsp;</p>
<div align="center"><div align="center"><center>

<table border="0" width="72%">
  <tr>
    <td width="50%" valign="bottom"><font face="Arial" size="3" color="#800080"><strong>Customer
    Code</strong></font></td>
    <td width="50%"><input type="text" name="T1" value=<%=cs%> size="20"></td>
  </tr>
  <tr>
    <td width="50%" valign="bottom"><font face="Arial" size="3" color="#800080"><strong>Server
    Code</strong></font></td>
    <td width="50%"><input type="text" name="T2" value=<%=ss%> size="20"></td>
  </tr>
  <tr>
    <td width="50%"><font face="Arial" size="3" color="#800080"><strong>Requirement Size</strong></font></td>
    <td width="50%"><select name="size" size="1">
      <option value="10">10MB</option>
      <option value="15">15MB</option>
      <option value="20">20MB</option>
      <option value="50">50MB</option>
      <option value="100">100MB</option>
    </select>&nbsp; </td>
  </tr>
  <tr>
    <td width="50%"><font face="Arial" size="3" color="#800080"><strong>Duration</strong></font></td>
    <td width="50%"><input type="text" name="T3" size="20">(in years) &nbsp; </td>
  </tr>
  
</table>
</center></div>

<hr align="center">
<div align="center"><center>

<table border="0" width="72%">
  <tr>
    <td width="50%" rowspan="3"><font face="Arial" size="3" color="#800080"><strong>URL
    Name(specify three type of url)</strong></font></td>
    <td width="50%"><input type="text" name="T5" size="20"></td>
  </tr>
  <tr>
    <td width="50%"><input type="text" name="T6" size="20"></td>
  </tr>
  <tr>
    <td width="50%"><input type="text" name="T7" size="20"></td>
  </tr>
</table>
</center></div>

<hr>
</div><div align="center"><div align="center"><center>

<table border="0" width="72%">
  <tr>
    <td width="50%" rowspan="5"><font face="Arial" size="3" color="#800080"><strong>Domain</strong></font></td>
    <td width="50%"><font face="Courier" size="3" color="#FF0000"><strong><input type="radio"
    value="com" checked name="R1">COM</strong></font></td>
  </tr>
  <tr>
    <td width="50%"><font face="Courier" size="3" color="#FF0000"><strong><input type="radio"
    value="org" name="R1">ORG</strong></font></td>
  </tr>
  <tr>
    <td width="50%"><font face="Courier" size="3" color="#FF0000"><strong><input type="radio"
    value="edu" name="R1">EDU</strong></font></td>
  </tr>
  <tr>
    <td width="50%"><font face="Courier" size="3" color="#FF0000"><strong><input type="radio"
    value="net" name="R1">NET</strong></font></td>
  </tr>
  <tr>
    <td width="50%"><font face="Courier" size="3" color="#FF0000"><strong><input type="radio"
    value="in" name="R1">IN</strong></font></td>
  </tr>
</table>
</center></div>

<hr>
<div align="center"><div align="center"><center>

<table border="0" width="72%">
  <tr>
    <td width="50%"><font face="Arial" size="3" color="#800080"><strong>Password</strong></font></td>
    <td width="50%"><input type="password" name="T8" size="20"></td>
  </tr>
</table>
</center></div>

<hr align="center">
<div align="center"><div align="center"><center>

<table border="0" width="72%">
  <tr>
    <td width="50%" rowspan="2"><font face="Arial" size="3" color="#800080"><strong>URL Type</strong></font></td>
    <td width="50%"><font face="Courier" size="4" color="#FF0000"><strong><input type="radio"
    value="static" name="R2">STATIC</strong></font></td>
  </tr>
  <tr>
    <td width="50%"><font face="Courier" size="4" color="#FF0000"><strong><input type="radio"
    value="dynamic" checked name="R2">DYNAMIC</strong></font></td>
  </tr>
</table>
</center></div>

<hr align="center">
</div></div><div align="center"><center>

<table border="0" width="72%">
  <tr>
    <td width="50%" rowspan="3"><font face="Arial" size="3" color="#800080"><strong>Design of
    URL</strong></font></td>
    <td width="50%"><font face="Courier" size="3" color="#FF0000"><strong><input type="radio"
    value="Yes" name="R3">YES</strong></font></td>
  </tr>
  <tr>
    <td width="50%"><font face="Courier" size="3" color="#FF0000"><strong><input type="radio"
    value="No" name="R3">NO </strong></font></td>
  </tr>
  <tr>
    <td width="50%"><font face="Courier" size="3" color="#FF0000"><strong><input type="radio"
    value="Ucon" checked name="R3">UNDER CONSTRUCTION</strong></font></td>
  </tr>
</table>
</center></div></div>
<hr>
<center><input type="submit" value="submit" name="S"><input type="reset" name="r" value="Reset"</center>

