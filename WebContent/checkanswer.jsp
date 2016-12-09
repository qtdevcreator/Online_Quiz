<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Question"%>
<%@ page import="com.software.onlexam.Quiz"%>
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
function validatecheck()
{
	var x=document.forms["FeedbackForm"]["From"].value;
	var x2=document.forms["FeedbackForm"]["message"].value;
	
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage1").innerHTML = "Please enter email!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1").innerHTML = "";
	}
	var atpos=x.indexOf("@");
	var dotpos=x.lastIndexOf(".");
	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
	{
		document.getElementById("userIdMessage1").innerHTML = "Email Id is not valid!";
	   	return false;
	}
	else
	{
		document.getElementById("userIdMessage1").innerHTML = "";
	}
	
	if (x2==null || x2=="")
	{
		document.getElementById("userIdMessage2").innerHTML = "Please enter message!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage2").innerHTML = "";
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
String cmpic = "";
if(session.getAttribute("compicon")!=null)
	cmpic = session.getAttribute("compicon").toString();
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
%>
<%
if(session.getAttribute("clkbtn").toString().equals("false"))
{
session.setAttribute("clkbtn", "true");
String action = request.getParameter("action");

int comno = 0;
int testno = 0;
int testscatno = 0;
int batchno = 0;
String comname1 = "";
String testname1 = "";
String testsubcatname1 = "";
String Batchname1 = "";
if(action.equals("end"))
{
batchno = Integer.parseInt(request.getParameter("sbatch"));
comno = Integer.parseInt(request.getParameter("comid"));
testno = Integer.parseInt(request.getParameter("stest"));
testscatno = Integer.parseInt(request.getParameter("stestscat"));
String ques = request.getParameter("ques");
String[] q = request.getParameterValues("q");
Batchname1 = request.getParameter("Batchname1");
comname1 = request.getParameter("comname1");
testname1 = request.getParameter("testname1");
testsubcatname1 = request.getParameter("testsubcatname1");
int noofquest = Integer.parseInt(request.getParameter("noofquest"));
int quizno = Integer.parseInt(request.getParameter("quizno"));
int marksperq = Integer.parseInt(request.getParameter("marksperq"));
int negscore = Integer.parseInt(request.getParameter("negscore"));
int passmarks = Integer.parseInt(request.getParameter("passmarks"));
int totmarks = Integer.parseInt(request.getParameter("totmarks"));
int timeperquest = Integer.parseInt(request.getParameter("timeperquest"));
int marks = Integer.parseInt(session.getAttribute("Marks").toString());
int CorAns = Integer.parseInt(session.getAttribute("CorAns").toString());
int WroAns = Integer.parseInt(session.getAttribute("WroAns").toString());

String correctans = request.getParameter("correctans");
int vflg = 0;
int ilen = correctans.length();
String sans = "";
if(q != null)
{
for(String sm : q)
{
	sans += sm;	
}
}
else {
	sans += "F";
}
if(correctans.equalsIgnoreCase(sans) )
{
	marks=marks+marksperq;	
	CorAns++;
}
else
{
	//wrong answer
	if((marks>0)&&((marks-negscore)>=0))
	{
		//reducing score
		marks=marks-negscore;
	}
	else
		marks = 0;
	WroAns++;
}
session.setAttribute("Marks",String.valueOf(marks));
session.setAttribute("CorAns",String.valueOf(CorAns));
session.setAttribute("WroAns",String.valueOf(WroAns));
int sid = Integer.parseInt(session.getAttribute("studentid").toString());
String studname = session.getAttribute("studentuser").toString();
suser = dbBean.GetUserName(studname, cid);

ArrayList<String> anslist = (ArrayList<String>)session.getAttribute("AnsList");
anslist.add(sans);
session.setAttribute("AnsList",anslist);

String anslst = "";
for(int w=0;w<anslist.size();w++)
{
	if(w==0)
	{
		anslst = anslist.get(w);
	}
	else
	{
		anslst += "-" + anslist.get(w);
	}
}


ArrayList<String> rlist = (ArrayList<String>)session.getAttribute("QuestList");
String questlst = "";
for(int w=0;w<rlist.size();w++)
{
	if(w==0)
	{
		questlst = rlist.get(w);
	}
	else
	{
		questlst += "-" + rlist.get(w);
	}
}
int pcount = dbBean.getCountPaper(sid,batchno);
if(pcount==0)
{
	dbBean.AddTestPaper(sid,questlst,Integer.parseInt(ques),batchno,marks,CorAns,WroAns,anslst);
}
else
{
	int lasttest = dbBean.getLastPaper(sid,batchno);
	dbBean.updateTestPaper(questlst,Integer.parseInt(ques),marks,CorAns,WroAns,anslst,lasttest);
}
String teststatus = "";
if(marks >= passmarks) { 
	teststatus = "Passed";
 } else { 
	 teststatus = "Failed";
 } 

dbBean.AddTeam(sid,marks,comno,testno,testscatno,batchno,teststatus,passmarks);
dbBean.SubmitTest("Submitted", sid);
session.setAttribute("Start","false");
session.setAttribute("End","true");
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
    
    
    	<div class="row">
                
                <jsp:include page="QuizMenu.jsp" flush="true"/>
    					
                
                <div class="col-md-9">
                
                <h3 class="custome-page-title">Welcome, <%=suser%></h3>
                
                 
                 	
                  <h3 class="custome-page-title" style="text-align:left; font-size:30px;">
                  <img src="<%=cmpic%>"  style="padding-right:150px;"><%=compname%></h3>
                  
                  
                 
                  
				
				<div class="col-lg-6 col-lg-offset-3">
                <div class="">
                    <header class="page-header text-center" style=" color:#2aa3d5; text-transform:uppercase; font-size:18px;">
                       Testimonial
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-12">

<% if(action.equals("end"))
{ %>
<HR>
<center>End Of Test!</center>
<HR>
<%
}
%>
<table align="center" width="600" >
<tr align="center">
<td  align="center" width="600" >
<% if(action.equals("end"))
{ %>
COMPANY : <%=comname1%> >> Test : <%=testname1%> >> TEST SUBCATEGORY : <%=testsubcatname1%> >> BATCH : <%=Batchname1%>
<%
}
%>
</td></tr>
<tr align="center"><td  align="center">
<table align="center" width="600" height="200" >
<tr align="center" height="30" >
<td align="center" colspan="2"></td></tr>
<tr align="center" height="170" >
<td align="center">
	<table align="center" width="300" height="170" >
		<tr align="center" height="170"><td align="center">
			Please drop us a line!
		</td></tr>
	</table>
</td>
<td align="center">
	<table align="center" width="300" height="170" >
		<tr align="center" height="170"><td align="center">
			If you have a query, an idea or a suggestion, we would be most happy to 
			listen and will do our best to implement the same			
		</td></tr>
	</table>
</td></tr>
</table>
</td></tr>
<tr align="center">
<td align="center">
<form name="FeedbackForm" method="post" action="Feedback1.jsp" onSubmit="return validatecheck()">
<table align=center width="400">
<tr align=center>
    <td  align=center colspan=2>Message</td>
</tr>
<tr align=center>
    <td align=center><B>Your email Id</B></td>
    <td align=left><INPUT TYPE="text" NAME="From" size="30">
    <div id="userIdMessage1"></div></td>
</tr>
<tr align=center>
    <td align=center><B>Feedback</B></td>
    <td align=left><TEXTAREA name="message" ROWS = "5" COLS="31"></TEXTAREA>
    <div id="userIdMessage2"></div></td>
</tr>
<tr align=center>
    <td align=center></td>
	<td align=center><input class="btn btn-cst-primary pull-right"  type="submit" value="Send"></td>
</tr>
</table>
</form>
</td></tr>
</table>

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
<% 
	session.setAttribute("clkbtn", "true"); } dbBean.CloseConnection(); %>
</body>
</html>
