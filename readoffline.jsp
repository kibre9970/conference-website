<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>

<%   
     //String userid = request.getParameter("userid");
     //String uname = request.getParameter("uname");
     
     String userid = session.getAttribute("userid")+"";
     String uname = session.getAttribute("uname")+"";  
     String chall = request.getParameter("chall");

     //System.out.println(userid+"   "+uname+"   "+chall);

     if(chall == null)
        chall = "no";

     String delete = request.getParameter("delete");
	 System.out.println(delete);

     if(delete == null)
        delete = "no";
     else 
     {
         String[] picked = request.getParameterValues("option");
         if (picked != null && picked.length != 0) 
         { 
           try {
                PreparedStatement pstmt3 = null;
                for (int i = 0; i < picked.length; i++) 
                { 
                   pstmt3= con.prepareStatement("delete mail where timing in ("+"'"+picked[i]+"'"+")"); 
                   int rowcount = pstmt3.executeUpdate();
                }
                
          
                
                if(pstmt3 != null)
                  pstmt3.close();
          
               }
               catch(Exception e) {
                 e.printStackTrace();
                 out.println("ERROR: "+ e + "\n");
            }

               
         }       
     }
     String tfrom = "";
     String tmsg = "";
     String ttime = "";
     String tread = "";
     String tsub = "";

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

<form action = 'readoffline.jsp?userid=<%= userid%>' method = post>
<table border=3 align="center" width=520>
<td bgcolor=palegreen> <FONT  face="verdana" size=5 COLOR=midnightblue><center>Offline Reading</CENTER></font></td>
</table>
<br>
<table border=0 align = center width = 520><tr>
<td><a href = writeoffline.jsp?userid=<%= userid%>><font color = black size = 5><b>Compose</b></font></a></td>
<td align = left> <input type = submit value = 'CheckAll' name=chall></td>
<td align = left> <input type = submit value = 'Clear' name=chall></td>
<td align = right><input type = submit value = 'Delete' name=delete></td>

</tr></table>
<br>
<table border=1 align="center" width=450>
<th><font color = hotpink size = 6> From </font></th>
          <th><font color = hotpink size = 6> Subject</font> </th>
   <%try {
           PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("select * from mail where userid = ?");   
           pstmt.setString(1,userid);                  
           ResultSet rs1 = pstmt.executeQuery();
           while(rs1.next())
           {
               tfrom = rs1.getString(2);
               tmsg = rs1.getString(3);
               ttime = rs1.getString(4);
               tread = rs1.getString(5);
               tsub = rs1.getString(6);
             
               if(tread.equals("n"))
                  out.println("<tr><td height='20'  bgcolor = darkseagreen align=left width = '50%'>");
               else out.println("<tr><td height='20'  align=left width = '50%'>");

                if(chall.equals("CheckAll"))
                  out.println("<input checked type='checkbox' name='option' value='"+ttime+"'>");            
               else out.println("<input type='checkbox' name='option' value='"+ttime+"'>");            

               out.println("  <font color = green size = 6>" +tfrom+"</font></td>");

               if(tread.equals("n")) 
                   out.println(" <td  nowrap align = left bgcolor = darkseagreen height='20' ><font color = green size = 6>");
               else 
                  out.println(" <td  nowrap align = left  height='20' ><font color = green size = 6>"); 
               %>
               &nbsp;&nbsp;<a href = 'readoffline2.jsp?userid=<%= userid%>&tfrom=<%= tfrom%>&ttime=<%= ttime%>'><%= tsub%></a></font> </td></tr>
               
          <% }   
           if(pstmt != null)
               pstmt.close();
               con.close();
         
         }
          catch(Exception e) {
           e.printStackTrace();
             out.println("ERROR: "+ e + "\n");
           }
%>
</table>
<br><br>
<table border = 2 width = 520 align = center bgcolor = palegreen><tr height = 10 >
<td> 
</td></tr></table>
</form>
</BODY>
</HTML>

