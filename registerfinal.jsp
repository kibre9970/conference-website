<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ include file="DBConn.jsp" %>

<%   
     String userid = request.getParameter("userid");
     String empid = request.getParameter("empid");

     String uname = request.getParameter("uname");
     String passwd = request.getParameter("passwd"); 
     String hintq = request.getParameter("hintq"); 
     String hinta = request.getParameter("hinta");
     String fname = request.getParameter("fname"); 
     String mname = request.getParameter("mname"); 
     String lname = request.getParameter("lname"); 
     String address = request.getParameter("address"); 
     String country = request.getParameter("country"); 
     String city = request.getParameter("city"); 
     String state = request.getParameter("state");  
     String zip = request.getParameter("zip");
     String phone = request.getParameter("phone");
     String email = request.getParameter("email");
     String gender = request.getParameter("gender");
     String month = request.getParameter("month");
     String day = request.getParameter("day");
     String year = request.getParameter("year");
     String education = request.getParameter("edu");
     String occupation = request.getParameter("occupation");

 try {
        PreparedStatement pstmt = null;
        PreparedStatement pstmt2 = null;
        PreparedStatement pstmt3 = null;
        PreparedStatement pstmt4 = null;
        pstmt = con.prepareStatement("insert into password values(?,?,'n')"); 
        pstmt.setString(1,userid);                  
        pstmt.setString(2,passwd);                  
        int count = pstmt.executeUpdate();
        pstmt2 = con.prepareStatement("insert into security values(?,?,?)"); 
        pstmt2.setString(1,userid);                  
        pstmt2.setString(2,hintq);                  
        pstmt2.setString(3,hinta);                  
        int count2 = pstmt2.executeUpdate();
		pstmt3 = con.prepareStatement("insert into userdetails values(?,?,?,?,?,?,?,?,?,?,?,?)"); 
        pstmt3.setString(1,userid);                  
        pstmt3.setString(2,fname+" "+mname+" "+lname);                  
        pstmt3.setString(3,address);                  
        pstmt3.setString(4,zip);                  
        pstmt3.setString(5,phone);                  
        pstmt3.setString(6,email);                  
        pstmt3.setString(7,gender);                  
        pstmt3.setString(8,education);                  
        pstmt3.setString(9,country);                  
        pstmt3.setString(10,city);                  
        pstmt3.setString(11,state);                  
        pstmt3.setString(12,day+"-"+month+"-"+year);                  
        int count3 = pstmt3.executeUpdate(); 
        pstmt4 = con.prepareStatement("update empdetails set ac_status = 'y', userid= ? where empid = ?");        
        pstmt4.setString(1,userid);                  
        pstmt4.setString(2,empid); 
        int count4 = pstmt4.executeUpdate();
 %>
        <html>
        <head>
        <title> Registration Process</title>
        </head>
        <body>
          
            
        <br><br><br><br><br><br>  
        <font color = green size = 6><center> Successfully Registered </center></font>
        <br><br><br>
        <center><a href = Client.html><img src='images/login.jpg' border=0></a></center>
          
        </body> 
        </html>
   <%    if(pstmt != null)
               pstmt.close();
               con.close();
         }
          catch(Exception e) {
           e.printStackTrace();
             out.println("ERROR: "+ e + "\n");
           }        
           
%>