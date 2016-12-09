<%
	/*session.setAttribute("loginapp", "false");
	session.setAttribute("loginadm","false");
	session.setAttribute("studentuser","");
	session.setAttribute("startques","0"); */
%>
<HTML>
<HEAD>
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
</HEAD>
<BODY>

<table align="center" height="190">
	<tr align="center" valign="top" height="120"><td ><jsp:include page="QuizHeader.jsp" flush="true"/></td></tr>
	<tr align="center" height="20"><td>
	<table width="1100" height="20" align="center" Background="Images/Hdr.jpg">
  		<tr align="center" height="20"><td align="center" width="1100">
		  	<table align="center" width="500" height="15" background="Images/HdrM.jpg"   border="0" >
		  		<tr align="center" height="15"><td align="center" width="500">
		  			<marquee><h2>Online Quiz</h2></marquee>
		  		</td></tr>
		  	</table>
  		</td></tr>
  	</table></td></tr>
	<tr align="center" valign="top" height="50"><td ><jsp:include page="Login.jsp" flush="true"/></td></tr>
</table>	
<table align="center" width="1100" height="670">
	<tr height="670" align="center">
		<td width="900" align="center">	
			<table width="900" Background="Images/Bg.jpg" height="670">
				<tr align="center" height="100" Valign="TOP">
					<td align="center" width="900"><jsp:include page="LoginMenu.jsp" flush="true"/></td>
				</tr>
				<tr height="570">
					<td align="center" width="900" >
						<table align="center" border="0" width="900" height="570">
							<tr align="center"><td align="center">
								<h2>Welcome to online examination!</h2> 
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

</BODY>
</HTML>