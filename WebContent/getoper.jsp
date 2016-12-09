<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%> 
<% 
String str=request.getParameter("q");

%>
<select name="oper1">
<option value="0">Select</option>
<%
if(str.equals("Search"))
{
%>
<option value="0 and 9"><10</option>
<option value="10 and 100">>=10</option>
<option value="20 and 100">>=20</option>
<option value="30 and 100">>=30</option>
<option value="40 and 100">>=40</option>
<option value="50 and 100">>=50</option>
<option value="60 and 100">>=60</option>
<option value="90 and 100">>=70</option>
<option value="80 and 100">>=80</option>
<option value="90 and 100">>=90</option>
<option value="0 and 100">All</option>
<% } %>
<%
if(str.equals("PerSearch"))
{
%>
<option value="1"><40%</option>
<option value="2">>=40%</option>
<option value="3">>=50%</option>
<option value="4">>=60%</option>
<option value="5">>=70%</option>
<option value="6">>=80%</option>
<option value="7">>=90%</option>
<option value="8">All</option>
<% } %>
</select> 

 