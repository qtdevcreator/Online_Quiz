<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.CustomerInfo"%>
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.TestSubCat"%>
<%@ page import="com.software.onlexam.Batch"%>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.Team"%>
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
String cmpic = "";
if(session.getAttribute("compicon")!=null)
	cmpic = session.getAttribute("compicon").toString();
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
String chkval1 = "false";
if(session.getAttribute("loginapp")!=null)
	chkval1 = session.getAttribute("loginadm").toString();

int ht = 0;
String Batchname1 = "";
String comname1 = "";
String testname1 = "";
String testsubcatname1 = "";
String level = "";
int mks = 0;
String teststat = "";
String UserId = "";
String fname = "";
String lname = "";
ArrayList<Team> tlist = null;
int col = 0;
int wid1 = 0;
int wid2 = 0;
int bid1 = 0;
String per1 = "";
String mks11 = "";
String byoper = "";
String eid = "";
int comno = 0;
int testno = 0;
int testscatno = 0;
int batchno = 0;
if (action.equals("ListPass")) 
{
	wid1 = 670;
	wid2 = 180;
	col=4;
	byoper = " who has passed the test";
	bid1 = Integer.parseInt(request.getParameter("sbatch"));
	comno = cid;
	testno = Integer.parseInt(request.getParameter("stest"));
	testscatno = Integer.parseInt(request.getParameter("stestscat"));
	ht = 650;
	tlist = dbBean.getTeam1(comno,testno,testscatno,bid1,"Passed");
}
if (action.equals("List2")) 
{
	wid1 = 670;
	wid2 = 130;
	col=6;
	int ID = Integer.parseInt(request.getParameter("ID").toString());
	CustomerInfo custinfo =  dbBean.getCustInfoById(ID);
	fname = custinfo.stuname;
	lname = custinfo.stlname;
	UserId = custinfo.stemail;
	eid = custinfo.empid;
	tlist = dbBean.getTeamById(ID, cid);
	ht = 650;
	ArrayList<Company> cm =  dbBean.getCompanyById(cid);
	Iterator iterator2 = cm.iterator();
	if(iterator2.hasNext())
	{
		Company cinfo = (Company) iterator2.next();
		comname1 = cinfo.getCompname();
	}
}
if (action.equals("List")) 
{
	wid1 = 670;
	wid2 = 100;
	col=7;
	int ID = Integer.parseInt(request.getParameter("ID").toString());
	CustomerInfo custinfo =  dbBean.getCustInfoById(ID);
	fname = custinfo.stuname;
	lname = custinfo.stlname;
	UserId = custinfo.stemail;
	mks11 = request.getParameter("mks");
	tlist = dbBean.getBatchByMksRangeID(mks11,ID, cid);
	ht = 650;
}
if (action.equals("List1")) 
{
	wid1 = 670;
	wid2 = 100;
	col=7;
	int ID = Integer.parseInt(request.getParameter("ID").toString());
	CustomerInfo custinfo =  dbBean.getCustInfoById(ID);
	fname = custinfo.stuname;
	lname = custinfo.stlname;
	UserId = custinfo.stemail;
	per1 = request.getParameter("per");
	tlist = dbBean.getBatchByPerRangeID(per1,ID, cid);
	ht = 650;
}
if (action.equals("Search")) 
{
	byoper = " By Marks";
	mks11 = request.getParameter("oper1");
	bid1 = Integer.parseInt(request.getParameter("sbatch"));
	comno = cid;
	testno = Integer.parseInt(request.getParameter("stest"));
	testscatno = Integer.parseInt(request.getParameter("stestscat"));
	tlist = dbBean.getBatchByMksRange(mks11,bid1,cid);
	col=6;
	wid1 = 670;
	wid2 = 115;
	ht = 650;
}
if (action.equals("PerSearch")) 
{
	byoper = " By Percentage";
	per1 = request.getParameter("oper1");
	bid1 = Integer.parseInt(request.getParameter("sbatch"));
	comno = cid;
	testno = Integer.parseInt(request.getParameter("stest"));
	testscatno = Integer.parseInt(request.getParameter("stestscat"));
	tlist = dbBean.getBatchByPerRange(per1, bid1,cid);
	col=6;
	wid1 = 670;
	wid2 = 115;
	ht = 650;
}
 eflg=false;
if (action.equals("Search") || action.equals("PerSearch") || action.equals("ListPass")) 
{
ArrayList<Company> cm =  dbBean.getCompanyById(comno);
	Iterator iterator2 = cm.iterator();
if(iterator2.hasNext())
{
	Company cinfo = (Company) iterator2.next();
	comname1 = cinfo.getCompname();
}
else
	eflg=true;
ArrayList<Test> tm =  dbBean.getTestById(testno);
	Iterator iterator3 = tm.iterator();
if(iterator3.hasNext())
{
	Test tinfo = (Test) iterator3.next();
	testname1 = tinfo.getTestname();
}
else
	eflg=true;
ArrayList<TestSubCat> bm =  dbBean.getTestscatById(testscatno);
	Iterator iterator4 = bm.iterator();
if(iterator4.hasNext())
{
	TestSubCat binfo = (TestSubCat) iterator4.next();
	testsubcatname1 = binfo.getTestsubcatname();
}
else
	eflg=true;
ArrayList<Batch> hm =  dbBean.getBatchById(bid1);
	Iterator iterator5 = hm.iterator();
if(iterator5.hasNext())
{
	Batch hinfo = (Batch) iterator5.next();
	Batchname1 = hinfo.getBatchname();
}
else
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
                            <% if (!action.equals("List2")) 
{ %>
COMPANY : <%=comname1%> >> Test : <%=testname1%> >> TEST SUBCATEGORY : <%=testsubcatname1%> >> BATCH : <%=Batchname1%>
<% } else { %>
<% } %>	
	<%
	
		Iterator iterator1 = tlist.iterator();
		if (iterator1.hasNext()) {
			
		%>
<div style="height: 490px; width: 670px; overflow-y: auto">
<table align="center" width="670" height="490">
<thead>
<% if (!action.equals("Search") && !action.equals("PerSearch") && !action.equals("ListPass")) 
{ %>
<tr bgcolor="#fff" align="center" height="30" ><td align="center" colspan="<%=col%>"><h3 class="consultant-services">Student Details<%=byoper%></h3></TD></TR>
<TR  align="center" height="30"><td align="center" colspan="3">Employee Id</td><td align="center" colspan="4"><%=eid%></TD></TR>
<TR  align="center" height="30"><td align="center" colspan="3">Name</td><td align="center" colspan="4"><%=fname%> <%=lname%></TD></TR>
<TR  align="center" height="30"><td align="center" colspan="3">UserId</td><td align="center" colspan="4"><%=UserId%></TD></TR>
<% } else if (action.equals("Search")) { 
	if(!mks11.equals("0 and 100")) {
		String prtg = ""; 
		if(mks11.equals("0 and 9"))
		{
			prtg = "<10";
		}
		else if(mks11.equals("10 and 100"))
		{
			prtg = ">=10";
		}
		else if(mks11.equals("20 and 100"))
		{
			prtg = ">=20";
		}
		else if(mks11.equals("30 and 100"))
		{
			prtg = ">=30";
		}
		else if(mks11.equals("40 and 100"))
		{
			prtg = ">=40";		
		}
		else if(mks11.equals("50 and 100"))
		{
			prtg = ">=50";
		}
		else if(mks11.equals("60 and 100"))
		{
			prtg = ">=60";
		}
		else if(mks11.equals("70 and 100"))
		{
			prtg = ">=70";
		}
		else if(mks11.equals("80 and 100"))
		{
			prtg = ">=80";
		}
		else if(mks11.equals("90 and 100"))
		{
			prtg = ">=90";
		}
		else if(mks11.equals("0 and 100"))
		{
			prtg = ">=0&<=100";
		}
%>
<tr bgcolor="#fff" align="center" height="30" ><td align="center" colspan="<%=col%>"><h3 class="consultant-services">Student Details with marks <%=prtg%></h3></TD></TR>
<% } else { %>
<tr bgcolor="#fff" align="center" height="30" ><td align="center" colspan="<%=col%>"><h3 class="consultant-services">Student Details with marks</h3></TD></TR>
<% } } else if (action.equals("PerSearch")) { 
	if(!per1.equals("8")) {
		String prtg = ""; 
		if(per1.equals("1"))
		{
			prtg = "<40%";
		}
		else if(per1.equals("2"))
		{
			prtg = ">=40%";
		}
		else if(per1.equals("3"))
		{
			prtg = ">=50%";
		}
		else if(per1.equals("4"))
		{
			prtg = ">=60%";
		}
		else if(per1.equals("5"))
		{
			prtg = ">=70%";		
		}
		else if(per1.equals("6"))
		{
			prtg = ">=80%";
		}
		else if(per1.equals("7"))
		{
			prtg = ">=90%";
		}
		else if(per1.equals("8"))
		{
			prtg = ">=0%&<=100%";
		}
%>
<tr bgcolor="#fff" align="center" height="30" ><td align="center" colspan="<%=col%>"><h3 class="consultant-services">Student Details with percentage <%=prtg%></h3></TD></TR>
<% } else { %>
<tr bgcolor="#fff" align="center" height="30" ><td align="center" colspan="<%=col%>"><h3 class="consultant-services">Student Details with percentage</h3></TD></TR>
<% } } %>
<% if(action.equals("ListPass")) { %>
<tr bgcolor="#fff" align="center" height="30" ><td align="center" colspan="<%=col%>"><h3 class="consultant-services">List Passed Students</h3></TD></TR>
<% } %>
<TR align="center" height="30" >
<% if (action.equals("Search") || action.equals("PerSearch") || action.equals("ListPass")) 
{ %>
<TD width="<%=wid2%>" align="center" >Name</TD>
<TD width="<%=wid2%>" align="center" >UserId</TD>
<% } %>
<% if (action.equals("List2")) 
{ %>
<TD width="<%=wid2%>" align="center" >Batch</TD>
<TD width="<%=wid2%>" align="center" >TestCategory</TD>
<TD width="<%=wid2%>" align="center" >TestSubCategory</TD>
<% } %>
<% if (!action.equals("ListPass")) 
{ %>
<TD width="<%=wid2%>" align="center" >MarksObtained</TD>
<% } %>
<% if (!action.equals("List2")) 
{ %>
<TD width="<%=wid2%>" align="center" >Employee Id</TD>
<% } %>
<TD width="<%=wid2%>" align="center" >TestStatus</TD>
<% if (action.equals("Search") || action.equals("List2")) 
{ %>
<TD width="<%=wid2%>" align="center" >Pass Marks</TD>
<% } else if(action.equals("PerSearch") || action.equals("List1")) { %>
<TD width="<%=wid2%>" align="center" >Percentage</TD>
<% } %>
</TR>
</thead>
<tbody>
<%
int i=0;
int per = 0;
int pmks = 0;

while (iterator1.hasNext()) {	
	Team linfo = (Team) iterator1.next();
	int ID1 = linfo.getTeamname();
	mks = linfo.getMarks();
	pmks = linfo.getPassmarks();
	int maxmks = 0;
	int bid = linfo.getBatchid();
	ArrayList<Batch> blist = dbBean.getBatchById(bid);
	Iterator it = blist.iterator();
	if(it.hasNext())
	{
		Batch bt = (Batch)it.next();
		maxmks = bt.getMaxscore();
	}
	teststat = linfo.getTeststatus();
	CustomerInfo custinfo =  dbBean.getCustInfoById(ID1);
	float mks1 = (float)mks;
	float maxmks1 = (float)maxmks;
	float per12 = (mks1 / maxmks1) * 100;
	per = (int)per12;
	fname = custinfo.stuname;
	lname = custinfo.stlname;
	UserId = custinfo.stemail;
	eid = custinfo.empid;
	if (action.equals("List2")) 
	{ 
	ArrayList<Company> cm1 =  dbBean.getCompanyById(linfo.getCompid());
 	Iterator iterator21 = cm1.iterator();
	if(iterator21.hasNext())
	{
		Company cinfo = (Company) iterator21.next();
		comname1 = cinfo.getCompname();
	}
	else
		eflg=true;
	ArrayList<Test> tm1 =  dbBean.getTestById(linfo.getTestid());
 	Iterator iterator31 = tm1.iterator();
	if(iterator31.hasNext())
	{
		Test tinfo = (Test) iterator31.next();
		testname1 = tinfo.getTestname();
	}
	else
		eflg=true;
	ArrayList<TestSubCat> bm1 =  dbBean.getTestscatById(linfo.getTestsubcatid());
 	Iterator iterator41 = bm1.iterator();
	if(iterator41.hasNext())
	{
		TestSubCat binfo = (TestSubCat) iterator41.next();
		testsubcatname1 = binfo.getTestsubcatname();
	}
	else
		eflg=true;
	ArrayList<Batch> hm1 =  dbBean.getBatchById(bid);
 	Iterator iterator51 = hm1.iterator();
	if(iterator51.hasNext())
	{
		Batch hinfo = (Batch) iterator51.next();
		Batchname1 = hinfo.getBatchname();
	}
	else
		eflg=true;
	}
	if(eflg==false)
	{
	i++;
%><TR   height="30" align="center">
	<% if (action.equals("Search") || action.equals("PerSearch") || action.equals("ListPass")) 
{ %>
	<TD width="<%=wid2%>" align="center" ><a href="GetStudentDetails.jsp?action=List2&ID=<%=ID1%>"><%=fname%> <%=lname%></a></TD>
	<TD width="<%=wid2%>" align="center" ><%=UserId%></TD>
	<% } %>
	<% if (action.equals("List2")) 
	{ %>
	<TD width="<%=wid2%>" align="center"><%=Batchname1%></TD>
	<TD width="<%=wid2%>" align="center"><%=testname1%></TD>
	<TD width="<%=wid2%>" align="center"><%=testsubcatname1%></TD>
	<% } %>
	<% if (!action.equals("ListPass")) 
	{ %>
	<TD width="<%=wid2%>" align="center"><%=mks%></TD>
	<% } %>
	<% if (!action.equals("List2")) 
	{ %>
	<TD width="<%=wid2%>" align="center"><%=eid%></TD>
	<% } %>
	<TD width="<%=wid2%>" align="center"><%=teststat%></TD>
	<% if (action.equals("Search") || action.equals("List2")) 
	{ %>
	<TD width="<%=wid2%>" align="center"><%=pmks%></TD>
	<% } else if(action.equals("PerSearch") || action.equals("List1")) { %>
	<TD width="<%=wid2%>" align="center"><%=per%></TD>
	<% } %>
</TR>
<%
}
} 	
%>
</tbody>
</table>
</div>    
<% } else { %>
<% if (action.equals("List1") || action.equals("List") || action.equals("List2")) 
{ %>
<table align="center" width="590" height="40">
<TR align="center"><TD  align="center"><%=fname%> <%=lname%> has not appeared for any tests!</TD></TR>
</table>
<% } else if(action.equals("ListPass")) { %>
<table align="center" width="590" height="40">
<TR align="center"><TD  align="center">There are no students who have passed in this test!</TD></TR>
</table>
<% } else if(action.equals("PerSearch")) { 
	String prtg = ""; 
	if(per1.equals("1"))
	{
		prtg = "<40%";
	}
	else if(per1.equals("2"))
	{
		prtg = ">=40%";
	}
	else if(per1.equals("3"))
	{
		prtg = ">=50%";
	}
	else if(per1.equals("4"))
	{
		prtg = ">=60%";
	}
	else if(per1.equals("5"))
	{
		prtg = ">=70%";		
	}
	else if(per1.equals("6"))
	{
		prtg = ">=80%";
	}
	else if(per1.equals("7"))
	{
		prtg = ">=90%";
	}
	else if(per1.equals("8"))
	{
		prtg = ">=0%&<=100%";
	}
%>
<table align="center" width="590" height="40">
<TR align="center"><TD  align="center">There are no student who has scored <%=prtg%>!</TD></TR>
</table>
<% } else if(action.equals("Search")) { 
	String prtg = ""; 
	if(mks11.equals("0 and 9"))
	{
		prtg = "<10";
	}
	else if(mks11.equals("10 and 100"))
	{
		prtg = ">=10";
	}
	else if(mks11.equals("20 and 100"))
	{
		prtg = ">=20";
	}
	else if(mks11.equals("30 and 100"))
	{
		prtg = ">=30";
	}
	else if(mks11.equals("40 and 100"))
	{
		prtg = ">=40";		
	}
	else if(mks11.equals("50 and 100"))
	{
		prtg = ">=50";
	}
	else if(mks11.equals("60 and 100"))
	{
		prtg = ">=60";
	}
	else if(mks11.equals("70 and 100"))
	{
		prtg = ">=70";
	}
	else if(mks11.equals("80 and 100"))
	{
		prtg = ">=80";
	}
	else if(mks11.equals("90 and 100"))
	{
		prtg = ">=90";
	}
	else if(mks11.equals("0 and 100"))
	{
		prtg = ">=0&<=100";
	}
%>
<table align="center" width="590" height="40">
<TR align="center"><TD  align="center">There are no student who has scored <%=prtg%> marks!</TD></TR>
</table>
<% } %>
<% } if(eflg==true)
	{
	%>
<table align="center" width="590" height="40">
<TR align="center"><TD  align="center">No data available!</TD></TR>
</table>	
<%
}
%>	
	
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