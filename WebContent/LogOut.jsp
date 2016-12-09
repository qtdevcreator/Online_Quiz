<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.TimeoutFilter" %>
<% 
	/* TimeoutFilter tm = new TimeoutFilter();
	tm.setIflag1(1);	
	session.invalidate(); */
	
	String chkval2 = "false";
	if(session.getAttribute("SelCompany")!=null)
		chkval2 = session.getAttribute("SelCompany").toString();
	session.setAttribute("loginapp","false");
	session.setAttribute("loginadm","false");
	session.setAttribute("Start","false");
	session.setAttribute("End","false");

	response.sendRedirect("Home.jsp?comname="+chkval2); 
%>
