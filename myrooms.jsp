<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>


<%
    String userid = session.getAttribute("userid")+"";
    String uname = session.getAttribute("uname")+"";  


   String tuserid = request.getParameter("suserid");
   String  roomname = "";
   String  trin = "";
   boolean flag1 = false;
   boolean flag2 = false;   
   int count = 0;
   String rooms[] = new String[100];
%>

<html>
<head>
<title>User Status Page</title>
<script language="javascript">
   function open()
   {
      var k = frm.x.value;
      if(k<=0)
      {
	  alert('Enter Room Name');
	  frm.x.value=""; 
	  frm.x.focus();
	  return false;
      }
      else return true;
   }
</script>
 </head>

       
<body>
 

<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>

<%
     try {
           PreparedStatement pstmt = null;
           PreparedStatement pstmt2 = null;
           pstmt = con.prepareStatement("select * from roomdetails where moderator = ?");    
           pstmt.setString(1,userid);
           ResultSet rs2 = pstmt.executeQuery();
         %>
           <center><font color = red><h1><u>My Rooms</u></h1></font></center>
           <br>
            <center>
<table border=0 width = '60%' align = 'right'>
          <tr><td align = right> 
           <table border="4" cellspacing="1"  WIDTH="40%">
 
             <th align = right nowrap width = '45%'><font color = hotpink size = 5> Room Name </font></th>
                 <th nowrap><font color = hotpink size = 5> Room Key</font> </th> 
       <%  while(rs2.next())
           {
             roomname = rs2.getString(1);
             count++;
             rooms[count] = roomname;
             trin = rs2.getString(2); 
             pstmt2 = con.prepareStatement("select count(*) from clientonline where roomname = ?");    
             pstmt2.setString(1,roomname);
             ResultSet rs3 = pstmt2.executeQuery();
             String f = "";
             if(rs3.next())
               f = rs3.getString(1); %>                         

           <tr><td height="20"  align='right' width = '45%' nowrap><font size=5 color=darkBLUE><b>&nbsp;&nbsp;&nbsp;<%= roomname%>(<%= f%>)</b></font>
           </td><td  align = 'right' nowrap><font color = green size = 5><b>&nbsp;&nbsp;&nbsp;<%= trin%></b></font></td></tr>        
     

              <%  }  %>
        
            <tr></tr><tr></tr><tr></tr>
             </table> </td>
             
             <td align =right>
             <table border = 0 width = 30%>
              <th height = 25>&nbsp;</th> 
              <% for(int i=1;i<=count;i++){ %>
                   <tr><td width = '30%'align = center nowrap>
                 <a href='changeroomkey.jsp?drname=<%= rooms[i]%>'><img src='images/changekey.jpg' border=0></a>
                 &nbsp;&nbsp;&nbsp;&nbsp;<a href="deleteroom.jsp?drname=<%= rooms[i]%>"><img src='images/deleteroom.jpg' border=0></a></td></tr>
               <% } %> 
              
             </table> </td></tr>
 
            </table> 
            <br><br><br><br><br><br><br><br><br><br>
            <table border=0  WIDTH='100%' >
            <tr></tr><tr></tr><tr></tr>  
                   <tr>
             <td width = '24%' nowrap></td><td align = left width = '30%'>
             <% if(userid.equals("admin")) 
                  out.println("<a href = adminmainscreen.jsp>");
             else  out.println("<a href = conferencemain.jsp>"); %>

             <img border=0 src = images/home2.jpg></a></center></tr>  
             </table> 
       <%  
          
           
           if(pstmt != null)
             pstmt.close();
             con.close();

         }
          catch(Exception e) {
           e.printStackTrace();
             out.println("ERROR: "+ e + "\n");
           }


%>
 	  </body>  
	  </html>  
