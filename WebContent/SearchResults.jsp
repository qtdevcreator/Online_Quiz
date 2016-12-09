<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>

<html>
<head>
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
</head>
<body onload="noBack1();">


<%
//String action = request.getParameter("action");
String cat = request.getParameter("cat");
String keyword = request.getParameter("keyword");

if (cat.equals("Question")) 
{
	response.sendRedirect("ListQuestion.jsp?action=Search&keyword="+keyword);
}
else if (cat.equals("Test")) 
{
	response.sendRedirect("ListTest.jsp?action=Search&keyword="+keyword);
}
else if (cat.equals("Test SubCategory")) 
{
	response.sendRedirect("ListTestscat.jsp?action=Search&keyword="+keyword);
}
else if (cat.equals("Batch")) 
{
	response.sendRedirect("ListBatch.jsp?action=Search&keyword="+keyword);
}
else if (cat.equals("TestByOrder")) 
{
	response.sendRedirect("ListTest.jsp?action=ByOrder&keyword="+keyword);
}
else if (cat.equals("Test SubCategoryByOrder")) 
{
	response.sendRedirect("ListTestscat.jsp?action=ByOrder&keyword="+keyword);
}
else if (cat.equals("BatchByOrder")) 
{
	response.sendRedirect("ListBatch.jsp?action=ByOrder&keyword="+keyword);
}
else if (cat.equals("StartTestByOrder")) 
{
	response.sendRedirect("StartTestByOrder.jsp?action=TestByOrder&keyword="+keyword);
}
else if (cat.equals("StartTest SubCategoryByOrder")) 
{
	response.sendRedirect("StartTestscatByOrder.jsp?action=TestscatByOrder&keyword="+keyword);
}
else if (cat.equals("StartBatchByOrder")) 
{
	response.sendRedirect("StartBatchByOrder.jsp?action=BatchByOrder&keyword="+keyword);
}
%>

</body>
</html>