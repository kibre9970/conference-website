import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class conferencescreen2 extends HttpServlet
{
   public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException
   {
       doPost(req,res);
	}
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException
	{
	   	     res.setContentType("text/html");
	   	     String txt=req.getParameter("ta1");
	   	     PrintWriter out=res.getWriter();
	   	     if((txt!=null) && !(txt.equals("")))
	   	     {
		       storedata.setData(txt+"\n");

		     }



			 Connection con;
			 Statement st;
			 ResultSet rs;
			 out.println("<html>"); //<META HTTP-EQUIV='REFRESH' CONTENT='25'>
			 out.println("<head>");
			 out.println("<title> Conferencing Screen </title>");
			 out.println("<script language='JavaScript'>");
			 out.println("function send1()");
			 out.println("{ f11.ta1.value=f11.t1.value; document.f11.submit(); } function servlt(){document.f11.submit();}</script>");
			 out.println("</head>");
			 out.println("<body>"); //onLoad='servlt()'
			 out.println("<form name=f11 action='http://localhost:8080/servlet/conferencescreen2' method=Get>");
			 out.println("<br>");
			 out.println("<center>");
			 out.println("<h1> Conference Screen </h1>");

			 out.println("<table><tr><td><b>User Data</b></td>");
			 out.println("<td><b>    Users </b></td>");
			 out.println("<td><b>Conferenece Data</b></td>");
			 out.println("</tr><tr>");

			 out.println("<td><textarea rows=10 cols=10  name=ta1>");
			 if(txt!=null)
			 out.println(txt);
			 out.println("</textarea></td>");

			out.println("<td><select name=Empname multiple>");
	 		try
		{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:netConference");
			st=con.createStatement();
			rs=st.executeQuery("select * from necdata2");
		while(rs.next())
		{
			String str=rs.getString(1);
			out.println("<option value="+str+">");
			out.println(str);
			out.println("</option>");
		}
		}
		catch(Exception e)
		{out.println("Error in.....");
		}
		out.println("</select></td>");
        out.println("<td><textarea rows=10 cols=15 name=ta2>");
        out.println(storedata.getData());
        out.println("</textarea></td></tr></table>");

			 out.println("<br>");
			 out.println("<br>");
			 out.println("<input type=text size=30 name=t1>");
			 out.println("<br>");
			 out.println("<br>");
			 out.println("<input type=button name=send value='CONFERENCE'  onClick='send1()'>");
	//		 out.println("<input type=button name=add value='   ADD   '>");
	//		 out.println("<input type=button name=close value=' CLOSE  '>");
			 out.println("</center>");
			 out.println("</form>");
			 out.println("</body>");
			 out.println("</html>");
}
}
