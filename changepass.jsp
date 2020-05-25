<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 

<%
    String userid = session.getAttribute("userid")+"";
    String uname = session.getAttribute("uname")+"";  
%>

<HTML>
<head>
<title> User Status </title>
<script language="javascript">
   function use()
   {
      frm.opass.focus();
   }

function check()
{
   k=frm.opass.value.length; 
   l=frm.npass.value.length; 
   m=frm.cpass.value.length; 
   var str1;
   var str2;   

   if(k<=0)
   {
		alert('Enter  Old Password');
		frm.opass.value=""; 
		frm.opass.focus();
		return false;
   }
   else if(l <= 0)
        {
		alert('Enter  New Password');
		frm.npass.value=""; 
		frm.npass.focus();
		return false;
         }
   else if(m <= 0)
        {
		alert('Confirm New Password');
		frm.cpass.value=""; 
		frm.cpass.focus();
		return false;
         }
   else {
           str1 = frm.npass.value;
           str2 = frm.cpass.value;  
           if(str1 != str2)
           {
              alert('Passwords typed do not match, please re-enter your password.\n\n');
              return false;
            }       
        } 
   return true;
}
  </script>
</head>
<BODY  bgcolor = lightcyan onload="use()" >


<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>



<form action='changepass2.jsp?userid=<%= userid%>&uname=<%=uname%>'name=frm onsubmit="return check()" method = post>


<table border=3 align="center" width=400>
<td bgcolor=lightgreen> <FONT  face="verdana" size=5 COLOR=red><center>Change Password</CENTER></font></td>
</table>

  <br><br>
<TABLE border=0 align="center">
<TR>
   <TD><FONT  face=verdana size="4" COLOR="#006600">Enter Old Password   : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          </font><input type=password name=opass size=15 maxlength=20>
   </TD></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr> 
   <TD><FONT  face=verdana size="4" COLOR="#006600">Enter New Password : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </font><input type=password name=npass size=15 maxlength=20>
  </TD></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr>
   <TD><FONT  face=verdana size="4" COLOR="#006600">ReType New Password   : &nbsp;&nbsp;&nbsp;
        </font><input type=password name=cpass size=15 maxlength=20>               

   </TD></tr>

<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
</table>
<table border=0 align="center">

<tr>
<tr></tr><tr></tr><tr></tr>
<td align = center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Change" </td>
</tr>

</TABLE>
<br><br>
<table border = 2 width = 400 align = center bgcolor = lightgreen><tr height = 10 >
<td> 
</td></tr></table>

</form>


</BODY>
</HTML>

