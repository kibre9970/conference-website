import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class ss extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws  IOException,ServletException
	{
	  res.setContentType("text/html");
	  PrintWriter out=res.getWriter();
	  out.println("<html>");
	  out.println("<head>");
	  out.println("</head>");
      String id=req.getParameter("cid");
	  String pw=req.getParameter("pwd");
	  if(id.equals("nec") && pw.equals("cen"))
	  {
	         out.println("<body>");
			 out.println("<br>");
			 out.println("You Are  The Company System Administrator");
			 out.println("<br>");
			 out.println(" Get the list of existed employees, ");
			  out.println("<br>");
			  out.println("Add  The Neccessry Persons ToConference");
			  out.println("<br>");
			   out.println("<A HREF='http://localhost:8080/servlet/su'> Go To The List Of Persons </A>");
			   
	}
	else
		{
           out.println("<body >");
			  out.println("<br>");
			   out.println("<Sorry Your Are Not A Valid Person !!!>");
			    out.println("<br>");
				 out.println("<Please Try Again !!!!!!>");
				  out.println("<br>");
				  out.println("<A HREF='/sh.html'> Please Click Here To Login Again </A>");
			}
			out.println("</body>");
			   out.println("</html>");
}
}
