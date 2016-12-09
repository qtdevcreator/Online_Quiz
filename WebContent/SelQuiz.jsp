<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Batch"%>
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.TestSubCat"%>
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
function showTestscat(str,str1){ 
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
		document.getElementById("dtestscat").innerHTML=xmlhttp.responseText; 
	} 
	} 
	xmlhttp.open("GET","gettestscat1.jsp?q="+str+"&v="+str1,true); 
	xmlhttp.send(); 
} 
function showBatch(str,str1,str2){ 
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
		document.getElementById("dbatch").innerHTML=xmlhttp.responseText; 
	} 
	} 
	xmlhttp.open("GET","getbatch.jsp?q="+str+"&v="+str1+"&w="+str2,true); 
	xmlhttp.send(); 
} 
function checkvalidate66666()
{
	var x1=document.forms["f1"]["stest"].value;
	var x2=document.forms["f1"]["stestscat"].value;
	var x3=document.forms["f1"]["sbatch"].value;
	
	if (x1==0)
	{
		document.getElementById("userIdMessage66662").innerHTML = "Please select Test!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage66662").innerHTML = "";
	}
	if (x2==0)
	{
		document.getElementById("userIdMessage66663").innerHTML = "Please select Test Sub Category!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage66663").innerHTML = "";
	}
	if (x3==0)
	{
		document.getElementById("userIdMessage66664").innerHTML = "Please select Batch!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage66664").innerHTML = "";
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
String suser = "";
if(session.getAttribute("studentnm")!=null)
	suser = session.getAttribute("studentnm").toString();
String compname = "";
boolean eflg = false;
String hdrscroll = "Online Quiz";
ArrayList<Company> llist99 = dbBean.getCompanyById(cid);
Iterator iterator99 = llist99.iterator();
if (iterator99.hasNext()) {
while (iterator99.hasNext()) {
	Company linfo = (Company) iterator99.next();
	cid = linfo.getID();
	compname = linfo.getCompname();
	hdrscroll = compname;
	hdrscroll += " " +  linfo.getCompaddr();
	hdrscroll += " " +  linfo.getContactno();
}
}
else
{
	eflg=true;
}
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
                       Select Quiz
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-12">


<table align="center" width="630" height="490">
<tr  align="center" valign="top"><td  align="center">
<% if(eflg==false)
			{
%>
<form name="f1" method="post" action="StartQuiz.jsp" onSubmit="return checkvalidate66666()">	
<input type="hidden" value="StartQuiz" name="action">
<input type="hidden" value="<%=cid%>" name="comid">
<table align="center" width="500" >
	<tr align="center"><td  align="center" width="150">Test</td>
<td  align=left><select name="stest" onchange="showTestscat(<%=cid%>,this.value)">
		<option value="0">Select</option>
		<% 
		ArrayList<Test> alist = dbBean.getTestByComp(cid);
		Iterator iterator2 = alist.iterator();
		while (iterator2.hasNext()) {
			Test ainfo = (Test) iterator2.next();
		%>
		<option value="<%=ainfo.getID()%>"><%=ainfo.getTestname()%></option>
		<% } %>
		</select>
		</td>
		<td  align="center" width="200"><div id="userIdMessage66662"></div></td></tr>
<tr><td  align="center" width="150">TestSubCategory</td>
	<td   align="left"> 
		<div id="dtestscat">
		<select name="stestscat" onchange="showBatch(<%=cid%>,stest.value,this.value)"> 
		<option value="0">Select</option>
		</select> 
		</div>
		</td>
		<td  align="center" width="200"><div id="userIdMessage66663"></div></td></tr>
<tr><td  align="center" width="150">Batch</td>
	<td   align="left">
		<div id="dbatch"> 
		<select name="sbatch"> 
		<option value="0">Select</option>
		</select> 
		</div>
		</td>
		<td  align="center" width="150"><div id="userIdMessage66664"></div></td></tr>	
<tr><td></td><td  align="left" ><input class="btn btn-cst-primary pull-right"  type="submit" value="Go"></td><td></td></tr>
</table>
</form>
<%
} else {
%>
<table align="center" width="590" height="40">
<TR align="center"><TD  align="center">No company is selected!</TD></TR>
</table>
<% } %>
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
<% dbBean.CloseConnection(); %>
</body>
</html>
