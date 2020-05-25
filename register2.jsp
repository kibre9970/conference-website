
<% String userid = request.getParameter("userid");
String empid = request.getParameter("empid"); %>


<HTML>
<HEAD><TITLE>Net Conference Registration Page</TITLE>

<SCRIPT language=JavaScript>
function use()
   {
      frm.passwd.focus();
   }
function validate()
{
   k =  frm.passwd.value.length;
   var str =frm.passwd.value;
   var str2 =frm.passwd1.value;

   if(k<=0)
   {
		alert('Enter Password');
		frm.passwd.value=""; 
		frm.passwd.focus();
		return false;
   }
   else if ((str == '') || (str.length < 4)) 
   {
   alert('\nThe PASSWORD field is either empty or less than 4 chars.\n\nPlease re-enter your Password.')
   frm.passwd.focus();
   return false;
   }
   else if (str != str2)
   {
     alert('Passwords typed do not match, please re-enter your passwords.\n\n');
     frm.passwd1.focus();
     return false;
   }
   else if(frm.hintq.value =='')
   {
      alert('The hint question field is empty.');
      frm.hintq.focus();
      return false;
   }
   else if(frm.hinta.value =='')
   {
       alert('The hint answer field is empty.');
       frm.hinta.focus();
       return false;  
   }
   else if(frm.fname.value =='')
   {
      alert('First name field is empty.');
      frm.fname.focus();
      return false;
   }
   else if(frm.lname.value =='')
   {
       alert('Last name field is empty.');
       frm.lname.focus();
       return false;  
   }
   else if(frm.address.value =='')
   {
       alert('Address field is empty.');
       frm.address.focus();
       return false;  
   }
   else if(frm.zip.value =='')
   {
       alert('Zip field is empty.');
       frm.zip.focus();
       return false;  
   }
   else if(frm.phone.value =='')
   {
       alert('Phone number field is empty.');
       frm.phone.focus();
       return false;  
   }
   else if(frm.email.value =='')
   {
       alert('Email field is empty.');
       frm.email.focus();
       return false;  
   }
   else if(frm.edu.value =='')
   {
       alert('Education field is empty.');
       frm.edu.focus();
       return false;  
   }
   else if(frm.occupation.value =='')
   {
       alert('Occupation field is empty.');
       frm.occupation.focus();
       return false;  
   }

   else  return true;
}
</script>
</HEAD>







<BODY bgcolor='#FFFFFF' onload = 'use()'>
<FORM action='registerfinal.jsp?userid=<%= userid%>&empid=<%= empid%>'  method=post name = frm onsubmit = "return validate()">

 
  <table border = 3 width = 550 align = middle><tr><td bgcolor = khaki>
<FONT  face='verdana' size=5 COLOR=red><center><marquee width='397' height='19' 
align='middle' scrolldelay='20' scrollamount='2'><b>Registration Form</b></marquee>
</CENTER></font>
</tr></td></table>

      <TABLE border=0 cellPadding=0 cellSpacing=0 width=550 height='560'>
        <TBODY >

      
        

        <TR>
          <TD height=20 width='144'></TD></TR>

                  

        <TR>
          <TD align=right vAlign=center width=196 height='50'><FONT 
            face='verdana' size=4 color='#1E90FF'>Password: </FONT></TD>
          <TD  width=332 height='50'><font color='#000000'>
          <INPUT maxLength=20 name=passwd  type=password> <STRONG><FONT color=red face='ARIAL, HELVETICA' 
            size=+2>*</FONT></STRONG> <BR></font></TD></TR>
        
        <TR>
          <TD align=right vAlign=center width=196 height='50'><FONT 
             face='verdana' size=4 color='#1E90FF'>Re-Type Password: </FONT></TD>
          <TD  width=332 height='50'><font color='#000000'><INPUT maxLength=20 name=passwd1 
            type=password> <STRONG><FONT color=red face='ARIAL, HELVETICA' 
            size=+2>*</FONT></STRONG> <BR></font></TD></TR>

        <TR><!---------- Password Reminder Question ---------- -->
        <TR>
          <TD width='144' height='21'><font color='#000000'>&nbsp;</font> </TD></TR>
        <TR bgColor=#dfdfdf>
          <TD colSpan=2 width='478' height='18' align = middle><STRONG><FONT face=Arial size=-1 color='#000000'>&nbsp;&nbsp;Password 
            Reminder Question</FONT></STRONG> </TD></TR>
        <TR>
          <TD height=21 width='144'></TD></TR><!---------- Password Reminder Question ---------- -->

        <TR>
          <TD colSpan=2 width='478' height='18'><font color='#000000'><FONT face=Arial 
            size=-1>&nbsp;</FONT><font face='Arial'><FONT 
            size=-1>&nbsp;</FONT><FONT color = green face=Arial 
            size=4>In case you forget your password we would 
            help you to retrieve it. </FONT> </font></font></TD></TR>
        
        <TR>
          <TD align=right vAlign=center width=196 height='50'><FONT 
             face='verdana' size=4 color='#1E90FF'>Hint Question: </FONT></TD>
          <TD vAlign=middle width=332 height='44'><font color='#000000'><INPUT maxLength=100 name=hintq><B><font face='ARIAL, HELVETICA' size='5' color='#FF0000'>*</font></B> <BR></font></TD></TR>
        <TR>
          <TD align=right vAlign=center width=196 height='50'><FONT 
            face='verdana' size=4 color='#1E90FF'>Hint Answer: </FONT></TD>
          <TD width=332 height='44'><font color='#000000'><INPUT maxLength=50 name=hinta 
            type=text><B><font face='ARIAL, HELVETICA' size='5' color='#FF0000'>*</font></B> <BR></font></TD></TR><!---------- Tell Us About Yourself ---------- -->
        <TR>
          <TD width='144' height='21'><font color='#000000'>&nbsp;</font> </TD></TR>
        <TR bgColor=#dfdfdf>
          <TD colSpan=2 width='478' height='18' align = middle><STRONG><font color='#000000'><FONT face=Arial size=-1>&nbsp;&nbsp;Tell Us 
            About Yourself</FONT></font></STRONG> </TD></TR>
        <TR>
          <TD height=21 width='144'></TD></TR><!---------- Tell Us About Yourself ---------- -->
        <TR>
          <TD colSpan=2 width='478' height='18'><font face='Arial' color='#000000'><FONT 
            size=-1>&nbsp;&nbsp;</FONT><FONT face=Arial color = green
            size=4>All information provided by you will be kept 
            confidential. </FONT> </font></TD></TR>
        <TR>
          <TD width='144' height='21'><font color='#000000'>&nbsp;</font> </TD></TR>
        <TR>
          <TD align=right vAlign=center width=196 height='50'><FONT 
            face='verdana' size=4 color='#1E90FF'>First Name: </FONT></TD>
          <TD align=left width=332 height='50'><font color='#000000'><INPUT maxLength=20 name=fname> 
            <STRONG><FONT color=red face='ARIAL, HELVETICA' 
            size=+2>*</FONT></STRONG> <BR></font></TD></TR>
        <TR>
          <TD align=right vAlign=center width=196 height='50'><FONT 
            face='verdana' size=4 color='#1E90FF'>Middle Name: </FONT></TD>
          <TD align=left  width=332 height='44'><font color='#000000'><INPUT maxLength=20 name=mname> 
            <FONT face='ARIAL, HELVETICA' size=-1>(Optional)</FONT> <BR></font></TD></TR>
        <TR>
          <TD align=right vAlign=center width=196 height='50'><FONT 
            face='verdana' size=4 color='#1E90FF'>Last Name: </FONT></TD>
          <TD  width=332 height='46'><font color='#000000'><INPUT maxLength=20 name=lname> 
            <STRONG><FONT color=red face='ARIAL, HELVETICA' 
            size=+2>*</FONT></STRONG> <BR></font></TD></TR>
        <TR>
          <TD colSpan=2 width=478 height='1'><font color='#000000'>&nbsp;</font> </TD></TR>
        
        <TR>
          <TD align=right width=196 height='67'><FONT 
           face='verdana' size=4 color='#1E90FF'>Address: </FONT>
            
          </TD>
          <TD  width=332 height='67'><font color='#000000'><INPUT maxLength=120 name=address size='43'> <STRONG><FONT 
            color=red face='ARIAL, HELVETICA' size=+2>*</FONT></STRONG> 
            </font>          
          </TD></TR>



        <TR>
          <TD align=right vAlign=center width=196 height='50'><FONT 
            face='verdana' size=4 color='#1E90FF'>Country: </FONT></TD>
          <TD  width=332 height='50'><font color='#000000'><SELECT name=country> <OPTION selected 
              value=India>India<OPTION value=United States>United States<OPTION 
              value=United Kingdom>United Kingdom<OPTION value=Canada>Canada<OPTION 
              value=Singapore>Singapore<OPTION value=Malaysia>Malaysia<OPTION 
              value=Australia>Australia<OPTION value=Saudia Arabia>Saudia Arabia
           <OPTION value=Others>Others</OPTION></SELECT>  <STRONG><FONT 
            color=red face='ARIAL, HELVETICA' size=+2>*</FONT></STRONG> 
        <BR></font></TD></TR><!--------------------------------- -->

        <TR>
          <TD align=right vAlign=center width=196 height='50'><FONT 
            face='verdana' size=4 color='#1E90FF'>City: </FONT></TD>
          <TD  width=332 height='31'><font color='#000000'><SELECT name=city> <OPTION selected 
              value=''>[Select One]<OPTION value=Ahmedabad>Ahmedabad<OPTION 
              value=Bangalore>Bangalore<OPTION 
              value=Chennai(Madras)>Chennai(Madras)<OPTION 
              value=Cochin>Cochin<OPTION value=Coimbatore>Coimbatore<OPTION 
              value=Delhi>Delhi<OPTION value=Goa>Goa<OPTION 
              value=Hyderabad>Hyderabad<OPTION value=Kanpur>Kanpur<OPTION 
              value=Indore>Indore<OPTION value=Jaipur>Jaipur<OPTION 
              value=Lucknow>Lucknow<OPTION value=Ludhiana>Ludhiana<OPTION 
              value=Madurai>Madurai<OPTION 
              value=Mumbai(Bombay)>Mumbai(Bombay)<OPTION 
              value=Nagpur>Nagpur<OPTION value=NOIDA>NOIDA<OPTION 
              value=Patna>Patna<OPTION value=Pune>Pune<OPTION 
              value=Surat>Surat<OPTION value=Varanasi>Varanasi<OPTION 
              value=Vishakapatnam>Vishakapatnam</OPTION></SELECT>  <STRONG><FONT 
              color=red face='ARIAL, HELVETICA' size=+2>*</FONT></STRONG>&nbsp;</font></TD></TR>
        <TR><!--------------------------------- -->

        
          <TD align=right vAlign=middle width=196 height='50'><FONT 
             face='verdana' size=4 color='#1E90FF'>State: </FONT></TD>
          <TD vAlign=middle width=332 height='50'><font color='#000000'><SELECT name=state> <OPTION selected 
              value=''>[Select One]<OPTION 
              value='Andaman and Nicobar Islands'>Andaman and Nicobar 
              Islands<OPTION value='Andhra Pradesh'>Andhra Pradesh<OPTION 
              value='Arunachal Pradesh'>Arunachal Pradesh<OPTION 
              value=Assam>Assam<OPTION value=Bihar>Bihar<OPTION 
              value=Chandigarh>Chandigarh<OPTION 
              value=Chattisgarh>Chattisgarh<OPTION 
              value='Dadra and Nagar Haveli'>Dadra and Nagar Haveli<OPTION 
              value='Daman and Diu'>Daman and Diu<OPTION 
              value=Delhi>Delhi<OPTION value=Goa>Goa<OPTION 
              value=Gujarat>Gujarat<OPTION value=Haryana>Haryana<OPTION 
              value='Himachal Pradesh'>Himachal Pradesh<OPTION 
              value='Jammu and Kashmir'>Jammu and Kashmir<OPTION 
              value=Karnataka>Karnataka<OPTION value=Kerala>Kerala<OPTION 
              value=Lakshadweep>Lakshadweep<OPTION value='Madhya Pradesh'>Madhya 
              Pradesh<OPTION value=Maharashtra>Maharashtra<OPTION 
              value=Manipur>Manipur<OPTION value=Meghalaya>Meghalaya<OPTION 
              value=Mizoram>Mizoram<OPTION value=Nagaland>Nagaland<OPTION 
              value=Orissa>Orissa<OPTION value=Pondicherry>Pondicherry<OPTION 
              value=Punjab>Punjab<OPTION value=Rajasthan>Rajasthan<OPTION 
              value=Sikkim>Sikkim<OPTION value='Tamil Nadu'>Tamil Nadu<OPTION 
              value=Tripura>Tripura<OPTION value=Uttarakhand>Uttarakhand<OPTION 
              value='Uttar Pradesh'>Uttar Pradesh<OPTION 
              value='West Bengal'>West Bengal<OPTION 
            value=Others>Others</OPTION></SELECT>  <STRONG><FONT 
            color=red face='ARIAL, HELVETICA' size=+2>*</FONT></STRONG> 
            </font> 
          </TD></TR>
        <TR><!--------------------------------- -->
        <TR>
          <TD align=right vAlign=middle width=196 height='50'><FONT 
             face='verdana' size=4 color='#1E90FF'>Zip/Postal Code: </FONT>
          </TD>
          <TD vAlign=middle width=332 height='25'><font color='#000000'><INPUT maxLength=6 name=zip> 
 <STRONG><FONT 
            color=red face='ARIAL, HELVETICA' size=+2>*</FONT></STRONG> 
            </font> 
          </TD></TR>
        <TR>
          <TD align=right vAlign=center width=196 height='50'>
            <p><font face='verdana' size=4 color='#1E90FF'>Phone:</font></p>
          </TD>
          <TD  width=332 height='50'> 
            <font color='#000000'> 
        <INPUT maxLength=12 name=phone size='20'> 
 <STRONG><FONT 
            color=red face='ARIAL, HELVETICA' size=+2>*</FONT></STRONG> 
            </font> 
          </TD></TR>
        <TR>
          <TD align=right vAlign=middle width=196 height='50'>
         <font face='verdana' size=4 color='#1E90FF'>E-Mail
            ID:</font>
          </TD>
          <TD  width=332 height='50'>
            <font color='#000000'><INPUT name=email MAXLENGTH = 50 size='35'> 
 <STRONG><FONT 
            color=red face='ARIAL, HELVETICA' size=+2>*</FONT></STRONG></font>
            </TD></TR>
        <TR>
          <TD align=right vAlign=middle width=196 height='50'><FONT 
            face='verdana' size=4 color='#1E90FF'>Gender: </FONT></TD>
          <TD vAlign=middle width=332 height='50'><font color='#000000'><FONT 
            face='verdana' size=4 color='orchid'><INPUT CHECKED name=gender type=radio value=m> 
            Male&nbsp;<INPUT name=gender type=radio value=f> Female 
            </FONT> <STRONG><font face='ARIAL, HELVETICA' size='5' color='#FF0000'>*</font></STRONG> 
            </font> 
          </TD></TR>
        <TR>
          <TD colSpan=2 width=478 height='21'><font color='#000000'>&nbsp;</font> </TD></TR>
        <TR>
          <TD align=right vAlign=center width=196 height='50'><FONT 
            face='verdana' size=4 color='#1E90FF'>Birthday: </FONT></TD>
          <TD  width=332 height='48'><font color='#000000'><SELECT name=month size='1'> <OPTION selected 
              value=0>Month<OPTION value=jan>Jan<OPTION value=feb>Feb<OPTION 
              value=mar>Mar<OPTION value=apr>Apr<OPTION value=may>May<OPTION 
              value=jun>Jun<OPTION value=jul>Jul<OPTION value=aug>Aug<OPTION 
              value=sep>Sep<OPTION value=oct>Oct<OPTION value=nov>Nov<OPTION 
              value=dec>Dec</OPTION></SELECT>
              <SELECT name=day> <OPTION selected 
              value=0>Day<OPTION value=01>01<OPTION value=02>02<OPTION 
              value=03>03<OPTION value=04>04<OPTION value=05>05<OPTION 
              value=06>06<OPTION value=07>07<OPTION value=08>08<OPTION 
              value=09>09<OPTION value=10>10<OPTION value=11>11<OPTION 
              value=12>12<OPTION value=13>13<OPTION value=14>14<OPTION 
              value=15>15<OPTION value=16>16<OPTION value=17>17<OPTION 
              value=18>18<OPTION value=19>19<OPTION value=20>20<OPTION 
              value=21>21<OPTION value=22>22<OPTION value=23>23<OPTION 
              value=24>24<OPTION value=25>25<OPTION value=26>26<OPTION 
              value=27>27<OPTION value=28>28<OPTION value=29>29<OPTION 
              value=30>30<OPTION value=31>31</OPTION></SELECT>
              <SELECT name=year> 
              <OPTION selected value=00>Year<OPTION
              value=2010>2010<OPTION 
              value=2009>2009<OPTION value=2008>2008<OPTION 
              value=2007>2007<OPTION value=2006>2006<OPTION 
              value=2005>2005<OPTION value=2004>2004<OPTION 
              value=2003>2003<OPTION value=2002>2002<OPTION 
              value=2001>2001<OPTION value=2000>2000<OPTION 
              value=1999>1999<OPTION value=1998>1998<OPTION 
              value=1997>1997<OPTION value=1996>1996<OPTION 
              value=1995>1995<OPTION value=1994>1994<OPTION 
              value=1993>1993<OPTION value=1992>1992<OPTION 
              value=1991>1991<OPTION value=1990>1990<OPTION 
              value=1989>1989<OPTION value=1988>1988<OPTION 
              value=1987>1987<OPTION value=1986>1986<OPTION 
              value=1985>1985<OPTION value=1984>1984<OPTION 
              value=1983>1983<OPTION value=1982>1982<OPTION 
              value=1981>1981<OPTION value=1980>1980<OPTION 
              value=1979>1979<OPTION value=1978>1978<OPTION 
              value=1977>1977<OPTION value=1976>1976<OPTION 
              value=1975>1975<OPTION value=1974>1974<OPTION 
              value=1973>1973<OPTION value=1972>1972<OPTION 
              value=1971>1971<OPTION value=1970>1970<OPTION 
              value=1969>1969<OPTION value=1968>1968<OPTION 
              value=1967>1967<OPTION value=1966>1966<OPTION 
              value=1965>1965<OPTION value=1964>1964<OPTION 
              value=1963>1963<OPTION value=1962>1962<OPTION 
              value=1961>1961<OPTION value=1960>1960<OPTION 
              value=1959>1959<OPTION value=1958>1958<OPTION 
              value=1957>1957<OPTION value=1956>1956<OPTION 
              value=1955>1955<OPTION value=1954>1954<OPTION 
              value=1953>1953<OPTION value=1952>1952<OPTION 
              value=1951>1951<OPTION value=1950>1950<OPTION 
              value=1949>1949<OPTION value=1948>1948<OPTION 
              value=1947>1947<OPTION value=1946>1946<OPTION 
              value=1945>1945<OPTION value=1944>1944<OPTION 
              value=1943>1943<OPTION value=1942>1942<OPTION 
              value=1941>1941<OPTION value=1940>1940<OPTION 
              value=1939>1939<OPTION value=1938>1938<OPTION 
              value=1937>1937<OPTION value=1936>1936<OPTION 
              value=1935>1935<OPTION value=1934>1934<OPTION 
              value=1933>1933<OPTION value=1932>1932<OPTION 
              value=1931>1931<OPTION value=1930>1930<OPTION 
              value=1929>1929<OPTION value=1928>1928<OPTION 
              value=1927>1927<OPTION value=1926>1926<OPTION 
              value=1925>1925<OPTION value=1924>1924<OPTION 
              value=1923>1923<OPTION value=1922>1922<OPTION 
              value=1921>1921</OPTION></SELECT>&nbsp;<STRONG><FONT 
            color=red face='ARIAL, HELVETICA' size=+2>*</FONT></STRONG> 
            <BR></font></TD></TR><!--------------------------------- -->
        <TR>
          <TD align=right vAlign=center width=196 height='50'><FONT 
            face='verdana' size=4 color='#1E90FF'>Education: </FONT></TD>
          <TD width=332 height='50'><font color='#000000'>
          <INPUT maxLength=30 name=edu size='20'> 
          <B><font face='ARIAL, HELVETICA' size='5' color='#FF0000'>*
                  </font></B><BR></font></TD></TR>
        <TR><!--------------------------------- -->

        <TR>
          <TD align=right vAlign=center width=196 height='50'><FONT 
            face='verdana' size=4 color='#1E90FF'>Occupation: </FONT></TD>
          <TD width=332 height='29'><font color='#000000'>
            <INPUT maxLength=30 name=occupation size='20'> 
          <B><font face='ARIAL, HELVETICA' size='5' color='#FF0000'>*</font></B></font></TD></TR>
          
<tr align = middle><TD height=20 width='144'></TD><TD height=20 width='296' align = right><B><FONT color=red face='ARIAL, HELVETICA' size=+1>*</FONT></B><FONT color = green face=Arial 
            size=4>-Fields are Mandatory. </FONT></TD></TR>

          <TR>
          <TD align=middle vAlign=center width=196 height='50'><FONT 
            face='verdana' size=4 color='#1E90FF'>&nbsp;&nbsp;&nbsp;&nbsp; </FONT></TD>
          <TD  align = left width=332 height='50'><font color='#000000'>
          <FONT face='ARIAL, HELVETICA' size=-1>
          <INPUT name=button  type=submit value=Submit>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <INPUT name=Reset type=reset value=Reset> </FONT><STRONG><FONT 
            color=red face='ARIAL, HELVETICA' size=+2>&nbsp;</FONT></STRONG> 
          <BR></font></TD></TR></TBODY></TABLE></TD></TR>
 
    </TD></TR></TBODY></TABLE>
       <table border = 2 width = 550 align = middle bgcolor = khaki><tr height = 10 >
        <td bgcolor = khaki >
  
                              </tr></td></table>
                                            </FORM></BODY></HTML>



