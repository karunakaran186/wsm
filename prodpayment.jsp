<%@ page language="java" import="java.sql.*,java.util.Calendar"%>
<html>
<body>
<%!int paid=0; %>
<% 
   paid=Integer.parseInt(request.getParameter("T3"));
   String ptype=request.getParameter("D1");
   String stat=request.getParameter("T5");
   int ddno=Integer.parseInt(request.getParameter("T4"));
   int ccodes=Integer.parseInt((String)session.getAttribute("ccode"));
   String ppp=(String)session.getAttribute("pcodes");
   Connection cc10=null;
   Connection cc11=null;
   
   Calendar cc1=Calendar.getInstance();
   int mon=cc1.get(Calendar.MONTH);
   int yea=cc1.get(Calendar.YEAR);
   int ata=cc1.get(Calendar.DATE);
   String pdate=mon+"/"+ata+"/"+yea;
      
try
{
   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch(ClassNotFoundException e){out.println(e);}
try
{
   
   cc10=DriverManager.getConnection("jdbc:odbc:espace","sa","");
   cc11=DriverManager.getConnection("jdbc:odbc:espace","sa","");
   Statement ss=cc10.createStatement();
   int am1=0;
   int tot=0;
   String on=(String)session.getAttribute("orderno");
   int hss=Integer.parseInt(on);
   PreparedStatement p=cc10.prepareStatement("select sum(amount) from prodpayment where orderno=?");
   p.setInt(1,hss);
   
   ResultSet rs3=p.executeQuery();
   if(rs3.next())
      tot=rs3.getInt(1);
   
   PreparedStatement ps=cc11.prepareStatement("select * from orderprocess where orderno=?");
   
   ps.setInt(1,hss);
   ResultSet rs4=ps.executeQuery();
   if(rs4.next())
     am1=rs4.getInt("Amount");
	
   int bal=am1-(paid+tot);
   out.println(tot);
   if(tot==0)
   {
   	   out.println("your amount is : " +  am1);
   	   out.println("<br>");  
	   out.println("Your order number is " + on);
	   out.println("<br>");
	   out.println("Your have to specify this order number during payment");
	   out.println("<br>");
	   int ono=0;
	   PreparedStatement ps1=cc10.prepareStatement("insert into delivery(orderno,prodcode,orderdate,delcode,clicode) values(?,?,?,?,?)");	
	   ps1.setInt(1,Integer.parseInt(on));
	   String pcode=(String)session.getAttribute("pcodes");
	   ps1.setString(2,pcode);
	   ps1.setString(3,pdate);
	 
	 ResultSet rsa3=ss.executeQuery("select delcode from delivery");
	   while(rsa3.next())
	   {
	       ono=rsa3.getInt(1);
	   }
	   ono=ono+1;
	   
	   ps1.setInt(4,ono);
	   
	   String co=(String)session.getAttribute("ccode");
	   ps1.setInt(5,Integer.parseInt(co));
	   int k=ps1.executeUpdate();
	   if(k>0)
	   {
	      PreparedStatement ps3=cc10.prepareStatement("insert into sales(prodcode,prodname,price,quantity,amount,saledate) values(?,?,?,?,?,?)");
	      ps3.setString(1,ppp);
	      String sm=(String)session.getAttribute("pnames");
	      ps3.setString(2,sm);
	      String pr=(String)session.getAttribute("prices");
	      ps3.setInt(3,Integer.parseInt(pr));
	      String am=(String)session.getAttribute("amounts");
	      ps3.setInt(4,Integer.parseInt(am));
	      String qu=(String)session.getAttribute("qunt");
	      ps3.setInt(5,Integer.parseInt(qu));
	      ps3.setString(6,pdate);
	      int kkkk=ps3.executeUpdate();  
	      if(kkkk>0)
		  out.println("success");
	   }
   }
         
   if(bal<0)
   {
   	bal=(paid+tot)-am1;
   	int rem=am1-tot;	
   	if (rem!=0)
        {
           out.println("You have paid the extra amount of " + bal);
           PreparedStatement ps9=cc10.prepareStatement("insert into prodpayment(paydate,clientcode,amount,paytype,cdno,status,pcode,orderno) values(?,?,?,?,?,?,?,?)");
   	   ps9.setString(1,pdate);
	   ps9.setInt(2,ccodes);
       	   ps9.setInt(3,rem);
           ps9.setString(4,ptype);
           ps9.setInt(5,ddno);
           ps9.setString(6,stat);
           ps9.setString(7,ppp);
           ps9.setInt(8,hss);
           int kk=ps9.executeUpdate();
         }
         else
         {
           out.println("Already paid");
         }
     }
     else if(bal>0)
     {
         PreparedStatement pstat=cc10.prepareStatement("insert into prodpayment(paydate,clientcode,cdno,amount,paytype,status,pcode,orderno) values(?,?,?,?,?,?,?,?)");
	 pstat.setString(1,pdate);
	 pstat.setInt(2,ccodes);
	 pstat.setInt(4,paid);
	 pstat.setString(5,ptype);
	 pstat.setInt(3,ddno);
	 pstat.setString(6,stat);
	 pstat.setString(7,ppp);
	 pstat.setInt(8,hss);
         int kk10=pstat.executeUpdate();
         if(kk10>0)
         {
         	tot=tot+paid;
		out.println("You had paid the amount of " + tot);
		out.println("<br>");
	        out.println("You have to pay the remaining amount of " + bal);
	 }
      }
      else
         out.println("you have paid the full amount thank you");        
}
catch(SQLException e){out.println(e);}
 %>
</body>
</html>
