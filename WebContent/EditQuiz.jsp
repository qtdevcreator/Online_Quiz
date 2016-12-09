<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Quiz"%>
<%@ page import="com.software.onlexam.Company"%>
<html>
<head>
<title>Online Test</title>
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
function checkvalidate1111()
{
	var x=document.forms["quesform"]["qname"].value;
	var x1=document.forms["quesform"]["marksperq"].value;
	var x2=document.forms["quesform"]["negscore"].value;
	var x3=document.forms["quesform"]["noques"].value;
	var x4=document.forms["quesform"]["passmarks"].value;
	var x5=document.forms["quesform"]["maxscore"].value;
	
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage1111").innerHTML = "Please enter quiz name!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1111").innerHTML = "";
	}
	if (x1==null || x1=="")
	{
		document.getElementById("userIdMessage1112").innerHTML = "Please enter marks per question!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1112").innerHTML = "";
	}
	if (isNaN(x1))
	{
		document.getElementById("userIdMessage1112").innerHTML = "Marks per question must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1112").innerHTML = "";
	}
	if (x2==null || x2=="")
	{
		document.getElementById("userIdMessage1113").innerHTML = "Please enter negative score!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1113").innerHTML = "";
	}
	if (isNaN(x2))
	{
		document.getElementById("userIdMessage1113").innerHTML = "Negative score must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1113").innerHTML = "";
	}
	if (x3==null || x3=="")
	{
		document.getElementById("userIdMessage1114").innerHTML = "Please enter no of questions!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1114").innerHTML = "";
	}
	if (isNaN(x3))
	{
		document.getElementById("userIdMessage1114").innerHTML = "No of questions must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1114").innerHTML = "";
	}
	if (x4==null || x4=="")
	{
		document.getElementById("userIdMessage1115").innerHTML = "Please enter pass marks!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1115").innerHTML = "";
	}
	if (isNaN(x4))
	{
		document.getElementById("userIdMessage1115").innerHTML = "Pass marks must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1115").innerHTML = "";
	}
	if (x5==null || x5=="")
	{
		document.getElementById("userIdMessage1116").innerHTML = "Please enter max score!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1116").innerHTML = "";
	}
	if (isNaN(x5))
	{
		document.getElementById("userIdMessage1116").innerHTML = "Max score must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1116").innerHTML = "";
	}
}
</script>


</head>
<body>
<% 
DB dbBean = new DB(); 
%>
<%
String hdrscroll = "Online Quiz";
ArrayList<Company> llist99 = dbBean.getSelCompany();
Iterator iterator99 = llist99.iterator();
if (iterator99.hasNext()) {
while (iterator99.hasNext()) {
	Company linfo = (Company) iterator99.next();
	hdrscroll = linfo.getCompname();
	hdrscroll += " " +  linfo.getCompaddr();
	hdrscroll += " " +  linfo.getContactno();
}
}
%>
<%
String action = request.getParameter("action");
int quizno = Integer.parseInt(request.getParameter("quizno"));
String qname1 = "";
int marksperq1 = 0;
int negscore1 = 0;
int noques1 = 0;
int passmarks1 = 0;
int maxscore1 = 0;
ArrayList<Quiz> qlist = dbBean.GetQuizById(quizno); 
Iterator iterator1 = qlist.iterator();
if (iterator1.hasNext()) {	
	Quiz linfo = (Quiz) iterator1.next();
	qname1 = linfo.getQuizname();
	marksperq1 = linfo.getMarksperq();
	negscore1 = linfo.getNegscore();
	noques1 = linfo.getNoques();
	passmarks1 = linfo.getPassmarks();
	maxscore1 = linfo.getMaxscore();
	
}
if(action!=null && action.equals("Edit"))
{
	;
}
else if(action!=null && action.equals("EditQuiz"))
{	
	 qname1 = request.getParameter("qname").toString();
	 marksperq1 = Integer.parseInt(request.getParameter("marksperq").toString());
	 negscore1 = Integer.parseInt(request.getParameter("negscore").toString());
	 noques1 = Integer.parseInt(request.getParameter("noques").toString());
	 passmarks1 = Integer.parseInt(request.getParameter("passmarks").toString());
	 maxscore1 = Integer.parseInt(request.getParameter("maxscore").toString());
	try 
	{			
		boolean val=dbBean.UpdateQuiz(qname1,marksperq1,negscore1,noques1,passmarks1,maxscore1,quizno);
		if(val==false)
		{
			out.println("Error updating Quiz");
			action="Fail";
		}
		else
			action="Succ";
		
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
}
else if (action != null && action.equals("deleteQuiz")) 
{
	try 
	{		
		int quizno1 = Integer.parseInt(request.getParameter("quizno1"));
		
		if(dbBean.DeleteQuiz(quizno1)==false)
		{
			out.println("Error deleting Quiz");
			action="Fail";
		}
		else
			action="Succ";
		
		
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
<table align="center" width="1100" height="670">
	<tr height="670" align="center">
		<td width="900" align="center">	
			<table width="900" Background="Images/Bg.jpg" height="670">
				<tr align="center" height="100" Valign="TOP">
					<td align="center" width="900"><jsp:include page="AdminMenu.jsp" flush="true"/></td>
				</tr>
				<tr height="620">
					<td align="center" width="900" >
						<table align="center" border="0" width="900" height="620">
							<tr align="center"><td align="center">
							
<table align="center" width="650" height="620">
							<tr align="center"><td align="center">	
<h2 align="center">Edit Quiz</h2>
<%
	if(action!=null && action.equals("Edit") || action.equals("Succ") || action.equals("Fail"))
	{				
%>
	<FORM name="quesform" onSubmit="return checkvalidate1111()">
	<INPUT TYPE="HIDDEN" NAME="action" VALUE="EditQuiz"/>
	<INPUT TYPE="HIDDEN" NAME="quizno" VALUE="<%=quizno%>"/>
	<table align="center" width="450" height="120">
	<tr><td  align="center" ><h2>Quiz Name</h2></td>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="qname" value="<%=qname1%>" SIZE="20"/></td>
	<TD width="150" align="left"><h1><div id="userIdMessage1111"></div></h1></td></tr>
	<tr><td  align="center" ><h2>MarksPerQuiz</h2></td>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="marksperq" value="<%=marksperq1%>" SIZE="20"/></td>
	<TD width="150" align="left"><h1><div id="userIdMessage1112"></div></h1></td></tr>
	<tr><td  align="center" ><h2>Negative Score</h2></td>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="negscore" value="<%=negscore1%>" SIZE="20"/></td>
	<TD width="150" align="left"><h1><div id="userIdMessage1113"></div></h1></td></tr>
	<tr><td  align="center" ><h2>No of Questions</h2></td>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="noques" value="<%=noques1%>" SIZE="20"/></td>
	<TD width="150" align="left"><h1><div id="userIdMessage1114"></div></h1></td></tr>
	<tr><td  align="center" ><h2>Passing Marks</h2></td>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="passmarks" value="<%=passmarks1%>" SIZE="20"/></td>
	<TD width="150" align="left"><h1><div id="userIdMessage1115"></div></h1></td></tr>
	<tr><td  align="center" ><h2>Max Score</h2></td>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="maxscore" value="<%=maxscore1%>" SIZE="20"/></td>
	<TD width="150" align="left"><h1><div id="userIdMessage1116"></div></h1></td></tr>
	<tr><td align="center"></td><td  align="left" colspan="2"><INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(Images/Edit.jpg); width:55px; height:25px;"/></td></tr>
	</table>
	</FORM>
	<% } %>
<%
	if(action!=null && action.equals("DisplayQuiz"))
	{				
		ArrayList<Quiz> llist = dbBean.getAllQuiz();
		Iterator iterator = llist.iterator();
		if (iterator.hasNext()) {
%>

<div style="height: 280px; overflow-y: auto">
<table align="center" width="880" height="280">
<thead>
<tr align="center" ><td bgcolor="#fbefd9" align="center" colspan="8"><h2>Quiz List</h2></TD></TR>
<TR BGCOLOR="#FFDEAD" align="center" >
<TD width="110" align="center" ><h2>Quiz Name</h2></TD>
<TD width="110" align="center" ><h2>MarksPerQuestion</h2></TD>
<TD width="110" align="center" ><h2>NegativeScore</h2></TD>
<TD width="110" align="center" ><h2>No Of Question</h2></TD>
<TD width="110" align="center" ><h2>Pass Marks</h2></TD>
<TD width="110" align="center" ><h2>Max Score</h2></TD>
<TD width="110" align="center" ><h2>Edit</h2></TD>
<TD width="110" align="center" ><h2>Delete</h2></TD>
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
<TD width="110" align="center"><h1><%=linfo.getQuizname()%></h1></TD>
<TD width="110" align="center"><h1><%=linfo.getMarksperq()%></h1></TD>
<TD width="110" align="center"><h1><%=linfo.getNegscore()%></h1></TD>
<TD width="110" align="center"><h1><%=linfo.getNoques()%></h1></TD>
<TD width="110" align="center"><h1><%=linfo.getPassmarks()%></h1></TD>
<TD width="110" align="center"><h1><%=linfo.getMaxscore()%></h1></TD>
<TD width="110" align="center"><h1><a href="EditQuiz.jsp?action=Edit&quizno=<%=qno1%>">Edit</a></h1></TD>
<FORM name="delform" onSubmit="return confirmcheck()">
<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteQuiz">
<INPUT TYPE="HIDDEN" NAME="quizno1" VALUE="<%=qno1%>">
<INPUT TYPE="HIDDEN" NAME="quizno" VALUE="<%=quizno%>"/>
<TD width="110" align="center"><h1><INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(Images/Del.jpg); width:90px; height:25px;"/></h1></TD>
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
<% } } %>
<%
	if(action!=null && action.equals("Succ"))
	{				
%>
<table align="center" width="590" height="30">
<TR align="center"><TD  align="center"><h2>Quiz updated successfully!</h2></TD></TR>
</table>
<% } else if (action != null && action.equals("Fail")) 
   { %>
<table align="center" width="590" height="30">
<TR align="center"><TD  align="center"><h2>Updation of quiz has failed!</h2></TD></TR>
</table>	
<% }%>
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




