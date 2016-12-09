<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Question"%>
<%@ page import="com.software.onlexam.Quiz"%>
<%@ page import="com.software.onlexam.Company"%>

<% 
DB dbBean = new DB(); 
%>
<%
String suser = "";
if(session.getAttribute("studentnm")!=null)
	suser = session.getAttribute("studentnm").toString();
int cid = 0;
if(session.getAttribute("SelCompany")!=null)
	cid = Integer.parseInt(session.getAttribute("SelCompany").toString());

String hdrscroll = "Online Quiz";
ArrayList<Company> llist99 = dbBean.getCompanyById(cid);
Iterator iterator99 = llist99.iterator();
if (iterator99.hasNext()) {
while (iterator99.hasNext()) {
	Company linfo = (Company) iterator99.next();
	hdrscroll = linfo.getCompname();
	hdrscroll += " " +  linfo.getCompaddr();
	hdrscroll += " " +  linfo.getContactno();
}
}
%>
<%
int comno = 0;
int testno = 0;
int testscatno = 0;
if(session.getAttribute("clkbtn").toString().equals("false"))
{
session.setAttribute("clkbtn", "true");
int batchno = Integer.parseInt(request.getParameter("sbatch"));
comno = Integer.parseInt(request.getParameter("comid"));
testno = Integer.parseInt(request.getParameter("stest"));
testscatno = Integer.parseInt(request.getParameter("stestscat"));
String ques = request.getParameter("ques");
String[] q = request.getParameterValues("q");
String Batchname1 = request.getParameter("Batchname1");
String comname1 = request.getParameter("comname1");
String testname1 = request.getParameter("testname1");
String testsubcatname1 = request.getParameter("testsubcatname1");
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
	marks=marks-negscore;
	WroAns++;
}
session.setAttribute("Marks",String.valueOf(marks));
session.setAttribute("CorAns",String.valueOf(CorAns));
session.setAttribute("WroAns",String.valueOf(WroAns));
int sid = Integer.parseInt(session.getAttribute("studentid").toString());
ArrayList<String> rlist = (ArrayList<String>)session.getAttribute("QuestList");
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
%>
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
    function noBack1() { window.history.forward(1); }
</SCRIPT>
<script type="text/javascript">
function showTimePerQuest(str){
	noBack1();
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
		document.getElementById("t3").innerHTML=xmlhttp.responseText; 
	} 
	} 
	xmlhttp.open("GET","gettimeperquest.jsp?q="+str,true); 
	xmlhttp.send();
	time1();
}
var i=0,j=0;
function time1()
{
	
var tinsec = document.getElementById("t3").innerHTML;
i++;
if(i==tinsec)
{
	document.f2.submit();
}
document.getElementById("t2").innerHTML="";
document.getElementById('t2').innerHTML=i;
document.getElementById("t4").innerHTML="The time in seconds for each question is ";
t=setTimeout('time1()',1000); 
}
function validatecheck()
{
	var x=document.forms["f1"]["quiz"].value;
	
	if (x==0)
	{
		document.getElementById("userIdMessage1").innerHTML = "Please select quiz!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1").innerHTML = "";
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
<body onLoad="showTimePerQuest(<%=timeperquest%>)" onpageshow="if (event.persisted) noBack();" onunload="">
<%
String chkval = "false";
if(session.getAttribute("loginapp")!=null)
	chkval = session.getAttribute("loginapp").toString();

String sstat = "false";
if(session.getAttribute("Start")!=null)
	sstat = session.getAttribute("Start").toString();
%>
<div class="global-wrapper clearfix" id="global-wrapper">

		<div class="navbar-before navbar-before-inverse">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="online-test">Online Test</h3>
                    </div>

                </div>
            </div>
        </div>
		
		<nav class="navbar navbar-default navbar-main-white yamm">
            <div class="navbar-header">
                <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#main-nav-collapse" area_expanded="false"><span class="sr-only">Main Menu</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="main-nav-collapse">
                <div class="container">                     
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
        
        <div class="container" style="margin-bottom:200px;">
         <div class="gap"></div>
            <div class="row">
                <div class="col-md-3">
                    <aside class="category-filters category-filters-color">
                        <div class="category-filters-section">
                            <h3 class="widget-title-sm" style="background-color: #0c4f6c;padding-top: 10px;padding-bottom: 10px;border-radius: 5px;">Test in progress</h3>
                            <ul class="cateogry-filters-list">
                                <li><a href="#" style="">Please select correct Answer(s) among given multiple choices.</a>
                                </li>
								<li>&nbsp;</li>
                                <li ><a href="#" style="color:#2aa4d7;font-weight:bold">GOOD LUCK.!</a>
                                </li>
                            </ul>
                        </div>
                     
                    
                     
                    </aside>
                </div>
                <div class="col-md-9">
                
                 <h3 class="custome-page-title">Welcome <span><%=suser%></span></h3>
                 <%
					String slink = "";
					int curquest = Integer.parseInt(session.getAttribute("QuestNo").toString());
					curquest++;
					if(curquest < noofquest)
					{		
						session.setAttribute("QuestNo",String.valueOf(curquest));
						slink = "nextQuest.jsp";
					}
					else
					{
						slink = "checkanswer.jsp?action=end";
					}	
				%>
                 <div class="notice">
                 	<h2>Results of Quiz</h2>
                    <ol>
                    	<li><span id="t4"></span>&nbsp;<span id="t3"></span></li>
                        <li><% if(negscore > 0) { %>Wrong answers carries negative marks<% } else { %>No negative marks for wrong answers<% } %></li>
                        <li>Total number of questions are <%=noofquest%></li>
                    </ol>
                 
                 </div><br>
				<br>
        	
        		<div class="row questions" data-gutter="15">
        		<h1>Question <%=curquest%></h1>
                       <div class="col-md-12">
                       <a >Company: <%=comname1%></a> > <a >Test :<%=testname1%> </a> > <a >Test Subcategory : <%=testsubcatname1%></a> > <a >Batch : <%=Batchname1%></a>
                       </div>
                       
                       
                       <div class="col-lg-3 counter"><h2><table><tr><td>Time Elapsed&nbsp;</td><td><span id="t2"></span></td></tr></table></h2>
                       </div>
                       
                       
                       <div class="clearfix"></div>
						<form action="<%=slink%>" method="post" name="f2" onSubmit="return validatecheck1()">
						<input type="hidden" value="<%=batchno%>" name="sbatch"/>
						<input type="hidden" value="<%=comname1%>" name="comname1"/>
						<input type="hidden" value="<%=testname1%>" name="testname1"/>
						<input type="hidden" value="<%=testsubcatname1%>" name="testsubcatname1"/>
						<input type="hidden" value="<%=Batchname1%>" name="Batchname1"/>
						<input type="hidden" value="<%=noofquest%>" name="noofquest"/>
						<input type="hidden" value="<%=quizno%>" name="quizno"/>
						<input type="hidden" value="<%=marksperq%>" name="marksperq"/>
						<input type="hidden" value="<%=negscore%>" name="negscore"/>
						<input type="hidden" value="<%=passmarks%>" name="passmarks"/>
						<input type="hidden" value="<%=totmarks%>" name="totmarks"/>
						<input type="hidden" value="<%=timeperquest%>" name="timeperquest"/>
						<input type="hidden" value="<%=comno%>" name="comid"/>
						<input type="hidden" value="<%=testno%>" name="stest"/>
						<input type="hidden" value="<%=testscatno%>" name="stestscat"/>
						<%
							int idx = curquest - 1;
						    ArrayList<Question> qlist = dbBean.getQuestionByQno(Integer.parseInt(rlist.get(idx)));
						    Iterator iterator = qlist.iterator();
						    String choiceC="";
						    String choiceD="";
						    String choiceE="";
						    if(iterator.hasNext())
							{
						    	Question que = (Question)iterator.next();
						    	choiceC=que.getCh3();
						    	choiceD=que.getCh4();
						    	choiceE=que.getCh5();
						%>
						<input type="hidden" value="<%=que.getAnswer()%>" name="correctans"/>
						<input type="hidden" value="<%=que.getQno()%>" name="ques" id="ques">
						<div class="question-section">
                            <h4><%=que.getQuestion()%></h4>
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                        <div class="col-xs-3 col-xs-offset-5">
                                           <div id="loadbar" style="display: none;">
                                              <div class="blockG" id="rotateG_01"></div>
                                              <div class="blockG" id="rotateG_02"></div>
                                              <div class="blockG" id="rotateG_03"></div>
                                              <div class="blockG" id="rotateG_04"></div>
                                              <div class="blockG" id="rotateG_05"></div>
                                              <div class="blockG" id="rotateG_06"></div>
                                              <div class="blockG" id="rotateG_07"></div>
                                              <div class="blockG" id="rotateG_08"></div>
                                          </div>
                                      </div>

                                      <div class="quiz" id="quiz" data-toggle="buttons">
									   <label class="element-animation1 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon fa fa-check"></i></span><input type="checkbox" name="q" value="A"> <%=que.getCh1()%></label>
                                       <label class="element-animation2 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon fa fa-check"></i></span><input type="checkbox" name="q" value="B"> <%=que.getCh2()%></label>
                                       <% if(!choiceC.equals("")) { %>
                                       <label class="element-animation3 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon fa fa-check"></i></span><input type="checkbox" name="q" value="C"> <%=choiceC%></label>
                                       <% } %>
                                       <% if(!choiceD.equals("")) { %>
                                       <label class="element-animation4 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon fa fa-check"></i></span><input type="checkbox" name="q" value="D"> <%=choiceD%></label>
                                       <% } %>
                                       <% if(!choiceE.equals("")) { %>
                                       <label class="element-animation5 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon fa fa-check"></i></span><input type="checkbox" name="q" value="E"> <%=choiceE%></label>
                                       <% } %>
                                   </div> </div>
                            </div>
                        </div><!-- ends question box-->
                        <input class="btn btn-cst-primary pull-right"  type="submit" value="Next">
                        <% session.setAttribute("clkbtn", "false"); 	} %>
                        </form>
						
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
						
						

</body>
</html>
<% }  dbBean.CloseConnection();  %>