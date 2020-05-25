<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>


<%  String userid = session.getAttribute("userid")+"";
    String uname = session.getAttribute("uname")+"";
    String empid = request.getParameter("empid"); 
	int id=Integer.parseInt(empid);
    String key = request.getParameter("empkey"); 
    String doj = request.getParameter("doj"); 
%>

<HTML>
<HEAD>
<title> Add Employee</title>
</HEAD>
<BODY bgColor=skyblue >

<% if(userid.equals("admin")) { %>
<jsp:include page="adminmainscreen.jsp" flush="true"/>
<% } else  { %>  <jsp:include page="conferencemain.jsp" flush="true"/>
<% } %>
<% try {
           PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("insert into empdetails values(?,?,?,?,?)");   
           pstmt.setInt(1,id);
           pstmt.setString(2,key);
           pstmt.setString(3,"n");
           pstmt.setString(4,doj);
           pstmt.setString(5,null);

           int c = pstmt.executeUpdate();

           out.println("<br><br><br><center><h2> Successfully Added </h2></center>");
           out.println("<br><br><br><center><a href = 'adminmainscreen.jsp'><img src = images/home5.jpg border=0></a></center>");
           
           if(pstmt != null)
               pstmt.close();
             con.close();
         }
          catch(Exception e) {
           e.printStackTrace();
             out.println("ERROR: "+ e + "\n");
           }
%>
</BODY>
</HTML>