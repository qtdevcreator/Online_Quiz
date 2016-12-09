<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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
<script type="text/javascript">
var st = "0";
var st1 = "0";
var st2 = "0";
function chkval()
{
	var chk = document.getElementById("userIdMessage114").innerHTML;
	var chk1 = chk.trim();
	if(chk1=="Id is already used!")
	{
		st = "1";
	}
	else 
	{
		st = "0";
	}
}
function chkval1()
{
	var chk = document.getElementById("userIdMessage115").innerHTML;
	var chk1 = chk.trim();
	if(chk1=="Password is already used!")
	{
		st1 = "1";
	}
	else 
	{
		st1 = "0";
	}
}
function chkval2()
{
	var chk = document.getElementById("userIdMessage120").innerHTML;
	var chk1 = chk.trim();
	if(chk1=="Employee Id already exists!")
	{
		st2 = "1";
	}
	else 
	{
		st2 = "0";
	}
}

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
		document.getElementById("userIdMessage114").innerHTML=xmlhttp.responseText;
		chkval();
	} 
	} 
	xmlhttp.open("GET","getIds.jsp?q="+str,true); 
	xmlhttp.send();	
}
function checkEids(str){ 
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
		document.getElementById("userIdMessage120").innerHTML=xmlhttp.responseText;
		chkval2();
	} 
	} 
	xmlhttp.open("GET","getEids.jsp?q="+str,true); 
	xmlhttp.send();	
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
		document.getElementById("userIdMessage115").innerHTML=xmlhttp.responseText;
		chkval1();
	} 
	} 
	xmlhttp.open("GET","getPswds.jsp?q="+str,true); 
	xmlhttp.send();	
}
function checkvalidate111()
{
	var x=document.forms["regform"]["stname"].value;
	var x1=document.forms["regform"]["stmname"].value;
	var x2=document.forms["regform"]["stlname"].value;
	var x3=document.forms["regform"]["email"].value;
	var x4=document.forms["regform"]["password"].value;
	var x5=document.forms["regform"]["password1"].value;
	var x6=document.forms["regform"]["mobile1"].value;
	var x7=document.forms["regform"]["age"].value;
	var x8=document.forms["regform"]["staddress"].value;
	var x9=document.forms["regform"]["eid"].value;
	
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage111").innerHTML = "Please enter first name!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage111").innerHTML = "";
	}
	if (x1==null || x1=="")
	{
		document.getElementById("userIdMessage112").innerHTML = "Please enter middle name!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage112").innerHTML = "";
	}
	if (x2==null || x2=="")
	{
		document.getElementById("userIdMessage113").innerHTML = "Please enter last name!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage113").innerHTML = "";
	}
	if (x3==null || x3=="")
	{
		document.getElementById("userIdMessage114").innerHTML = "Please enter userId!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage114").innerHTML = "";
	}
	if (isNaN(x3))
	{
		document.getElementById("userIdMessage114").innerHTML = "UserId must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage114").innerHTML = "";
	}
	if(x3.length != 6)
	{
		document.getElementById("userIdMessage114").innerHTML = "UserId must be 6 digit!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage114").innerHTML = "";
	}
	if(st=="1")
	{
		document.getElementById("userIdMessage114").innerHTML="Id is already used!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage114").innerHTML = "";
	}	
	if (x4==null || x4=="")
	{
		document.getElementById("userIdMessage115").innerHTML = "Please enter password!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage115").innerHTML = "";
	}
	if(st1=="1")
	{
		document.getElementById("userIdMessage115").innerHTML="Password is already used!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage115").innerHTML = "";
	}	
	if(x4.length < 5 || x4.length > 10)
	{
		document.getElementById("userIdMessage115").innerHTML = "Password must be between 5 to 10 characters!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage115").innerHTML = "";
	}
	if (x5==null || x5=="")
	{
		document.getElementById("userIdMessage116").innerHTML = "Please enter confirm password!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage116").innerHTML = "";
	}
	if (x4!=x5)
	{
		document.getElementById("userIdMessage116").innerHTML = "Password and Confirm password must be same!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage116").innerHTML = "";
	}
	
	if (x6==null || x6=="")
	{
		document.getElementById("userIdMessage117").innerHTML = "Please enter mobile number!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage117").innerHTML = "";
	}
	if (isNaN(x6))
	{
		document.getElementById("userIdMessage117").innerHTML = "Mobile number must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage117").innerHTML = "";
	}
	if (x6.length!=10)
	{
		document.getElementById("userIdMessage117").innerHTML = "Mobile number must be 10 digit!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage117").innerHTML = "";
	}
	if (x7==null || x7=="")
	{
		document.getElementById("userIdMessage118").innerHTML = "Please enter age!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage118").innerHTML = "";
	}
	if (isNaN(x7))
	{
		document.getElementById("userIdMessage118").innerHTML = "Age must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage118").innerHTML = "";
	}
	if((x7 < 1 || x7 > 150))
	{
		document.getElementById("userIdMessage118").innerHTML = "Age must be between 1 TO 150!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage118").innerHTML = "";
	}
	if (x8==null || x8=="")
	{
		document.getElementById("userIdMessage119").innerHTML = "Please enter address!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage119").innerHTML = "";
	}
	if(st2=="1")
	{
		document.getElementById("userIdMessage120").innerHTML="Employee Id already exists!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage120").innerHTML = "";
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
                       Register
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-12">
                                
                                <form action="WelcomeReg.jsp?action=Register" method="post" name="regform" onSubmit="return checkvalidate111()">
								<input type="hidden" name="action" value="Student"/>
                                    <div class="form-group">
                                        <label>First Name</label>
                                        <input class="form-control" type="text" NAME="stname">
                                        <div id="userIdMessage111"></div>
                                    </div>
                                    <div class="form-group">
                                        <label>Middle Name</label>
                                        <input class="form-control" type="text" NAME="stmname">
                                        <div id="userIdMessage112"></div>
                                    </div>
                                    <div class="form-group">
                                        <label>Last Name</label>
                                        <input class="form-control" type="text" NAME="stlname">
                                        <div id="userIdMessage113"></div>
                                    </div>
                                    <div class="form-group">
                                        <label>UserId</label>
                                        <input class="form-control" type="text" NAME="email" autocomplete="off" oncontextmenu="return false" onkeyup="checkIds(this.value)">
                                        <div id="userIdMessage114"></div>
                                    </div>
                                    <div class="form-group">
                                        <label>Gender</label>
                                        <INPUT  TYPE="radio" NAME="gender" value="Male" checked>  Male  </INPUT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="radio" NAME="gender" value="Female" >  Female  </INPUT>                                        
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input class="form-control" type="password" NAME="password" autocomplete="off" oncontextmenu="return false" onkeyup="checkPswds(this.value)">
                                        <div id="userIdMessage115"></div>
                                    </div>
                                    <div class="form-group">
                                        <label>Confirm Password</label>
                                        <input class="form-control" type="password" NAME="password1">
                                        <div id="userIdMessage116"></div>
                                    </div>
                                    <div class="form-group">
                                        <label>Mobile Number</label>
                                        <input class="form-control" type="text" NAME="mobile1">
                                        <div id="userIdMessage117"></div>
                                    </div>
                                    <div class="form-group">
                                        <label>Age</label>
                                        <input class="form-control" type="text" NAME="age">
                                        <div id="userIdMessage118"></div>
                                    </div>
                                    <div class="form-group">
                                        <label>Address1</label>
                                        <textarea NAME="staddress" rows="3" cols="116"></textarea>
                                        <div id="userIdMessage119"></div>
                                    </div>
                                    <div class="form-group">
                                        <label>Employee Id</label>
                                        <input class="form-control" type="text" NAME="eid" autocomplete="off" oncontextmenu="return false" onkeyup="checkEids(this.value)">
                                        <div id="userIdMessage120"></div>
                                    </div>
                                    <div class="form-group">
                                        <label>Company</label>
                                        <input class="form-control" type="text" NAME="comname" value="<%=compname%>" readonly>
                                        <div id="userIdMessage121"></div>
                                    </div>
                                    <!-- div class="checkbox">
                                        <label>
                                            <div class="i-check"><div class="i-check"><input class="i-check" type="checkbox" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>Remember me</label>
                                    </div -->
                                   
					            
                                
                                 <input class="btn btn-cst-primary pull-right"  type="submit" value="Register">
                                </form>
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




