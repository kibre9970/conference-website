
<%  String userid = session.getAttribute("userid")+"";
    String uname = session.getAttribute("uname")+"";  %>


<HTML>
<head>
<title> User Status </title>
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



<form method="POST"  action='showstatus.jsp' name=frm onsubmit="return check()">


<table border=3 align="center" width=300>
<td bgcolor=cyan> <FONT  face="verdana" size=5 COLOR=red><center>Check User Status</CENTER></font></td>
</table>

  <br><br>
<TABLE border=0 align="center">
<TR>
		<TD align = left><FONT  face="comic sans ms" size="4" COLOR="#006600">UserId   : &nbsp;&nbsp;&nbsp;</font>
<input type=text name=suserid size=15 maxlength=15>

		</TD>
</tr>
<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
</table>
<table border=0 align="center">

<tr>
<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<td align = center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;<input type="image" src = 'images/getstatus.jpg'> </td>
</tr>

</TABLE>
<br><br>
<table border = 2 width = 300 align = center bgcolor = cyan><tr height = 10 >
<td> 
</td></tr></table>

</form>


</BODY>
</HTML>

