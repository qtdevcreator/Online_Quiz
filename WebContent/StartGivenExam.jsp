<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Question"%>
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.TestSubCat"%>
<%@ page import="com.software.onlexam.Batch"%>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.CustomerInfo"%>
<%@ page import="com.software.onlexam.TestPaper"%>

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
int ID = 0;
String cmpic = "";
if(session.getAttribute("compicon")!=null)
	cmpic = session.getAttribute("compicon").toString();

String action = request.getParameter("action");
int comno = 0;
int testno = 0;
int testscatno = 0;
int batchno = 0;
int timeperquest = 0;

String quiz = "";
String Batchname1 = "";
String comname1 = "";
String testname1 = "";
String testsubcatname1 = "";
String correctans = "";
int noofquest = 0;
String sname = "";
int mk = 0;
int corans = 0;
int wroans = 0;
int marksperq = 0;
int passmarks = 0;
int negscore = 0;
int totmarks = 0;
String slink = "Next";
int curquest = 0;
ArrayList<Batch> clist = null;
ArrayList<String> rlist = new ArrayList<String>();
rlist.clear();
ArrayList<String> anslist = new ArrayList<String>();
anslist.clear();
ArrayList<String> nlevel = new ArrayList<String>();
nlevel.clear();
comno = Integer.parseInt(request.getParameter("comid"));
testno = Integer.parseInt(request.getParameter("stest"));
testscatno = Integer.parseInt(request.getParameter("stestscat"));
batchno = Integer.parseInt(request.getParameter("sbatch"));
ID = Integer.parseInt(request.getParameter("sstud"));
if (action != null && action.equals("StartQuiz")) 
{
	session.setAttribute("QuestNo","1");
}
	
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
		
		//session.setAttribute("Marks","0");
		//session.setAttribute("CorAns","0");
		//session.setAttribute("WroAns","0");		
	
		//session.setAttribute("Start","true");
	//session.setAttribute("End","false");
		
	curquest = Integer.parseInt(session.getAttribute("QuestNo").toString());
	if (!action.equals("StartQuiz")) 
	{
		if(action.equals("StartQuiz2"))
		{
			if(curquest < noofquest)
			{
				curquest++;
			}
		}
		else if(action.equals("StartQuiz1"))
		{
			if(curquest > 1)
			{
				curquest--;
			}
		}
		session.setAttribute("QuestNo",String.valueOf(curquest));
	}
	String examquest = "";
	String examans = "";
	
	
	ArrayList<TestPaper> tp =  dbBean.getTestPaperById(ID);
 	Iterator iterator49 = tp.iterator();
	if(iterator49.hasNext())
	{
		TestPaper tinfo = (TestPaper) iterator49.next();
		CustomerInfo cinfo = dbBean.getCustInfoById(tinfo.getSid());
		sname = cinfo.stuname + " " + cinfo.stlname;
		examquest = tinfo.getExamquest();
		examans = tinfo.getExamans();
		mk = tinfo.getMarks();
		corans = tinfo.getCorans();
		wroans = tinfo.getWronans();
	}
	
	StringTokenizer st = new StringTokenizer(examquest,"-");
	String stoken = "";
	
	if (st.hasMoreTokens())
	{
		while (st.hasMoreTokens())
		{
			stoken = st.nextToken();
			rlist.add(stoken);
		}
	}
	
	StringTokenizer st1 = new StringTokenizer(examans,"-");
	String stoken1 = "";
		
	if (st1.hasMoreTokens())
	{
		while (st1.hasMoreTokens())
		{
			stoken1 = st1.nextToken();
			anslist.add(stoken1);
		}
	}
	
    	//session.setAttribute("QuestList",rlist);
    	//session.setAttribute("AnsList",anslist);

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
document.getElementById("t4").innerHTML="1. THE TIME IN SECONDS FOR EACH QUESTION IS ";
t=setTimeout('time1()',1000); 
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
<body>
<%
int per = 0;
float mks1 = (float)mk;
float maxmks1 = (float)totmarks;
float per12 = (mk / maxmks1) * 100;
per = (int)per12;
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
                
                
				<%
	int idx = curquest - 1;
	ArrayList<Question> qlist = null;
	
	qlist =	dbBean.getQuestionByQno(Integer.parseInt(rlist.get(idx)));
	Iterator iterator55 = qlist.iterator();
    
	String choiceC="";
    String choiceD="";
    String choiceE="";
    String chcA="";
    String chcB="";
    String chcC="";
    String chcD="";
    String chcE="";
    int qno = 0;
    if(iterator55.hasNext())
	{    	
    	Question que = (Question)iterator55.next();
    	correctans = que.getAnswer();
    	qno = que.getQno();
    	
    	String ansstat = "";
    	String sans = anslist.get(idx);
    	String colr = "";
    	String iurl = "";
    	if(correctans.equals(sans))
    	{
    		ansstat = "Correct Answer";
    		colr = "GREEN";
    		iurl = "Images/Correct.png";
    	}
    	else
    	{
    		ansstat = "Wrong Answer";
    		iurl = "Images/Wrong.png";
    		colr = "RED";    		
    	}	
    	if(correctans.contains("A"))
    	{
    		chcA="Correct Answer";
    	}
		if(correctans.contains("B"))
    	{
    		chcB="Correct Answer";
    	}
		if(correctans.contains("C"))
    	{
    		chcC="Correct Answer";
    	}
		if(correctans.contains("D"))
    	{
    		chcD="Correct Answer";
    	}
		if(correctans.contains("E"))
    	{
    		chcE="Correct Answer";
    	}
    	choiceC=que.getCh3();
    	choiceD=que.getCh4();
    	choiceE=que.getCh5();
    	
    	ArrayList<TestPaper> tplist =  dbBean.getTestPaperByQno(qno);
		Iterator iterator43 = tplist.iterator();
		String sans2 = "";
		int ansA = 0;
		int ansB = 0;
		int ansC = 0;
		int ansD = 0;
		int ansE = 0;
		if(iterator43.hasNext())
		{		
			while(iterator43.hasNext())
			{
				TestPaper hinfo = (TestPaper)iterator43.next();
					
				String examquest2 = hinfo.getExamquest();
				StringTokenizer st2 = new StringTokenizer(examquest2,"-");
				String stoken2 = "";
				int idx2 = 0;
				int indx = 0;
				if (st2.hasMoreTokens())
				{
					while (st2.hasMoreTokens())
					{
						stoken2 = st2.nextToken();
						if(stoken2.equals(String.valueOf(qno)))
						{
							indx = idx2;
						}	
						idx2++;
					}
				}
				
				String examans2 = hinfo.getExamans();
				
				StringTokenizer st12 = new StringTokenizer(examans2,"-");
				String stoken12 = "";
				int idx12 = 0;
				
				if (st12.hasMoreTokens())
				{
					while (st12.hasMoreTokens())
					{
						stoken12 = st12.nextToken();
						if(idx12 == indx)
						{
							sans2 = stoken12;									
						}	
						idx12++;
					}
				}
				
				
				if(sans2.contains("A"))
				{
					ansA++;
				}
				if(sans2.contains("B"))
				{
					ansB++;
				}
				if(sans2.contains("C"))
				{
					ansC++;
				}
				if(sans2.contains("D"))
				{
					ansD++;
				}
				if(sans2.contains("E"))
				{
					ansE++;
				}
			}
		}
%>							
        		<div class="notice">
                 	<h2>Results of Quiz</h2>
                    <ol>
                    	<li><% if(negscore > 0) { %>Wrong answers carries negative marks<% } else { %>No negative marks for wrong answers<% } %></li>
                        <li>Name : <%=sname%> >> Score : <%=mk%> / <%=totmarks%> >> Percentage : <%=per%>%</li>
                        <li>Total Questions : <%=noofquest%> >> Correct Answers : <%=corans%> >> Wrong Answers : <%=wroans%></li>
                    </ol>
                 
                 </div><br>
				<br>
				<div class="row questions" data-gutter="15">
        		<h1>Question <%=curquest%></h1>
                       <div class="col-md-12">
                       <a >Company: <%=comname1%></a> > <a >Test :<%=testname1%> </a> > <a >Test Subcategory : <%=testsubcatname1%></a> > <a >Batch : <%=Batchname1%></a>
                       </div>
                       
                       
                       <div class="clearfix"></div>
                       
                       <div class="question-section">
                       		<img src="<%=iurl%>"/><FONT color="<%=colr%>"><%=ansstat%></FONT>
                            <h4><%=que.getQuestion()%></h4>
                            <div class="modal-dialog">
                                  <div class="">
                                
                                      <div class="quiz" id="quiz" data-toggle="">
                                       <% if(sans.contains("A")) { %>
                                       <% if(chcA.equals("Correct Answer")) { %><label style="background:#29a245;" class="element-animation1 btn btn-lg btn-primary btn-block disable"><span class="btn-label"><i class="glyphicon fa fa-check"></i></span><%=ansA%>&nbsp;&nbsp;<%=que.getCh1()%></label><% } else { %><label style="background:#cb4a2c;" class="element-animation4 btn btn-lg btn-primary btn-block disable"><span class="btn-label"><i class="glyphicon fa fa-check"></i></span><%=ansA%>&nbsp;&nbsp;<%=que.getCh1()%></label><% } %>
                                       <% } else { %>
                                       <% if(chcA.equals("Correct Answer")) { %><label style="background:#29a245;" class="element-animation1 btn btn-lg btn-primary btn-block disable"><span class="btn-label"></span><%=ansA%>&nbsp;&nbsp;<%=que.getCh1()%></label><% } else { %><label class="element-animation4 btn btn-lg btn-primary btn-block disable"><span class="btn-label"></span><%=ansA%>&nbsp;&nbsp;<%=que.getCh1()%></label><% } %>
                                       <% } %>
                                       <% if(sans.contains("B")) { %>
                                       <% if(chcB.equals("Correct Answer")) { %><label style="background:#29a245;" class="element-animation1 btn btn-lg btn-primary btn-block disable"><span class="btn-label"><i class="glyphicon fa fa-check"></i></span><%=ansB%>&nbsp;&nbsp;<%=que.getCh2()%></label><% } else { %><label style="background:#cb4a2c;" class="element-animation4 btn btn-lg btn-primary btn-block disable"><span class="btn-label"><i class="glyphicon fa fa-check"></i></span><%=ansB%>&nbsp;&nbsp;<%=que.getCh2()%></label><% } %>
                                       <% } else { %>
                                       <% if(chcB.equals("Correct Answer")) { %><label style="background:#29a245;" class="element-animation1 btn btn-lg btn-primary btn-block disable"><span class="btn-label"></span><%=ansB%>&nbsp;&nbsp;<%=que.getCh2()%></label><% } else { %><label class="element-animation4 btn btn-lg btn-primary btn-block disable"><span class="btn-label"></span><%=ansB%>&nbsp;&nbsp;<%=que.getCh2()%></label><% } %>
                                       <% } %>
                                       <% if(!choiceC.equals("")) { %>
                                       <% if(sans.contains("C")) { %>
                                       <% if(chcC.equals("Correct Answer")) { %><label style="background:#29a245;" class="element-animation1 btn btn-lg btn-primary btn-block disable"><span class="btn-label"><i class="glyphicon fa fa-check"></i></span><%=ansC%>&nbsp;&nbsp;<%=que.getCh3()%></label><% } else { %><label style="background:#cb4a2c;" class="element-animation4 btn btn-lg btn-primary btn-block disable"><span class="btn-label"><i class="glyphicon fa fa-check"></i></span><%=ansC%>&nbsp;&nbsp;<%=que.getCh3()%></label><% } %>
                                       <% } else { %>
                                       <% if(chcC.equals("Correct Answer")) { %><label style="background:#29a245;" class="element-animation1 btn btn-lg btn-primary btn-block disable"><span class="btn-label"></span><%=ansC%>&nbsp;&nbsp;<%=que.getCh3()%></label><% } else { %><label class="element-animation4 btn btn-lg btn-primary btn-block disable"><span class="btn-label"></span><%=ansC%>&nbsp;&nbsp;<%=que.getCh3()%></label><% } %>
                                       <% } %>
                                       <% } %>
                                       <% if(!choiceD.equals("")) { %>
                                       <% if(sans.contains("D")) { %>
                                       <% if(chcD.equals("Correct Answer")) { %><label style="background:#29a245;" class="element-animation1 btn btn-lg btn-primary btn-block disable"><span class="btn-label"><i class="glyphicon fa fa-check"></i></span><%=ansD%>&nbsp;&nbsp;<%=que.getCh4()%></label><% } else { %><label style="background:#cb4a2c;" class="element-animation4 btn btn-lg btn-primary btn-block disable"><span class="btn-label"><i class="glyphicon fa fa-check"></i></span><%=ansD%>&nbsp;&nbsp;<%=que.getCh4()%></label><% } %>
                                       <% } else { %>
                                       <% if(chcD.equals("Correct Answer")) { %><label style="background:#29a245;" class="element-animation1 btn btn-lg btn-primary btn-block disable"><span class="btn-label"></span><%=ansD%>&nbsp;&nbsp;<%=que.getCh4()%></label><% } else { %><label class="element-animation4 btn btn-lg btn-primary btn-block disable"><span class="btn-label"></span><%=ansD%>&nbsp;&nbsp;<%=que.getCh4()%></label><% } %>
                                       <% } %>
                                       <% } %>
                                       <% if(!choiceE.equals("")) { %>
                                       <% if(sans.contains("E")) { %>
                                       <% if(chcE.equals("Correct Answer")) { %><label style="background:#29a245;" class="element-animation1 btn btn-lg btn-primary btn-block disable"><span class="btn-label"><i class="glyphicon fa fa-check"></i></span><%=ansE%>&nbsp;&nbsp;<%=que.getCh5()%></label><% } else { %><label style="background:#cb4a2c;" class="element-animation4 btn btn-lg btn-primary btn-block disable"><span class="btn-label"><i class="glyphicon fa fa-check"></i></span><%=ansE%>&nbsp;&nbsp;<%=que.getCh5()%></label><% } %>
                                       <% } else { %>
                                       <% if(chcE.equals("Correct Answer")) { %><label style="background:#29a245;" class="element-animation1 btn btn-lg btn-primary btn-block disable"><span class="btn-label"></span><%=ansE%>&nbsp;&nbsp;<%=que.getCh5()%></label><% } else { %><label class="element-animation4 btn btn-lg btn-primary btn-block disable"><span class="btn-label"></span><%=ansE%>&nbsp;&nbsp;<%=que.getCh5()%></label><% } %>
                                       <% } %>                                       
                                       <% } %>
                                   </div> </div>
                            </div>
                        </div><!-- ends question box-->
                        <table width="700" align="center"><tr align="center"><td align="center" width="350">
                        <table><tr><td><form method="post" name="f2" onSubmit="return validatecheck1()">
                        <input type="hidden" value="<%=batchno%>" name="sbatch"/>
						<input type="hidden" value="<%=ID%>" name="sstud"/>
						<input type="hidden" value="StartQuiz1" name="action"/>
						<input type="hidden" value="<%=comno%>" name="comid"/>
						<input type="hidden" value="<%=testno%>" name="stest"/>
						<input type="hidden" value="<%=testscatno%>" name="stestscat"/>
						<input type="hidden" value="<%=correctans%>" name="correctans"/>
						<input type="hidden" value="<%=que.getQno()%>" name="ques" id="ques">
						<% if(curquest > 1) { %>
						<input class="btn btn-cst-primary pull-right"  type="submit" value="Prev">
						<% } %>
						</form></td>
						<td align="center" width="350"><form method="post" name="f2" onSubmit="return validatecheck1()">
						<input type="hidden" value="<%=batchno%>" name="sbatch"/>
						<input type="hidden" value="<%=ID%>" name="sstud"/>
						<input type="hidden" value="StartQuiz2" name="action"/>
						<input type="hidden" value="<%=comno%>" name="comid"/>
						<input type="hidden" value="<%=testno%>" name="stest"/>
						<input type="hidden" value="<%=testscatno%>" name="stestscat"/>
						<input type="hidden" value="<%=correctans%>" name="correctans"/>
						<input type="hidden" value="<%=que.getQno()%>" name="ques" id="ques">
						<% if(curquest < noofquest)
						{ %>
						<input class="btn btn-cst-primary pull-right"  type="submit" value="Next">
						<% } %>
						</form></td></tr></table>
						</td></tr></table>
						<% } %>
                       

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
</body>
</html>
<% dbBean.CloseConnection(); %>