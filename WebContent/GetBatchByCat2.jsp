<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Batch"%>
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.TestSubCat"%>
<%@ page import="com.software.onlexam.Company"%>
<!DOCTYPE HTML>
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
</head>
<body>
<% 
DB dbBean = new DB(); 
String action = request.getParameter("action");
if (action != null && action.equals("deleteCompany")) 
{
	try 
	{
		int Companyno = Integer.parseInt(request.getParameter("Companyno"));
		if(dbBean.DeleteCompany(Companyno)==false)
		{
			out.println("Error deleting company");
		}
		response.sendRedirect("GetBatchByCat1.jsp#r3");
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
if (action != null && action.equals("deleteTest")) 
{
	try 
	{
		int Testno = Integer.parseInt(request.getParameter("Testno"));
		if(dbBean.DeleteTest(Testno)==false)
			out.println("Error deleting Test");
		response.sendRedirect("GetBatchByCat1.jsp#r3");
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
if (action != null && action.equals("deleteTestSubCat")) 
{
	try 
	{
		int TestSubCatno = Integer.parseInt(request.getParameter("TestSubCatno"));
		if(dbBean.DeleteTestSubCat(TestSubCatno)==false)
			out.println("Error deleting TestSubCat");
		response.sendRedirect("GetBatchByCat1.jsp#r3");
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
if (action != null && action.equals("deleteTestSubCat1")) 
{
	try 
	{
		int TestSubCatno = Integer.parseInt(request.getParameter("TestSubCatno"));
		if(dbBean.DeleteTestSubCat(TestSubCatno)==false)
			out.println("Error deleting TestSubCat");
		response.sendRedirect("ListScatByTest.jsp");
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
if (action != null && action.equals("deleteBatch")) 
{
	try 
	{
		int Batchno = Integer.parseInt(request.getParameter("Batchno"));
		if(dbBean.DeleteBatch(Batchno)==false)
			out.println("Error deleting Batch");
		response.sendRedirect("GetBatchByCat1.jsp#r3");
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
if (action != null && action.equals("deleteBatch1")) 
{
	try 
	{
		int Batchno = Integer.parseInt(request.getParameter("Batchno"));
		if(dbBean.DeleteBatch(Batchno)==false)
			out.println("Error deleting Batch");
		response.sendRedirect("GetBatchByCat.jsp");
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}


%>
<% dbBean.CloseConnection(); %>
</body>
</html>	
