<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Question"%>
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
function confirmcheck() { 
    var r=confirm("Are You Sure You Want To delete?"); 
    if(r==false) {
    	return false;
    }
}
function checkvalidate2222()
{
	var x=document.forms["f1"]["stest"].value;
	var x1=document.forms["f1"]["stestscat"].value;
	
	if (x==0)
	{
		document.getElementById("userIdMessage222").innerHTML = "Please select test!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage222").innerHTML = "";
	}
	if (x1==0)
	{
		document.getElementById("userIdMessage223").innerHTML = "Please select test subcategory!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage223").innerHTML = "";
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
<%!  
String comname120 = "";
String testname120 = "";
String testsubcatname120 = "";
    
    public void getQuizInfo(int comno,int testno,int testscatno,DB dbBean11)
    {
	ArrayList<Company> cm =  dbBean11.getCompanyById(comno);
		Iterator iterator2 = cm.iterator();
	if(iterator2.hasNext())
	{
		Company cinfo = (Company) iterator2.next();
		comname120 = cinfo.getCompname();
	}
	ArrayList<Test> tm =  dbBean11.getTestById(testno);
		Iterator iterator3 = tm.iterator();
	if(iterator3.hasNext())
	{
		Test tinfo = (Test) iterator3.next();
		testname120 = tinfo.getTestname();
	}
	
	ArrayList<TestSubCat> bm =  dbBean11.getTestscatById(testscatno);
		Iterator iterator4 = bm.iterator();
	if(iterator4.hasNext())
	{
		TestSubCat binfo = (TestSubCat) iterator4.next();
		testsubcatname120 = binfo.getTestsubcatname();
	}	
}
%>
<%
int cid = 0;
if(session.getAttribute("SelCompany")!=null)
	cid = Integer.parseInt(session.getAttribute("SelCompany").toString());

String compname1 = ""; 
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
String cmpic = "";
if(session.getAttribute("compicon")!=null)
	cmpic = session.getAttribute("compicon").toString();
%>
<%
String chkval1 = "false";
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString();
String action = request.getParameter("action");
int comid = 0;
int testid = 0;
int testscatid = 0;
int stest = 0;
int stestscat = 0;
int ht = 0;
int isr = 0;

int comid11 = 0;
int stest11 = 0;
int stestscat11 = 0;
String compname111 = "";
String keyword11 = "";
String test111 = "";
String testscat111 = "";

//String compname1 = "";
String test1 = "";
String testscat1 = "";
String keyword = "";
ArrayList<Question> clist = null;
if (action != null && action.equals("listquestion")) 
{
	//comid = Integer.parseInt(request.getParameter("comid").toString());
	comid = cid;
	stest = Integer.parseInt(request.getParameter("stest").toString());
	stestscat = Integer.parseInt(request.getParameter("stestscat").toString());
	compname1 = request.getParameter("compname1").toString();
	test1 = request.getParameter("test1").toString();
	testscat1 = request.getParameter("testscat1").toString();
	
	clist = dbBean.getQuestionByComp(comid, stest, stestscat);
	//comid11 = comid;
	stest11 = stest;
	stestscat11 = stestscat;
	compname111 = compname1;
	test111 = test1;
	testscat111 = testscat1;
	getQuizInfo(comid,stest,stestscat,dbBean);
	ht = 450;
	isr = 0;	
}
if (action.equals("Search")) 
{
	keyword = request.getParameter("keyword");
	clist = dbBean.getQuestionByKeyword(keyword, cid);
	keyword11 = keyword;
	ht = 480;
	isr = 1;
}
if (action != null && action.equals("listquestion1")) 
{
	compname1 = request.getParameter("compname1").toString();
	comid = cid;
	test1 = request.getParameter("test1").toString();
	testid = Integer.parseInt(request.getParameter("stest").toString());
	testscat1 = request.getParameter("testscat1").toString();
	testscatid = Integer.parseInt(request.getParameter("stestscat").toString());
	
	clist = dbBean.getQuestionByComp(comid, testid, testscatid);
	//comid11 = comid;
	stest11 = testid;
	stestscat11 = testscatid;
	compname111 = compname1;
	test111 = test1;
	testscat111 = testscat1;
	getQuizInfo(comid,testid,testscatid,dbBean);
	ht = 470;
	isr = 0;
}
if (action != null && action.equals("deleteQuestion")) 
{
	//comid11 = Integer.parseInt(request.getParameter("comid11").toString());
	comid11 = cid;
	stest11 = Integer.parseInt(request.getParameter("stest11").toString());
	stestscat11 = Integer.parseInt(request.getParameter("stestscat11").toString());
	compname111 = request.getParameter("compname111").toString();
	test111 = request.getParameter("test111").toString();
	testscat111 = request.getParameter("testscat111").toString();
	keyword11 = request.getParameter("keyword11").toString();
	String action11 = request.getParameter("action11").toString();
	String action12 = action;
	try 
	{
		String[] recdel = request.getParameterValues("chkdel");
		int ilen = recdel.length;
		for(int d=0;d<ilen;d++)
		{	
			int qno = Integer.parseInt(recdel[d]);
			if(dbBean.DeleteQuest(qno)==false)
				out.println("Error deleting Question");
		}
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	action = action11;
	action11 = action12;
	if(action.equals("listquestion"))
	{
		comid = cid;
		stest = stest11;
		stestscat = stestscat11;
		compname1 = compname111;
		test1 = test111;
		testscat1 = testscat111;
		getQuizInfo(comid,stest,stestscat,dbBean);
		clist = dbBean.getQuestionByComp(comid11, stest11, stestscat11);
		ht = 450;
		isr = 0;
	}
	else if(action.equals("listquestion1"))
	{
		comid = cid;
		testid = stest11;
		testscatid = stestscat11;
		compname1 = compname111;
		test1 = test111;
		testscat1 = testscat111;
		clist = dbBean.getQuestionByComp(comid11, stest11, stestscat11);
		ht = 470;
		isr = 0;
	}
	else if(action.equals("Search"))
	{
		keyword = keyword11;
		clist = dbBean.getQuestionByKeyword(keyword,cid);
		ht = 480;
		isr = 1;
	}		
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
                			        <%} else { %>
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
                
                <h3 class="custome-page-title">Welcome Administrator</h3>
                
                 
                 	
                  <h3 class="custome-page-title" style="text-align:left; font-size:30px;">
                  <img src="<%=cmpic%>"  style="padding-right:150px;"><%=compname%></h3>
                  
                  
                 
                  
				
				<div class="col-lg-6 col-lg-offset-3">
                <div class="">
                    <header class="page-header text-center" style=" color:#2aa3d5; text-transform:uppercase; font-size:18px;">
                       List Question
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-12">
                  <% } %>
										
<table align="center" width="630" height="490">
<tr  align="center" valign="top"><td  align="center">
<% if(action.equals("List")) 
{ %>
<% if(chkval1.equals("true"))
{ %> 
<h3 class="consultant-services">List Question</h3><br>
<% } } %>
<% if (action.equals("List") || action.equals("listquestion")) 
	{ %>
	<% if(chkval1.equals("true"))
{ %> 
Select Test
<% } } %>
<% if (!action.equals("Search")) 
{ 
%>
<form name="f1" onSubmit="return checkvalidate2222()">
<% if (action.equals("List") || action.equals("listquestion")) 
	{ %>	
<input type="hidden" value="listquestion" name="action">
<% } %>
<input type="hidden" name="compname1" value="<%=compname1%>"/>
<input type="hidden" name="test1" value="<%=test1%>"/>
<input type="hidden" name="testscat1" value="<%=testscat1%>"/>
<table align="center" width="500" >
<% if (action.equals("listquestion") || action.equals("List")) 
{
%>
<tr align="center"><td align="center" colspan="2"></td><td></td></tr>
<% } else { %>
<tr bgcolor="#fff" align="center"><td align="center" colspan="2"><h3 class="consultant-services">Test Details</h3></td><td></td></tr>
<% } %>
	<% if (action.equals("listquestion1")) { %>
	<tr><td  align="center" width="150">Company</td>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="comname1" value="<%=compname1%>" readonly style="width:350px;"></td>
	<td  align="center" width="150"><div id="userIdMessage221"></div></td></tr>
	<% } %>	
	<tr align="center"><td  align="center" width="150">Test</td>
	<% if (action.equals("List") || action.equals("listquestion")) 
	{ %>
	<td  align=left><select name="stest" onchange="showTestscat(<%=cid%>,this.value)">
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
	<% } if (action.equals("listquestion1")) { %>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="test1" value="<%=test1%>" readonly style="width:350px;"></td>
	<% } %>	
		<td  align="center"><div id="userIdMessage222"></div></td></tr>
		<tr><td  align="center" width="150">TestSubCategory</td>
	<% if (action.equals("List") || action.equals("listquestion")) 
	{ %>	
<td   align="left"> 
		<div id="dtestscat">
		<select name="stestscat"> 
		<option value="0">Select</option>
		</select> 
		</div>
		</td>
	<% } if (action.equals("listquestion1")) { %>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="testscat1" value="<%=testscat1%>" readonly style="width:350px;"></td>
	<% } %>	
		<td  align="center" width="150"><div id="userIdMessage223"></div></td></tr>
		<% if (action.equals("List") || action.equals("listquestion")) 
	{ %>
<tr><td></td><td  align="left" ><input class="btn btn-cst-primary pull-right"  type="submit" value="Go"></td><td></td></tr>
<% } %>	
</table>
</form>
<% } %>								
<%
if (action.equals("listquestion1") || action.equals("listquestion") || action.equals("Search")) 
{
	Iterator iterator = clist.iterator();
	if (iterator.hasNext()) {		
%>
<% if (action.equals("listquestion")) 
{ 
%>
COMPANY : <%=comname120%> >> Test : <%=testname120%> >> TEST SUBCATEGORY : <%=testsubcatname120%>
<% } %>
<FORM name="delform" onSubmit="return confirmcheck()">
<INPUT TYPE="HIDDEN" NAME="action11" VALUE="<%=action%>">
<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteQuestion">
<INPUT TYPE="HIDDEN" NAME="stest11" VALUE="<%=stest11%>">
<INPUT TYPE="HIDDEN" NAME="stestscat11" VALUE="<%=stestscat11%>">
<input type="hidden" name="compname111" value="<%=compname111%>"/>
<input type="hidden" name="test111" value="<%=test111%>"/>
<input type="hidden" name="testscat111" value="<%=testscat111%>"/>
<input type="hidden" name="keyword11" value="<%=keyword11%>"/>
<INPUT TYPE="HIDDEN" NAME="hdflg" VALUE="1">
<div style="height: <%=ht-20%>px; width:670px; overflow-y: auto">
<table align="center" height="<%=ht-20%>">
<thead>
<tr  align="center"><td align="center" colspan="3">
<INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(img/delete.png); width:25px; height:25px;"/></td></tr>
<% if(chkval1.equals("true"))
{ %> 
<% if(isr==0) { %>
<tr bgcolor="#fff" align="center" height="30"><td  align="center" colspan="3"><h3 class="consultant-services">Question List</h3></TD></TR>
<% } else if(isr==1) { %>
<tr bgcolor="#fff" align="center" height="30"><td  align="center" colspan="3"><h3 class="consultant-services">Question List by keyword <%=keyword%></h3></TD></TR>
<% } } %>
<TR  align="center" height="50">
<TD width="70" align="center"><input type="checkbox" id="chkdell" onClick="setchkval()" /></TD>
<TD width="670" align="center" >Question</TD>
<TD width="230" align="center" >Details</TD>
</TR>
</thead>
<tbody>
<%
int i=1;
while (iterator.hasNext()) {
	Question cust = (Question) iterator.next();
	if (action.equals("Search")) 
	{
		comid11 = cust.getCompid();
		stest11 = cust.getTestid();
		stestscat11 = cust.getTestsubcatid();
		getQuizInfo(comid11,stest11,stestscat11,dbBean);
		compname111 = comname120;
		test111 = testname120;
		testscat111 = testsubcatname120;
	}
%>	
<TR   height="50" align="center">
<% 
 	String qno1 = String.valueOf(cust.getQno());
%>
<TD width="70"  align="center"><input type="checkbox" name="chkdel" onClick="getchkval()" value="<%=qno1%>"></TD>
<TD width="670" align="center"><%=cust.getQuestion()%></TD>
<TD width="230" align="center"><a href="QuesDetails.jsp?&qno=<%=qno1%>">Details</a></TD>
</TR>
<%
i++;
} //while
	%>
</tbody>
</table>    
</div>	
</FORM>
	<%
}
else
{
%>
<table align="center" width="590" height="40">
<TR align="center"><TD  align="center">There are no questions!</TD></TR>
</table>
<%
}
}
%>
</td></tr></table>
<% if(chkval1.equals("true"))
{ %> 
					</div>
				</div>	
	         </div>
	     </div>
      </div>           
        <% } else { %>
        </div>
                    </div>
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