<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>

<%
     String userid = session.getAttribute("userid")+"";
     String uname = session.getAttribute("uname")+"";     
  
     String tname=" ";     
     String tpin=" ";    
     String tadd=" "; 
     String tphone=" ";     
     String temail=" ";     
     String tsex=" ";     
     String ted=" ";     
     String tcou=" ";     
     String tcity=" ";     
     String tstate=" ";     
     String tdob=" ";     

%>
<HTML>
<HEAD>
<title> My Profile </title>
<script language="javascript">
   function use()
   {
      frm.tname.focus();
   }

function check()
{
   k=frm.tname.value.length; 
   if(k<=0)
   {
		alert('Enter Name');
		frm.tname.value=""; 
		frm.tname.focus();
		return false;
   }
   else  return true;
}
  </script>

</HEAD>
<BODY bgColor=skyblue onload="use()">


<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>



<FORM  ACTION = "myprofile2.jsp" name = frm onsubmit="return check()" method = post>

<H2 align=center><FONT face=Tahoma color = green><U>My Profile</U></FONT></H2>
<P align=center>
<TABLE  border=0 cellPadding=1 cellSpacing=1 
  width="75%">
  <TR><td width = 80></td>
    <TD height = 45>
      <P align=center><font color = blue size = 5 face verdana> User Id:</font></P></TD>
<%    out.println("<TD align = right><font size = 5 color = red><b>"+userid+"</b></font></TD></TR>");%>
           
 <% try { 
           PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("select * from userdetails where userid = ?");   
           pstmt.setString(1,userid);                  
  
           ResultSet rs1 = pstmt.executeQuery();

           if(rs1.next())
           {
               tname = rs1.getString(2);
               tadd = rs1.getString(3);
               tpin = rs1.getString(4);
               tphone = rs1.getString(5);
               temail = rs1.getString(6);
               tsex = rs1.getString(7);
               ted = rs1.getString(8);
               tcou = rs1.getString(9);
               tcity = rs1.getString(10);
               tstate = rs1.getString(11);
               tdob = rs1.getString(12);

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
  <TR><td></td>
    <TD height = 45>
      <P align=center><font color = blue size = 5 face verdana>&nbsp;&nbsp;Name:</P></TD>
<%    out.println("<TD><INPUT type =text name=tname maxlength = 60 value ='"+tname+"'></TD></TR>"); %>


  <TR><td></td>
    <TD height = 45>
      <P align=center><font color = blue size = 5 face verdana>Date of Birth:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</P></TD>
<%    out.println("<TD><INPUT type=text name=tdob maxlength=12 value='"+tdob+"'></TD></TR>"); %>
    
   <tr><td ></td>
    <TD height = 45>
      <P align=center><font color = blue size = 5 face verdana> Gender:</font></P></TD>
<%    out.println("<TD align = right><font size = 5 color = red>"+tsex+"</font></TD></TR>"); %>


  <TR><td></td>
    <TD height = 45>
      <P align=center><font color = blue size = 5 face verdana>Address:</P></TD>
<%    out.println("<TD><INPUT type=text name=tadd maxlength=120 value='"+tadd+"'></TD></TR>"); %>


  <TR><td></td>
    <TD height = 45><P align=center><font color = blue size = 5 face verdana>E-Mail Id:</td>
<%    out.println("<TD><INPUT type=text name=temail maxlength=50 value='"+temail+"'></TD></TR></P>"); %>

    <TR><td></td>
    <TD height = 45>
      <P align=center><font color = blue size = 5 face verdana>Phone:</P></TD>
 <%    out.println("<TD><INPUT type=text name=tphone maxlength=12 value='"+tphone+"'></TD></TR>"); %>

    <TR><td></td>
    <TD height = 45>
      <P align=center><font color = blue size = 5 face verdana>Pin Code:</P></TD>
<%    out.println("<TD><INPUT type=text name=tpin maxlength=6 value='"+tpin+"'></TD></tr>"); %>

    <TR><td></td>
    <TD height = 45>
      <P align=center><font color = blue size = 5 face verdana>Education:</P></TD>
<%    out.println("<TD><INPUT type=text name=ted maxlength=30 value='"+ted+"'></TD></tr>"); %>


   <TR><td></td>
    <TD height = 45>
      <P align=center><font color = blue size = 5 face verdana>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City:</P></TD>
<%    out.println("<TD><INPUT type=text name=tcity maxlength=20 value='"+tcity+"'></TD></TR>");  %>

   <TR><td></td>
    <TD height = 45>
      <P align=center><font color = blue size = 5 face verdana>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;State:</P></TD>
 <%    out.println("<TD><INPUT type=text name=tstate maxlength=25 value='"+tstate+"'></TD></TR>"); %>

   <TR><td></td>
    <TD height = 45>
      <P align=center><font color = blue size = 5 face verdana>Country:</P></TD>
  <%    out.println("<TD><INPUT type=text name=tcou maxlength=25 value='"+tcou+"'></TD></TR></TABLE>"); %>



<P align=center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT type = 'image' src = 'images/update1.jpg'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

<% if(userid.equals("admin")) 
out.println("<a href = 'adminmainscreen.jsp'><img src = 'images/home4.jpg' border=0></a></P>");
else out.println("<a href = 'conferencemain.jsp'><img src = 'images/home4.jpg' border=0></a></P>"); %>
<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>
</form>

<%// String s = request.getParameter("tname");
//out.println(s);%>
</BODY>
</HTML>


