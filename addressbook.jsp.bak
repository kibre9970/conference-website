<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>
<%   
     
     String userid = session.getAttribute("userid")+"";
     String uname = session.getAttribute("uname")+"";    
 
     String chall = request.getParameter("chall");
     if(chall == null)
        chall = "no";
     
     String delete = request.getParameter("delete");
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
                   pstmt3= con.prepareStatement("delete addressbook where userid in ("+"'"+picked[i]+"'"+")"); 
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
     String tname = "";
     String tuserid = "";
     String tdob = "";
     String temail = "";
     String tphone = "";
     String tcity = "";

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
<form action = 'addressbook.jsp?userid=<%= userid%>&uname=<%= uname%>' method = post>
<FONT  face="verdana" size=5 COLOR=blue><center><u><b>Address Book</b></u></CENTER></font>
<br>
<table border=0 align = 'center' width = 720><tr>
<td><a href = addcontact.jsp?userid=<%= userid%>&uname=<%= uname%>>
   <font color = black size = 5><b><img src = images/hh.jpg border=0></b></font></a></td>
<td align = left> <input type = submit value = 'CheckAll' name=chall></td>
<td align = left> <input type = submit value = 'Clear' name=chall></td>
<td align = right><input type = submit value = 'Delete' name=delete></td>

</tr></table>
<br>
<table border=1 align="center" width=800>
<th><font color = hotpink size = 6> Name </font></th>
 <th><font color = hotpink size = 6> Userid </font></th>
 <th><font color = hotpink size = 6> DOB </font></th>
 <th><font color = hotpink size = 6> Email </font></th>
 <th><font color = hotpink size = 6> phone </font></th>
    <th><font color = hotpink size = 6> City</font> </th>
   <%try {
           PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("select * from addressbook where ouserid = ?");   
           pstmt.setString(1,userid);                  

           ResultSet rs1 = pstmt.executeQuery();

           while(rs1.next())
           {
               tname = rs1.getString(1);
               tuserid = rs1.getString(2);
               tdob = rs1.getString(3);
               temail = rs1.getString(4);
               tphone = rs1.getString(5);
               tcity = rs1.getString(6);
          
               if(chall.equals("CheckAll"))
                  out.println("<tr><td width = '30%' nowrap height='20'   align=left ><input checked type='checkbox' name='option' value='"+tuserid+"'>");            
               else out.println("<tr><td width = '30%' nowrap height='20'   align=left ><input type='checkbox' name='option' value='"+tuserid+"'>");  
               out.println(" <font size = 5 face = verdana><a href='updatecontact.jsp?tuserid="+tuserid+"&tname="+tname+"&tdob="+tdob+"&temail="+temail+"&tphone="+tphone+"&tcity="+tcity+"'>"+tname+"</a></font></td>");
               out.println("<td height='20' width = '20%' align=left ><font size = 5 face = verdana>"+tuserid+"</font></td>");
               out.println("<td height='20' width = '20%'  align=left ><font size = 5 face = verdana>"+tdob+"</font></td>");
               out.println("<td height='20' width = '20%'  align=left ><font size = 5 face = verdana>"+temail+"</font></td>");
               out.println("<td nowrap height='20' width = '20%'  align=left ><font size = 5 face = verdana>"+tphone+"</font></td>");
               out.println("<td height='20' width = '20%'  align=left ><font size = 5 face = verdana>"+tcity+"</font></td></tr>");
           }   
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
</form>
</BODY>
</HTML>