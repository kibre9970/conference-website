<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 

<jsp:useBean id="user" class="SessionData" scope="session"/>
<jsp:setProperty name="user" property="*"/> 

  <%	            
	   /*String userid = request.getParameter("uid");
  	   String uname = request.getParameter("uname"); */

out.println("user.getuname()");

out.println("user.getuserid()");

         out.println("<html>");
	   out.println("<head>");
	   out.println("</head>");
	   
         out.println("<FRAMESET ROWS='26%,*' border='0' noresize>");
	   out.println("<FRAME SRC=\"conferencemain.jsp?userid=" + userid+"&uname="+uname + "\" NAME='f1' scrolling='no'>");
  	   out.println("<FRAME SRC='lowerframe.jsp' NAME='f3'>");
	   out.println("</FRAMESET>");
         out.println("</FRAMESET>");

         out.println("</html>");
     


%>