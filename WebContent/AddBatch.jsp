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
        function noBack1() { window.history.forward();   }
</SCRIPT>
<script type="text/javascript">
function showTest(str){ 
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
		document.getElementById("dtest").innerHTML=xmlhttp.responseText; 
	} 
	} 
	xmlhttp.open("GET","gettest1.jsp?q="+str,true); 
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
	xmlhttp.open("GET","gettestscat.jsp?q="+str+"&v="+str1,true); 
	xmlhttp.send(); 
}
function calctotmks()
{
	var x4=document.forms["Batchform"]["marksperq"].value;
	var x9=document.forms["Batchform"]["lvl1"].value;
	var x10=document.forms["Batchform"]["lvl2"].value;
	var x11=document.forms["Batchform"]["lvl3"].value;
	if (isNaN(x9))
	{
		document.getElementById("userIdMessage670").innerHTML = "No. of easy questions must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage670").innerHTML = "";
	}
	if (x9<0)
	{
		document.getElementById("userIdMessage670").innerHTML = "No. of easy questions cannot be negative!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage670").innerHTML = "";
	}
	if (isNaN(x10))
	{
		document.getElementById("userIdMessage671").innerHTML = "No. of medium questions must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage671").innerHTML = "";
	}
	if (x10 < 0)
	{
		document.getElementById("userIdMessage671").innerHTML = "No. of medium questions cannot be negative!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage671").innerHTML = "";
	}
	if (isNaN(x11))
	{
		document.getElementById("userIdMessage672").innerHTML = "No. of difficult questions must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage672").innerHTML = "";
	}
	if (x11 < 0)
	{
		document.getElementById("userIdMessage672").innerHTML = "No. of difficult questions cannot be negative!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage672").innerHTML = "";
	}
	var tot = 0;
	var tot1 = 0;
	var tot2 = 0;
	var tot3 = 0;
	var tot4 = 0;
	if(x9 != "")
		tot1 += Number(x9);
	if(x10 != "")
		tot2 += Number(x10);
	if(x11 != "")
		tot3 += Number(x11);
	tot4 = Number(tot1) + Number(tot2)+ Number(tot3);
	if (tot4 <= 0  && x9 != "" && x10 != "" && x11 != "")
	{
		document.getElementById("userIdMessage672").innerHTML = "No. of questions must be greater than 0!";
		document.forms["Batchform"]["maxscore"].value = 0;
		return false;
	}
	else
	{
		document.getElementById("userIdMessage672").innerHTML = "";
		document.forms["Batchform"]["maxscore"].value = tot4*x4;		
	}
}
function checkvalidate6666()
{
	var x1=document.forms["Batchform"]["stest"].value;
	var x2=document.forms["Batchform"]["stestscat"].value;
	var x3=document.forms["Batchform"]["Batchname"].value;
	var x4=document.forms["Batchform"]["marksperq"].value;
	var x5=document.forms["Batchform"]["negscore"].value;
	var x6=document.forms["Batchform"]["passmarks"].value;
	var x8=document.forms["Batchform"]["timeperquest"].value;
	var x9=document.forms["Batchform"]["lvl1"].value;
	var x10=document.forms["Batchform"]["lvl2"].value;
	var x11=document.forms["Batchform"]["lvl3"].value;
		
	if (x1==0)
	{
		document.getElementById("userIdMessage662").innerHTML = "Please select Test!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage662").innerHTML = "";
	}
	if (x2==0)
	{
		document.getElementById("userIdMessage663").innerHTML = "Please select Test subcategory!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage663").innerHTML = "";
	}	
	if (x3==null || x3=="")
	{
		document.getElementById("userIdMessage664").innerHTML = "Please enter Batch!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage664").innerHTML = "";
	}	
	if (x4==null || x4=="")
	{
		document.getElementById("userIdMessage665").innerHTML = "Please enter marks per question!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage665").innerHTML = "";
	}
	if (isNaN(x4))
	{
		document.getElementById("userIdMessage665").innerHTML = "Marks per question must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage665").innerHTML = "";
	}
	if (x4 <= 0)
	{
		document.getElementById("userIdMessage665").innerHTML = "Marks per question must be greater than 0!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage665").innerHTML = "";
	}
	if (x5==null || x5=="")
	{
		document.getElementById("userIdMessage666").innerHTML = "Please enter negative marks!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage666").innerHTML = "";
	}
	if (isNaN(x5))
	{
		document.getElementById("userIdMessage666").innerHTML = "Negative marks must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage666").innerHTML = "";
	}
	if(Number(x5)>=Number(x4))
	{
		document.getElementById("userIdMessage666").innerHTML = "Negative marks must be less than marks per question!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage666").innerHTML = "";
	}
	if(Number(x5)<0)
	{
		document.getElementById("userIdMessage666").innerHTML = "Negative marks cannot be negative!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage666").innerHTML = "";
	}
	if (x6==null || x6=="")
	{
		document.getElementById("userIdMessage667").innerHTML = "Please enter passing marks!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage667").innerHTML = "";
	}
	if (isNaN(x6))
	{
		document.getElementById("userIdMessage667").innerHTML = "Passing marks must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage667").innerHTML = "";
	}
	if (x6<=0)
	{
		document.getElementById("userIdMessage667").innerHTML = "Passing marks must be greater than 0!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage667").innerHTML = "";
	}
	if (x8==null || x8=="")
	{
		document.getElementById("userIdMessage669").innerHTML = "Please enter time per question!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage669").innerHTML = "";
	}
	if (isNaN(x8))
	{
		document.getElementById("userIdMessage669").innerHTML = "Time per question score must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage669").innerHTML = "";
	}
	if (x8 <= 0)
	{
		document.getElementById("userIdMessage669").innerHTML = "Time per question score must be greater than 0!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage669").innerHTML = "";
	}
	if (x9==null || x9=="")
	{
		document.getElementById("userIdMessage670").innerHTML = "Please enter no. of easy questions!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage670").innerHTML = "";
	}
	if (isNaN(x9))
	{
		document.getElementById("userIdMessage670").innerHTML = "No. of easy questions must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage670").innerHTML = "";
	}
	if (x9 < 0)
	{
		document.getElementById("userIdMessage670").innerHTML = "No. of easy questions cannot be negative!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage670").innerHTML = "";
	}
	if (x10==null || x10=="")
	{
		document.getElementById("userIdMessage671").innerHTML = "Please enter no. of medium questions!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage671").innerHTML = "";
	}
	if (isNaN(x10))
	{
		document.getElementById("userIdMessage671").innerHTML = "No. of medium questions must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage671").innerHTML = "";
	}
	if (x10 < 0)
	{
		document.getElementById("userIdMessage671").innerHTML = "No. of medium questions cannot be negative!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage671").innerHTML = "";
	}
	if (x11==null || x11=="")
	{
		document.getElementById("userIdMessage672").innerHTML = "Please enter no. of difficult questions!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage672").innerHTML = "";
	}
	if (isNaN(x11))
	{
		document.getElementById("userIdMessage672").innerHTML = "No. of difficult questions must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage672").innerHTML = "";
	}
	if (x11 < 0)
	{
		document.getElementById("userIdMessage672").innerHTML = "No. of difficult questions cannot be negative!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage672").innerHTML = "";
	}
	
	var tot = 0;
	var tot1 = 0;
	var tot2 = 0;
	var tot3 = 0;
	var tot4 = 0;
	if(x9 != "")
		tot1 += Number(x9);
	if(x10 != "")
		tot2 += Number(x10);
	if(x11 != "")
		tot3 += Number(x11);
	tot4 = Number(tot1) + Number(tot2)+ Number(tot3);
	if (tot4 <= 0  && x9 != "" && x10 != "" && x11 != "")
	{
		document.getElementById("userIdMessage672").innerHTML = "No. of questions must be greater than 0!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage672").innerHTML = "";
	}
}


function checkvalidate6266()
{
	var x3=document.forms["Batchform"]["Batchname"].value;
	var x4=document.forms["Batchform"]["marksperq"].value;
	var x5=document.forms["Batchform"]["negscore"].value;
	var x6=document.forms["Batchform"]["passmarks"].value;
	var x8=document.forms["Batchform"]["timeperquest"].value;
	var x9=document.forms["Batchform"]["lvl1"].value;
	var x10=document.forms["Batchform"]["lvl2"].value;
	var x11=document.forms["Batchform"]["lvl3"].value;
		
	if (x3==null || x3=="")
	{
		document.getElementById("userIdMessage664").innerHTML = "Please enter Batch!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage664").innerHTML = "";
	}	
	if (x4==null || x4=="")
	{
		document.getElementById("userIdMessage665").innerHTML = "Please enter marks per question!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage665").innerHTML = "";
	}
	if (isNaN(x4))
	{
		document.getElementById("userIdMessage665").innerHTML = "Marks per question must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage665").innerHTML = "";
	}
	if (x4 <= 0)
	{
		document.getElementById("userIdMessage665").innerHTML = "Marks per question must be greater than 0!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage665").innerHTML = "";
	}
	if (x5==null || x5=="")
	{
		document.getElementById("userIdMessage666").innerHTML = "Please enter negative marks!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage666").innerHTML = "";
	}
	if (isNaN(x5))
	{
		document.getElementById("userIdMessage666").innerHTML = "Negative marks must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage666").innerHTML = "";
	}
	if(Number(x5)>=Number(x4))
	{
		document.getElementById("userIdMessage666").innerHTML = "Negative marks must be less than marks per question!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage666").innerHTML = "";
	}
	if(Number(x5) < 0)
	{
		document.getElementById("userIdMessage666").innerHTML = "Negative marks cannot be negative!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage666").innerHTML = "";
	}
	if (x6==null || x6=="")
	{
		document.getElementById("userIdMessage667").innerHTML = "Please enter passing marks!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage667").innerHTML = "";
	}
	if (isNaN(x6))
	{
		document.getElementById("userIdMessage667").innerHTML = "Passing marks must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage667").innerHTML = "";
	}
	if (x6 <= 0)
	{
		document.getElementById("userIdMessage667").innerHTML = "Passing marks must be greater than 0!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage667").innerHTML = "";
	}
	if (x8==null || x8=="")
	{
		document.getElementById("userIdMessage669").innerHTML = "Please enter time per question!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage669").innerHTML = "";
	}
	if (isNaN(x8))
	{
		document.getElementById("userIdMessage669").innerHTML = "Time per question score must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage669").innerHTML = "";
	}
	if (x8 <= 0)
	{
		document.getElementById("userIdMessage669").innerHTML = "Time per question score must be greater than 0!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage669").innerHTML = "";
	}
	if (x9==null || x9=="")
	{
		document.getElementById("userIdMessage670").innerHTML = "Please enter no. of easy questions!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage670").innerHTML = "";
	}
	if (isNaN(x9))
	{
		document.getElementById("userIdMessage670").innerHTML = "No. of easy questions must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage670").innerHTML = "";
	}
	if (x9 < 0)
	{
		document.getElementById("userIdMessage670").innerHTML = "No. of easy questions cannot be negative!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage670").innerHTML = "";
	}
	if (x10==null || x10=="")
	{
		document.getElementById("userIdMessage671").innerHTML = "Please enter no. of medium questions!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage671").innerHTML = "";
	}
	if (isNaN(x10))
	{
		document.getElementById("userIdMessage671").innerHTML = "No. of medium questions must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage671").innerHTML = "";
	}
	if (x10 < 0)
	{
		document.getElementById("userIdMessage671").innerHTML = "No. of medium questions cannot be negative!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage671").innerHTML = "";
	}
	if (x11==null || x11=="")
	{
		document.getElementById("userIdMessage672").innerHTML = "Please enter no. of difficult questions!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage672").innerHTML = "";
	}
	if (isNaN(x11))
	{
		document.getElementById("userIdMessage672").innerHTML = "No. of difficult questions must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage672").innerHTML = "";
	}
	if (x11 < 0)
	{
		document.getElementById("userIdMessage672").innerHTML = "No. of difficult questions cannot be negative!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage672").innerHTML = "";
	}
	var tot = 0;
	var tot1 = 0;
	var tot2 = 0;
	var tot3 = 0;
	var tot4 = 0;
	if(x9 != "")
		tot1 += Number(x9);
	if(x10 != "")
		tot2 += Number(x10);
	if(x11 != "")
		tot3 += Number(x11);
	tot4 = Number(tot1) + Number(tot2)+ Number(tot3);
	if (tot4 <= 0 && x9 != "" && x10 != "" && x11 != "")
	{
		document.getElementById("userIdMessage672").innerHTML = "No. of questions must be greater than 0!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage672").innerHTML = "";		
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
%>
<%
String action = request.getParameter("action");
int comid = 0;
int testid = 0;
int testscatid = 0;
String compname1 = "";
String sjfunc = "";
String test1 = "";
String testscat1 = "";
String action1 = "";
ArrayList<Batch> clist = null;
if (action != null && action.equals("Add")) 
{
	sjfunc = "checkvalidate6666()";
}
if (action != null && action.equals("AddT")) 
{
	compname1 = request.getParameter("compname1").toString();
	comid = cid;
	test1 = request.getParameter("test1").toString();
	testid = Integer.parseInt(request.getParameter("testid").toString());
	testscat1 = request.getParameter("testscat1").toString();
	testscatid = Integer.parseInt(request.getParameter("testscatid").toString());
	sjfunc = "checkvalidate6266()";
}
if (action != null && action.equals("addBatch")) 
{
	comid = cid;
	testid = Integer.parseInt(request.getParameter("stest").toString());
	testscatid = Integer.parseInt(request.getParameter("stestscat").toString());
	String Batchname = request.getParameter("Batchname").toString();
	int marksperq = Integer.parseInt(request.getParameter("marksperq").toString());
	int negscore = Integer.parseInt(request.getParameter("negscore").toString());
	int passmarks = Integer.parseInt(request.getParameter("passmarks").toString());
	int maxscore = Integer.parseInt(request.getParameter("maxscore").toString());
	int timeperquest = Integer.parseInt(request.getParameter("timeperquest").toString());
	int lvl1 = Integer.parseInt(request.getParameter("lvl1").toString());
	int lvl2 = Integer.parseInt(request.getParameter("lvl2").toString());
	int lvl3 = Integer.parseInt(request.getParameter("lvl3").toString());
	sjfunc = "checkvalidate6666()";
	try 
	{		
		boolean val = dbBean.AddBatch(Batchname,comid,testid,testscatid,marksperq,negscore,
				passmarks,maxscore,timeperquest,lvl1,lvl2,lvl3);
		if(val==false)
		{
			out.println("Error adding Batch");
			action="Fail";
		}
		else
			action="Succ";
		action1 = "addBatch";		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
%>
<%
if (action != null && action.equals("addBatch1")) 
{
	comid = cid;
	testid = Integer.parseInt(request.getParameter("testid1").toString());
	testscatid = Integer.parseInt(request.getParameter("testscatid1").toString());
	String Batchname = request.getParameter("Batchname").toString();
	int marksperq = Integer.parseInt(request.getParameter("marksperq").toString());
	int negscore = Integer.parseInt(request.getParameter("negscore").toString());
	int passmarks = Integer.parseInt(request.getParameter("passmarks").toString());
	int maxscore = Integer.parseInt(request.getParameter("maxscore").toString());
	int timeperquest = Integer.parseInt(request.getParameter("timeperquest").toString());
	int lvl1 = Integer.parseInt(request.getParameter("lvl1").toString());
	int lvl2 = Integer.parseInt(request.getParameter("lvl2").toString());
	int lvl3 = Integer.parseInt(request.getParameter("lvl3").toString());
	compname1 = request.getParameter("compname1").toString();
	test1 = request.getParameter("test1").toString();
	testscat1 = request.getParameter("testscat1").toString();
	sjfunc = "checkvalidate6266()";
	try 
	{		
		//dbBean.initDB();
		boolean val = dbBean.AddBatch(Batchname,comid,testid,testscatid,marksperq,negscore,
				passmarks,maxscore,timeperquest,lvl1,lvl2,lvl3);
		if(val==false)
		{
			out.println("Error adding Batch");
			action="Fail";
		}
		else
			action="Succ";
		action1 = "addBatch1";
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
ArrayList<Company> cm =  dbBean.getCompanyById(cid);
Iterator iterator2 = cm.iterator();
if(iterator2.hasNext())
{
Company cinfo = (Company) iterator2.next();
compname1 = cinfo.getCompname();
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


<table align="center" height="490" width="670" >
<tr align="center" height="490" >
<td  align="center">
<FORM name="Batchform" onSubmit="return <%=sjfunc%>">
<% if (action.equals("AddT") || action1.equals("addBatch1")) 
{ %>
<input type="hidden" name="action" value="addBatch1"/>
<input type="hidden" name="testid1" value="<%=testid%>"/>
<input type="hidden" name="testscatid1" value="<%=testscatid%>"/>
<input type="hidden" name="compname1" value="<%=compname1%>"/>
<input type="hidden" name="test1" value="<%=test1%>"/>
<input type="hidden" name="testscat1" value="<%=testscat1%>"/>
<% } else if (action.equals("Add") || action1.equals("addBatch")) { %>
<input type="hidden" name="action" value="addBatch"/>
<% } %>
<h3 class="consultant-services">Add Batch</h3><br>
<div style="height: 490px; overflow-y: auto">
	<table align="center" width="670" height="360">
	<tbody>
	<tr align="center"><td  align="center" width="150">Test</td>
	<% if (action.equals("Add") || action1.equals("addBatch")) 
	{ %>
	<td  align="left" ><select name="stest" onchange="showTestscat(<%=cid%>,this.value)">
					<option value="0">Select</option>
					<%
					ArrayList<Test> llist = dbBean.getTestByComp(cid);
					Iterator iterator = llist.iterator();
					if (iterator.hasNext()) {
					while (iterator.hasNext()) {
						Test linfo = (Test) iterator.next();
					%>
							<option value="<%=linfo.getID()%>"><%=linfo.getTestname()%></option>
					<% } } %>
				</select></td>
	<% } if (action.equals("AddT") || action1.equals("addBatch1")) { %>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="test1" value="<%=test1%>" readonly style="width:350px;">
	<% } %>	
		<td  align="center" width="200"><div id="userIdMessage662"></div></td></tr>
	<tr align="center"><td  align="center" width="150">TestSubCategory</td>
	<% if (action.equals("Add") || action1.equals("addBatch")) 
	{ %>
	<td   align="left">
		<div id="dtestscat"> 
		<select name="stestscat"> 
		<option value="0">Select</option>
		</select> 
		</div>
		</td>
	<% } if (action.equals("AddT") || action1.equals("addBatch1")) { %>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="testscat1" value="<%=testscat1%>" readonly style="width:350px;">
	<% } %>	
		<td  align="center" width="200"><div id="userIdMessage663"></div></td></tr>	
	<tr align="center"><td  align="center" width="150">Batch</td>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="Batchname" style="width:350px;"></td>
	<td  align="center" width="200"><div id="userIdMessage664"></div></td></tr>
	<tr align="center"><td  align="center" width="150">MarksPerQuestion</td>
	<td  align="left" width="200" ><INPUT TYPE="TEXT" NAME="marksperq" onkeyup="calctotmks()" style="width:350px;"></td>
	<td  align="center" width="200"><div id="userIdMessage665"></div></td></tr>
	<tr align="center"><td  align="center" width="150">Negative Marks</td>
	<td  align="left" width="200" ><INPUT TYPE="TEXT" NAME="negscore" style="width:350px;"></td>
	<td  align="center" width="200"><div id="userIdMessage666"></div></td></tr>
	<tr align="center"><td  align="center" width="150">Passing Marks</td>
	<td  align="left" width="200" ><INPUT TYPE="TEXT" NAME="passmarks" style="width:350px;"></td>
	<td  align="center" width="200"><div id="userIdMessage667"></div></td></tr>
	<tr align="center"><td  align="center" width="150">TimePerQuestionInSec</td>
	<td  align="left" width="200" ><INPUT TYPE="TEXT" NAME="timeperquest" style="width:350px;"></td>
	<td  align="center" width="200"><div id="userIdMessage669"></div></td></tr>
	<tr align="center"><td  align="center" width="150">NoOfEasyQuestions</td>
	<td  align="left" width="200" ><INPUT TYPE="TEXT" NAME="lvl1" onkeyup="calctotmks()" style="width:350px;"></td>
	<td  align="center" width="200" colspan="3"><div id="userIdMessage670"></div></td></tr>
	<tr align="center"><td  align="center" width="150">NoOfMediumQuestions</td>
	<td  align="left" width="200" ><INPUT TYPE="TEXT" NAME="lvl2" onkeyup="calctotmks()" style="width:350px;"></td>
	<td  align="center" width="200" colspan="3"><div id="userIdMessage671"></div></td></tr>
	<tr align="center"><td  align="center" width="150">NoOfDifficultQuestions</td>
	<td  align="left" width="200" ><INPUT TYPE="TEXT" NAME="lvl3" onkeyup="calctotmks()" style="width:350px;"></td>
	<td  align="center" width="200" colspan="3"><div id="userIdMessage672"></div></td></tr>
	<tr align="center"><td  align="center" width="150">Max Score</td>
	<td  align="left" width="200" ><INPUT TYPE="TEXT" NAME="maxscore" readonly style="width:350px;"></td>
	<td  align="center" width="200"><div id="userIdMessage668"></div></td></tr>
	<TR align="center"><TD width="150" align="center"></TD><TD ALIGN="left"><input class="btn btn-cst-primary pull-right"  type="submit" value="Add"></TD></TR>			
	<tr align="center" height="20"><td  align="center" colspan="3"><% if (action != null && action.equals("Succ")) { %>Batch added successfully!<% } else if (action != null && action.equals("Fail")) { %>Adding of Batch has failed!<% }%></td></tr>
</tbody>
</table>
</div>
</FORM>
</td></tr></table>							

</td>
				</tr>
			</table>
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