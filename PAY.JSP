<%@ page language="java" import="java.sql.*,java.util.Calendar"%>
<%! int am=0;%>
<html>
<body>
<%
int ii=0;
int code=Integer.parseInt(request.getParameter("T1"));
int paid=Integer.parseInt(request.getParameter("T2"));
String ptype=request.getParameter("C1");
String cdd=request.getParameter("T4");
String binf=request.getParameter("T5");
int ono11=Integer.parseInt((String)session.getAttribute("onno"));

Calendar cal=Calendar.getInstance();
int mon=cal.get(Calendar.MONTH);
int yea=cal.get(Calendar.YEAR);
int ata=cal.get(Calendar.DATE);
String Dt=mon+"/"+ata+"/"+yea;


try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch(ClassNotFoundException ex){}
try
{
	Connection cc=null;
	Connection cc1=null;
	cc=DriverManager.getConnection("jdbc:odbc:espace","sa","");
	cc1=DriverManager.getConnection("jdbc:odbc:espace","sa","");
	
	Statement s=cc.createStatement();
	
	int tot=0;
	PreparedStatement p=cc.prepareStatement("select sum(paid) from pay1 where orderno=?");
	p.setInt(1,ono11);
	ResultSet rs3=p.executeQuery();
	
	if(rs3.next())
	   tot=rs3.getInt(1);

	
/*	ResultSet rss=s.executeQuery("select * from payment");
	
	while(rss.next())
	{
		int ab=rss.getInt("orderno");
  		if(code==ab)
  		{
    		
    			//out.println(rss.getInt("amount"));
    			am=rss.getInt("amount");
			break;
  		}
	}	*/
	
	
	PreparedStatement pse=cc1.prepareStatement("select * from payment where orderno=?");
	pse.setInt(1,ono11);
	ResultSet rss101=pse.executeQuery();
	if(rss101.next())
	{
	  am=rss101.getInt(4);   
	  out.println("your amount is : " +  am);
	  }
	
	 out.println("<br>");
	
	int bal=am-(paid+tot);
	
	
        if(bal<0)
	{                         
		bal=(paid+tot)-am;
  		int rem=am-tot;	
		if (rem!=0)
	        {
	        	out.println("You have paid the extra amount of " + bal);
			String sq=("insert into pay1(customcode,paid,Dat,paytype,cheqdd,Bankinfo,orderno)values(?,?,?,?,?,?,?)");
			PreparedStatement pp=cc.prepareStatement(sq);		
			pp.setInt(1,code);
			pp.setInt(2,rem);
			pp.setString(3,Dt);
			pp.setString(4,ptype);
			pp.setInt(5,Integer.parseInt(cdd));
			pp.setString(6,binf);
			pp.setInt(7,ono11);
			int i=pp.executeUpdate();
		}
		else
		{
			out.println("Already Paid");
		}
	}
	
	else if(bal>0)
	{
		tot=tot+paid;
		out.println("You had paid the amount of " + tot);
		out.println("<br>");
		out.println("You have to pay the remaining amount of " + bal);
		//ResultSet rs=s.executeQuery("select * from pay1");
		String sq=("insert into pay1(customcode,paid,Dat,paytype,cheqdd,Bankinfo,orderno)values(?,?,?,?,?,?,?)");
		PreparedStatement pp1=cc.prepareStatement(sq);		
		pp1.setInt(1,code);
		pp1.setInt(2,paid);
		pp1.setString(3,Dt);
		pp1.setString(4,ptype);
		pp1.setInt(5,Integer.parseInt(cdd));
		pp1.setString(6,binf);
		pp1.setInt(7,ono11);
		int i=pp1.executeUpdate();
	}
	else
  		out.println("You paid Full amount Thank You" );
  	out.println("Inside" );	
  	
/*  	ResultSet rss1=s.executeQuery("select * from pay1");
  	String ndatt="2004-02-13";
  	java.sql.Date mmm=java.sql.Date.valueOf(ndatt);
  	while(rss1.next())
  	{
  	
  	   java.sql.Date datt=(rss1.getDate("Dat"));
  	   out.println("<br>");
  	   if(datt.equals(mmm))
  	   {
  	      out.println(datt);
  	   }
  	}*/
  	
	/*if(i>0)
            {
         response.sendRedirect("http://localhost:7000/examples/jsp/krishtml/renewal.html");      
             } 
	}
	else
	{
	response.sendRedirect("http://localhost:7000/examples/jsp/krishtml/paym.html");  
	}*/
}
catch(SQLException ee){out.println(ee);}
%>

</body></html>



