<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.Team"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.CustomerInfo"%>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.Batch"%>
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.TestSubCat"%>
<%@ page import="com.software.onlexam.TestPaper"%>
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
	xmlhttp.open("GET","gettestscat1.jsp?q="+str+"&v="+str1,true); 
	xmlhttp.send(); 
} 
function confirmcheck() { 
    var r=confirm("Are You Sure You Want To delete?"); 
    if(r==false) {
    	return false;
    }
}
function checkvalidate99999()
{
	var x1=document.forms["Batchform"]["stest"].value;
	var x2=document.forms["Batchform"]["stestscat"].value;
	var x3=document.forms["Batchform"]["sbatch"].value;
	var x4=document.forms["Batchform"]["steststat"].value;
		
	
	if (x1==0)
	{
		document.getElementById("userIdMessage9992").innerHTML = "Please select Test!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage9992").innerHTML = "";
	}
	if (x2==0)
	{
		document.getElementById("userIdMessage9993").innerHTML = "Please select Test subcategory!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage9993").innerHTML = "";
	}	
	if (x3==0)
	{
		document.getElementById("userIdMessage9994").innerHTML = "Please select batch!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage9994").innerHTML = "";
	}	
	if (x4==0)
	{
		document.getElementById("userIdMessage9995").innerHTML = "Please select Test status!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage9995").innerHTML = "";
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
<%!	int maxscore=0;
%>



<%
String action = request.getParameter("action");
String Batchname1 = "";
String comname1 = "";
String testname1 = "";
String testsubcatname1 = "";
int comno = 0;
int testno = 0;
int testscatno = 0;
int teststat = 0;
int batchno = 0;
String teststat1 = "";
String keyword = null;
int lid = 0;
ArrayList<Team> clist = null;
if (action != null && action.equals("deleteTeam")) 
{
	try 
	{
		String[] recdel = request.getParameterValues("chkdel");
		int ilen = recdel.length;
		for(int d=0;d<ilen;d++)
		{	
			int ID = Integer.parseInt(recdel[d]);
			if(dbBean.DeleteTeam1(ID)==false)
				out.println("Error deleting Team");
		}
		action = "SelTest";
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
if (action.equals("SelTest")) 
{
	
	batchno = Integer.parseInt(request.getParameter("sbatch"));
	comno = cid;
	testno = Integer.parseInt(request.getParameter("stest"));
	testscatno = Integer.parseInt(request.getParameter("stestscat"));
	teststat = Integer.parseInt(request.getParameter("steststat"));
	
	if(teststat==1)
		teststat1 = "Passed";
	else
		teststat1 = "Failed";
	 clist = dbBean.getTeam1(comno,testno,testscatno,batchno,teststat1);
}
ArrayList<Company> cm =  dbBean.getCompanyById(comno);
Iterator iterator2 = cm.iterator();
if(iterator2.hasNext())
{
Company cinfo = (Company) iterator2.next();
comname1 = cinfo.getCompname();
}

ArrayList<Test> tm =  dbBean.getTestById(testno);
Iterator iterator3 = tm.iterator();
if(iterator3.hasNext())
{
Test tinfo = (Test) iterator3.next();
testname1 = tinfo.getTestname();
}

ArrayList<TestSubCat> bm =  dbBean.getTestscatById(testscatno);
Iterator iterator4 = bm.iterator();
if(iterator4.hasNext())
{
TestSubCat binfo = (TestSubCat) iterator4.next();
testsubcatname1 = binfo.getTestsubcatname();
}

ArrayList<Batch> hm =  dbBean.getBatchById(batchno);
Iterator iterator5 = hm.iterator();
if(iterator5.hasNext())
{
Batch hinfo = (Batch) iterator5.next();
Batchname1 = hinfo.getBatchname();
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




<table align="center" width="670" >
<tr align="center"><td  align="center">							
<% if (action.equals("List")) 
{
%>
<FORM name="Batchform" onSubmit="return checkvalidate99999()">
<input type="hidden" name="action" value="SelTest"/>
<h3 class="consultant-services">List Score</h3><br>
Select Quiz<br>
<table align="center" width="530">
	<tr><td  align="center" width="150">Test</td>
	<td align="left"><select name="stest" onchange="showTestscat(<%=cid%>,this.value)">
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
		<td  align="center" width="200"><div id="userIdMessage9992"></div></td></tr>
	<tr><td  align="center" width="150">TestSubCategory</td>
	<td   align="left"> 
		<div id="dtestscat">
		<select name="stestscat" onchange="showBatch(<%=cid%>,stest.value,this.value)"> 
		<option value="0">Select</option>
		</select> 
		</div>
		</td>
		<td  align="center" width="200"><div id="userIdMessage9993"></div></td></tr>
	<tr><td  align="center" width="150">Batch</td>
	<td   align="left">
		<div id="dbatch"> 
		<select name="sbatch"> 
		<option value="0">Select</option>
		</select> 
		</div>
		</td>
		<td  align="center" width="200"><div id="userIdMessage9994"></div></td></tr>		
	<tr><td  align="center" width="150">Test Status</td>
	<td   align="left"> 
		<select name="steststat"> 
		<option value="0">Select</option>
		<option value="1">Passed</option>
		<option value="2">Failed</option>
		</select> 
		</td>
		<td  align="center" width="200"><div id="userIdMessage9995"></div></td></tr>			
	<TR align="center"><TD width="150" align="center"></TD><TD ALIGN="left"><input class="btn btn-cst-primary pull-right"  type="submit" value="Go"></TD></TR>			
</table>
</FORM>
<%
}
String sname = "";
if (action.equals("SelTest")) 
{
%>
COMPANY : <%=comname1%> >> Test : <%=testname1%> >> TEST SUBCATEGORY : <%=testsubcatname1%> >> BATCH : <%=Batchname1%>
<%
	Iterator iterator98 = clist.iterator();
	if(iterator98.hasNext())
	{
		
		maxscore = dbBean.getMarksMax(comno,testno,testscatno,batchno,teststat1);
		ArrayList<Team> cin =  dbBean.getCustInfoByMarks(maxscore,comno,testno,testscatno,
				batchno,teststat1);
		Iterator iterator1 = cin.iterator();
		if(iterator1.hasNext())
		{
			int z=1;
			boolean mflag=false;
			ArrayList<String> alist = new ArrayList<String>();
			alist.clear();
		%>
<div style="height: 150px; width:670px; overflow-y: auto">		
<table align="center" width="500" height="150">
<tbody>		
<tr bgcolor="#fff" height="20" align="center"><td align="center" colspan="2"><h3 class="consultant-services">Student Having Maximum Score</h3></td></tr>
<tr   height="20" align="center">
<td  align="center" width="250">Student Name</td>
<td  align="center" width="250">Score</td>
</tr>

		<%
			while(iterator1.hasNext()) {
				Team tem = (Team) iterator1.next();
			CustomerInfo cinfo1 = dbBean.getCustInfoById(tem.getTeamname());
			sname = cinfo1.stuname + " " + cinfo1.stlname;
			
			if(z==1)
			{
				alist.add(sname);
				mflag = true;
			}
			else
			{
				if(!alist.contains(sname))
				{
					alist.add(sname);
					mflag = true;
				}
				else
				{
					mflag = false;
				}
			}
			if(mflag==true)
			{
%>
<tr   height="20" align="center">
<td  align="center" width="250"><a href="GetStudentDetails.jsp?action=List2&ID=<%=cinfo1.id%>"><%=sname%></a></td>
<td align="center" width="250"><%=maxscore%></td></tr>
<% z++;
	} 
}
 %>
</tbody>
</table>
</div>
<% } %>
<br/>
<FORM name="delform" onSubmit="return confirmcheck()">
<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteTeam">
<INPUT TYPE="HIDDEN" NAME="stest" VALUE="<%=testno%>">
<INPUT TYPE="HIDDEN" NAME="stestscat" VALUE="<%=testscatno%>">
<INPUT TYPE="HIDDEN" NAME="steststat" VALUE="<%=teststat%>">
<INPUT TYPE="HIDDEN" NAME="sbatch" VALUE="<%=batchno%>">
<INPUT TYPE="HIDDEN" NAME="hdflg" VALUE="1">
<div style="height: 490px; width:670px; overflow-y: auto">
<table align="center" height="490">
<thead>
<tr  align="center"><td align="center" colspan="10">
<INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(img/delete.png); width:25px; height:25px;"/></td></tr>
<tr bgcolor="#fff" align="center" height="30"><td  align="center" colspan="10"><h3 class="consultant-services">Score Board</h3></TD></TR>
<TR  align="center" height="30">
<TD width="70" align="center"><input type="checkbox" id="chkdell" onClick="setchkval()" /></TD>
<TD width="130" align="center" >Student</TD>
<TD width="100" align="center" >UserId</TD>
<TD width="100" align="center" >Score</TD>
<TD width="100" align="center" >Total Marks</TD>
<TD width="100" align="center" >Total questions</TD>
<TD width="100" align="center" >Correct answers</TD>
<TD width="100" align="center" >Wrong answers</TD>
<TD width="100" align="center" >Status</TD>
<TD width="100" align="center" >PassMarks</TD>
</TR>
</thead>
<tbody>
<%
int i=1;
while (iterator98.hasNext()) {
	Team linfo = (Team) iterator98.next();
%>
<TR   height="30" align="center">
<% 
 	String ID1 = String.valueOf(linfo.getID());
 	int id1 = Integer.parseInt(ID1);
 	int tid = linfo.getTeamname();
 	CustomerInfo cinfo =  dbBean.getCustInfoById(tid);
 	int bid1 = linfo.getBatchid();
 	ArrayList<Batch> blist = dbBean.getBatchById(bid1);
 	Iterator it101 = blist.iterator();
 	int totmarks = 0;
 	int noofquest = 0;
 	if(it101.hasNext())
	{
 		Batch binfo = (Batch) it101.next();
 		totmarks = binfo.getMaxscore();
 		int qs1 = binfo.getL1();
		int qs2 = binfo.getL2();
		int qs3 = binfo.getL3();
		noofquest = qs1 + qs2 + qs3;
	}
 	ArrayList<TestPaper> tpaper =  dbBean.getTestPaperByIdBid(tid,bid1); 
 	Iterator it102 = tpaper.iterator();
 	int CorAns = 0;
 	int WroAns = 0;
 	if(it102.hasNext())
	{
 		TestPaper tpinfo = (TestPaper) it102.next();
 		CorAns = tpinfo.getCorans();
 		WroAns = tpinfo.getWronans();
	}
%>
<TD width="70"  align="center"><input type="checkbox" name="chkdel" onClick="getchkval()" value="<%=ID1%>"></TD>
<TD width="130" align="center"><a href="GetStudentDetails.jsp?action=List2&ID=<%=cinfo.id%>"><%=cinfo.stuname%> <%=cinfo.stlname%></a></TD>
<TD width="100" align="center"><%=cinfo.stemail%></TD>
<TD width="100" align="center"><%=linfo.getMarks()%></TD>
<TD width="100" align="center"><%=totmarks%></TD>
<TD width="100" align="center"><%=noofquest%></TD>
<TD width="100" align="center"><%=CorAns%></TD>
<TD width="100" align="center"><%=WroAns%></TD>
<TD width="100" align="center"><%=linfo.getTeststatus()%></TD>
<TD width="100" align="center"><%=linfo.getPassmarks()%></TD>
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
<TR align="center"><TD  align="center">There are no students who have <%=teststat1%> in this test!</TD></TR>
</table>
<%
}
}
%>
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