<%@ page language="java" %>

<HTML>
<head>
<style>
h121 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; font-weight:normal; color:4169E1; text-decoration:none
}
h221 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; font-weight:bold; color:4169E1; text-decoration:none
}
h321 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; font-weight:normal; color:4169E1; text-decoration:none
}

</style>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
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

if(chkval.equals("true") && !sstat.equals("true") && send.equals("false")) { %>
<table align="center" width="220" height="100">
<tr align="center">
	<td align="center">
			<TABLE align="center" background="Images/TopMenu8.jpg" width="220" height="100">
				<TR align="center">
					<TD align="center"><h212><a href="SelQuiz.jsp">Select Quiz</a></h212></TD>
				</TR>
				<TR align="center">
					<TD align="center"><h212><a href="ListBatch.jsp?action=List1">List Batch</a></h212></TD>
				</TR>	
				<TR align="center">
					<TD align="center"><h212><a href="ListBatchByTest1.jsp">List Batch By Test</a></h212></TD>
				</TR>
				<TR align="center">
					<TD align="center"><h212><a href="GetBatchByCat.jsp">Test List</a></h212></TD>
				</TR>			
			</TABLE>
		</td>		
	</tr>
</table>
<% } %>
</BODY>
</HTML>
