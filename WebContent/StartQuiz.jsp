<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Question"%>
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.TestSubCat"%>
<%@ page import="com.software.onlexam.Batch"%>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.TestPaper"%>

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
int batchno = 0;
batchno = Integer.parseInt(request.getParameter("sbatch"));
///////////////////////////////
int sid = 0;
boolean iflag = false;
int lastqno = 0;
int resumemarks = 0;
int resumecorans = 0;
int resumewronans = 0;
int lmode = 0;
ArrayList<String> resumerlist = new ArrayList<String>();
resumerlist.clear();
ArrayList<String> resumeanslist = new ArrayList<String>();
resumeanslist.clear();
if(session.getAttribute("studentid")!=null)
{
	sid = Integer.parseInt(session.getAttribute("studentid").toString());
	int lasttest = dbBean.getLastPaper(sid,batchno);
	if(lasttest!=0)
	{
	ArrayList<TestPaper> llist98 = dbBean.getTestPaperById(lasttest);
	Iterator iterator98 = llist98.iterator();
	String examquest = "";
	String examans = "";
	String lastansqno = "";
	
	if (iterator98.hasNext())
	{
		while (iterator98.hasNext())
		{
			TestPaper linfo = (TestPaper) iterator98.next();
			examquest = linfo.getExamquest();
			examans = linfo.getExamans();
			lastansqno = String.valueOf(linfo.getLastansqno());
			resumemarks = linfo.getMarks();
			resumecorans = linfo.getCorans();
			resumewronans = linfo.getWronans();
			
			StringTokenizer st1 = new StringTokenizer(examans,"-");
			String stoken1 = "";
			
			if (st1.hasMoreTokens())
			{
				while (st1.hasMoreTokens())
				{
					stoken1 = st1.nextToken();
					resumeanslist.add(stoken1);
				}
			}
			StringTokenizer st = new StringTokenizer(examquest,"-");
			String stoken = "";
			int idx1 = 0;
			if (st.hasMoreTokens())
			{
				while (st.hasMoreTokens())
				{
					idx1++;
					stoken = st.nextToken();
					resumerlist.add(stoken);
					
					if(stoken.equalsIgnoreCase(lastansqno))
					{
						lastqno = idx1;	
					}					
				}
				if(!stoken.equalsIgnoreCase(lastansqno))
				{
					iflag=true;	
				}
				else
				{
					iflag=false;
				}
			}
		}		
			
		}
	}	
}

//////////////////////////////

String action = request.getParameter("action");
int comno = 0;
int testno = 0;
int testscatno = 0;

int timeperquest = 0;
String quiz = "";
String Batchname1 = "";
String comname1 = "";
String testname1 = "";
String testsubcatname1 = "";
String correctans = "";
int noofquest = 0;
int marksperq = 0;
int passmarks = 0;
int negscore = 0;
int totmarks = 0;
ArrayList<Batch> clist = null;
ArrayList<Batch> dlist = null;
String slink = "";
int curquest = 0;
ArrayList<String> rlist = new ArrayList<String>();
rlist.clear();
ArrayList<String> anslist = new ArrayList<String>();
anslist.clear();
ArrayList<String> nlevel = new ArrayList<String>();
nlevel.clear();
boolean sflag=false;
if (action != null && action.equals("StartQuiz")) 
{
	comno = Integer.parseInt(request.getParameter("comid"));
	testno = Integer.parseInt(request.getParameter("stest"));
	testscatno = Integer.parseInt(request.getParameter("stestscat"));
	clist = dbBean.getBatchById(batchno);
	Iterator iterator = clist.iterator();
	if (iterator.hasNext()) {
		Batch qz = (Batch) iterator.next();
		//noofquest = qz.getNoques();
		Batchname1 = qz.getBatchname(); 
		marksperq = qz.getMarksperq();
		negscore = qz.getNegscore();
		passmarks = qz.getPassmarks();
		totmarks = qz.getMaxscore();
		timeperquest = qz.getTimeperquest();
		int qs1 = qz.getL1();
		int qs2 = qz.getL2();
		int qs3 = qz.getL3();
		noofquest = qs1 + qs2 + qs3;
		nlevel.add(String.valueOf(qs1));
		nlevel.add(String.valueOf(qs2));
		nlevel.add(String.valueOf(qs3));
		ArrayList<Company> cm =  dbBean.getCompanyById(qz.getCompid());
	 	Iterator iterator2 = cm.iterator();
		if(iterator2.hasNext())
		{
			Company cinfo = (Company) iterator2.next();
			comname1 = cinfo.getCompname();
		}
		ArrayList<Test> tm =  dbBean.getTestById(qz.getTestid());
	 	Iterator iterator3 = tm.iterator();
		if(iterator3.hasNext())
		{
			Test tinfo = (Test) iterator3.next();
			testname1 = tinfo.getTestname();
		}
		ArrayList<TestSubCat> bm =  dbBean.getTestscatById(qz.getTestsubcatid());
	 	Iterator iterator4 = bm.iterator();
		if(iterator4.hasNext())
		{
			TestSubCat binfo = (TestSubCat) iterator4.next();
			testsubcatname1 = binfo.getTestsubcatname();
		}			
	}
	if(iflag==false)
	{
		session.setAttribute("QuestNo","0");
		session.setAttribute("Marks","0");
		session.setAttribute("CorAns","0");
		session.setAttribute("WroAns","0");		
	}
	else
	{
		session.setAttribute("QuestNo",String.valueOf(lastqno));
		session.setAttribute("Marks",String.valueOf(resumemarks));
		session.setAttribute("CorAns",String.valueOf(resumecorans));
		session.setAttribute("WroAns",String.valueOf(resumewronans));
	}
	session.setAttribute("Start","true");
	session.setAttribute("End","false");
		
	curquest = Integer.parseInt(session.getAttribute("QuestNo").toString());
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
	
	if(iflag==false)
	{
	int maxquest = dbBean.getMaxQuest(comno,testno,testscatno);
	if(maxquest == 0)
	{
		sflag=true;
	}
	else if(maxquest != 0)
	{
		sflag=false;
	//int minquest = dbBean.getMinQuest(comno,testno,testscatno);
	
	
	int siz1 = 0;
	int cnt = 0;
	int totquest = 0;
    int cntr = 0;
    boolean gflg = false;
    ArrayList<String> zlst = new ArrayList<String>();
    
    ArrayList<String> mlst = new ArrayList<String>();
    while(cntr <  3 && sflag==false)
		{
    	    int que1 = Integer.parseInt(nlevel.get(cntr));
    	    totquest += que1;
			cntr++;
			zlst.clear();
			zlst = dbBean.getQuestion(comno, testno, testscatno, cntr);
			siz1 = 0;
			siz1 = zlst.size();
	if(siz1 < que1)
	{
		sflag=true;
		lmode = cntr;
		cntr =1000000;
	}
	else
	{
		sflag=false;
		mlst.clear();
		
		int aStart = 0;
		int aEnd = siz1-1;
		
		int randomNumber =  0;
		Random aRandom = new Random();
		
		while(cnt<totquest)
	{
		//get the range, casting to long to avoid overflow problems
	    long range = (long)aEnd - (long)aStart + 1;
	    // compute a fraction of the range, 0 <= frac < range
	    long fraction = (long)(range * aRandom.nextDouble());
	    randomNumber =  (int)(fraction + aStart);
	    
	    	if(cnt==0)
	    	{
	    		rlist.add(String.valueOf(zlst.get(randomNumber)));
	    		mlst.add(String.valueOf(randomNumber));
	    		//System.out.println(randomNumber);
	    		cnt++;
	    	}
	    	else if(cnt< totquest) 
	    	{
	    		if(!mlst.contains(String.valueOf(randomNumber)))
	    		{
	    			rlist.add(String.valueOf(zlst.get(randomNumber)));
	    			mlst.add(String.valueOf(randomNumber));
	    			cnt++;    			
	    		}	    		
	    	}    	
	    } // while cnt<totquest
	} //if siz1 < no of que in lvl
	} //while cntr <  3 && sflag==false
	String questlst = "";
    for(int w=0;w<rlist.size();w++)
	{
		System.out.println(rlist.get(w));		
	}
    	session.setAttribute("QuestList",rlist);
    	session.setAttribute("AnsList",anslist);
	} //if(maxquest != 0)
	} //if(iflag==false)
	else
	{
		session.setAttribute("QuestList",resumerlist);
		session.setAttribute("AnsList",resumeanslist);
		for(int w=0;w<resumerlist.size();w++)
		{
			System.out.println(resumerlist.get(w));		
		}
	}		
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
<%
if(sflag==false)
	{
%>
<body onLoad="showTimePerQuest(<%=timeperquest%>)">
<% } else { %>
<body>
<% } %>
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
                       
                       
                       <div class="col-lg-3 counter"><h2>Time Elapsed&nbsp;<span id="t2"></span></h2>
                       </div>
                       
                       
                       <div class="clearfix"></div>
						
						<%
if(sflag==false)
{
if (action != null && action.equals("StartQuiz")) 
{
%>

<form action="<%=slink%>" method="post" name="f2" onSubmit="return validatecheck1()">
<input type="hidden" value="<%=batchno%>" name="sbatch"/>
<input type="hidden" value="<%=comname1%>" name="comname1"/>
<input type="hidden" value="<%=testname1%>" name="testname1"/>
<input type="hidden" value="<%=testsubcatname1%>" name="testsubcatname1"/>
<input type="hidden" value="<%=Batchname1%>" name="Batchname1"/>
<input type="hidden" value="<%=noofquest%>" name="noofquest"/>
<input type="hidden" value="<%=batchno%>" name="quizno"/>
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
	ArrayList<Question> qlist = null;
	
	if(iflag==false)
	{
		qlist =	dbBean.getQuestionByQno(Integer.parseInt(rlist.get(idx)));
	}
	else
	{
		qlist =	dbBean.getQuestionByQno(Integer.parseInt(resumerlist.get(idx)));
	}
    Iterator iterator = qlist.iterator();
    //rs=Db.getSelected(con,"select * from questions where qno="+startques);
    String choiceC="";
    String choiceD="";
    String choiceE="";
    if(iterator.hasNext())
	{    	
    	Question que = (Question)iterator.next();
    	correctans = que.getAnswer();
    	choiceC=que.getCh3();
    	choiceD=que.getCh4();
    	choiceE=que.getCh5();
%>
<input type="hidden" value="<%=correctans%>" name="correctans"/>
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
                        <%	} %>
                        </form>
						<% } %>
						<% } else { 
						String lmode1 = "";
						if(lmode==1)
						{
							lmode1 = "Easy";
						}
						else if(lmode==2)
						{
							lmode1 = "Medium";
						}
						else if(lmode==3)
						{
							lmode1 = "Difficult";
						}
						%>
						There are less question in question bank for <%=lmode1%> mode!
						<% } %>
						                        
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
<% dbBean.CloseConnection(); %>