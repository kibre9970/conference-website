<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>

<%
   String view1 = request.getParameter("view1"); 
         
   String view2 = request.getParameter("view2"); 
         
   String view3 = request.getParameter("view3"); 
         

   String active = request.getParameter("active"); 
         if(active==null)   active="";
   String message = request.getParameter("message"); 
         if(message==null)   message="";
   
   String room = request.getParameter("room"); 

   String user = request.getParameter("user"); 


%>

<html>
<head>
<title>Statistics Page</title>
 </head>
<body> 

<jsp:include page="adminmainscreen.jsp" flush="true"/>

<%
if(view1 != null)
{
try {
           

       if(active.equals("Users"))
       { 
           PreparedStatement pstmt = null;

           pstmt = con.prepareStatement("select * from clientonline");           
           ResultSet rs2 = pstmt.executeQuery();
%>
      <center><h2><u>Active Users</U></h2></center>  
      <center>
      <table border="4" cellspacing="1"  WIDTH="60%">
      <tr><td align = center><b>UserId</b></td><td><b>Login Room</b></td><td><b>Login Time</b></td><td><b>Login Date</b></td></tr>  

  <%         while(rs2.next())
           {
             String tabuserid = rs2.getString(1);
             String troom = rs2.getString(2);
             String tdate = rs2.getString(3); 
             String ttime = rs2.getString(4);  
              
            %>
          
             <tr><td><%=tabuserid %></td><td><%= troom%></td><td><%= ttime %></td><td><%=tdate %></td></tr>  
             
             
           <% } %>
            </table> 
             <br><br>
       <%  

           
           if(pstmt != null)
             pstmt.close();
       } // If end   


        if(active.equals("Rooms"))
       { 
           PreparedStatement pstmt = null;

           pstmt = con.prepareStatement("select * from clientonline");           
           ResultSet rs2 = pstmt.executeQuery();
%>
      <center><h2><u>Active Rooms</u></h2></center>  
      <center>
      <table border="4" cellspacing="1"  WIDTH="20%">
      <tr><td align = center><center><b>Login Room</b></center></td></tr>  

  <%         while(rs2.next())
           {
             String tabuserid = rs2.getString(1);
             String troom = rs2.getString(2);
             String tdate = rs2.getString(3); 
             String ttime = rs2.getString(4);  
             if(troom != null)
             { 
            %>
          
             <tr><td><center><%= troom%></center></td></tr>  
             
             
           <%} } %>
            </table> 
             <br><br>
       <%  

           
           if(pstmt != null)
             pstmt.close();
       } // If end   


         }
          catch(Exception e) {
           e.printStackTrace();
             out.println("ERROR: "+ e + "\n");
           }
 

 
}  

%>



<%

                               

                                    //     View2
if(view2 != null)
{
try {
           

       if(message.equals("Room"))
       { 
           PreparedStatement pstmt = null;

           pstmt = con.prepareStatement("select * from " + room);    
  
    
           ResultSet rs2 = pstmt.executeQuery();
%>
      <center><h2><u>Messages in <%= room%></u></h2></center>  
      <center>
      <table border="4" cellspacing="1"  WIDTH="60%">
      <tr><td align = center><center><b>UserId</b></center></td><td><center><b>Message</b></center></td></tr>  

  <%         while(rs2.next())
           {
             String tuserid = rs2.getString(1);
             String ttmessage = rs2.getString(2);
              
            %>
          
             <tr><td><%=tuserid %></td><td><%=ttmessage %></td></tr>               
             
           <% } %>
            </table> 
             <br><br>
       <%  

           
           if(pstmt != null)
             pstmt.close();
       } // If end   


        if(message.equals("UserId"))
       { 
           PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("select * from "+ room +" where userid = ?");           
           pstmt.setString(1,user);

           ResultSet rs2 = pstmt.executeQuery();
%>
      <center><h2><u>Messages in <%= room%> By <%= user%> </u></h2></center>
      <center>
      <table border="4" cellspacing="1"  WIDTH="20%">
      <tr><td align = center><center><b>Message</b></center></td></tr>  

  <%         while(rs2.next())
           {
             String mes = rs2.getString(2);
            %>
          
             <tr><td><center><%= mes%></center></td></tr>  
             
             
           <%}  %>
            </table> 
             <br><br>
       <%  

           
           if(pstmt != null)
             pstmt.close();
       } // If end   


         }
          catch(Exception e) {
           e.printStackTrace();
             out.println("ERROR: "+ e + "\n");
           }
 

}  

%>

                                 
<%

                                       // view3 
if(view3 != null)
{
try {
           
           PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("select * from empdetails");           
           ResultSet rs2 = pstmt.executeQuery();
%>
      <center><h2><u>Employees</U></h2></center>  
      <center>
      <table border="4" cellspacing="1"  WIDTH="60%">
<tr><td align = center><b>EmpId</b></td><td><b>Key</b></td><td><b>Account</b></td><td><b>DOJ</b></td><td><b>UserId</b></td></tr>  

  <%         while(rs2.next())
           {
             String tempid = rs2.getString(1);
             String tkey = rs2.getString(2);
             String tstatus = rs2.getString(3); 
             String tdoj = rs2.getString(4);  
             String tuserid = rs2.getString(5);  
 
            %>
    <tr><td><%= tempid%></td><td><%= tkey%></td><td><%= tstatus%></td><td><%=tdoj%></td><td><%=tuserid%></td></tr> 
           <% } %>
            </table> 
             <br><br>
       <%  
           if(pstmt != null)
             pstmt.close();
         }
          catch(Exception e) {
           e.printStackTrace();
             out.println("ERROR: "+ e + "\n");
          }
}  

%>

<a href = statistics.jsp><img src=images/goback.jpg border=0> </a>
</body>
</html>