<%@ page language="java" import="java.sql.*,java.util.Calendar"%>
<html>
<body>
<%
try
{
      Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}catch(ClassNotFoundException e){};
try
{
        int ii1=0;
	int ii=0;
	int orno=0;
	int a2=Integer.parseInt(request.getParameter("T1"));
	String b2=request.getParameter("T2");
	String c2=request.getParameter("size");
	String d2=request.getParameter("T3");
	String f2=request.getParameter("T5");
	String g2=request.getParameter("T6");
	String h2=request.getParameter("T7");
	String i2=request.getParameter("R1");
	String j2=request.getParameter("T8");
	String k2=request.getParameter("R2");
	String l2=request.getParameter("R3");
        int dur=Integer.parseInt(d2);
	session.setAttribute("size",c2);

	Calendar cc1=Calendar.getInstance();
	int mon=cc1.get(Calendar.MONTH);
	int yea=cc1.get(Calendar.YEAR);
	int ata=cc1.get(Calendar.DATE);
	String e2=mon+"/"+ata+"/"+yea;
	   
	Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:espace","sa","");
	
	Statement ps101=cc.createStatement();
	
	ResultSet rsss=ps101.executeQuery("select * from payment");
	while(rsss.next())
	{
	   orno=orno+1;
	}
	
	session.setAttribute("onno",String.valueOf(orno));
	out.println(orno);
	session.setAttribute("ggg","10");
	
	Statement s2=cc.createStatement();
	
	String sq="insert into URL1(custcode,sercode,Reqsize,Duration,Dateofbooking,URL,nam1,nam2,Domain,password,URLtype,DesignofURL,orderno) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement p=cc.prepareStatement(sq);
	out.println("Connection Created");

	p.setInt(1,a2);
	p.setInt(2,Integer.parseInt(b2));
	p.setInt(3,Integer.parseInt(c2));
	p.setInt(4,Integer.parseInt(d2));
	p.setString(5,e2);
	p.setString(6,f2);
	p.setString(7,g2);
	p.setString(8,h2);
	p.setString(9,i2);
	p.setString(10,j2);
	p.setString(11,k2);
	p.setString(12,l2);
	p.setInt(13,orno);
	
	int i=p.executeUpdate();
	if(i>0)
	{
		String ser=(String)session.getAttribute("server");
		if(ser.equals("NT"))
		{
			if(c2.equals("10"))
				ii1=dur*3500;
			else if(c2.equals("15"))
				ii1=15*4500;
			else if(c2.equals("20"))
				ii1=20*7000;
			else if(c2.equals("50"))
				ii1=50*10000;
			else if(c2.equals("100"))
				ii1=100*14000;
		}
		else if(ser.equals("LINUX"))
		{
			if(c2.equals("10"))
				ii1=10*2300;
			else if(c2.equals("15"))
				ii1=15*3000;
			else if(c2.equals("20"))
				ii1=20*6000;
			else if(c2.equals("50"))
				ii1=50*8000;
			else if(c2.equals("100"))
				ii1=1000*12000;
		}        
		
	     
	     session.setAttribute("amm",String.valueOf(ii1));
	     PreparedStatement ps=cc.prepareStatement("select * from payment");
	     ResultSet rs=ps.executeQuery();
	     while(rs.next())
	     {
	       orno=rs.getInt(5);
	     }
	     orno=orno+1;
	     session.setAttribute("onno",String.valueOf(orno));
	     
	     String sq1="insert into payment values(?,?,?,?,?,?)";
	     PreparedStatement p1=cc.prepareStatement(sq1);

	     p1.setInt(1,a2);
	     p1.setInt(2,Integer.parseInt(b2));
	     p1.setInt(3,Integer.parseInt(c2));
	     p1.setInt(4,ii1);
	     p1.setInt(5,orno);
	     p1.setString(6,e2);
	     int mm1=p1.executeUpdate();
	     if(mm1>0)
	       out.println("success");
	     else
	       out.println("failed");
             response.sendRedirect("http://localhost:7000/examples/krishna/paym.jsp");      
	} 
	else
	     response.sendRedirect("http://localhost:7000/examples/krishtml/URL1.html");  

}
catch(SQLException ee)
{out.println(ee);}

%>

</body></html>


