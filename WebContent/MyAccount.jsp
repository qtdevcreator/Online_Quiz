<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.CustomerInfo"%>
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
<SCRIPT type="text/javascript">
   function noBack1() { window.history.forward(); }
</SCRIPT>
<script type="text/javascript">
var st = "0";
var st1 = "0";
function chkval()
{
	var chk = document.getElementById("userIdMessage224").innerHTML;
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
	var chk = document.getElementById("userIdMessage225").innerHTML;
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
		document.getElementById("userIdMessage224").innerHTML=xmlhttp.responseText; 
		chkval();
	} 
	} 
	xmlhttp.open("GET","getIds.jsp?q="+str,true); 
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
		document.getElementById("userIdMessage225").innerHTML=xmlhttp.responseText;
		chkval1();
	} 
	} 
	xmlhttp.open("GET","getPswds.jsp?q="+str,true); 
	xmlhttp.send();	
}
function checkvalidate222()
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
	
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage221").innerHTML = "Please enter first name!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage221").innerHTML = "";
	}
	if (x1==null || x1=="")
	{
		document.getElementById("userIdMessage222").innerHTML = "Please enter middle name!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage222").innerHTML = "";
	}
	if (x2==null || x2=="")
	{
		document.getElementById("userIdMessage223").innerHTML = "Please enter last name!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage223").innerHTML = "";
	}
	if (x3==null || x3=="")
	{
		document.getElementById("userIdMessage224").innerHTML = "Please enter userId!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage224").innerHTML = "";
	}
	if (isNaN(x3))
	{
		document.getElementById("userIdMessage224").innerHTML = "UserId must be numeric!";
	   return false;
	}
	else
	{
		document.getElementById("userIdMessage224").innerHTML = "";
	}
	if(x3.length != 6)
	{
		document.getElementById("userIdMessage224").innerHTML = "UserId must be 6 digit!";
	   return false;
	}
	else
	{
		document.getElementById("userIdMessage224").innerHTML = "";
	}
	if (x4==null || x4=="")
	{
		document.getElementById("userIdMessage225").innerHTML = "Please enter password!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage225").innerHTML = "";
	}		
	if(x4.length < 5 || x4.length > 10)
	{
		document.getElementById("userIdMessage225").innerHTML = "Password must be between 5 to 10 characters!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage225").innerHTML = "";
	}
	if (x5==null || x5=="")
	{
		document.getElementById("userIdMessage226").innerHTML = "Please enter confirm password!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage226").innerHTML = "";
	}
	if (x4!=x5)
	{
		document.getElementById("userIdMessage226").innerHTML = "Password and Confirm password must be same!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage226").innerHTML = "";
	}
	
	if (x6==null || x6=="")
	{
		document.getElementById("userIdMessage227").innerHTML = "Please enter mobile number!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage227").innerHTML = "";
	}
	if (isNaN(x6))
	{
		document.getElementById("userIdMessage227").innerHTML = "Mobile number must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage227").innerHTML = "";
	}
	if (x6.length!=10)
	{
		document.getElementById("userIdMessage227").innerHTML = "Mobile number must be 10 digit!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage227").innerHTML = "";
	}
	if (x7==null || x7=="")
	{
		document.getElementById("userIdMessage228").innerHTML = "Please enter age!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage228").innerHTML = "";
	}
	if (isNaN(x7))
	{
		document.getElementById("userIdMessage228").innerHTML = "Age must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage228").innerHTML = "";
	}
	if((x7 < 1 || x7 > 150))
	{
		document.getElementById("userIdMessage228").innerHTML = "Age must be between 1 TO 150!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage228").innerHTML = "";
	}
	if (x8==null || x8=="")
	{
		document.getElementById("userIdMessage229").innerHTML = "Please enter address!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage229").innerHTML = "";
	}
	
}
</script>

<link rel="stylesheet" href="mystyle.css" type="text/css" />
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
String suser = "";
if(session.getAttribute("studentnm")!=null)
	suser = session.getAttribute("studentnm").toString();
String compname = "";
String hdrscroll = "Online Quiz";
ArrayList<Company> llist = dbBean.getCompanyById(cid);
Iterator iterator = llist.iterator();
if (iterator.hasNext()) {
while (iterator.hasNext()) {
	Company linfo = (Company) iterator.next();
	cid = linfo.getID();
	compname = linfo.getCompname();
	hdrscroll = compname;
	hdrscroll += " " +  linfo.getCompaddr();
	hdrscroll += " " +  linfo.getContactno();
}
}
%>
<% 
	String name = "";
	if(session.getAttribute("studentuser")!=null)
		name = session.getAttribute("studentuser").toString();
	CustomerInfo cust = dbBean.getCustInfo(name,cid);
	String comname120 = "";
	ArrayList<Company> cm =  dbBean.getCompanyById(cid);
	Iterator iterator2 = cm.iterator();
	if(iterator2.hasNext())
	{
		Company cinfo = (Company) iterator2.next();
		comname120 = cinfo.getCompname();
	}
	dbBean.CloseConnection();
	String cmpic = "";
	if(session.getAttribute("compicon")!=null)
		cmpic = session.getAttribute("compicon").toString();
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
                <div class="col-md-6 col-md-offset-3">
                    <div class="main-header-input-center">
                   		<jsp:include page="LHSMenu.jsp" flush="true"/>
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
    
    
    	<div class="row">
                <jsp:include page="QuizMenu.jsp" flush="true"/>
    					
                <div class="col-md-9">
                
                <h3 class="custome-page-title">Welcome, <%=suser%></h3>
                
                 
                 	
                  <h3 class="custome-page-title" style="text-align:left; font-size:30px;">
                  <img src="<%=cmpic%>"  style="padding-right:150px;"><%=compname%></h3>
                  
                  
                 
                  
				
				<div class="col-lg-6 col-lg-offset-3">
                <div class="">
                    <header class="page-header text-center" style=" color:#2aa3d5; text-transform:uppercase; font-size:18px;">
					My Account                       
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-6">


<table align="center" width="700" height="490">
<tr  align="center" valign="top"><td  align="center">

<form action="WelcomeReg.jsp?action=MyAccount" method="post" name="regform" onSubmit="return checkvalidate222()" >
<div style="height: 410px; overflow-y: auto">
<table align="center" width="600" height="410">
<tbody>
	<tr><td  align="center" width="100">First Name</td>
	<td  align="left" colspan="4"><INPUT TYPE="TEXT" NAME="stname" value="<%=cust.stuname%>" SIZE="25"/></td>
	<td  align="center"><div id="userIdMessage221"></div></td></tr>
	<tr><td  align="center" width="100">Middle Name</td>
	<td  align="left" colspan="4"><INPUT TYPE="TEXT" NAME="stmname" value="<%=cust.stmname%>" SIZE="25"/></td>
	<td  align="center"><div id="userIdMessage222"></div></td></tr>
	<tr><td  align="center" width="100">Last name</td>
	<td  align="left" colspan="4"><INPUT TYPE="TEXT" NAME="stlname" value="<%=cust.stlname%>" SIZE="25"/></td>
	<td  align="center"><div id="userIdMessage223"></div></td></tr>
	<tr><td  align="center" width="100">UserId</td>
	<td  align="left" colspan="4"><INPUT TYPE="TEXT" NAME="email" value="<%=cust.stemail%>" readonly SIZE="25"/></td>
	<td  align="center"><div id="userIdMessage224"></div></td></tr>
	<tr><td  align="center" width="100">Gender</td><td></td>
	<td  align="left" colpspan="4"><% if(cust.stgender.equals("Male")) { %><INPUT TYPE="radio" NAME="gender" value="Male" checked> Male </INPUT><% } else	{ %><INPUT TYPE="radio" NAME="gender" value="Male"> Male </INPUT><% } %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<% if(cust.stgender.equals("Female"))	{ %><INPUT TYPE="radio" NAME="gender" value="Female" checked> Female </INPUT><% } else { %><INPUT TYPE="radio" NAME="gender" value="Female" > Female </INPUT><% } %></td>
	<td  align="center"></td></tr> 	
	<tr><td  align="center" width="100">Password</td>
	<td  align="left" colspan="4"><INPUT TYPE="PASSWORD" NAME="password"  value="<%=cust.stpass%>" readonly SIZE="25"/></td>
	<td  align="left" width="140"><div id="userIdMessage225"></div></td></tr>
	<tr><td  align="center" width="100">Confirm Password</td>
	<td  align="left" colspan="4"><INPUT TYPE="PASSWORD" NAME="password1" value="<%=cust.stcpass%>" readonly SIZE="25"/></td>
	<td  align="left" width="140"><div id="userIdMessage226"></div></td></tr>
	<tr><td  align="center" width="100">Mobile Number</td>
	<td  align="left" colspan="4"><INPUT TYPE="TEXT" NAME="mobile1" value="<%=cust.stmobile%>" SIZE="25"/></td>
	<td  align="left" width="140"><div id="userIdMessage227"></div></td></tr>
	<tr><td  align="center" width="100">Age</td>
	<td  align="left" colspan="4"><INPUT TYPE="TEXT" NAME="age" value="<%=cust.stage%>" SIZE="25"/></td>
	<td  align="left" width="140"><div id="userIdMessage228"></div></td></tr>
	<tr><td  align="center" width="100">Address</td>
	<td  align="left" colspan="4"><textarea NAME="staddress" rows="3" cols="26"><%=cust.staddress%></textarea></td>
	<td  align="left" width="140"><div id="userIdMessage229"></div></td></tr>
	<tr><td  align="center" width="150">Employee Id</td>
	<td  align="left" colspan="4"><INPUT TYPE="text" NAME="eid" value="<%=cust.empid%>" readonly SIZE="25"/></td>
	<td  align="center"><div id="userIdMessage230"></div></td></tr>
	<tr><td  align="center" width="150">Company</td>
	<td  align="left" colspan="4"><INPUT TYPE="text" NAME="comname" value="<%=compname%>" readonly SIZE="25"/></td>
	<td  align="center"><div id="userIdMessage230"></div></td></tr>
	<tr><td  align="center" colspan="5"><input class="btn btn-cst-primary pull-right"  type="submit" value="Update"></td><td></td></tr>	
</tbody></table></div>
</form>
</td></tr></table>	

				</div>
                    </div>
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

</body>
</html>




