<% 
session.setAttribute("loginapp","false");
session.setAttribute("loginadm","false");
session.setAttribute("Start","false");
session.setAttribute("End","false");
%>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="java.util.*" %>
<%@ page import ="java.io.*" %>
<!DOCTYPE HTML>
<HTML>
<HEAD>
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
<SCRIPT LANGUAGE="JavaScript">
function checkvalidate999011()
{
	var x=document.forms["searchfrm9"]["keyword"].value;
	var x1=document.forms["searchfrm9"]["cat"].value;
	
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage1289").innerHTML = "Enter keyword!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1289").innerHTML = "";
	}	
	if (x1=="Select")
	{
		document.getElementById("userIdMessage1289").innerHTML = "Select category!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1289").innerHTML = "";
	}	
}
function checkvalidate()
{
	var x=document.forms["LOGIN"]["Name"].value;
	var x2=document.forms["LOGIN"]["Pwd"].value;
	
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage1").innerHTML = "Please enter userId!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1").innerHTML = "";
	}
	if (isNaN(x))
	{
		document.getElementById("userIdMessage1").innerHTML = "UserId must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1").innerHTML = "";
	}
	if(x.length != 6)
	{
		document.getElementById("userIdMessage1").innerHTML = "UserId must be 6 digit!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1").innerHTML = "";
	}
	if (x2==null || x2=="")
	{
		document.getElementById("userIdMessage1").innerHTML = "Please enter password!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1").innerHTML = "";
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
</HEAD>
<BODY onload="noBack1();">
<% 
DB dbBean = new DB(); 
%>
<%
session.setAttribute("clkbtn", "false");
int cid = Integer.parseInt(request.getParameter("comname"));
session.setAttribute("SelCompany",cid);

String hdrscroll = "Online Quiz";
ArrayList<Company> llist99 = dbBean.getCompanyById(cid);
Iterator iterator99 = llist99.iterator();
if (iterator99.hasNext()) {
while (iterator99.hasNext()) {
	Company linfo = (Company) iterator99.next();
	hdrscroll = linfo.getCompname();
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
                	<div class="col-lg-12 text-center"><img src="img/cap.png" class="text-center" style="margin:0 auto;"></div>
                    <header class="page-header text-center" style=" color:#2aa3d5; text-transform:uppercase; font-size:18px;">
                       Student Login
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-12">
                                
                                <form NAME='LOGIN' ACTION="LoginSucc.jsp" method="POST" onSubmit="return checkvalidate()">
								<input type="hidden" name="action" value="Student"/>
                                    <div class="form-group">
                                        <label>User ID</label>
                                        <input class="form-control" type="text" NAME="Name">
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input class="form-control" type="password" NAME="Pwd">
                                    </div>
                                    <!-- div class="checkbox">
                                        <label>
                                            <div class="i-check"><div class="i-check"><input class="i-check" type="checkbox" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>Remember me</label>
                                    </div -->
                                   
                                
                                 <input class="btn btn-cst-primary pull-right"  type="submit" value="Sign in">
                                
					            </form><a href="ForgotPswd.jsp">Forgot Your Password?</a>
                              <div id="userIdMessage1"></div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="gap"></div>

        
        <jsp:include page="Footer.jsp" flush="true"/>
        
    </div>
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



<% 
dbBean.CloseConnection(); 
%>
</BODY>
</HTML>