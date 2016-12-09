<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%> 
<%@ page import="com.software.onlexam.Batch"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="java.util.*" %>
<%! int k;
	int z;
	int b;%> 
 
<% 
DB dbBean = new DB(); 
String str=request.getParameter("q");
String str1=request.getParameter("v");
String str2=request.getParameter("w");


k=Integer.parseInt(str);
z=Integer.parseInt(str1);
b=Integer.parseInt(str2);

%>
<select name="sbatch">
<option value="0">Select</option>
<% 

ArrayList<Batch> alist = dbBean.getBatchByComp(k,z,b);
Iterator iterator2 = alist.iterator();
while (iterator2.hasNext()) {
	Batch ainfo = (Batch) iterator2.next();
%>
<option value="<%=ainfo.getID()%>"><%=ainfo.getBatchname()%></option>
<% } %>
</select> 
<% 
dbBean.CloseConnection(); 
%>
 