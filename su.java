import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;
public class su extends HttpServlet
{
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException 
	{
		res.setContentType("text/html");
		PrintWriter out=res.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title> Server: User List Screen </title>");
		out.println("</head><body>");	
		out.println("<h2> <center>");
		out.println("NEC Employee Details ");
		out.println("</center> </h2>");
		out.println("<br>");
		out.println("<br>");
		Properties props=new Properties();
		query("sun.jdbc.odbc.JdbcOdbcDriver","jdbc:odbc:netConference",props,"select Empname,Dateandtime,Emailid from necdata",out);
		out.println("<br>");
		out.println("<br>");
		out.println("<center>");
		out.println("<A HREF='http://localhost:8080/servlet/sadduser'>Please Click Here To add employees to Conference</A>");
		out.println("</center>");
		out.println("</html>");
		out.flush();
  }
private boolean query(String drivername,String connectionURL,Properties props,String query,PrintWriter out)
	{
		boolean r=true;
		Connection con;
		Statement st;
		ResultSet rs;
		long start=System.currentTimeMillis();
        int rowcount=0;
		try
			{
				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				con=DriverManager.getConnection("jdbc:odbc:netConference");
				st=con.createStatement();
				rs=st.executeQuery("select * from necdata");
				rowcount=formatTable(rs,out);
				while(rs.next())
				{
								  out.println(rs.getString(1));
				  				  out.println(rs.getString(2));
								  				 out.println(rs.getString(3));
												  }
		
			}
			catch(Exception ex)
			{
				out.println(" inException! ");
				ex.printStackTrace();
				r=false;
			}
			return r;
			}
			
				private int formatTable(ResultSet rs,PrintWriter out) throws Exception
				{
					int rowcount=0;
					out.println("<center> <table border>");
					ResultSetMetaData rsmd=rs.getMetaData();
					int columncount=rsmd.getColumnCount();
					out.println("<tr> ");
					for(int i=0; i<columncount;i++)
					{
						out.println("<th>" +rsmd.getColumnLabel(i+1)+ "</th>");
					}
					out.println("</tr>");
					while(rs.next())
					{
						rowcount++;
						out.println("<tr>");
						for(int i=0; i<columncount; i++)
						{
						out.println("<td>" +rs.getString(i+1) + "</td>") ;
						}
						out.println("</tr>");
					}
					out.println("</table> </center>");
					return rowcount;
				}
		}