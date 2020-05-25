<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page session="true" %>


<%  String userid = session.getAttribute("userid")+"";
    String uname = session.getAttribute("uname")+"";  %>

      

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0046)http://www.steves-templates.com/templates.html -->
<HTML><HEAD>

<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK 
href="images/conferencemain_files/style.css" type=text/css 
rel=stylesheet>
<META content="MSHTML 6.00.2900.2180" name=GENERATOR>
<style>
 a {
 text-decoration:none;
  }
</style>
<script language="JavaScript">
<!--
function mmLoadMenus() {
  if (window.mm_menu_0521120203_0) return;
                                    window.mm_menu_0521120203_0 = new Menu("root",116,22,"Verdana, Arial, Helvetica, sans-serif",12,"#000000","#000000","#CCCCCC","#00CCFF","left","middle",5,2,1000,-5,7,true,true,true,0,true,true);
  mm_menu_0521120203_0.addMenuItem("Login&nbsp;Room","location='loginroom.jsp'");
  mm_menu_0521120203_0.addMenuItem("Create&nbsp;Room","location='createroom.jsp'");
  mm_menu_0521120203_0.addMenuItem("My&nbsp;Rooms","location='myrooms.jsp'");
   mm_menu_0521120203_0.fontWeight="bold";
   mm_menu_0521120203_0.hideOnMouseOut=true;
   mm_menu_0521120203_0.bgColor='#555555';
   mm_menu_0521120203_0.menuBorder=1;
   mm_menu_0521120203_0.menuLiteBgColor='#FFFFFF';
   mm_menu_0521120203_0.menuBorderBgColor='#777777';

            window.mm_menu_0521151457_0 = new Menu("root",128,22,"Verdana, Arial, Helvetica, sans-serif",12,"#000000","#000000","#CCCCCC","#00CCFF","left","middle",5,2,1000,-5,7,true,true,true,0,true,true);
  mm_menu_0521151457_0.addMenuItem("My&nbsp;Profile","location='myprofile.jsp'");
  mm_menu_0521151457_0.addMenuItem("Others&nbsp;Profiles","location='viewprofile.jsp'");
  mm_menu_0521151457_0.addMenuItem("Change&nbsp;Pwd","location='changepass.jsp'");
   mm_menu_0521151457_0.fontWeight="bold";
   mm_menu_0521151457_0.hideOnMouseOut=true;
   mm_menu_0521151457_0.bgColor='#555555';
   mm_menu_0521151457_0.menuBorder=1;
   mm_menu_0521151457_0.menuLiteBgColor='#FFFFFF';
   mm_menu_0521151457_0.menuBorderBgColor='#777777';

mm_menu_0521151457_0.writeMenus();
} // mmLoadMenus()
//-->
</script>
<script language="JavaScript" src="mm_menu.js"></script>
</HEAD>
<BODY bottomMargin=0 leftMargin=0 
background="images/conferencemain_files/pagebg.jpg" topMargin=0 
rightMargin=0 marginwidth="0" marginheight="0">
<script language="JavaScript1.2">mmLoadMenus();</script>
<CENTER>
  <TABLE height=80 cellSpacing=0 cellPadding=0 width=776 border=0>
    <TBODY>
      <TR vAlign=top> 
        <TD width=18 height="80"><IMG height=78 alt="" 
      src="images/conferencemain_files/topleft1.jpg" width=18 
    border=0></TD>
        <TD width=1>&nbsp; </TD>
      <!--  <TD width=63><img src="photos/<%= userid%>.jpg" width="75" height="80" hspace="0" border="0" align="baseline"></TD> -->
        <td width="676" valign="bottom" 
    background="images/conferencemain_files/top2.jpg"> <p>&nbsp;</p>
          <DIV style="PADDING-TOP: 8px" align=center><font color="#FF3333" size="4"><strong>Welcome 
            <%= uname%></strong></font></DIV></td>
        <TD width=18><IMG height=78 alt="" 
      src="images/conferencemain_files/topright1.jpg" width=18 
    border=0></TD>
      </TR>
    </TBODY>
  </TABLE>
  <TABLE height=6 cellSpacing=0 cellPadding=0 width=776 border=0>
    <TBODY>
      <TR vAlign=top> 
        <TD width=18><IMG height=6 alt="" 
      src="images/conferencemain_files/topleft2.jpg" width=18 
    border=0></TD>
        <TD width="100%" 
    background="images/conferencemain_files/topbg2.jpg"><IMG height=6 
      alt="" src="images/conferencemain_files/topbg2.jpg" width=9 
      border=0></TD>
        <TD width=18><IMG height=6 alt="" 
      src="images/conferencemain_files/topright2.jpg" width=18 
    border=0></TD>
      </TR>
    </TBODY>
  </TABLE>
  <TABLE height=30 cellSpacing=0 cellPadding=0 width=776 border=0>
    <TBODY>
      <TR vAlign=center> 
        <TD width=18><IMG height=30 alt="" 
      src="images/conferencemain_files/topleft3.jpg" width=18 
    border=0></TD>
        <TD width=740 
      background="images/conferencemain_files/topbg3.jpg"><TABLE 
      cellSpacing=0 cellPadding=0 width=740 border=0>
            <TBODY>
              <TR> 
                <TD width=80 align="center"> <DIV style="PADDING-LEFT: 25px; PADDING-TOP: 8px" 
            align=center> 
                    <div align="left"></div>
                    <div align="justify"><a href="conferencemain.jsp" target="_top" class="menu">Home</a></div>
                  </DIV></TD>
                <TD width=2 height=30><IMG height=30 alt="" 
            src="images/conferencemain_files/topdiv.jpg" width=2 
            border=0></TD>
                <TD width=89><A class=menu href="addressbook.jsp"> 
                  <DIV style="PADDING-TOP: 8px" align=center><font color="#666666">Addresses</font></DIV>
                  </A></TD>
                <TD width=2 height=30><IMG height=30 alt="" 
            src="images/conferencemain_files/topdiv.jpg" width=2 
            border=0></TD>

                <TD width=90 ><A class=menu  href="#"> </A> 
                     <a href="#" name="link2" id="link1" onMouseOver="MM_showMenu(window.mm_menu_0521120203_0,0,25,null,'link2')" onMouseOut="MM_startTimeout();"> 
                  <div style="PADDING-TOP: 8px" align=center> <font color="#666666" size="3"><b>Conference</b></font></div></a></TD>
                <TD width=2 height=30><IMG height=30 alt="" 
            src="images/conferencemain_files/topdiv.jpg" width=2 
            border=0></TD>

                <TD width=56><A class=menu 
            href="offline.jsp"> 
                  <DIV style="PADDING-TOP: 8px" align=center>Offline</DIV>
                  </A></TD>
                <TD width=2 height=30><IMG height=30 alt="" 
            src="images/conferencemain_files/topdiv.jpg" width=2 
            border=0></TD>
                <TD width=90><A class=menu href="userstatus.jsp"> 
                  <DIV style="PADDING-TOP: 8px" align=center>View Status</DIV>
                  </A></TD>
                <TD width=2 height=30><IMG height=30 alt="" 
            src="images/conferencemain_files/topdiv.jpg" width=2 
            border=0></TD>

                <TD width=70><A class=menu  href="#"> </A>  
                    <a href="#" name="link4" id="link3" onMouseOver="MM_showMenu(window.mm_menu_0521151457_0,0,25,null,'link4')" onMouseOut="MM_startTimeout();">
                     <DIV style="PADDING-TOP: 8px" align=center> <font color="#666666" size="3"><b>Options</b></font></div></a></TD>
                <TD width=2 height=30><IMG height=30 alt="" 
            src="images/conferencemain_files/topdiv.jpg" width=2 
            border=0></TD>

                <TD width=74><A class=menu href="Searchcontact.jsp"> 
                  <DIV style="PADDING-TOP: 8px" align=center>Search</DIV>
                  </A></TD>
                <TD width=2 height=30><IMG height=30 alt="" 
            src="images/conferencemain_files/topdiv.jpg" width=2 
            border=0></TD>
                <TD width=80 align = right> <DIV style="PADDING-RIGHT: 20px; PADDING-TOP: 8px"> 
                    <div align="right"><A class=menu 
            href="logout.jsp"> Logout</A> </div>
                  </DIV></TD>
              </TR>
            </TBODY>
          </TABLE></TD>
        <TD width=18><IMG height=30 alt="" 
      src="images/conferencemain_files/topright3.jpg" width=18 
    border=0></TD>
      </TR>
    </TBODY>
  </TABLE>
</center>
<br><br>
</BODY></HTML>
