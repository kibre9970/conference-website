import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;
public class addconf extends HttpServlet
{
  public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException
	{
		 res.setContentType("text/html");
		PrintWriter out=res.getWriter();
		String[] str=null;
		//ne
		String str1=req.getParameter("Empname");
		String str2=str1;


		//ne
		Connection con;
		Statement st;
		ResultSet rs;
		try
		{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:netConference");
		st=con.createStatement();
		st.executeUpdate("delete * from necdata2");
		st.close();

		 int k=0;
		if((str1!=null)&&!(str1.equals("")))
		{
			StringTokenizer stk=new StringTokenizer(str1,"!");
			while(stk.hasMoreTokens())
			{
				st=con.createStatement();
				st.executeUpdate("insert into necdata2 values('"+stk.nextToken()+"')");
				st.close();
				k++;

			}

		}

		str=new String[k];
        int l=0;
        System.out.println("str2-----"+str2);
		if((str2!=null)&&!(str2.equals("")))
		{
			StringTokenizer stk=new StringTokenizer(str2,"!");
			while(stk.hasMoreTokens())
			{
			  String data=stk.nextToken();
			  System.out.println("data---"+data);
               str[l]=data;
              System.out.println("next token---"+str[l]);
				l++;
			}

		}




/*		for(int z=0;z<str.length;z++)
		{
		System.out.println(str[z]);
		st=con.createStatement();
		st.executeUpdate("insert into necdata2 values('"+str[z]+"')");
		st.close();
	    }  */
	  }catch(Exception ee)
	  {
		  ee.printStackTrace();
	  }


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
		for(int i=0;i<str.length;i++)
		{
	    out.println("<option value="+str[i]+">");
		out.println(str[i]);
		out.println("</option>");
		}
		out.println("</select>");
		out.println("</td>");
		out.println("</tr>");
		out.println("</table>");
		out.println("</form>");
		out.println("</body>");
		out.println("</html>");
}
}