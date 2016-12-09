<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%> 
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="java.util.*" %>
<%! int k;%> 
 
<% 
DB dbBean = new DB(); 
String str=request.getParameter("q"); 


k=Integer.parseInt(str);

%>
<select name="stest" onchange="showTestscat99(<%=str%>,this.value)">
<option value="0">Select</option>
<% 
ArrayList<Test> alist = dbBean.getTestByComp(k);
Iterator iterator2 = alist.iterator();
while (iterator2.hasNext()) {
	Test ainfo = (Test) iterator2.next();
%>
<option value="<%=ainfo.getID()%>"><%=ainfo.getTestname()%></option>
<% } %>
</select> 
<% 
dbBean.CloseConnection(); 
%>
 