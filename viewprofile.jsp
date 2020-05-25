<%  String userid = session.getAttribute("userid")+"";
    String uname = session.getAttribute("uname")+"";  %>


<HTML>
<head>
<title> View Profile</title>
<script language="javascript">
   function use()
   {
      frm.suserid.focus();
   }

function check()
{
   k=frm.suserid.value.length; 
   if(k<=0)
   {
		alert('Enter  Userid');
		frm.suserid.value=""; 
		frm.suserid.focus();
		return false;
   }
   else  return true;
}
  </script>
</head>
<BODY  bgcolor = ghostwhite onload="use()" >


<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>



<form method="POST"  action='viewprofile2.jsp' name=frm onsubmit="return check()">


<table border=3 align="center" width=300>
<td bgcolor=palegreen> <FONT  face="verdana" size=5 COLOR=midnightblue><center>View Profile</CENTER></font></td>
</table>

  <br><br>
<TABLE border=0 align="center">
<TR>
		<TD><FONT  face="comic sans ms" size="4" COLOR="#006600">UserId   : &nbsp;&nbsp;&nbsp;</font>
<input type=text name=suserid size=15 maxlength=25>

		</TD>
</tr>
<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
</table>
<table border=0 align="center">

<tr>
<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<td align = center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Get Profile" </td>
</tr>

</TABLE>
<br><br>
<table border = 2 width = 300 align = center bgcolor = palegreen><tr height = 10 >
<td> 
</td></tr></table>

</form>


</BODY>
</HTML>

