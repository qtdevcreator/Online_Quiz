<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.TestSubCat"%>
<%@ page import="com.software.onlexam.Batch"%>
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
        function noBack1() { window.history.forward();  }
</SCRIPT>
<script type="text/javascript">
function confirmcheck() { 
    var r=confirm("Are You Sure You Want To delete?"); 
    if(r==false) {
    	return false;
    }
}
function calctotmks()
{
	var x4=document.forms["quesform"]["marksperq"].value;
	var x9=document.forms["quesform"]["lvl1"].value;
	var x10=document.forms["quesform"]["lvl2"].value;
	var x11=document.forms["quesform"]["lvl3"].value;
	if (isNaN(x9))
	{
		document.getElementById("userIdMessage44450").innerHTML = "No. of easy questions must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44450").innerHTML = "";
	}
	if (x9<0)
	{
		document.getElementById("userIdMessage44450").innerHTML = "No. of easy questions cannot be negative!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44450").innerHTML = "";
	}
	if (isNaN(x10))
	{
		document.getElementById("userIdMessage44451").innerHTML = "No. of medium questions must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44451").innerHTML = "";
	}
	if (x10 < 0)
	{
		document.getElementById("userIdMessage44451").innerHTML = "No. of medium questions cannot be negative!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44451").innerHTML = "";
	}
	if (isNaN(x11))
	{
		document.getElementById("userIdMessage44452").innerHTML = "No. of difficult questions must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44452").innerHTML = "";
	}
	if (x11<0)
	{
		document.getElementById("userIdMessage44452").innerHTML = "No. of difficult questions cannot be negative!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44452").innerHTML = "";
	}
	var tot = 0;
	var tot1 = 0;
	var tot2 = 0;
	var tot3 = 0;
	var tot4 = 0;
	var mk = Number(x4);
	
	if(x9 != "")
		tot1 = Number(x9);
	if(x10 != "")
		tot2 = Number(x10);
	if(x11 != "")
		tot3 = Number(x11);
	tot4 = Number(tot1) + Number(tot2)+ Number(tot3);
	if (tot4 <= 0  && x9 != "" && x10 != "" && x11 != "")
	{
		document.getElementById("userIdMessage44452").innerHTML = "No. of questions must be greater than 0!";
		document.forms["quesform"]["maxscore"].value = 0;
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44452").innerHTML = "";
		document.forms["quesform"]["maxscore"].value = tot4*mk;		
	}
}
function checkvalidate44444()
{
	var x=document.forms["quesform"]["Batchname"].value;
	var x4=document.forms["quesform"]["marksperq"].value;
	var x5=document.forms["quesform"]["negscore"].value;
	var x6=document.forms["quesform"]["passmarks"].value;
	//var x7=document.forms["quesform"]["maxscore"].value;
	var x8=document.forms["quesform"]["timeperquest"].value;
	var x9=document.forms["quesform"]["lvl1"].value;
	var x10=document.forms["quesform"]["lvl2"].value;
	var x11=document.forms["quesform"]["lvl3"].value;
		
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage44444").innerHTML = "Please enter Batch!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44444").innerHTML = "";
	}
	
	if (x4==null || x4=="")
	{
		document.getElementById("userIdMessage44445").innerHTML = "Please enter marks per question!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44445").innerHTML = "";
	}
	if (isNaN(x4))
	{
		document.getElementById("userIdMessage44445").innerHTML = "Marks per question must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44445").innerHTML = "";
	}
	if (x4<=0)
	{
		document.getElementById("userIdMessage44445").innerHTML = "Marks per question must be greater than 0!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44445").innerHTML = "";
	}
	if (x5==null || x5=="")
	{
		document.getElementById("userIdMessage44446").innerHTML = "Please enter negative marks!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44446").innerHTML = "";
	}
	if (isNaN(x5))
	{
		document.getElementById("userIdMessage44446").innerHTML = "Negative marks must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44446").innerHTML = "";
	}
	if(Number(x5)>=Number(x4))
	{
		document.getElementById("userIdMessage44446").innerHTML = "Negative marks must be less than marks per question!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44446").innerHTML = "";
	}
	if(Number(x5)<0)
	{
		document.getElementById("userIdMessage44446").innerHTML = "Negative marks cannot be negative!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44446").innerHTML = "";
	}
	if (x6==null || x6=="")
	{
		document.getElementById("userIdMessage44447").innerHTML = "Please enter passing marks!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44447").innerHTML = "";
	}
	if (isNaN(x6))
	{
		document.getElementById("userIdMessage44447").innerHTML = "Passing marks must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44447").innerHTML = "";
	}
	if (x6<=0)
	{
		document.getElementById("userIdMessage44447").innerHTML = "Passing marks must be greater than 0!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44447").innerHTML = "";
	}
	/* if (x7==null || x7=="")
	{
		document.getElementById("userIdMessage44448").innerHTML = "Please enter maximum score!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44448").innerHTML = "";
	}
	if (isNaN(x7))
	{
		document.getElementById("userIdMessage44448").innerHTML = "Maximum score must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44448").innerHTML = "";
	} */
	if (x8==null || x8=="")
	{
		document.getElementById("userIdMessage44449").innerHTML = "Please enter time per question!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44449").innerHTML = "";
	}
	if (isNaN(x8))
	{
		document.getElementById("userIdMessage44449").innerHTML = "Time per question must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44449").innerHTML = "";
	}
	if (x8<=0)
	{
		document.getElementById("userIdMessage44449").innerHTML = "Timeperquestion must be greater than 0!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44449").innerHTML = "";
	}
	if (x9==null || x9=="")
	{
		document.getElementById("userIdMessage44450").innerHTML = "Please enter no. of easy questions!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44450").innerHTML = "";
	}
	if (isNaN(x9))
	{
		document.getElementById("userIdMessage44450").innerHTML = "No. of easy questions must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44450").innerHTML = "";
	}
	if (x9 < 0)
	{
		document.getElementById("userIdMessage44450").innerHTML = "No. of easy questions cannot be negative!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44450").innerHTML = "";
	}
	if (x10==null || x10=="")
	{
		document.getElementById("userIdMessage44451").innerHTML = "Please enter no. of medium questions!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44451").innerHTML = "";
	}
	if (isNaN(x10))
	{
		document.getElementById("userIdMessage44451").innerHTML = "No. of medium questions must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44451").innerHTML = "";
	}
	if (x10 < 0)
	{
		document.getElementById("userIdMessage44451").innerHTML = "No. of medium questions cannot be negative!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44451").innerHTML = "";
	}
	if (x11==null || x11=="")
	{
		document.getElementById("userIdMessage44452").innerHTML = "Please enter no. of difficult questions!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44452").innerHTML = "";
	}
	if (isNaN(x11))
	{
		document.getElementById("userIdMessage44452").innerHTML = "No. of difficult questions must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44452").innerHTML = "";
	}
	if (x11<0)
	{
		document.getElementById("userIdMessage44452").innerHTML = "No. of difficult questions cannot be negative!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44452").innerHTML = "";
	}
	var tot = 0;
	var tot1 = 0;
	var tot2 = 0;
	var tot3 = 0;
	var tot4 = 0;
	var mk = Number(x4);
	
	if(x9 != "")
		tot1 = Number(x9);
	if(x10 != "")
		tot2 = Number(x10);
	if(x11 != "")
		tot3 = Number(x11);
	tot4 = Number(tot1) + Number(tot2)+ Number(tot3);
	if (tot4 <= 0  && x9 != "" && x10 != "" && x11 != "")
	{
		document.getElementById("userIdMessage44452").innerHTML = "No. of questions must be greater than 0!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44452").innerHTML = "";		
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
int Batchno = Integer.parseInt(request.getParameter("Batchno"));
String Batchname1 = "";
String comname1 = "";
String testname1 = "";
String testsubcatname1 = "";
int marksperq1 = 0;
int negscore1 = 0;
int passmarks1 = 0;
int maxscore1 = 0;
int timeperquest1 = 0;
int lvl21 = 0;
int lvl22 = 0;
int lvl23 = 0;

if(action!=null && action.equals("EditBatch"))
{	
	 Batchname1 = request.getParameter("Batchname").toString();
	 	marksperq1 = Integer.parseInt(request.getParameter("marksperq").toString());
		negscore1 = Integer.parseInt(request.getParameter("negscore").toString());
		passmarks1 = Integer.parseInt(request.getParameter("passmarks").toString());
		maxscore1 = Integer.parseInt(request.getParameter("maxscore").toString());
		timeperquest1 = Integer.parseInt(request.getParameter("timeperquest").toString());
		lvl21 = Integer.parseInt(request.getParameter("lvl1").toString());
		lvl22 = Integer.parseInt(request.getParameter("lvl2").toString());
		lvl23 = Integer.parseInt(request.getParameter("lvl3").toString());
	 	 
	try 
	{			
		boolean val=dbBean.updateBatch(Batchname1,marksperq1,negscore1,passmarks1,
				maxscore1,timeperquest1,lvl21,lvl22,lvl23,Batchno);
		if(val==false)
		{
			out.println("Error updating Batch");
			action="Fail";
		}
		else
			action="Succ";
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
}


ArrayList<Batch> qlist = dbBean.getBatchById(Batchno); 
Iterator iterator1 = qlist.iterator();
if (iterator1.hasNext()) {	
	Batch linfo = (Batch) iterator1.next();
	Batchname1 = linfo.getBatchname();
	marksperq1 = linfo.getMarksperq();
	negscore1 = linfo.getNegscore();
	passmarks1 = linfo.getPassmarks();
	maxscore1 = linfo.getMaxscore();
	timeperquest1 = linfo.getTimeperquest();
	lvl21 = linfo.getL1();
	lvl22 = linfo.getL2();
	lvl23 = linfo.getL3();
	ArrayList<Company> cm =  dbBean.getCompanyById(linfo.getCompid());
 	Iterator iterator2 = cm.iterator();
	if(iterator2.hasNext())
	{
		Company cinfo = (Company) iterator2.next();
		comname1 = cinfo.getCompname();
	}
	ArrayList<Test> tm =  dbBean.getTestById(linfo.getTestid());
 	Iterator iterator3 = tm.iterator();
	if(iterator3.hasNext())
	{
		Test tinfo = (Test) iterator3.next();
		testname1 = tinfo.getTestname();
	}
	ArrayList<TestSubCat> bm =  dbBean.getTestscatById(linfo.getTestsubcatid());
 	Iterator iterator4 = bm.iterator();
	if(iterator4.hasNext())
	{
		TestSubCat binfo = (TestSubCat) iterator4.next();
		testsubcatname1 = binfo.getTestsubcatname();
	}
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
							<tr align="center" valign="top"><td align="center">	
	<FORM name="quesform" onSubmit="return checkvalidate44444()">
	<INPUT TYPE="HIDDEN" NAME="action" VALUE="EditBatch"/>
	<INPUT TYPE="HIDDEN" NAME="Batchno" VALUE="<%=Batchno%>"/>
	<h3 class="consultant-services">Edit Batch</h3><br>
	<div class="form-group">
     <label>Company</label>
     <input class="form-control" type="text" NAME="comname" value="<%=comname1%>" readonly>
     <div id=userIdMessage44441></div>
 </div>
	<div class="form-group">
     <label>Test</label>
     <input class="form-control" type="text" NAME="testname" value="<%=testname1%>" readonly>
     <div id=userIdMessage44442></div>
 </div>
 <div class="form-group">
     <label>TestSubCategory</label>
     <input class="form-control" type="text" NAME="testsubcatname" value="<%=testsubcatname1%>" readonly>
     <div id=userIdMessage44443></div>
 </div>
 <div class="form-group">
     <label>Batch</label>
     <input class="form-control" type="text" NAME="Batchname" value="<%=Batchname1%>">
     <div id=userIdMessage44444></div>
 </div>
 <div class="form-group">
     <label>MarksPerQues</label>
     <input class="form-control" type="text" NAME="marksperq" value="<%=marksperq1%>" onkeyup="calctotmks()">
     <div id=userIdMessage44445></div>
 </div>
 <div class="form-group">
     <label>NegativeScr</label>
     <input class="form-control" type="text" NAME="negscore" value="<%=negscore1%>">
     <div id=userIdMessage44446></div>
 </div>
 <div class="form-group">
     <label>Passing Mks</label>
     <input class="form-control" type="text" NAME="passmarks" value="<%=passmarks1%>" >
     <div id=userIdMessage44447></div>
 </div>
 <div class="form-group">
     <label>TimePerQues</label>
     <input class="form-control" type="text" NAME="timeperquest" value="<%=timeperquest1%>">
     <div id=userIdMessage44449></div>
 </div>
 <div class="form-group">
     <label>EasyQues</label>
     <input class="form-control" type="text" NAME="lvl1" value="<%=lvl21%>" onkeyup="calctotmks()">
     <div id=userIdMessage44450></div>
 </div>
 <div class="form-group">
     <label>MediumQues</label>
     <input class="form-control" type="text" NAME="lvl2" value="<%=lvl22%>" onkeyup="calctotmks()">
     <div id=userIdMessage44451></div>
 </div>
 <div class="form-group">
     <label>DifficultQues</label>
     <input class="form-control" type="text" NAME="lvl3" value="<%=lvl23%>" onkeyup="calctotmks()">
     <div id=userIdMessage44452></div>
 </div>
 <div class="form-group">
     <label>MaxScore</label>
     <input class="form-control" type="text" NAME="maxscore" value="<%=maxscore1%>" readonly>
     <div id=userIdMessage44448></div>
 </div>
 <input class="btn btn-cst-primary pull-right"  type="submit" value="Update">
						
	</FORM>
	<br><br><% if (action != null && action.equals("Succ")) { %>Batch is updated successfully!!<% } else if (action != null && action.equals("Fail")) { %>Updation of Batch has failed!<% }%>
	</td></tr></table>
				
</div>
	     </div>
      </div>           
</div></div>                
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




