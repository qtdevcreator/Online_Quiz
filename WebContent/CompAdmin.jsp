<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.DB"%>
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
<SCRIPT type="text/javascript">
        function noBack1() { window.history.forward(); }
</SCRIPT>
<script type="text/javascript">
function checkvalidate55555()
{
	var x=document.forms["testform"]["comname"].value;
		
	if (x==0)
	{
		document.getElementById("userIdMessage55551").innerHTML = "Please select company!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage55551").innerHTML = "";
	}
}

function checkvalidate94991()
{
	var x=document.forms["logform"]["admid"].value;
	var x2=document.forms["logform"]["admpass"].value;
	
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage9941").innerHTML = "Please enter email!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage9941").innerHTML = "";
	}
	var atpos=x.indexOf("@");
	var dotpos=x.lastIndexOf(".");
	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
	{
		document.getElementById("userIdMessage9941").innerHTML = "Email Id is not valid!";
	   	return false;
	}
	else
	{
		document.getElementById("userIdMessage9941").innerHTML = "";
	}
	
	if (x2==null || x2=="")
	{
		document.getElementById("userIdMessage9942").innerHTML = "Please enter password!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage9942").innerHTML = "";
	}
}
</SCRIPT>

<link href='css/css1.css' rel='stylesheet' type='text/css'>
<!-- <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'> -->
<!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'> -->
<link href='css/css2.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/mystyles.css">
</head>
<body onload="noBack1();">
<% 
DB dbBean = new DB(); 
String name = request.getParameter("admid");
String password = request.getParameter("admpass");
String smsg = "";
if(dbBean.AdmLogin(name, password))
{
	session.setAttribute("logincadm", "true");
	smsg = "Successful Login!";
}
else
{
	smsg = "Administrator login has failed!";
}
%>
<div class="global-wrapper clearfix" id="global-wrapper">
        
   
      
    <jsp:include page="QuizHeader.jsp" flush="true"/>
    <jsp:include page="SearchComp.jsp" flush="true"/>
                
    <div class="container" style="margin-bottom:20px; margin-top:50px;">
    
    <div class="col-lg-5 col-lg-offset-3">
          <div class="">
              <header class="page-header">
                 
              </header>
              <div class="box-lg">
                  <div class="row" data-gutter="60">
                   <div class="col-md-12 row">
                   
                   <%=smsg%><br>
	</div>
                      
                  </div>
              </div>
          </div>
     </div>
     </div>
        
        <div class="gap"></div>
       
        <jsp:include page="Footer1.jsp" flush="true"/>
      
    
    </div>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/icheck.js"></script>
    <script src="js/ionrangeslider.js"></script>
    <script src="js/jqzoom.js"></script>
    <script src="js/card-payment.js"></script>
    <script src="js/owl-carousel.js"></script>
    <script src="js/magnific.js"></script>
    <script src="js/custom.js"></script>


<% dbBean.CloseConnection(); %>
</body>
</html>