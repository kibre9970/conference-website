<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 


<%  String userid = session.getAttribute("userid")+"";
    String uname = session.getAttribute("uname")+"";
 %>

<HTML>
<HEAD>
<title> Create Room </title>
<script language="javascript">
   function use()
   {
      frm.rname.focus();
   }

function check()
{
   var k=frm.rname.value.length; 
   var l=frm.rin.value.length; 
   var name = frm.rname.value;
   if(k<=0)
   {
		alert('Enter Room Name');
		frm.rname.value=""; 
		frm.rname.focus();
		return false;
   }
   else  if(l<=0)
   {
		alert('Enter Room key');
		frm.rin.value=""; 
		frm.rin.focus();
		return false;
   }
   else if(isNotAlphabets(name))
   {
     alert('Room Name Should contain only alphabets and _');
     frm.rname.value=""; 
     frm.rname.focus();
     return false;

   } 
   else  return true;
}
function isNotAlphabets(str)
{
   for (var i = 0; i < str.length; i++)
   {
      var ch = str.substring(i, i + 1);
      if((ch < 'a' || 'z' < ch) && (ch < 'A' || 'Z' < ch)) 
      {
        return true;
      }
   }
   return false;
}

  </script>

</HEAD>
<BODY bgColor=skyblue onLoad="use()" >


<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>



<FORM  ACTION = "createroom2.jsp" name = frm onsubmit="return check()" method = post>

  <H4 align=center><FONT color="#0066CC" face=Verdana, Arial, Helvetica, sans-serif><U>CREATE 
    CONFERENCE ROOM</U></FONT></H4><br>
  <P align=center>
  <TABLE 
  width="39%"  border=0 align="center" cellPadding=1 cellSpacing=1>
    <TR> <TD width="134" height = 50> 
        <font color = #CC3366 size = 5 face verdana> Room Name:</font></TD>
    <TD width="159" align = left><INPUT type = text name=rname maxlength="25"></TD></TR>


  <TR>
      <TD height = 45> <font color="#CC0066" size="5" face="Verdana, Arial, Helvetica, sans-serif">Room Key:</font></TD>
    <TD><INPUT name=rin type =password maxlength="20"></TD></TR>



    
</TABLE>

  <P align=center> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
    <input type=submit name=submit1  value=Create >
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </P>
<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>
</form>
</BODY>
</HTML>


