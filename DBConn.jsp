<%@page import="java.sql.*" %>
<%
	Connection con=null;
	try{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:GCM","gcmedia","gcmedia");
	}catch(Exception e)
	{ e.printStackTrace();}
%>