<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ include file="DBConn.jsp" %>
<%   
     String userid = session.getAttribute("userid")+"";
     String uname = session.getAttribute("uname")+"";
     String tfrom = request.getParameter("tfrom");
     String ttim = request.getParameter("ttime");
	 String ttime1 = ttim.substring(0,23);
	 String ttime2 = ttim.substring(24,34);
	 String ttime = ttime1 + "+" + ttime2;
     String tmsg = "";
     String tread = "";
     String tsub = "";
     String tname = "";
     boolean flag = false;
%>

<HTML>
<head>
</head>
<BODY  bgcolor = skyblue link = green vlink = green alink = green>


<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>



   <% try {
/*           PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("select * from mail where userid = ? and whosend = ? and timing = ?");
           pstmt.setString(1,userid);
           pstmt.setString(2,tfrom);
           pstmt.setString(3,ttime); */

		   System.out.println(userid+" "+tfrom+"  "+ttime);
           Statement stmt = null;
           stmt = con.createStatement();
		   String cmd="select * from mail where userid='"+userid+"' and whosend='" + tfrom + "' and timing = '" + ttime + "'";
		   ResultSet rs1 = stmt.executeQuery(cmd);
           if(rs1.next())
           {
               tmsg = rs1.getString(3);
               tread = rs1.getString(5);
               tsub = rs1.getString(6);
			   System.out.println(tmsg+" "+tread+"   "+tsub);
              %> 

<table border=3 align="center" width=520>
<td bgcolor=palegreen> <FONT  face="verdana" size=5 COLOR=midnightblue><center>Offline Reading</CENTER></font></td>
</table>
<br>
<table border=0 align = center width = 520><tr>
<td><a href = 'writeoffline.jsp?userid=<%= userid%>'><font color = black size = 5><b>Compose</b></font></a></td>
<td align = center><a href = 'readoffline.jsp?userid=<%= userid%>'><font color = black size = 5><b>Read More</b></font></a></td>
<td align = right><a href = 'deleteoffline.jsp?userid=<%= userid%>&tfrom=<%= tfrom%>&ttime=<%= ttime%>'><font color = black size = 5><b>Delete</b></font></a>

</tr></table>

<table border=0 align="center" width=450>

           <%PreparedStatement pstmt3 = null;
           pstmt3 = con.prepareStatement("select * from userdetails where userid = ?");   
           pstmt3.setString(1,tfrom);                  
           ResultSet rs3 = pstmt3.executeQuery();

           if(rs3.next())
           {
                tname = rs3.getString(2);
                
            }  
           if(pstmt3 != null)
               pstmt3.close();
              
 %>
 

              <tr><td><br><font color = midnightblue size = 6>From: <%= tname%>[<%= tfrom%>]</font></td></tr>
              <tr><td><br><font color = midnightblue size = 6>Subject: <%= tsub%></font></td></tr>
              <tr><td><br><font color = midnightblue size = 6>Time: <%= ttime%></font></td></tr>
              <tr><td><br><br></font>
              <% if(tmsg != null) out.println("<font color = maroon size = 6>"+tmsg+"</font>");%></td></tr>

             <%  if(tread.equals("n"))
               {
/*                  PreparedStatement pstmt2 = null;     
                  pstmt2 = con.prepareStatement("update mail set read = 'y' where whosend = ? and timing = ?"); 
                    pstmt2.setString(1,tfrom);
                    pstmt2.setString(2,ttime);  */
                  Statement stmt2 = con.createStatement(); 
				  String ccmd="update mail set read = 'y'";// where whosend = '"+tfrom+"'";// and timing = '"+ttime+"'";

				  int rowcount = stmt2.executeUpdate(ccmd);
                  if(stmt2 != null)
                        stmt2.close();
                        
               }   
          }
 
           if(stmt != null)
	       {
               stmt.close();
               con.close();
		   }

          
  }
  catch(Exception e)
  {
		e.printStackTrace();
		out.println("ERROR: "+ e + "\n");
   }
         
%>
</table>
<br><br>
<table border = 2 width = 520 align = center bgcolor = palegreen><tr height = 10 >
<td> 
</td></tr></table>
</BODY>
</HTML>