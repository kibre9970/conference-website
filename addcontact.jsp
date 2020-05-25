<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 


<%
     String userid = session.getAttribute("userid")+"";
     String uname = session.getAttribute("uname")+"";          
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


<FORM  ACTION = "addcontact2.jsp?userid=<%= userid%>" name = frm onsubmit="return check()" method = post>

<H4 align=center><FONT face=Tahoma><U>ADD CONTACT</U></FONT></H4>
<P align=center>
<TABLE  border=0 cellPadding=1 cellSpacing=1 
  width="75%">
  <TR><td width = 80></td>
    <TD height = 45>
      <P align=left><font color = blue size = 5 face verdana> Name:</font></P></TD>
    <TD align = left><INPUT type = text name=tname></TD></TR>



  <TR><td></td>
    <TD height = 45>
      <P align=left><font color = blue size = 5 face verdana>User Id:</P></TD>
    <TD><INPUT type =text name=tuserid></TD></TR>

  <TR><td></td>
    <TD height = 45>
      <P align=left><font color = blue size = 5 face verdana>Date of Birth:</P></TD>
    <TD><INPUT type=text name=tdob></TD></TR>

  <TR><td></td>
    <TD height = 45><P align=left><font color = blue size = 5 face verdana>E-Mail Id</td>
    <TD><INPUT type=text name=temail></TD></TR></P>

    <TR><td></td>
    <TD height = 45>
      <P align=left><font color = blue size = 5 face verdana>Phone:</P></TD>
    <TD><INPUT type=text name=tphone></TD></TR>

   <TR><td></td>
    <TD height = 45>
      <P align=left><font color = blue size = 5 face verdana>City:</P></TD>
    <TD><INPUT type=text name=tcity></TD></TR></TABLE>

<P align=center><INPUT id=submit1 name=submit1 type=submit value=ADD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<INPUT id=reset1 name=reset1 type=reset value=CLEAR></P>
<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>
</form>
</BODY>
</HTML>


