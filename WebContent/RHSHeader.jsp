<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Batch"%>
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.TestSubCat"%>
<%@ page import="com.software.onlexam.Company"%>
<html>
<head>
<style>
h121 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; font-weight:normal; color:4169E1; text-decoration:none
}
h221 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; font-weight:bold; color:4169E1; text-decoration:none
}
h321 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; font-weight:normal; color:4169E1; text-decoration:none
}

</style>
<script type="text/javascript">
    function noBack7() { window.history.forward(); }
    noBack();
    window.onload = noBack7;
    window.onpageshow = function (evt) { if (evt.persisted) noBack7(); }
    window.onunload = function () { void (0); }
</script>
<SCRIPT LANGUAGE="javascript">
function ClearHistory()
{
	 noBack1();
     var backlen = history.length;
     history.go(-backlen);
     window.location.href = "http://localhost:8083/Online_Exam/Logout.jsp";
}
</SCRIPT>	
<script type="text/javascript">
function showBatch99(str,str1,str2){ 
	var xmlhttp; 
	
	if (window.XMLHttpRequest) 
	{// code for IE7+, Firefox, Chrome, Opera, Safari 
		xmlhttp=new XMLHttpRequest(); 
	} 
	else 
	{// code for IE6, IE5 
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); 
	} 
	xmlhttp.onreadystatechange=function() 
	{ 
	if (xmlhttp.readyState==4 && xmlhttp.status==200) 
	{ 
		document.getElementById("dbatch99").innerHTML=xmlhttp.responseText; 
	} 
	} 
	xmlhttp.open("GET","getbatch99.jsp?q="+str+"&v="+str1+"&w="+str2,true); 
	xmlhttp.send(); 
} 
function showTest99(str){ 
	var xmlhttp; 
	
	if (window.XMLHttpRequest) 
	{// code for IE7+, Firefox, Chrome, Opera, Safari 
		xmlhttp=new XMLHttpRequest(); 
	} 
	else 
	{// code for IE6, IE5 
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); 
	} 
	xmlhttp.onreadystatechange=function() 
	{ 
	if (xmlhttp.readyState==4 && xmlhttp.status==200) 
	{ 
		document.getElementById("dtest99").innerHTML=xmlhttp.responseText; 
	} 
	} 
	xmlhttp.open("GET","gettest199.jsp?q="+str,true); 
	xmlhttp.send(); 
}
function showTestscat99(str,str1){ 
	var xmlhttp; 
	
	if (window.XMLHttpRequest) 
	{// code for IE7+, Firefox, Chrome, Opera, Safari 
		xmlhttp=new XMLHttpRequest(); 
	} 
	else 
	{// code for IE6, IE5 
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); 
	} 
	xmlhttp.onreadystatechange=function() 
	{ 
	if (xmlhttp.readyState==4 && xmlhttp.status==200) 
	{ 
		document.getElementById("dtestscat99").innerHTML=xmlhttp.responseText; 
	} 
	} 
	xmlhttp.open("GET","gettestscat199.jsp?q="+str+"&v="+str1,true); 
	xmlhttp.send(); 
}

function showOper(str){ 
	var xmlhttp;
		
	if (window.XMLHttpRequest) 
	{// code for IE7+, Firefox, Chrome, Opera, Safari 
		xmlhttp=new XMLHttpRequest(); 
	} 
	else 
	{// code for IE6, IE5 
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); 
	} 
	xmlhttp.onreadystatechange=function() 
	{ 
	if (xmlhttp.readyState==4 && xmlhttp.status==200) 
	{ 
		document.getElementById("doper").innerHTML=xmlhttp.responseText; 
	} 
	} 
	xmlhttp.open("GET","getoper.jsp?q="+str,true); 
	xmlhttp.send(); 
}
function checkvalidate999901()
{
	var x=document.forms["searchfrm"]["keyword"].value;
	var x1=document.forms["searchfrm"]["cat"].value;
		
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage99101").innerHTML = "Enter keyword!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage99101").innerHTML = "";
	}
	if (x1=="Select")
	{
		document.getElementById("userIdMessage99102").innerHTML = "Select Category!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage99102").innerHTML = "";
	}		
}

function checkvalidate999902()
{	
	var x2=document.forms["searchform2"]["stest"].value;
	var x3=document.forms["searchform2"]["stestscat"].value;
	var x4=document.forms["searchform2"]["sbatch"].value;
	var x5=document.forms["searchform2"]["action"].value;
	var x6=document.forms["searchform2"]["oper1"].value;
		
	
	if (x2==0)
	{
		document.getElementById("userIdMessage99142").innerHTML = "Select Test!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage99142").innerHTML = "";
	}
	if (x3==0)
	{
		document.getElementById("userIdMessage99143").innerHTML = "Select Testsubcat!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage99143").innerHTML = "";
	}	
	if (x4==0)
	{
		document.getElementById("userIdMessage99144").innerHTML = "Select batch!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage99144").innerHTML = "";
	}
	if (x5==0)
	{
		document.getElementById("userIdMessage99145").innerHTML = "Select Search!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage99145").innerHTML = "";
	}	
	if (x6==0)
	{
		document.getElementById("userIdMessage99146").innerHTML = "Select Range!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage99146").innerHTML = "";
	}
}
</script>
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
String chkval = "false";
String chkval1 = "false"; 
if(session.getAttribute("loginapp")!=null)
	chkval = session.getAttribute("loginapp").toString();
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString();

String chkval2 = "false";
if(session.getAttribute("SelCompany")!=null)
	chkval2 = session.getAttribute("SelCompany").toString();

String sstat = "false";
if(session.getAttribute("Start")!=null)
	sstat = session.getAttribute("Start").toString();

String send = "false";
if(session.getAttribute("End")!=null)
	send = session.getAttribute("End").toString();

int iheight = 10;
if(chkval.equals("true") && sstat.equals("false") && send.equals("false"))
{
	iheight = 140;
}
if(chkval.equals("true") && sstat.equals("true") && send.equals("false"))
{
	iheight = 240;
}
if(chkval.equals("true") && sstat.equals("false") && send.equals("true"))
{
	iheight = 120;
}
if(chkval.equals("false") && chkval1.equals("false"))
{
	iheight = 270;
}
%>
<ul class="nav navbar-nav navbar-center">
<% if(chkval.equals("false") && chkval1.equals("false"))
{ %>
    <li class="dropdown yamm-fw"><a href="AdmLogOut.jsp">SelectCompany</a></li>
    <li class="dropdown yamm-fw"><a href="Home.jsp?comname=<%=chkval2%>">Log In</a></li>
    <li class="dropdown yamm-fw"><a href="AdminLogin.jsp">Administrator</a></li>
    <li class="dropdown yamm-fw"><a href="GetStuIds.jsp?action=List">GetStudentId</a></li>    
<% } %>
<% if(chkval1.equals("true")&& chkval.equals("false"))
{ %>
<li class="dropdown yamm-fw"><a href="LogOut.jsp">Log Out</a></li>
<% } else   { 
	if(!sstat.equals("true") && chkval.equals("true"))  {
%>
<li class="dropdown yamm-fw"><a href="LogOut.jsp">Log Out</a></li>
<% } } %>
<% if((chkval1.equals("true")) && chkval1.equals("false"))
{ %> 
<li class="dropdown yamm-fw"><a href="LogOut.jsp">Log Out</a></li>
<% } %>
<% if((chkval.equals("true")))
{ 
if(!sstat.equals("true")) {%>

<% } else { %>

<% } } %>
<% if(chkval.equals("false") && chkval1.equals("false"))
{ %>
<li class="dropdown yamm-fw"><a href="Register.jsp">Sign Up</a></li>
<li class="dropdown yamm-fw"><a href="AboutUs1.jsp">About Us</a></li>
<% } %>
<% if(chkval.equals("true") && !sstat.equals("true"))
{ %>
<li class="dropdown yamm-fw"><a href="MyAccount.jsp">MyAccount</a></li>
<% } %>
<% if(chkval.equals("false") && chkval1.equals("false"))
{ %>
<li class="dropdown yamm-fw"><a href="ForgotPswd.jsp">Forgot Password</a></li>
<% } %>
<% if(chkval1.equals("false") && !sstat.equals("true") && chkval.equals("true"))
{ %>
<li class="dropdown yamm-fw"><a href="ContactUs.jsp?action=Display">Contact Us</a></li>
<li class="dropdown yamm-fw"><a href="Feedback.jsp">Give Feedback</a></li>
<li class="dropdown yamm-fw"><a href="ShowFeedback.jsp">View Feedback</a></li>
<% } %>
<% if(chkval.equals("true") && sstat.equals("false") && send.equals("false"))
{ %>
<li class="dropdown yamm-fw"><a href="GetBatchByCat3.jsp?action=StartQuiz">SearchTest</a></li>
<% } %>
<% if(chkval1.equals("true"))
{ %>
<li class="dropdown yamm-fw"><a href="ListCustomers.jsp?action=Customer">List Students</a></li>
<li class="dropdown yamm-fw"><a href="Cust_Query.jsp?action=Show">Student Queries</a></li>
<li class="dropdown yamm-fw"><a href="AddQuestion.jsp?action=Add">Add Question</a></li>
<li class="dropdown yamm-fw"><a href="GetStudentByMks.jsp">ListStudentByMarks</a></li>
<li class="dropdown yamm-fw"><a href="ListIds.jsp">ListStudentIds</a></li>
<li class="dropdown yamm-fw"><a href="ResetAdminCo.jsp?action=Display">ResetAdmin</a></li>
<% } %>
</ul>

</body>
</html>