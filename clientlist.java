import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;
public class clientlist extends HttpServlet
{
  public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException
	{
		 res.setContentType("text/html");
		PrintWriter out=res.getWriter();
		Connection con;
		Statement st;
		ResultSet rs;
		out.println("<html>");
		out.println("<head>");
		out.println("<title> Server: Conference list </title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<form>");
		out.println("<br>");
		out.println("<br>");
		out.println("<h1> <center>List Of Conferencing Persons </center> </h1>" );
		out.println("<br>");
		out.println("<br>");
	    out.println("<table border=0>");
		out.println("<tr valign=center>");
    	out.println("<td align=center>");
	   out.println("Emp names");
    	out.println("</td> ");
	    out.println("<td align=center>");
	    out.println("<select name=Empname multiple>");
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
		}
		out.println("</option>");
		}
		catch(Exception e)
		{out.println("Error in.....");
		}
		out.println("</select>");
		out.println("</td>");
		out.println("</tr>");
		out.println("</table>");
		out.println("<A HREF='http://localhost:8080/servlet/conferencescreen2'> Ready To Paricipate in conference </A>");
		out.println("</form>");
		out.println("</body>");
		out.println("</html>");
}
}