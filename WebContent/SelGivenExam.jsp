<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Batch"%>
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.TestSubCat"%>
<%@ page import="com.software.onlexam.Company"%>
<!DOCTYPE HTML>
<html>
<head>
<TITLE>Online Exam</TITLE>

<SCRIPT type="text/javascript">
   function noBack1() { window.history.forward(); }
</SCRIPT>
<script type="text/javascript">
function showStud(str){ 
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
		document.getElementById("dstud").innerHTML=xmlhttp.responseText; 
	} 
	} 
	xmlhttp.open("GET","getstud.jsp?q="+str,true); 
	xmlhttp.send(); 
} 
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
	xmlhttp.open("GET","getbatch1.jsp?q="+str+"&v="+str1+"&w="+str2,true); 
	xmlhttp.send(); 
} 
function checkvalidate63666()
{
	var x1=document.forms["f1"]["stest"].value;
	var x2=document.forms["f1"]["stestscat"].value;
	var x3=document.forms["f1"]["sbatch"].value;
	var x4=document.forms["f1"]["sstud"].value;
	
	if (x1==0)
	{
		document.getElementById("userIdMessage63662").innerHTML = "Please select Test!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage63662").innerHTML = "";
	}
	if (x2==0)
	{
		document.getElementById("userIdMessage63663").innerHTML = "Please select Test Sub Category!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage63663").innerHTML = "";
	}
	if (x3==0)
	{
		document.getElementById("userIdMessage63664").innerHTML = "Please select Test Batch!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage63664").innerHTML = "";
	}
	if (x4==0)
	{
		document.getElementById("userIdMessage63665").innerHTML = "Please select Student!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage63665").innerHTML = "";
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
%>
<%
int cid = 0;
if(session.getAttribute("SelCompany")!=null)
	cid = Integer.parseInt(session.getAttribute("SelCompany").toString());
String cmpic = "";
if(session.getAttribute("compicon")!=null)
	cmpic = session.getAttribute("compicon").toString();
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


<table align="center" width="670" height="490">
<tr  align="center" valign="top"><td  align="center">
<% if(eflg==false)
			{
%>
<h3 class="consultant-services">View Given Exams</h3><br>	
Select Quiz
<form name="f1" method="post" action="StartGivenExam.jsp" onSubmit="return checkvalidate63666()">	
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
		<td  align="center"><div id="userIdMessage63662"></div></td></tr>
<tr><td  align="center" width="150">TestSubCategory</td>
	<td   align="left"> 
		<div id="dtestscat">
		<select name="stestscat" onchange="showBatch(<%=cid%>,stest.value,this.value)"> 
		<option value="0">Select</option>
		</select> 
		</div>
		</td>
		<td  align="center" width="150"><div id="userIdMessage63663"></div></td></tr>
<tr><td  align="center" width="150">Batch</td>
	<td   align="left">
		<div id="dbatch"> 
		<select name="sbatch" onchange="showStud(this.value)"> 
		<option value="0">Select</option>
		</select> 
		</div>
		</td>
		<td  align="center" width="150"><div id="userIdMessage63664"></div></td></tr>	
<tr><td  align="center" width="150">Student</td>
	<td   align="left">
		<div id="dstud"> 
		<select name="sstud"> 
		<option value="0">Select</option>
		</select> 
		</div>
		</td>
		<td  align="center" width="150"><div id="userIdMessage63665"></div></td></tr>	
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
