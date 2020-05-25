<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 


<%
     String userid = session.getAttribute("userid")+"";
     String uname = session.getAttribute("uname")+""; 
     
     String tuserid = request.getParameter("tuserid"); 
     String tname = request.getParameter("tname"); 
     String tdob = request.getParameter("tdob"); 
     String temail = request.getParameter("temail"); 
     String tphone = request.getParameter("tphone"); 
     String tcity = request.getParameter("tcity");        
%>
<HTML>
<HEAD>
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



<FORM  ACTION = "updatecontact2.jsp?tuserid=<%= tuserid%>" name = frm onsubmit="return check()" method = post>

<H4 align=center><FONT face=Tahoma><U>Update Contact</U></FONT></H4>
<P align=center>
<TABLE  border=0 cellPadding=1 cellSpacing=1 
  width="75%">
  <TR><td width = 80></td>
    <TD height = 45>
      <P align=left><font color = blue size = 5 face verdana> Name:</font></P></TD>
    <TD align = left><font color = red size = 5 face verdana><%= tname%></font> </TD></TR>



  <TR><td></td>
    <TD height = 45>
      <P align=left><font color = blue size = 5 face verdana>User Id:</P></TD>
    <TD><font color = red size = 5 face verdana><%= tuserid%></font> </TD></TR>

  <TR><td></td>
    <TD height = 45>
      <P align=left><font color = blue size = 5 face verdana>Date of Birth:</P></TD>
    <TD><INPUT type=text name=tdob value='<%= tdob%>'></TD></TR>

  <TR><td></td>
    <TD height = 45><P align=left><font color = blue size = 5 face verdana>E-Mail Id</td>
    <TD><INPUT type=text name=temail value='<%= temail%>'></TD></TR></P>

    <TR><td></td>
    <TD height = 45>
      <P align=left><font color = blue size = 5 face verdana>Phone:</P></TD>
    <TD><INPUT type=text name=tphone value='<%= tphone%>'></TD></TR>

   <TR><td></td>
    <TD height = 45>
      <P align=left><font color = blue size = 5 face verdana>City:</P></TD>
    <TD><INPUT type=text name=tcity value='<%= tcity%>'></TD></TR></TABLE>

<P align=center><INPUT  type=image src='images/update.jpg'>
</P>
<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>
</form>
</BODY>
</HTML>


