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
function checkvalidate22200()
{
	var x=document.forms["f1"]["ques"].value;
	var x1=document.forms["f1"]["ch"].value;
	
	if ((x==null || x=="") && (x1==null || x1==""))
	{
		document.getElementById("userIdMessage711").innerHTML = "Enter atleast 1 search criteria!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage711").innerHTML = "";
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

%>
<%
String action = request.getParameter("action");
int comid = 0;
int testid = 0;
int testscatid = 0;

String ques111 = "";
String ch111 = "";
ArrayList<Question> clist = null;
String ques = "";
String ch = "";
int itval = 0;
if (action != null && action.equals("listquestion")) 
{
	ques = request.getParameter("ques");
	ch = request.getParameter("ch");
	if(ques != "" && ch != "")
	{
		itval = 1;
		clist = dbBean.getQuestionChByKeyword(ques,ch, cid);
	}
	else
	{
		if(ques != "")
		{
			itval = 2;
			clist = dbBean.getQuestionByKeyword(ques,cid);
		}	
		else if(ch != "")
		{
			itval = 3;
			clist = dbBean.getChByKeyword(ch, cid);
		} 
	}
	ques111 = ques;
	ch111 = ch;
}
if (action != null && action.equals("deleteQuestion")) 
{
	ques111 = request.getParameter("ques111").toString();
	ch111 = request.getParameter("ch111").toString();
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
		ques = ques111;
		ch = ch111;		
	}
	
	if(ques != "" && ch != "")
	{
		itval = 1;
		clist = dbBean.getQuestionChByKeyword(ques,ch,cid);
	}
	else
	{
		if(ques != "")
		{
			itval = 2;
			clist = dbBean.getQuestionByKeyword(ques,cid);
		}	
		else if(ch != "")
		{
			itval = 3;
			clist = dbBean.getChByKeyword(ch,cid);
		} 
	}	
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
<form name="f1" onSubmit="return checkvalidate22200()">
<input type="hidden" value="listquestion" name="action">
<h3 class="consultant-services">List Question-Choices By Keyword</h3><br>
<table align="center" width="670" >
<tr><td>Question</td><td><INPUT TYPE="TEXT" NAME="ques" style="width:350px;"/></td>
<td align="left" width="220"><div id="userIdMessage711"></div></td></tr>
<tr><td>Choices</td><td><INPUT TYPE="TEXT" NAME="ch" style="width:350px;"/></td>
<td align="left" width="220"><div id="userIdMessage721"></div></td></tr>
<tr><td colspan="2"><input class="btn btn-cst-primary pull-right"  type="submit" value="Search"></td></tr></table>
</form>
<%
if (action.equals("listquestion")) 
{
	Iterator iterator = clist.iterator();
	if (iterator.hasNext()) {		
%>
<FORM name="delform" onSubmit="return confirmcheck()">
<INPUT TYPE="HIDDEN" NAME="action11" VALUE="<%=action%>">
<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteQuestion">
<input type="hidden" name="ques111" value="<%=ques111%>"/>
<input type="hidden" name="ch111" value="<%=ch111%>"/>
<INPUT TYPE="HIDDEN" NAME="hdflg" VALUE="1">
<div style="height: 490px; width: 670px; overflow-y: auto">
<table align="center" width="650" height="490">
<thead>
<tr  align="center"><td align="center" colspan="5">
<INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(img/delete.png); width:25px; height:25px;"/></td></tr>
<% if(itval==1) { %>
<tr align="center" height="50"><td  align="center" colspan="5"><h3 class="consultant-services">Question List By keyword <%=ques%> in question and keyword <%=ch%> in choices</h3></TD></TR>
<% } else if(itval==2) { %>
<tr align="center" height="50"><td  align="center" colspan="5"><h3 class="consultant-services">Question List By keyword <%=ques%> in question</h3></TD></TR>
<% } else if(itval==3) { %>
<tr align="center" height="50"><td  align="center" colspan="5"><h3 class="consultant-services">Question List By keyword <%=ch%> in choices</h3></TD></TR>
<% } %>
<TR  align="center" height="50">
<TD width="70" align="center"><input type="checkbox" id="chkdell" onClick="setchkval()" /></TD>
<TD width="510" align="center" >Question</TD>
<TD width="160" align="center" >Test</TD>
<TD width="160" align="center" >TestSubCat</TD>
<TD width="160" align="center" >Details</TD>
</TR>
</thead>
<tbody>
<%
int i=1;
while (iterator.hasNext()) {
	Question cust = (Question) iterator.next();
	comid = cust.getCompid();
	testid = cust.getTestid();
	testscatid = cust.getTestsubcatid();
	getQuizInfo(comid,testid,testscatid,dbBean);
	
if(i%2==0)
{
%>
<TR   height="50" align="center">
<% 
}
else
{
%>
<TR   height="50" align="center">
<% 
}
 	String qno1 = String.valueOf(cust.getQno());
%>
<TD width="70"  align="center"><input type="checkbox" name="chkdel" onClick="getchkval()" value="<%=qno1%>"></TD>
<TD width="510" align="center"><%=cust.getQuestion()%></TD>
<TD width="160" align="center"><%=testname120%></TD>
<TD width="160" align="center"><%=testsubcatname120%></TD>
<TD width="160" align="center"><a href="QuesDetails.jsp?&qno=<%=qno1%>">Details</a></TD>
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