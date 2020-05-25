



  <%   String userid = session.getAttribute("userid")+"";
     String uname = session.getAttribute("uname")+"";    %>
 

<HTML>
<head>
<title> Search Contact </title>
<script language="javascript">
   function use()
   {
      frm.sname.focus();
   }

function check()
{
   k=frm.sname.value.length; 
   if(k<=0)
   {
		alert('Enter  User name');
		frm.sname.value=""; 
		frm.sname.focus();
		return false;
   }
   else  return true;
}
  </script>
</head>
<BODY  bgcolor = lightblue onload="use()" >


<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>



<form method="POST"  action='searchcontact2.jsp'  name=frm onsubmit="return check()">


<table border=3 align="center" width=400>
<td bgcolor=hotpink> <FONT  face="verdana" size=5 COLOR=black><center>Search Contact</CENTER></font></td>
</table>

  <br><br>
<TABLE border=0 align="center">
<TR>
		<TD><FONT  face=verdana size="4" COLOR="#006600">Enter Name[with wildcards] : &nbsp;&nbsp;&nbsp;</font>
<input type=text name=sname size=15 maxlength=60>

		</TD>
</tr>
<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
</table>
<table border=0 align="center">

<tr>
<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<td align = center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;<input type="image" src = 'images/getcontact.jpg'> </td>
</tr>

</TABLE>
<br><br>
<table border = 2 width = 400 align = center bgcolor = hotpink><tr height = 10 >
<td> 
</td></tr></table>

</form>


</BODY>
</HTML>

