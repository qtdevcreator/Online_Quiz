<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.Batch"%>
<%@ page import="com.software.onlexam.Quiz"%>
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
function checkvalidate888()
{
	var x=document.forms["quesform"]["qname"].value;
	var x1=document.forms["quesform"]["marksperq"].value;
	var x2=document.forms["quesform"]["negscore"].value;
	var x3=document.forms["quesform"]["noques"].value;
	var x4=document.forms["quesform"]["passmarks"].value;
	var x5=document.forms["quesform"]["maxscore"].value;
	
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage81").innerHTML = "Please enter quiz name!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage81").innerHTML = "";
	}
	if (x1==null || x1=="")
	{
		document.getElementById("userIdMessage82").innerHTML = "Please enter marks per question!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage82").innerHTML = "";
	}
	if (isNaN(x1))
	{
		document.getElementById("userIdMessage82").innerHTML = "Marks per question must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage82").innerHTML = "";
	}
	if (x2==null || x2=="")
	{
		document.getElementById("userIdMessage83").innerHTML = "Please enter negative score!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage83").innerHTML = "";
	}
	if (isNaN(x2))
	{
		document.getElementById("userIdMessage83").innerHTML = "Negative score must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage83").innerHTML = "";
	}
	if (x3==null || x3=="")
	{
		document.getElementById("userIdMessage84").innerHTML = "Please enter no of questions!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage84").innerHTML = "";
	}
	if (isNaN(x3))
	{
		document.getElementById("userIdMessage84").innerHTML = "No of questions must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage84").innerHTML = "";
	}
	if (x4==null || x4=="")
	{
		document.getElementById("userIdMessage85").innerHTML = "Please enter pass marks!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage85").innerHTML = "";
	}
	if (isNaN(x4))
	{
		document.getElementById("userIdMessage85").innerHTML = "Pass marks must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage85").innerHTML = "";
	}
	if (x5==null || x5=="")
	{
		document.getElementById("userIdMessage86").innerHTML = "Please enter max score!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage86").innerHTML = "";
	}
	if (isNaN(x5))
	{
		document.getElementById("userIdMessage86").innerHTML = "Max score must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage86").innerHTML = "";
	}
}
</script>


</head>
<body>
<% 
DB dbBean = new DB(); 
%>
<%
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
String action = request.getParameter("action");

ArrayList<Quiz> clist = null;
if (action != null && action.equals("addQuiz")) 
{
	String qname = request.getParameter("qname").toString();
	int marksperq = Integer.parseInt(request.getParameter("marksperq").toString());
	int negscore = Integer.parseInt(request.getParameter("negscore").toString());
	int noques = Integer.parseInt(request.getParameter("noques").toString());
	int passmarks = Integer.parseInt(request.getParameter("passmarks").toString());
	int maxscore = Integer.parseInt(request.getParameter("maxscore").toString());
	try 
	{		
		//dbBean.initDB();
		boolean val = dbBean.AddQuiz(marksperq,negscore,noques,passmarks,maxscore,qname);
		if(val==false)
			out.println("Error adding quiz");
		//dbBean.CloseConnection();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
if (action != null && action.equals("deleteQuiz")) 
{
	try 
	{
		int quizno = Integer.parseInt(request.getParameter("quizno"));
		//dbBean.initDB();
		if(dbBean.DeleteQuiz(quizno)==false)
			out.println("Error deleting Quiz");
		//dbBean.CloseConnection();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
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
	<tr align="center" valign="top" height="50"><td ><jsp:include page="AdminLogin.jsp" flush="true"/></td></tr>
</table>	
<table align="center" width="1100" height="720">
	<tr height="720" align="center">
		<td width="900" align="center">	
			<table width="900" Background="Images/Bg.jpg" height="720">
				<tr align="center" height="100" Valign="TOP">
					<td align="center" width="900"><jsp:include page="AdminMenu.jsp" flush="true"/></td>
				</tr>
				<tr height="620">
					<td align="center" width="900" >
						<table align="center" border="0" width="900" height="620">
							<tr align="center"><td align="center">
<%
int comid = 0;
String comname1="";
ArrayList<Company> llist = dbBean.getSelCompany();
Iterator iterator = llist.iterator();
if (iterator.hasNext()) {
while (iterator.hasNext()) {
	Company linfo = (Company) iterator.next();
	comid = linfo.getID();
	comname1 = linfo.getCompname();
}
}
%>								
<table align="center" width="590" >
<tr align="center"><td  align="center">
<FORM name="quesform" onSubmit="return checkvalidate888()">
<INPUT TYPE="HIDDEN" NAME="action" VALUE="addQuiz">
<table align="center" width="500" height="150">
	<tr align="center"><td align="center" colspan="2"><h2>Add Quiz</h2></td></tr>
	<tr align="center"><td  align="center" width="150"><h2>Company</h2></td>
	<td  align="left" width="200" ><INPUT TYPE="TEXT" NAME="comname" value="<%=comname1%>" readonly SIZE="20"></td>
	<td  align="center" width="150"><h1><div id="userIdMessage81"></div></h1></td></tr>
	
	<tr align="center"><td  align="center" width="150"><h2>Test</h2></td>
	<td  align="left" width="200" ><INPUT TYPE="TEXT" NAME="stest" SIZE="20"></td>
	<td  align="center" width="150"><h1><div id="userIdMessage81"></div></h1></td></tr>
	<tr align="center"><td  align="center" width="150"><h2>TestSubCategory</h2></td>
	<td  align="left" width="200" ><INPUT TYPE="TEXT" NAME="stestscat" SIZE="20"></td>
	<td  align="center" width="150"><h1><div id="userIdMessage81"></div></h1></td></tr>
	<tr align="center"><td  align="center" width="150"><h2>Batch</h2></td>
	<td  align="left" width="200" ><INPUT TYPE="TEXT" NAME="qname" SIZE="20"></td>
	<td  align="center" width="150"><h1><div id="userIdMessage81"></div></h1></td></tr>
	<tr align="center"><td  align="center" width="150"><h2>Quiz Name</h2></td>
	<td  align="left" width="200" ><INPUT TYPE="TEXT" NAME="qname" SIZE="20"></td>
	<td  align="center" width="150"><h1><div id="userIdMessage81"></div></h1></td></tr>
	
	<tr align="center"><td  align="center" width="150"><h2>MarksPerQuestion</h2></td>
	<td  align="left" width="200" ><INPUT TYPE="TEXT" NAME="marksperq" SIZE="20"></td>
	<td  align="center" width="150"><h1><div id="userIdMessage82"></div></h1></td></tr>
	<tr align="center"><td  align="center" width="150"><h2>Negative Score</h2></td>
	<td  align="left" width="200" ><INPUT TYPE="TEXT" NAME="negscore" SIZE="20"></td>
	<td  align="center" width="150"><h1><div id="userIdMessage83"></div></h1></td></tr>
	<tr align="center"><td  align="center" width="150"><h2>No of Questions</h2></td>
	<td  align="left" width="200" ><INPUT TYPE="TEXT" NAME="noques" SIZE="20"></td>
	<td  align="center" width="150"><h1><div id="userIdMessage84"></div></h1></td></tr>
	<tr align="center"><td  align="center" width="150"><h2>Passing Marks</h2></td>
	<td  align="left" width="200" ><INPUT TYPE="TEXT" NAME="passmarks" SIZE="20"></td>
	<td  align="center" width="150"><h1><div id="userIdMessage85"></div></h1></td></tr>
	<tr align="center"><td  align="center" width="150"><h2>Max Score</h2></td>
	<td  align="left" width="200" ><INPUT TYPE="TEXT" NAME="maxscore" SIZE="20"></td>
	<td  align="center" width="150"><h1><div id="userIdMessage86"></div></h1></td></tr>
	<tr align="center"><td width="150" align="center"></td>
	<td align="left"><INPUT TYPE="SUBMIT" name="Submit" onclick="return validatecheck()" value="" style="background: url(Images/Add.jpg); width:55px; height:25px;"/></td>
	</tr>
</table>
</FORM>
	<br>
	<%
		ArrayList<Quiz> llist3 = dbBean.getAllQuiz();
		Iterator iterator3 = llist3.iterator();
		if (iterator3.hasNext()) {		
		%>
<div style="height: 270px; overflow-y: auto">
<table align="center" width="850" height="270">
<thead>
<tr align="center" ><td bgcolor="#fbefd9" align="center" colspan="8"><h2>Quiz List</h2></TD></TR>
<TR BGCOLOR="#FFDEAD" align="center" >
<TD width="120" align="center" ><h2>Quiz Name</h2></TD>
<TD width="120" align="center" ><h2>MarksPerQuestion</h2></TD>
<TD width="120" align="center" ><h2>NegativeScore</h2></TD>
<TD width="120" align="center" ><h2>No Of Question</h2></TD>
<TD width="120" align="center" ><h2>Pass Marks</h2></TD>
<TD width="120" align="center" ><h2>Max Score</h2></TD>
<TD width="120" align="center" ><h2>Edit</h2></TD>
<TD width="120" align="center" ><h2>Delete</h2></TD>
</TR>
</thead>
<tbody>
<%
int i=1;
while (iterator3.hasNext()) {
	Quiz linfo = (Quiz) iterator3.next();

if(i%2==0)
{
%>
<TR BGCOLOR="#FFDEAD"   align="center">
<% 
}
else
{
%>
<TR BGCOLOR="#fbefd9" align="center">
<% 
}
 	String qno1 = String.valueOf(linfo.getQuizno());
%>
<TD width="120" align="center"><h1><%=linfo.getQuizname()%></h1></TD>
<TD width="120" align="center"><h1><%=linfo.getMarksperq()%></h1></TD>
<TD width="120" align="center"><h1><%=linfo.getNegscore()%></h1></TD>
<TD width="120" align="center"><h1><%=linfo.getNoques()%></h1></TD>
<TD width="120" align="center"><h1><%=linfo.getPassmarks()%></h1></TD>
<TD width="120" align="center"><h1><%=linfo.getMaxscore()%></h1></TD>
<TD width="120" align="center"><h1><a href="EditQuiz.jsp?action=Edit&quizno=<%=qno1%>">Edit</a></h1></TD>
<FORM name="delform" onSubmit="return confirmcheck()">
<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteQuiz">
<INPUT TYPE="HIDDEN" NAME="quizno" VALUE="<%=qno1%>">
<TD width="120" align="center"><h1><INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(Images/Del.jpg); width:90px; height:25px;"/></h1></TD>
</FORM>
</TR>
<%
i++;
} //while
%>
</tbody>
</table>    
</div>
<%
} //if prod size!=0
else
{
%>
<table align="center" width="590" height="30">
<TR align="center"><TD  align="center"><h2>There are no quiz!</h2></TD></TR>
</table>
<% } %>
	
</td></tr></table>							


</td></tr>
						</table>
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