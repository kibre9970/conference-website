<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>

<%  String userid = session.getAttribute("userid")+"";
    String uname = session.getAttribute("uname")+"";
    int id = 0;
%>

<HTML>
<HEAD>
<title> Add Employee </title>
<script language="javascript">
   function use()
   {
      frm.empkey.focus();
   }

function check()
{
   var k=frm.empkey.value.length; 
   var l=frm.doj.value.length; 
   if(k<=0)
   {
		alert('Enter Emp Key');
		frm.empkey.value=""; 
		frm.empkey.focus();
		return false;
   }
   else  if(l<=0)
   {
		alert('Enter DOJ');
		frm.doj.value=""; 
		frm.doj.focus();
		return false;
   }
   else  return true;
}
  </script>

</HEAD>
<BODY bgColor=skyblue onLoad="use()" >
<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>
<% try {
           PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("select max(empid) from empdetails");   
           ResultSet rs1 = pstmt.executeQuery();
           if(rs1.next())
           {
             id = rs1.getInt(1);             
             id++; 
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
<FORM  ACTION = "addemp2.jsp" name = frm onsubmit="return check()" method = post>
  <H2 align=center><FONT color="brown" face=Verdana><U>Add Employee</U></FONT></H2><br>
  <P align=center>
  <TABLE width="39%"  border=0 align="center" cellPadding=1 cellSpacing=1>
     <TR> 
        <TD width="134" height = 50> 
        <font color = blue size = 5 face verdana>Employee Id:</font></TD>
    <TD width="159" align = left><font color = red size = 5 face verdana><%= id%></font></TD></TR>
        <input type = hidden name = empid value=<%= id%>>
    <TR> 
        <TD width="134" height = 50> 
        <font color = blue size = 5 face verdana>Emp Key:</font></TD>
    <TD width="159" align = left><INPUT type = text name=empkey maxlength="25"></TD></TR>
  <TR>
      <TD height = 45> <font color="blue" size="5" face="Verdana">Date of Joining:</font></TD>
    <TD><INPUT name=doj type = text maxlength="10"></TD></TR>
</TABLE>
  <P align=center> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
    <input type=image src = images/addemp.jpg>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </P>
<P align=center>&nbsp;</P>
<P align=center>&nbsp;</P>
</form>
</BODY>
</HTML>