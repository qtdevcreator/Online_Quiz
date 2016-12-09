<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.DB"%>
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
function checkvalidate51555()
{
	var x=document.forms["testform"]["comname"].value;
		
	if (x==0)
	{
		document.getElementById("userIdMessage51551").innerHTML = "Please select company!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage51551").innerHTML = "";
	}
}

</script>


</head>
<body onload="noBack1();">
<% 
DB dbBean1 = new DB(); 

%>	
<%
String hdrscroll = "Online Quiz";
ArrayList<Company> llist99 = dbBean1.getSelCompany();
Iterator iterator99 = llist99.iterator();
if (iterator99.hasNext()) {
while (iterator99.hasNext()) {
	Company linfo = (Company) iterator99.next();
	hdrscroll = linfo.getCompname();
	hdrscroll += " " +  linfo.getCompaddr();
	hdrscroll += " " +  linfo.getContactno();
}
}
int oper = Integer.parseInt(request.getParameter("oper"));
String activity = "";
if(oper == 1)
{
	activity="ListScatByTest.jsp";
}
else if(oper == 2)
{
	activity="GetBatchByCat1.jsp";
}
else if(oper == 3)
{
	activity="ListBatchByTest1.jsp";
}
else if(oper == 4)
{
	activity="Cust_Query.jsp";
}
 
%>
<table align="center" height="980" background="Images/Form.jpg">
	<tr align="center" valign="top" height="120"><td ><jsp:include page="QuizHeader.jsp" flush="true"/></td></tr>
	<tr align="center" height="20"><td>
	<table width="1220" height="20" align="center" Background="Images/Hdr.jpg">
  		<tr align="center" height="20"><td align="center" width="1220">
		  	<table align="center" width="1220" height="15" background="Images/HdrM.jpg"   border="0" >
		  		<tr align="center" height="15"><td align="center" width="500">
		  			<marquee><h2><%=hdrscroll%></h2></marquee>
		  		</td></tr>
		  	</table>
  		</td></tr>
  	</table></td></tr>
	<tr align="center" valign="top" height="50"><td ><jsp:include page="AdminLogin.jsp" flush="true"/></td></tr>
<tr align="center" valign="top" height="790"><td >	
<table align="center" width="1200" height="790">
	<tr height="790" align="center">
		<td width="1030" align="center">	
			<table width="1030" background="Images/Form.jpg" height="790">
				<tr align="center" height="100" Valign="TOP">
					<td align="center" width="1030"><jsp:include page="AdminMenu.jsp" flush="true"/></td>
				</tr>
				<tr height="690">
					<td align="center" width="1030" >

<table align="center" width="1030" >
<tr align="center"><td  align="center">
<FORM name="testform" action="<%=activity%>" onSubmit="return checkvalidate51555()">
<%if(oper == 4)
{ %>
<input type="hidden" name="action" value="Show"/>
<% } %>
<table align="center" width="440">
<tr align="center"><td align="center" colspan="2"><h2 align="center">Select Company</h2></td><td></td></tr>	
	<tr><td  align="center" width="150"><h2>Company</h2></td>
	<td  align="left" ><select name="comname">
					<option value="0">Select</option>
					<%
					ArrayList<Company> llist = dbBean1.getCompany();
					Iterator iterator = llist.iterator();
					if (iterator.hasNext()) {
					while (iterator.hasNext()) {
						Company linfo = (Company) iterator.next();
					%>
							<option value="<%=linfo.getID()%>"><%=linfo.getCompname()%></option>
					<% } } %>
				</select></td>
	<td  align="center" width="150"><h1><div id="userIdMessage51551"></div></h1></td></tr>
	<TR align="center"><TD width="150" align="center"></TD><TD ALIGN="left"><INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(Images/Go.png); width:55px; height:35px;"/></TD></TR>			
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
</td></tr></table>
<% dbBean1.CloseConnection(); %>
</body>
</html>