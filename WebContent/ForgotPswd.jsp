<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.DB"%>
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
<script>
$("#studuser").on('change keydown paste input', function(){
	var txtFld = document.forms["fgotpswdform"]["studuser"].value;
	alert(txtFld);
	//checkIds(txtFld);
});
</script>
<script type="text/javascript">
var st = "0";
function checkIds(str){ 
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
		document.getElementById("userIdMessage1000").innerHTML=xmlhttp.responseText;
		chkval();
	} 
	} 
	xmlhttp.open("GET","getIds2.jsp?q="+str,true); 
	xmlhttp.send();
	
}
	
function checkvalidate1()
{
	var x=document.forms["fgotpswdform"]["studuser"].value;
	
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage1000").innerHTML = "Please enter userId!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1000").innerHTML = "";
	}
	
	if (isNaN(x))
	{
		document.getElementById("userIdMessage1000").innerHTML = "UserId must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1000").innerHTML = "";
	}
	if(x.length != 6)
	{
		document.getElementById("userIdMessage1000").innerHTML = "UserId must be 6 digit!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1000").innerHTML = "";
	}
	//checkIds(x);
	if(st=="1")
	{
		document.getElementById("userIdMessage1000").innerHTML="Id doesnt exists!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1000").innerHTML = "";
	}
	
}
function chkval()
{
	var chk = document.getElementById("userIdMessage1000").innerHTML;
	var chk1 = chk.trim();
	if(chk1=="Id doesnt exists!")
	{
		st = "1";
	}
	else 
	{
		st = "0";
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
DB dbBean = new DB(); 
%>
<%
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
                       Forgot Password
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-12">
                            
                            <form action="GetPswd.jsp" method="post" name="fgotpswdform" onSubmit="return checkvalidate1()">
								<input type="hidden" name="action" value="Student"/>
                                    <div class="form-group">
                                        <label>User ID</label>
                                        <input class="form-control" type="text" NAME="studuser" autocomplete="off" oncontextmenu="return false" onkeyup="checkIds(this.value)">
                                        <div id="userIdMessage1000"></div>
                                     <input class="btn btn-cst-primary pull-right"  type="submit" value="Go">
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
