public class storedata
{
 static StringBuffer sb=new StringBuffer();
 static void setData(String txt)
 {
   sb.append(txt);
 }

 static String getData()
 {
  return sb.toString();
 }


}
