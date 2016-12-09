<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.CreateStudIds"%>
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
<SCRIPT type="text/javascript">
        function noBack1() { window.history.forward(); }
</SCRIPT>
<script type="text/javascript">
function checkvalidate88888()
{
	var x=document.forms["quesform"]["fname"].value;
	var x1=document.forms["quesform"]["lname"].value;
	var x2=document.forms["quesform"]["semail"].value;
			
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage88881").innerHTML = "Please enter First name!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage88881").innerHTML = "";
	}
	if (x1==null || x1=="")
	{
		document.getElementById("userIdMessage88882").innerHTML = "Please enter Last name!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage88882").innerHTML = "";
	}
	if (x2==null || x2=="")
	{
		document.getElementById("userIdMessage88883").innerHTML = "Please enter Email Id!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage88883").innerHTML = "";
	}
	var atpos=x2.indexOf("@");
	var dotpos=x2.lastIndexOf(".");
	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x2.length)
	{
		document.getElementById("userIdMessage88883").innerHTML = "Email Id is not valid!";
	   return false;
	}
	else
	{
		document.getElementById("userIdMessage88883").innerHTML = "";
	}
}
</script>


</head>
<body onload="noBack1();">
<% 
DB dbBean = new DB(); 
%>
<%
int cid = 0;
if(session.getAttribute("SelCompany")!=null)
	cid = Integer.parseInt(session.getAttribute("SelCompany").toString());

String hdrscroll = "Online Quiz";
ArrayList<Company> llist = dbBean.getCompanyById(cid);
Iterator iterator = llist.iterator();
if (iterator.hasNext()) {
while (iterator.hasNext()) {
	Company linfo = (Company) iterator.next();
	hdrscroll = linfo.getCompname();
	hdrscroll += " " +  linfo.getCompaddr();
	hdrscroll += " " +  linfo.getContactno();
}
}
%>
<%
String action = request.getParameter("action");
int noofstud = 0;

int curstud = 0;
String slink = "";
ArrayList<CreateStudIds> clist = new ArrayList<CreateStudIds>();
clist.clear();
if(action!=null && action.equals("CreateIds"))
{
	curstud = Integer.parseInt(session.getAttribute("CurStud").toString());
	noofstud = Integer.parseInt(request.getParameter("noofstud"));
	session.setAttribute("NoOfStud", String.valueOf(noofstud));
	session.setAttribute("StudList", clist);	
}
if(action!=null && action.equals("GetSInfo"))
{	
	 curstud = Integer.parseInt(session.getAttribute("CurStud").toString());
	 noofstud = Integer.parseInt(session.getAttribute("NoOfStud").toString());
	 clist = (ArrayList<CreateStudIds>)session.getAttribute("StudList");
	 System.out.println("Noofstud"+noofstud);
	 if(curstud <= noofstud)
	 {
	 	CreateStudIds cinfo = new CreateStudIds();
	 	cinfo.setFname(request.getParameter("fname"));
	 	cinfo.setLname(request.getParameter("lname"));
	 	cinfo.setSemail(request.getParameter("semail"));
	 	clist.add(cinfo);
	 	session.setAttribute("StudList", clist);
	 	curstud++;
	 	session.setAttribute("CurStud",String.valueOf(curstud));
	 }
	 if(curstud < noofstud)
	 		slink = "nextStudent.jsp";
	 	else
	 		slink = "genStudIds.jsp";
}
%>
<table align="center" width="100%" background="Images/pattern.jpg"><tr><td><jsp:include page="HeaderScript.jsp" flush="true"/>
 
<table align="center" height="935" background="Images/Form.jpg">
	<tr align="center" valign="top" height="75"><td ><jsp:include page="QuizHeader.jsp" flush="true"/></td></tr>
	<tr align="center" height="20"><td>
	<table width="1220" height="20" align="center" Background="Images/Hdr.jpg">
  		<tr align="center" height="20"><td align="center" width="1220">
		  	<table align="center" width="1220" height="15" background="Images/HdrM.jpg"   border="0" >
		  		<tr align="center" height="15"><td align="center" width="500">
		  			<marquee><h212><%=hdrscroll%></h212></marquee>
		  		</td></tr>
		  	</table>
  		</td></tr>
  	</table></td></tr>
	<tr align="center" valign="top" height="50"><td ><jsp:include page="AdminLogin.jsp" flush="true"/></td></tr>
<tr align="center" valign="top" height="670"><td >	
<table align="center" width="1200" height="670">
	<tr height="670" align="center">
		<td width="1030" align="center">	
			<table width="1030" background="Images/Form.jpg" height="670">
				<tr align="center" height="100" Valign="TOP">
					<td align="center" width="1030"><jsp:include page="AdminMenu.jsp" flush="true"/></td>
				</tr>
				<tr height="690">
					<td align="center" width="1030" >
							
<table align="center" width="650" height="690">
							<tr align="center"><td align="center">	
<h2 align="center">Get Student Information</h212>
<h2 align="center">Student Number <%=curstud%></h212>
	<FORM action="<%=slink%>" method="post" name="quesform" onSubmit="return checkvalidate88888()">
	<INPUT TYPE="HIDDEN" NAME="action" VALUE="GetSInfo"/>
	<table align="center" width="450" height="120">
	<tr><td  align="center" ><h212>First Name</h212></td>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="fname" SIZE="20"/></td>
	<TD width="150" align="left"><h211><div id="userIdMessage88881"></div></h211></td></tr>
	<tr><td  align="center" ><h212>Last Name</h212></td>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="lname" SIZE="20"/></td>
	<TD width="150" align="left"><h211><div id="userIdMessage88882"></div></h211></td></tr>
	<tr><td  align="center" ><h212>Email Id</h212></td>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="semail" SIZE="20"/></td>
	<TD width="150" align="left"><h211><div id="userIdMessage88883"></div></h211></td></tr>
	<tr><td align="center"></td><td  align="left" colspan="2"><INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(Images/Go.png); width:55px; height:35px;"/></td></tr>
	</table>
	</FORM>
</td></tr></table>

				</td>
				</tr>
			</table>
		</td>
		<td align="left" width="170"><jsp:include page="RHSHeader.jsp" flush="true"></jsp:include></td>
	</tr>	
</table>
</td></tr>
<tr align="center" valign="top" height="50"><td >
<table align="center" >
	<tr align="center">
		<td align="center"><jsp:include page="Footer.jsp" flush="true"/></td>
	</tr>
</table>	
</td></tr></table></td></tr></table>
<% dbBean.CloseConnection(); %>
</body>
</html>




