<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%> 
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="java.util.*" %>
<%! int k;%> 
 
<% 
String str=request.getParameter("q"); 


k=Integer.parseInt(str);

%>
<%=k%>
 