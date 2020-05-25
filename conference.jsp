<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>
<%
   String userid = session.getAttribute("userid")+"";
   String uname = session.getAttribute("uname")+"";          
   String text = request.getParameter("t1"); 
   if(text == null)
      text = "";   

   String rname = request.getParameter("rname");
   String rin = request.getParameter("rin");     
%>

<html>
<head>
<title>Conference Page</title>

<script>
function go()
{
 frm.t1.focus();
}
function check()
{
   var k=frm.t1.value.length; 
   if(k<=0)
   {
		alert('Enter Message');
		frm.t1.value=""; 
		frm.t1.focus();
		return false;
   }

   else  return true;
}

</script>
<META http-equiv="REFRESH" content="15; url=conference.jsp?rname=<%= rname%>&rin=<%= rin%>">
 </head>

       
<body onload = "go()" >


<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>



 
<form action = 'conference.jsp?rname=<%= rname%>&rin=<%= rin%>' name = frm method = post >
<font color = blue size=5 face =verdana><center><b> Conference Room</b></center></font>
<center><textarea rows=14 cols=75 name=tarea>   

<% 
    PreparedStatement pstmt = null;
    PreparedStatement pstmt2 = null;
    ResultSet rs = null;
    try {
         if(text.length() > 0)
         {
           pstmt = con.prepareStatement ("insert into "+rname+" values(?,?)");
           pstmt.setString(1,userid);           
           pstmt.setString(2,text);   
           int rowcount = pstmt.executeUpdate();
         }
         pstmt2 = con.prepareStatement ("select * from "+rname);
         rs = pstmt2.executeQuery();
         int count = 0;
         while(rs.next()) 
         {
           String id = rs.getString(1);
           String mess = rs.getString(2); 
           out.println(id + " : " + mess + "\n");
           count++;
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
</textarea>  
<br><br>
<b><font color = green size = 5><%=userid%><font></b>
&nbsp;:&nbsp;<input type=text size=50 name=t1>  
&nbsp;&nbsp;&nbsp; <input type=submit name=send value=' send ' >  
</form>		 
</body>  
</html> 