<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Company"%>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<HTML>
<head>
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
<SCRIPT LANGUAGE="JavaScript">
function checkvalidate999011()
{
	var x=document.forms["searchfrm9"]["keyword"].value;
	var x1=document.forms["searchfrm9"]["cat"].value;
	
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage1289").innerHTML = "Enter keyword!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1289").innerHTML = "";
	}	
	if (x1=="Select")
	{
		document.getElementById("userIdMessage1289").innerHTML = "Select category!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1289").innerHTML = "";
	}	
}
function checkvalidate()
{
	var x=document.forms["LOGIN"]["Name"].value;
	var x2=document.forms["LOGIN"]["Pwd"].value;
	
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage1").innerHTML = "Please enter userId!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1").innerHTML = "";
	}
	if (isNaN(x))
	{
		document.getElementById("userIdMessage1").innerHTML = "UserId must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1").innerHTML = "";
	}
	if(x.length != 6)
	{
		document.getElementById("userIdMessage1").innerHTML = "UserId must be 6 digit!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1").innerHTML = "";
	}
	if (x2==null || x2=="")
	{
		document.getElementById("userIdMessage1").innerHTML = "Please enter password!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1").innerHTML = "";
	}
}
</SCRIPT>
</head>
<BODY>
<%
String chkval = "false";
if(session.getAttribute("loginapp")!=null)
	chkval = session.getAttribute("loginapp").toString();

String sstat = "false";
if(session.getAttribute("Start")!=null)
	sstat = session.getAttribute("Start").toString();

String send = "false";
if(session.getAttribute("End")!=null)
	send = session.getAttribute("End").toString();

DB dbBean = new DB(); 
%>
<%
int cid = 0;
if(session.getAttribute("SelCompany")!=null)
	cid = Integer.parseInt(session.getAttribute("SelCompany").toString());

String compname1 = ""; 
String hdrscroll = "Online Quiz";
ArrayList<Company> llist99 = dbBean.getCompanyById(cid);
Iterator iterator99 = llist99.iterator();
if (iterator99.hasNext()) {
while (iterator99.hasNext()) {
	Company linfo = (Company) iterator99.next();
	cid = linfo.getID();
	compname1 = linfo.getCompname();
	hdrscroll = compname1;
	hdrscroll += " " +  linfo.getCompaddr();
	hdrscroll += " " +  linfo.getContactno();
}
}
%>
	<table align='center' Background="Images/Bg.jpg" width="1230" height="50" cellspacing=0 cellpadding=0>
		<tr align='center'>
			<td align='center'>
			
			<table align='center' width="1230" height="50">
			<tr align='center'><td align='center'>
			<table align="left" width="1200">
				<tr align="center">
				<% if(chkval.equals("true"))
				{
					String semail = "";
					if(session.getAttribute("studentuser")!=null)
						semail = session.getAttribute("studentuser").toString();
					String suser = dbBean.GetUserName(semail,cid);
					%>
					<td  width="250"><h212>Welcome, <%=suser%>&nbsp;&nbsp;&nbsp;&nbsp;</h212></td>
					<% if(sstat.equals("false") && send.equals("false"))
					{ 
					%>
					<FORM name="searchfrm9" Method="post" action="SearchResults.jsp" onSubmit="return checkvalidate999011()">
					<td width="800"><h212>Search&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;Keyword&nbsp;&nbsp;&nbsp;&nbsp;
					<INPUT TYPE="text" NAME="keyword" size="20" />&nbsp;&nbsp;&nbsp;&nbsp;Category&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="cat">
					<option value="Select" selected>Select</option>
					<option value="Test">Test</option>
					<option value="Test SubCategory">Test SubCategory</option>
					<option value="Batch">Batch</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;	
					<INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(Images/Go.png); width:55px; height:30px;"/></h212></td>
					</FORM>
					<td  align="left" width="190"><h212><div id="userIdMessage1289"></div></h212></td>
					<% } %>
					<% } else { %>
					<FORM NAME='LOGIN' ACTION="LoginSucc.jsp" method="POST" onSubmit="return checkvalidate()">
					<input type="hidden" name="action" value="Student"/>
					<td><h212>Student Login&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;UserId&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="text" NAME="Name" size="15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="password" NAME="Pwd" size="15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="" style="background: url(Images/Go1.jpg); width:100px; height:20px; BORDER:0" /></h212></td>
					<td  align="left"><h212><div id="userIdMessage1"></div></h212></td>
					</FORM>
					<% } %>
				</tr>
			</table>
			</td></tr></table>
			
			</td>
		</tr>
	</table>
	<% dbBean.CloseConnection(); %>
</BODY>
</HTML>
