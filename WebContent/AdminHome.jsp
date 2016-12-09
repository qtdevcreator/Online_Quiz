<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="java.util.*" %>
<HTML>
<HEAD>
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
<SCRIPT type="text/javascript">
        function noBack1() { window.history.forward(); }
</SCRIPT>
</HEAD>
<BODY onload="noBack1();">
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
						<table align="center" border="0" width="1030" height="690">
							<tr align="center"><td align="center">
								<h212>Welcome to online examination!</h212> 
							</td></tr>
						</table>
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
</BODY>
</HTML>