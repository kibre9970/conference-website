import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
public class killer extends HttpServlet
{
   public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException
   {
       String info=req.getParameter("info");
	   if(info!=null)
	   {
			getInfo(info,req,res);
			return;
		}
		 res.setContentType("text/html");
		 res.setHeader("Expires","Tues 01 jan 1999 00.00.00 gmt");
		 PrintWriter out=res.getWriter();
		 out.println("<html>");
		 out.println("<head>");
		 out.println("<title> servlet session killer </title>");
		 out.println("</head>");
		 out.println("<body>");
		 out.println("This Page Lists All Of The Current Session");
		 out.println("Information. Check The Session and Press");
		 out.println("'kill' to remove the sesion. Warning!");
		 out.println("Killing an active session may cause problems");
		 out.println("for some cliens");
		 out.println("<form method=Get action=\""+req.getRequestURI()+"\">"); 
		 out.println("<center> <table border>");
		 out.println("<tr><th> kill </th> </tr>");
		 HttpSession session=req.getSession(true);
		 HttpSessionContext context=session.getSessionContext();
		 String tokill[]=req.getParameterValues("id");
		 if(tokill!=null)
		 {
			for(int i=0; i<tokill.length;i++)
			{
				HttpSession cursession=context.getSession(tokill[i]);
				if(cursession!=null)
				{
					getServletContext().log("killing session"+cursession.getId());
					cursession.invalidate();
				}	
			}
		}
		Enumeration enum=context.getIds();
		while(enum.hasMoreElements())
		{
			String sessionID=(String)enum.nextElement();
			out.println("<tr><td><input type=checkbox name=id"+" value=\""+sessionID+"\"></td></tr>");
			out.println("<td><a href=\""+req.getRequestURI()+"?info="+sessionID+"\">"+sessionID+"</td>");
			String time="";
			HttpSession cursession=context.getSession(sessionID);
			if(cursession!=null)
			{
				long last=cursession.getLastAccessedTime();
				time=(new Date(last).toString());
			}
			out.println("<td>"+time+"</td></tr>");
		}
		out.println("</table> <br>");
		out.println("<input type=submit"+"value=\"kill marked sessions\">");
		out.println("</center></form>");
		out.println("</body>");
		out.println("</html>");
		out.flush();
	}
	public void getInfo(String id,HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		 res.setContentType("text/html");



		 res.setHeader("Expires","Tues 01 jan 1999 00.00.00 gmt");
		 PrintWriter out=res.getWriter();
		 out.println("<html>");
		 out.println("<head>");
		 out.println("<title> servlet session information</title>");
		 out.println("</head>");
		 out.println("<body>"); 	
		 HttpSession session=req.getSession(true);
		 HttpSessionContext context=session.getSessionContext();
	     HttpSession cursession=context.getSession(id);
         if(cursession==null)
		 {
		   out.println("session"+id+"not found");
		  }
			else
			{
				out.println("<center><h1> information for session"+id+"</h1>");
				out.println("<table border>");
				long creationTime=cursession.getCreationTime();
				out.println("<tr><td>creation time</td> <td>"+(new Date(creationTime))+"</td></tr>");
				long lastTime=cursession.getLastAccessedTime();
				out.println("<tr><td>last access time</td><td>"+(new Date(lastTime))+"</td></tr>");
				out.println("</table>");
				String names[]=cursession.getValueNames();
				if((names!=null) && (names.length > 0))
				{
					out.println("<br> <h1> bound objects </h1>");
					out.println("<table border>");
					for(int i=0;i<names.length;i++)
					{
						out.println("<tr><td>"+names[i]+"</td><td>"+cursession.getValue(names[i])+"</td></tr>");
					}
					out.println("</table>");
				}
				out.println("</center>");
				}
				out.println("</body>");
				out.println("</html>");
				out.flush();
	}
}
