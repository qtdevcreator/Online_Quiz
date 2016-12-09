<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.TimeoutFilter" %>
<% 
	TimeoutFilter tm = new TimeoutFilter();
	tm.setIflag1(1);	
	session.invalidate();
	

	response.sendRedirect("SelCompany.jsp"); 
%>
