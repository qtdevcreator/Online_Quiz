<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.Quiz"%>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.DB"%>
<!DOCTYPE HTML>
<html>
<head>
<TITLE>Online Exam</TITLE>
<style>
h1 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; font-weight:normal; color:4169E1; text-decoration:none
}
h2 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; font-weight:bold; color:4169E1; text-decoration:none
}
h3 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; font-weight:normal; color:4169E1; text-decoration:none
}

</style>
<script type="text/javascript">
function confirmcheck() { 
    var r=confirm("Are You Sure You Want To delete?"); 
    if(r==false) {
    	return false;
    }
}
function validatecheck()
{
	var x=document.forms["searchform"]["loc"].value;
		
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage1").innerHTML = "Location cannot be blank!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1").innerHTML = "";
	}
}

</script>


</head>
<body>
<% 
DB dbBean = new DB(); 
int cid = 0;
if(session.getAttribute("SelCompany")!=null)
	cid = Integer.parseInt(session.getAttribute("SelCompany").toString());

String hdrscroll = "Online Quiz";
ArrayList<Company> llist99 = dbBean.getCompanyById(cid);
Iterator iterator99 = llist99.iterator();
if (iterator99.hasNext()) {
while (iterator99.hasNext()) {
	Company linfo = (Company) iterator99.next();
	cid = linfo.getID();
	hdrscroll = linfo.getCompname();
	hdrscroll += " " +  linfo.getCompaddr();
	hdrscroll += " " +  linfo.getContactno();
}
}
%>

<%
String action = request.getParameter("action");
String chkval1 = "false";
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString();
String slogin = "";
String smenu = "";
if(chkval1.equals("true"))
{ 
	slogin = "AdminLogin.jsp";
	smenu = "AdminMenu.jsp";
	
} else {
	slogin = "Login.jsp";
	smenu = "LoginMenu.jsp";
}
String keyword = null;
int lid = 0;
ArrayList<Quiz> clist = null;
if (action != null && action.equals("deleteQuiz")) 
{
	try 
	{
		int quizno = Integer.parseInt(request.getParameter("quizno"));
		if(dbBean.DeleteQuiz(quizno)==false)
			out.println("Error deleting Quiz");
		action = "Location";
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
if (action.equals("Location")) 
{
	clist = dbBean.getAllQuiz();
}

%>
<table align="center" height="190">
	<tr align="center" valign="top" height="120"><td ><jsp:include page="QuizHeader.jsp" flush="true"/></td></tr>
	<tr align="center" height="20"><td>
	<table width="1100" height="20" align="center" Background="Images/Hdr.jpg">
  		<tr align="center" height="20"><td align="center" width="1100">
		  	<table align="center" width="500" height="15" background="Images/HdrM.jpg"   border="0" >
		  		<tr align="center" height="15"><td align="center" width="500">
		  			<marquee><h2><%=hdrscroll%></h2></marquee>
		  		</td></tr>
		  	</table>
  		</td></tr>
  	</table></td></tr>
	<tr align="center" valign="top"><td ><jsp:include page="<%=slogin%>" flush="true"/></td></tr>
</table>	
<table align="center" width="1100" height="720">
	<tr height="720" align="center">
		<td width="900" align="center">	
			<table width="900" Background="Images/Bg.jpg" height="720">
				<tr align="center" height="100" Valign="TOP">
					<td align="center" width="900"><jsp:include page="<%=smenu%>" flush="true"/></td>
				</tr>
				<tr height="620">
					<td align="center" width="900" >
						<table align="center" border="0" width="900" height="620">
							<tr align="center"><td align="center">
<%
if (action.equals("Location")) 
{
	if (action.equals("Location")) 
	{
	Iterator iterator = clist.iterator();
	if(iterator.hasNext())
	{
%>
<% 
String cspn = "";
String wid = "";
if(chkval1.equals("true"))
{ 
	cspn = "8";
	wid = "110";
	
} else {
	cspn = "6";
	wid = "130";
}
%>

<div style="height: 350px; overflow-y: auto">
<table align="center" width="900" height="350">
<thead>
<tr align="center" height="50"><td bgcolor="#fbefd9" align="center" colspan="<%=cspn%>"><h2>Quiz List</h2></TD></TR>
<TR BGCOLOR="#FFDEAD" align="center" height="50">
<TD width="<%=wid%>" align="center" ><h2>Quiz Name</h2></TD>
<TD width="<%=wid%>" align="center" ><h2>MarksPerQuestion</h2></TD>
<TD width="<%=wid%>" align="center" ><h2>NegativeScore</h2></TD>
<TD width="<%=wid%>" align="center" ><h2>No Of Question</h2></TD>
<TD width="<%=wid%>" align="center" ><h2>Pass Marks</h2></TD>
<TD width="<%=wid%>" align="center" ><h2>Max Score</h2></TD>
<% if(chkval1.equals("true"))
{ %>
<TD width="<%=wid%>" align="center" ><h2>Edit</h2></TD>
<TD width="<%=wid%>" align="center" ><h2>Delete</h2></TD>
<% } %>
</TR>
</thead>
<tbody>
<%
int i=1;
while (iterator.hasNext()) {
	Quiz linfo = (Quiz) iterator.next();
if(i%2==0)
{
%>
<TR  BGCOLOR="#FFDEAD" height="50" align="center">
<% 
}
else
{
%>
<TR  BGCOLOR="#fbefd9" height="50" align="center">
<% 
}
 	String qno1 = String.valueOf(linfo.getQuizno());
%>
<TD width="<%=wid%>" align="center"><h1><%=linfo.getQuizname()%></h1></TD>
<TD width="<%=wid%>" align="center"><h1><%=linfo.getMarksperq()%></h1></TD>
<TD width="<%=wid%>" align="center"><h1><%=linfo.getNegscore()%></h1></TD>
<TD width="<%=wid%>" align="center"><h1><%=linfo.getNoques()%></h1></TD>
<TD width="<%=wid%>" align="center"><h1><%=linfo.getPassmarks()%></h1></TD>
<TD width="<%=wid%>" align="center"><h1><%=linfo.getMaxscore()%></h1></TD>
<% if(chkval1.equals("true"))
{ %>
<TD width="<%=wid%>" align="center"><h1><a href="EditQuiz.jsp?action=Edit&quizno=<%=qno1%>">Edit</a></h1></TD>
<FORM name="delform" onSubmit="return confirmcheck()">
<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteQuiz">
<INPUT TYPE="HIDDEN" NAME="quizno" VALUE="<%=qno1%>">
<TD width="<%=wid%>" align="center"><h1><INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(Images/Del.jpg); width:90px; height:25px;"/></h1></TD>
</FORM>
<% } %>
</TR>
<%
i++;
} //while
	%>
</tbody>
</table>    
</div>	
	<%
}
else
{
%>
<table align="center" width="590" height="40">
<TR align="center"><TD  align="center"><h2>There are no Quiz!</h2></TD></TR>
</table>
<%
}
}
}
%>
</td></tr></table>
				
				</td>
				</tr>
			</table>
		</td>
		<td align="left" width="200"><jsp:include page="RHSHeader.jsp" flush="true"></jsp:include></td>
	</tr>	
</table>
<table align="center" >
	<tr align="center">
		<td align="center"><jsp:include page="Footer.jsp" flush="true"/></td>
	</tr>
</table>	
<% dbBean.CloseConnection(); %>
</body>
</html>