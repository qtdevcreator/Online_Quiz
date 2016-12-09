<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%> 
<%@ page import="com.software.onlexam.TestSubCat"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="java.util.*" %>
<%! int k;
	int z;%> 
 
<% 
DB dbBean = new DB(); 
String str=request.getParameter("q");
String str1=request.getParameter("v");


k=Integer.parseInt(str);
z=Integer.parseInt(str1);

%>
<select name="stestscat" onchange="showBatch(<%=str%>,<%=str1%>,this.value)">
<option value="0">Select</option>
<% 
ArrayList<TestSubCat> alist = dbBean.getTscatByComp(k,z);
Iterator iterator2 = alist.iterator();
while (iterator2.hasNext()) {
	TestSubCat ainfo = (TestSubCat) iterator2.next();
%>
<option value="<%=ainfo.getID()%>"><%=ainfo.getTestsubcatname()%></option>
<% } %>
</select> 
<% 
dbBean.CloseConnection(); 
%>
 