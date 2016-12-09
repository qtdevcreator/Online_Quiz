<% 
session.setAttribute("loginapp","false");
session.setAttribute("loginadm","false");
session.setAttribute("Start","false");
session.setAttribute("End","false");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.DB"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Online Test</title>

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
DB dbBean1 = new DB(); 

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
                        <div class="col-md-3 row" align="center"> </div>
                        	<div class="col-md-3 row">
                            <img src="img/company.png" class="col-lg-4 img-responsive"> 
                        	</div>
                            <div class="col-md-5 row">
                                
                                <form name="testform" method="POST" action="Home.jsp" onSubmit="return checkvalidate55555()">
                                    <div class="form-group">
                                        <label>Select Company</label><br>
										
                                        <select class="product-page-option-select" name="comname">
                                            <option value="0" selected>Name of Company</option>                                            
											<%
											ArrayList<Company> llist = dbBean1.getCompany();
											Iterator iterator = llist.iterator();
											if (iterator.hasNext()) {
											while (iterator.hasNext()) {
												Company linfo = (Company) iterator.next();
											%>
													<option value="<%=linfo.getID()%>"><%=linfo.getCompname()%></option>
											<% } } %>
                            			</select>&nbsp;<input class="btn btn-cst-primary pull-right "  type="submit" value="Go">                            			
                                    </div>
                                 </form>   
                                <br><div id="userIdMessage55551"></div>
                                                            
                              
                            </div>
                            
                        </div>
                    <div class="col-md-1 row" align="center"> </div>
                    </div>
                </div>
            </div>
            
            
            <div class="col-lg-5 col-lg-offset-3">
                <div class="">
                    <header class="page-header text-center" style=" color:#2aa3d5; text-transform:uppercase; font-size:18px;">
                       Admin Login
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-12">
                                
                                <form name="logform" Method="post" action="CompAdmin.jsp" onSubmit="return checkvalidate94991()">
                                    <div class="form-group">
                                        <label>User ID</label>
                                        <input class="form-control" type="text" NAME="admid">
                                        <div id="userIdMessage9941"></div>
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input class="form-control" type="password" NAME="admpass">
                                        <div id="userIdMessage9942"></div>
                                    </div>
                                    <!-- div class="checkbox">
                                        <label>
                                            <div class="i-check"><div class="i-check"><input class="i-check" type="checkbox" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>Remember me</label>
                                    </div -->
                                   
                                <!-- a href="#">Forgot Your Password?</a -->
                                
                                 <input class="btn btn-cst-primary pull-right"  type="submit" value="Sign in">
                                </form>
                              
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

<% dbBean1.CloseConnection(); %>
</body>
</html>