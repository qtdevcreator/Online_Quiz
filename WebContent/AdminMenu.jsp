<%@ page language="java" %>
<!DOCTYPE HTML>
<HTML>
<head>
<style>
h1212 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; font-weight:normal; color:4169E1; text-decoration:none
}
h2212 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; font-weight:bold; color:4169E1; text-decoration:none
}
h3212 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; font-weight:normal; color:4169E1; text-decoration:none
}

</style>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href='css/css1.css' rel='stylesheet' type='text/css'>
<!-- <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'> -->
<!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'> -->
<link href='css/css2.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/mystyles.css">

</head>
<body>
<%
String chkval1 = "false";
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString();
if(chkval1.equals("true")) { %>
<ul>
    <a href="ListScatByTest.jsp"><li>List Test By Category</li></a>
    <a href="GetBatchByCat1.jsp"><li>Activity-Test List</li></a>
    <a href="ListBatchByTest1.jsp"><li>List Batch By Test</li></a>
    <a href="CreateIds.jsp"><li>Generate Student Ids</li></a>
    <a href="ListQuestion.jsp?action=List"><li>List Question</li></a>
    <a href="UploadExcelFile.jsp"><li>Upload QuestionBank</li></a>
    <a href="ListScore.jsp?action=List"><li>List Score</li></a>
    <a href="SelGivenExam.jsp"><li>View Exams</li></a>
    <a href="ListTestByOrder.jsp?action=ByOrder"><li>Test By Order</li></a>
    <a href="ListTestScatByOrder.jsp?action=ByOrder"><li>Test SubCat By Order</li></a>
    <a href="AddTest.jsp?action=Add"><li>Add Test</li></a>
    <a href="AddTestSubCat.jsp?action=Add"><li>Add Test Sub Category</li></a>
    <a href="AddBatch.jsp?action=Add"><li>Add Batch</li></a>
    <a href="ListTest.jsp?action=addTest"><li>List Test</li></a>
    <a href="ListTestscat.jsp?action=List"><li>List Test Sub Category</li></a>
    <a href="ListBatch.jsp?action=List"><li>List Batch</li></a> 
    <a href="GetStudentByPer.jsp"><li>List Student By Percent</li></a>    
    <a href="ListPassedStud.jsp"><li>List Passed Student</li></a>       
    <a href="ListScrByRng.jsp"><li>List Score By Range</li></a> 
    <a href="CreateStuIds.jsp?action=List"><li>Create Student Id</li></a>
    <a href="GetStuIds.jsp?action=List"><li>Get Student Id</li></a> 
    <a href="GetBatchByCat.jsp"><li>Test List</li></a>    
    <a href="GetBatchByCat3.jsp?action=StartQuiz"><li>Search Test</li></a>
    <a href="ListStudentByOrder.jsp"><li>Student By Order</li></a>
    <a href="ShowFeedback.jsp"><li>View Feedback</li></a>      
</ul>
<% } %>
</BODY>
</HTML>
