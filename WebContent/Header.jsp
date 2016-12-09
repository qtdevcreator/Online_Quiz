<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.DB"%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
h211 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px; font-weight:normal; color:#7D0552; text-decoration:none
}
h212 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px; font-weight:bold; color:#7D0552; text-decoration:none
}
h213 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px; font-weight:normal; color:#7D0552; text-decoration:none
}
h216 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:16px; font-weight:bold; color:#7D0552; text-decoration:none
}
</style>
</head>
<body>
<% DB dbBean = new DB(); %>
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

<table width="1230" height="20" align="center" Background="Images/Hdr.jpg">
  		<tr align="center" height="20"><td align="center" width="1100">
		  	<table align="center" width="1230" height="15" background="Images/HdrM.jpg"   border="1" >
		  		<tr align="center" height="15"><td align="center" width="500">
		  			<marquee><h6><%=hdrscroll%></h6></marquee>
		  		</td></tr>
		  	</table>
  		</td></tr>
  	</table>
<% dbBean.CloseConnection(); %>
</body>
</html>