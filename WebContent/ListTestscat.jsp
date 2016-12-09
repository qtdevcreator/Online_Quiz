<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.TestSubCat"%>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.DB"%>
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
	xmlhttp.open("GET","gettest.jsp?q="+str,true); 
	xmlhttp.send(); 
} 
function confirmcheck() { 
    var r=confirm("Are You Sure You Want To delete?"); 
    if(r==false) {
    	return false;
    }
}
function checkvalidate8888()
{
	var x1=document.forms["TestSubCatform"]["stest"].value;
	
	
	if (x1==0)
	{
		document.getElementById("userIdMessage882").innerHTML = "Please select Test!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage882").innerHTML = "";
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
    
    public void getQuizInfo(int comno,int testno,DB dbBean11)
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

%>
<%
String action = request.getParameter("action");
String chkval1 = "false";
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString();
String suser = "";
if(session.getAttribute("studentnm")!=null)
	suser = session.getAttribute("studentnm").toString();
String chkval = "false";
if(session.getAttribute("loginapp")!=null)
	chkval = session.getAttribute("loginapp").toString();
String cmpic = "";
if(session.getAttribute("compicon")!=null)
	cmpic = session.getAttribute("compicon").toString();
String slogin = "";
String smenu = "";
if(chkval1.equals("true"))
{ 	
	slogin = "AdminLogin.jsp";
	smenu = "AdminMenu.jsp";
	
} else {
	slogin = "Login.jsp";
	smenu = "LoginMenu.jsp";
}

int ht = 0;
String keyword = "";
String keyword11 = "";
int lid = 0;
int comid = 0;
int testid = 0;

String test1 = "";
String action1 = "";
int cspn = 0;
int wid = 0;
int wid1 = 0;
int comid11 = 0;
int testid11 = 0;
ArrayList<TestSubCat> clist = null;
int isr = 0;
if (action.equals("Location")) 
{
	comid = cid;
	testid = Integer.parseInt(request.getParameter("stest"));
	clist = dbBean.getTscatByComp(comid,testid);
	comid11 = comid;
	testid11 = testid;
	action1 = "Location1";
	ht = 580;
	getQuizInfo(comid,testid,dbBean);
	isr = 0;
	cspn = 3;
	wid = 670;
	wid1 = 230;
}
if (action.equals("lstTestscat")) 
{
	comid = cid;
	testid = Integer.parseInt(request.getParameter("stest"));
	clist = dbBean.getTscatByComp(comid,testid);
	comid11 = comid;
	testid11 = testid;
	action1 = "Location1";
	ht = 600;
	isr = 0;
	cspn = 3;
	wid = 670;
	wid1 = 230;
}
if (action.equals("Search")) 
{
	cspn = 4;
	wid = 670;
	wid1 = 180;
	ht = 680;
	keyword = request.getParameter("keyword");
	keyword11 = keyword;
	clist = dbBean.getTestscatByKeyword(keyword, cid);
	isr = 1;
}
if (action.equals("ByOrder")) 
{
	cspn = 4;
	wid = 670;
	wid1 = 180;
	ht = 680;
	keyword = request.getParameter("keyword");
	keyword11 = keyword;
	clist = dbBean.getTestSubCatWithAlph(keyword, cid);
	isr = 2;
}
if (action != null && action.equals("deleteTestSubCat")) 
{
	comid11 = cid;
	testid11 = Integer.parseInt(request.getParameter("testid11").toString());
	keyword11 = request.getParameter("keyword11").toString();
	String action11 = request.getParameter("action11").toString();
	String action12 = action;
	try 
	{
		String[] recdel = request.getParameterValues("chkdel");
		int ilen = recdel.length;
		for(int d=0;d<ilen;d++)
		{
			int TestSubCatno = Integer.parseInt(recdel[d]);
			if(dbBean.DeleteTestSubCat(TestSubCatno)==false)
				out.println("Error deleting TestSubCat");
		}
		//action = "Location";
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	action = action11;
	action11 = action12;
	if(action.equals("Location"))
	{
		comid = cid;
		testid = testid11;
		clist = dbBean.getTscatByComp(comid,testid);
		action1 = "Location1";
		ht = 580;
		getQuizInfo(comid,testid,dbBean);
		isr = 0;
		cspn = 3;
		wid = 670;
		wid1 = 230;
	}
	else if(action.equals("lstTestscat"))
	{
		comid = cid;
		testid = testid11;
		clist = dbBean.getTscatByComp(comid,testid);
		action1 = "Location1";
		ht = 600;
		isr = 0;
		cspn = 3;
		wid = 670;
		wid1 = 230;
	}
	else if(action.equals("Search"))
	{
		cspn = 4;
		wid = 670;
		wid1 = 180;
		ht = 680;
		keyword = keyword11;
		clist = dbBean.getTestscatByKeyword(keyword, cid);
		isr = 1;
	}	
	else if(action.equals("ByOrder"))
	{
		cspn = 4;
		wid = 670;
		wid1 = 180;
		ht = 680;
		keyword = keyword11;
		clist = dbBean.getTestSubCatWithAlph(keyword, cid);
		isr = 2;
	}
}
ArrayList<Company> cm7 =  dbBean.getCompanyById(cid);
Iterator iterator27 = cm7.iterator();
if(iterator27.hasNext())
{
Company cinfo = (Company) iterator27.next();
compname1 = cinfo.getCompname();
}
if (action1.equals("Location1")) 
{
	ArrayList<Company> cm =  dbBean.getCompanyById(comid);
		Iterator iterator2 = cm.iterator();
	if(iterator2.hasNext())
	{
		Company cinfo = (Company) iterator2.next();
		compname1 = cinfo.getCompname();
	}
	ArrayList<Test> tm =  dbBean.getTestById(testid);
		Iterator iterator3 = tm.iterator();
	if(iterator3.hasNext())
	{
		Test tinfo = (Test) iterator3.next();
		test1 = tinfo.getTestname();
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
                
                <h3 class="custome-page-title">Welcome, <%=suser%></h3>
                
                 
                 	
                  <h3 class="custome-page-title" style="text-align:left; font-size:30px;">
                  <img src="<%=cmpic%>"  style="padding-right:150px;"><%=compname%></h3>
                  
                  
                 
                  
				
				<div class="col-lg-6 col-lg-offset-3">
                <div class="">
                    <header class="page-header text-center" style=" color:#2aa3d5; text-transform:uppercase; font-size:18px;">
                       List Test Sub Category
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-12">
                  <% } %>

<table align="center" width="670" >
<tr align="center"><td  align="center">
<% if (!action.equals("Search") && !action.equals("ByOrder")) 
{ %>
<% if(action.equals("Location") || action.equals("List") || action.equals("lstTestscat")) 
{ %>
<FORM name="TestSubCatform" onSubmit="return checkvalidate8888()">
<input type="hidden" name="action" value="Location"/>
<% if(action.equals("List")) 
{ %>
	<% if(chkval1.equals("true"))
{ %> 
<h3 class="consultant-services">List Test Sub Category</h3>	<br>
<% } } %>
<% if(action.equals("List") || action.equals("Location")) 
{ %>
	<% if(chkval1.equals("true"))
{ %> 
Select Test	<br>
<% } } %>
<table align="center" width="470">
	<% if (action.equals("lstTestscat")) { %>
	<tr><td  align="center" width="150">Company</td>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="comname1" value="<%=compname1%>" readonly style="width:350px;"></td>
	<td  align="center" width="200"><div id="userIdMessage881"></div></td></tr>
	<% } %>
	<tr><td  align="center" width="150">Test</td>
	<% if (!action.equals("lstTestscat")) 
	{ %>
	<td align="left"><select name="stest">
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
	<% } if (action.equals("lstTestscat")) { %>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="test1" value="<%=test1%>" readonly style="width:350px;"></td>
	<% } %>
		<td  align="center" width="200"><div id="userIdMessage882"></div></td></tr>
	<% if (!action.equals("lstTestscat")) 
	{ %>
	<TR align="center"><TD width="150" align="center"></TD><TD ALIGN="left"><input class="btn btn-cst-primary pull-right"  type="submit" value="Go"></TD></TR>			
	<% } %>
</table>
</FORM>
<% } } %>							
<%
if (action.equals("Location") || action.equals("lstTestscat") || action.equals("Search") || action.equals("ByOrder")) 
{
	Iterator iterator1 = clist.iterator();
	if(iterator1.hasNext())
	{
%>
<% if (action.equals("Location")) 
{ 
%>
COMPANY : <%=comname120%> >> Test : <%=testname120%>
<% } %>
<% if (action.equals("Search") || action.equals("ByOrder")) 
{ 
%>

<% } %>
<FORM name="delform" onSubmit="return confirmcheck()">
<INPUT TYPE="HIDDEN" NAME="action11" VALUE="<%=action%>">
<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteTestSubCat">
<INPUT TYPE="HIDDEN" NAME="testid11" VALUE="<%=testid11%>">
<input type="hidden" name="keyword11" value="<%=keyword11%>"/>
<INPUT TYPE="HIDDEN" NAME="hdflg" VALUE="1">
<div style="height: 470px; width:"670px" overflow-y: auto">
<table align="center" width="670" height="470">
<thead>
<% if(chkval1.equals("true"))
{ %>
<tr  align="center">
<td align="center" colspan="<%=cspn%>">
<INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(img/delete.png); width:25px; height:25px;"/></td></tr>
<% } %>
	<% if(chkval1.equals("true"))
{ %> 
<% if(isr==0) { %>
<tr align="center" height="30"><td  align="center" colspan="<%=cspn%>"><h3 class="consultant-services">TestSubCategory List</h3></TD></TR>
<% } else if(isr==1) { %>
<tr align="center" height="30"><td  align="center" colspan="<%=cspn%>"><h3 class="consultant-services">TestSubCategory List by keyword <%=keyword%></h3></TD></TR>
<% } else if(isr==2) { %>
<tr align="center" height="30"><td  align="center" colspan="<%=cspn%>"><h3 class="consultant-services">TestSubCategory List with first character as <%=keyword%></h3></TD></TR>
<% } } %>
<TR  align="center" height="30">
<% if(chkval1.equals("true"))
{ %>
<TD width="<%=wid1%>" align="center" ><input type="checkbox" id="chkdell" onClick="setchkval()" /></TD>
<% } %>
<TD width="<%=wid1%>" align="center" >TestSubCategory</TD>
<% if (!action1.equals("Location1")) 
	{ %>
<TD width="<%=wid1%>" align="center" >TestCategory</TD>
<% } %>
<% if(chkval1.equals("true"))
{ %>
<TD width="<%=wid1%>" align="center" >Edit</TD>
<% } %>
</TR>
</thead>
<tbody>
<%
int i=1;
while (iterator1.hasNext()) {
	TestSubCat linfo = (TestSubCat) iterator1.next();
if(i%2==0)
{
%>
<TR   height="30" align="center">
<% 
}
else
{
%>
<TR   height="30" align="center">
<% 
}
 	String ID1 = String.valueOf(linfo.getID());
 	String comp = "";
 	ArrayList<Company> cm =  dbBean.getCompanyById(linfo.getCompid());
 	Iterator iterator2 = cm.iterator();
	if(iterator2.hasNext())
	{
		Company cinfo = (Company) iterator2.next();
		comp = cinfo.getCompname();
	}
	String gtest = "";
 	ArrayList<Test> tm =  dbBean.getTestById(linfo.getTestid());
 	Iterator iterator3 = tm.iterator();
	if(iterator3.hasNext())
	{
		Test tinfo = (Test) iterator3.next();
		gtest = tinfo.getTestname();
	}
%>
<% if(chkval1.equals("true"))
{ %>
<TD width="<%=wid1%>" align="center"><input type="checkbox" name="chkdel" onClick="getchkval()" value="<%=ID1%>"></TD>
<% } %>
<% if(chkval.equals("true"))
{ %>
<TD width="<%=wid1%>" align="center"><a href="GetTestScatDetails.jsp?action=StartQuiz&ID=<%=linfo.getID()%>"><%=linfo.getTestsubcatname()%></a></td>
<% } else { %>
<TD width="<%=wid1%>" align="center"><a href="GetTestScatDetails.jsp?action=ByOrder&ID=<%=linfo.getID()%>"><%=linfo.getTestsubcatname()%></a></TD>
<% } if (!action1.equals("Location1")) 
	{ %>
<TD width="<%=wid1%>" align="center"><%=gtest%></TD>
<% } %>
<% if(chkval1.equals("true"))
{ %>
<TD width="<%=wid1%>" align="center"><a href="EditTestscat.jsp?action=Edit&TestSubCatno=<%=ID1%>"><img src="img/edit.png"></a></TD>
<% } %>
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
<table align="center" width="590" height="30">
<TR align="center"><TD  align="center">There are no TestSubCategory!</TD></TR>
</table>
<%
}
}
%>
</td></tr></table>
				
				<% if(chkval1.equals("true"))
{ %> 
</div>				</div>	
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