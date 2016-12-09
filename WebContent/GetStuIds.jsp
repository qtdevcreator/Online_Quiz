<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.CustomerInfo"%>
<%@ page import="com.software.onlexam.CreateStudIds"%>
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
var st2 = "0";
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
		document.getElementById("userIdMessage1914").innerHTML=xmlhttp.responseText;
		chkval2();
	} 
	} 
	xmlhttp.open("GET","getEmpid.jsp?q="+str,true); 
	xmlhttp.send();	
}

function chkval2()
{
	var chk = document.getElementById("userIdMessage1914").innerHTML;
	var chk1 = chk.trim();
	if(chk1=="Employee Id does not exits!")
	{
		st2 = "1";
	}
	else 
	{
		st2 = "0";
	}
}
function checkvalidate1911()
{
	var x9=document.forms["regform"]["eid"].value;
	
	
	if (x9==null || x9=="")
	{
		document.getElementById("userIdMessage1914").innerHTML = "Please enter employee id!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1914").innerHTML = "";
	}
	if(st2=="1")
	{
		document.getElementById("userIdMessage1914").innerHTML="Employee Id does not exits!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1914").innerHTML = "";
	}
}
</script>

<link href='css/css1.css' rel='stylesheet' type='text/css'>
<!-- <link href='https://fonts.googleapis.com/css?family=Lato:400,670' rel='stylesheet' type='text/css'> -->
<!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,670' rel='stylesheet' type='text/css'> -->
<link href='css/css2.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/mystyles.css">
</head>
<body onload="noBack1();">
<% 
DB dbBean = new DB();
String cmpic = "";
if(session.getAttribute("compicon")!=null)
	cmpic = session.getAttribute("compicon").toString();
%>
<%
int cid = 0;
if(session.getAttribute("SelCompany")!=null)
	cid = Integer.parseInt(session.getAttribute("SelCompany").toString());

String compname1 = ""; 
String compname = "";
String hdrscroll = "Online Quiz";
ArrayList<Company> llist = dbBean.getCompanyById(cid);
Iterator iterator = llist.iterator();
if (iterator.hasNext()) {
while (iterator.hasNext()) {
	Company linfo = (Company) iterator.next();
	cid = linfo.getID();
	compname = linfo.getCompname();
	hdrscroll = compname1;
	hdrscroll += " " +  linfo.getCompaddr();
	hdrscroll += " " +  linfo.getContactno();
}
}
%>
<%
String chkval1 = "false";
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString();

String slogin = "";
if(chkval1.equals("true"))
{ 
	slogin = "AdminLogin.jsp";
} else {
	slogin = "Login.jsp";
}

String action = request.getParameter("action");
String empid="";
ArrayList<CustomerInfo> clist = null;
if(action.equals("GetId"))
{	
	empid=request.getParameter("eid");
	clist = dbBean.getIdsInfo(empid,cid);
}
%>
<div class="global-wrapper clearfix" id="global-wrapper">
        
   
<% if(chkval1.equals("true"))
{ %>
     
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
                <div class="col-md-3">
                  <aside class="category-filters">
                        
                        <div class="category-filters-section">
                            <h3 class="widget-title-sm sidebar-list-header">Admin Menu</h3>
                           
                        </div>
                        
                        <div class="category-filters-section sidebar-list">
							<jsp:include page="AdminMenu.jsp" flush="true"/>    
						</div>
                     
                        
                    </aside>
                </div>
                <div class="col-md-9">
                
                <h3 class="custome-page-title">Welcome Administrator</h3>
                    
                    <h2 class="inner-page-header">List of Questions</h2>
                  <div class="row" data-gutter="15">
                         <div class="col-md-4">
                            <div class="product ">
                                
                                <div class="product-img-wrap text-center">
                                    <img class="" src="img/1.png" alt="Image Alternative text" title="Image Title">
                                </div>
                                <a class="product-link" href="ListQuestionChByKeyword.jsp?action=ListQues"></a>
                                <div class="product-caption text-center lq-btn">
                                   
                                    <a href="ListQuestionChByKeyword.jsp?action=ListQues">By Keyboard</a>
                                </div>
                            </div>
                        </div>
                            
                            
                        <div class="col-md-4">
                            <div class="product ">
                                
                                <div class="product-img-wrap text-center">
                                    <img class="" src="img/2.png" alt="Image Alternative text" title="Image Title">
                                </div>
                                <a class="product-link" href="ListQuestionChByAns.jsp?action=ListQues"></a>
                                <div class="product-caption text-center lq-btn">
                                   
                                    <a href="ListQuestionChByAns.jsp?action=ListQues">By Answer</a>
                                </div>
                            </div>
                        </div>
                        
                        
                         <div class="col-md-4">
                            <div class="product ">
                                
                                <div class="product-img-wrap text-center">
                                    <img class="" src="img/3.png" alt="Image Alternative text" title="Image Title">
                                </div>
                                <a class="product-link" href="ListQuestionChByLvl.jsp?action=ListQues"></a>
                                <div class="product-caption text-center lq-btn">
                                   
                                    <a href="ListQuestionChByLvl.jsp?action=ListQues">By Level</a>
                                </div>
                            </div>
                        </div>
                  </div>

                   
                 	<div class="gap-big"></div>
                  <h3 class="custome-page-title" style="text-align:left; font-size:30px;">
                  <img src="<%=cmpic%>"  style="padding-right:150px;"><%=compname%></h3>
                  
                  <div class="gap-big"></div>
                   <h2 class="inner-page-header"><%=compname%></h2>
                  <div class="col-md-12 " >
                  <div style="background:#fff; padding-bottom:15px;">  

<% } else { %>     
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
                       Get Student Ids
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-12">
                            <% } %>
                            
                            <form name="regform" onSubmit="return checkvalidate1911()" >
							<input type="hidden" name="action" value="GetId"/>
                                    <div class="form-group">
                                        <label>Employee ID</label>
                                        <input class="form-control" type="text" NAME="eid" autocomplete="off" oncontextmenu="return false" onkeyup="checkEids(this.value)">
                                        <div id="userIdMessage1914"></div>
                                     <input class="btn btn-cst-primary pull-right"  type="submit" value="Go">
                                     </div>
                                </form>
                                <br>
                              	<% 
if(action.equals("GetId"))
{
Iterator iterator2 = clist.iterator();
	
	if (iterator2.hasNext()) {
%>
<% if(chkval1.equals("true"))
{ %>
<div style="height: 300px; width:670px; overflow-y: auto">
<table align="center" height="300" width="670">
<% } else { %>
<div style="height: 300px; overflow-y: auto">
<table align="center" height="300">
<% } %>
<thead>
<tr BGCOLOR="#fff" align="center" ><td bgcolor="#fff" align="center" colspan="6"><h3 class="consultant-services">List Student Ids</h3></td></tr>
<tr  align="center" height="30">
<td width="150" align="center" >Employee Id</td>
<td width="150" align="center" >First Name</td>
<td width="150" align="center" >Middle Name</td>
<td width="150" align="center" >Last Name</td>
<td width="150" align="center" >User Id</td>
<td width="150" align="center" >Password</td>
</tr>
</thead>
<tbody>
<%		
 	 CustomerInfo winfo = (CustomerInfo) iterator2.next(); 
%>
<tr   height="30" align="center">
<td width="150" align="center"><%=empid%></td>
<td width="150" align="center"><%=winfo.stuname%></td>
<td width="150" align="center"><%=winfo.stmname%></td>
<td width="150" align="center"><%=winfo.stlname%></td>
<td width="150" align="center"><%=winfo.stemail%></td>
<td width="150" align="center"><%=winfo.stpass%></td>
</tr>
</tbody>
</table>    
</div>
<% 	
}
}
%>
<% if(chkval1.equals("true"))
{ %>
</div>	
</div>
	     </div>
      </div></div>           
 <% } %>
 <% if(!chkval1.equals("true"))
{ %>
                                                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
<% } %>                                
                
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

