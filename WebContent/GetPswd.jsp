<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.DB" %>
<%@ page import="java.util.*" %>
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
var st = "0";
function chkval()
{
	var chk = document.getElementById("userIdMessage11").innerHTML;
	var chk1 = chk.trim();
	if(chk1=="Password is already used!")
	{
		st = "1";
	}
	else 
	{
		st = "0";
	}
}
function checkPswds(str){ 
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
		document.getElementById("userIdMessage11").innerHTML=xmlhttp.responseText; 
		chkval();
	} 
	} 
	xmlhttp.open("GET","getPswds.jsp?q="+str,true); 
	xmlhttp.send();	
}
function chkvalidate2()
{
	var x=document.forms["chgpswdform"]["pass"].value;
	var x1=document.forms["chgpswdform"]["pass1"].value;
	var val=0;
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage11").innerHTML = "Please enter password!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage11").innerHTML = "";
	}
	if(st=="1")
	{
		document.getElementById("userIdMessage11").innerHTML="Password is already used!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage11").innerHTML = "";
	}	
	if(x.length < 5 || x.length > 10)
	{
		document.getElementById("userIdMessage11").innerHTML = "Password must be between 5 to 10 characters!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage11").innerHTML = "";
	}
	if (x1==null || x1=="")
	{
		document.getElementById("userIdMessage12").innerHTML = "Please enter confirm password!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage12").innerHTML = "";
	}
	if (x!=x1)
	{
		document.getElementById("userIdMessage12").innerHTML = "Password and Confirm password must be same!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage12").innerHTML = "";
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
<body onload="noBack1();">

<%	
	String name = request.getParameter("studuser");
%>
<%
DB dbBean = new DB();
int cid = 0;
if(session.getAttribute("SelCompany")!=null)
	cid = Integer.parseInt(session.getAttribute("SelCompany").toString());

String compname = "";
String hdrscroll = "Online Quiz";
ArrayList<Company> llist = dbBean.getCompanyById(cid);
Iterator iterator = llist.iterator();
if (iterator.hasNext()) {
while (iterator.hasNext()) {
	Company linfo = (Company) iterator.next();
	compname = linfo.getCompname();
	hdrscroll = compname;
	hdrscroll += " " +  linfo.getCompaddr();
	hdrscroll += " " +  linfo.getContactno();
}
}
%>
<div class="global-wrapper clearfix" id="global-wrapper">
        
   
      
    <jsp:include page="QuizHeader.jsp" flush="true"/>
        
        
        <nav class="navbar navbar-default navbar-main-white yamm">
            <div class="navbar-header">
                <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#main-nav-collapse" area_expanded="false"><span class="sr-only">Main Menu</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="main-nav-collapse">
                <div class="container">
                    <jsp:include page="RHSHeader.jsp" flush="true"/>
                </div>
            </div>
        </nav>
        
        <div class="student-bg">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-md-offset-3">
                    <div class="main-header-input-center">
                        <h4 style="font-size:40px; color:#fff; text-transform:uppercase;">Welcome to Examination</h4>
                    </div>
                </div>
            </div>
        </div>
        </div>
        
          <div class="breadcrumbs-bg">
        <div class="container">
        	<p><%=hdrscroll%></p>
        </div></div>
     
        

       
       
      
    <div class="container" style="margin-bottom:20px; margin-top:40px;">
    
     
            
            
            <div class="col-lg-5 col-lg-offset-3">
                <div class="">
                	<header class="page-header text-center" style=" color:#2aa3d5; text-transform:uppercase; font-size:18px;">
                       Reset Password
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-12">
                            
                            <form action="ChgPswdSucc.jsp" method="post" name="chgpswdform" onSubmit="return chkvalidate2()">
							<input type="hidden" name="name" value="<%=name%>"/>
								<input type="hidden" name="action" value="Student"/>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input class="form-control" type="password" NAME="pass" autocomplete="off" oncontextmenu="return false" onkeyup="checkPswds(this.value)">
                                        <div id="userIdMessage11"></div>
                                     </div>
                                     <div class="form-group">
                                        <label>Confirm Password</label>
                                        <input class="form-control" type="password" NAME="pass1">
                                        <div id="userIdMessage12"></div>
                                     <input class="btn btn-cst-primary pull-right"  type="submit" value="Reset">
                                     </div>
                                </form>
                              
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="gap"></div>

        
        <jsp:include page="Footer.jsp" flush="true"/>
        
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
