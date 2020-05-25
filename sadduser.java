import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class sadduser extends HttpServlet
{
  public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException
  {
     doPost(req,res);
	}
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException
	{
	res.setContentType("text/html");
	PrintWriter out=res.getWriter();
	Connection con;
	Statement st;
	ResultSet rs;
	out.println("<html>");
	out.println("<head>");
	out.println("<title> Server:User add form </title>");
	out.println("<script language='javascript'>");
    out.println("function showSelection(objectName,objval)");
	out.println("{ var selt=\"\";");
    out.println("for(var i=0;i<objectName.length;i++)");
	out.println("{");
	out.println("if(objectName.options[i].selected)");
	out.println("{");
	out.println("selt+=objectName.options[i].text+'!'");
	out.println("}}");
	out.println("document.location.href='http://localhost:8080/servlet/addconf?Empname='+selt;");
	out.println("}");
	out.println("</script>");
    out.println("</head>");
    out.println("<body ><form method=Get>");
	out.println("<br>");
	out.println("<br>");
	out.println("<h1> <center> <b> <i> Add Users To Conference </i></b></center></h1>");
	out.println("<br>");
	out.println("<br>");
	out.println("<table border=0>");
	out.println("<tr valign=center>");
	out.println("<td align=center>");
	out.println("Emp names");
	out.println("</td> ");
	out.println("<td align=center>");
	out.println("<select name=Empname size=10 multiple>");
	try
	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:netConference");
	st=con.createStatement();
	rs=st.executeQuery("select * from necdata");
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
	out.println("<br>");
	out.println("<br>");
	out.println("<input type=button name=submit  value=ShowSelectedItems onclick='showSelection(this.form.Empname)'>");
	out.println("<br>");
	out.println("</form></body>");
	out.println("</html>");
	}
}

