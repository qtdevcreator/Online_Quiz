<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Question"%>
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.TestSubCat"%>
<%@ page import="com.software.onlexam.Batch"%>
<%@ page import="com.software.onlexam.Company"%>
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
function confirmcheck() { 
    var r=confirm("Are You Sure You Want To delete?"); 
    if(r==false) {
    	return false;
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
String cmpic = "";
if(session.getAttribute("compicon")!=null)
	cmpic = session.getAttribute("compicon").toString();
String action = request.getParameter("action");
String chkval1 = "false";
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString();
int qno = Integer.parseInt(request.getParameter("qno"));
String Batchname1 = "";
String comname1 = "";
String testname1 = "";
String testsubcatname1 = "";
String level = "";
String level1 = "";
if (action != null && action.equals("deleteQuestion")) 
{
	try 
	{		
		//int qno1 = Integer.parseInt(request.getParameter("qno1"));
		
		if(dbBean.DeleteQuest(qno)==false)
			out.println("Error deleting Question");
		//action="DisplayQuestion";
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
ArrayList<Question> qlist = dbBean.getQuestionById(qno); 
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

<%
if (action != null && action.equals("deleteQuestion")) 
{
%>
<table align="center" width="590" height="30">
<TR align="center"><TD  align="center">Question deleted successfully!</TD></TR>
</table>
<% } else {%>
	<%
		Iterator iterator1 = qlist.iterator();
		if (iterator1.hasNext()) {	
			Question linfo = (Question) iterator1.next();
			level = String.valueOf(linfo.getLevel());
			if(level.equals("1"))
			{
				level1 = "Easy";
			}
			else if(level.equals("2"))
			{
				level1 = "Medium";
			}
			else if(level.equals("3"))
			{
				level1 = "Difficult";
			}
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
						
			ArrayList<TestPaper> tplist =  dbBean.getTestPaperByQno(qno);
			Iterator iterator43 = tplist.iterator();
			String sans = "";
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
						
					String examquest = hinfo.getExamquest();
					StringTokenizer st = new StringTokenizer(examquest,"-");
					String stoken = "";
					int idx = 0;
					int indx = 0;
					if (st.hasMoreTokens())
					{
						while (st.hasMoreTokens())
						{
							stoken = st.nextToken();
							if(stoken.equals(String.valueOf(qno)))
							{
								indx = idx;
							}	
							idx++;
						}
					}
					
					String examans = hinfo.getExamans();
					StringTokenizer st1 = new StringTokenizer(examans,"-");
					String stoken1 = "";
					int idx1 = 0;
					
					if (st1.hasMoreTokens())
					{
						while (st1.hasMoreTokens())
						{
							stoken1 = st1.nextToken();
							if(idx1 == indx)
							{
								sans = stoken1;									
							}	
							idx1++;
						}
					}
					
					
					if(sans.contains("A"))
					{
						ansA++;
					}
					if(sans.contains("B"))
					{
						ansB++;
					}
					if(sans.contains("C"))
					{
						ansC++;
					}
					if(sans.contains("D"))
					{
						ansD++;
					}
					if(sans.contains("E"))
					{
						ansE++;
					}
				}
			}
		%>
<div style="height: 720px; width:670px; overflow-y: auto">
<table align="center" height="720">
<tbody>
<tr bgcolor="#fff" align="center" height="50" ><td  align="center" colspan="3"><h3 class="consultant-services">Question Details</h3></TD></TR>
<TR  align="center" height="50">
	<TD width="400" colspan="2" align="center">Question</TD><TD width="600" align="center"><%=linfo.getQuestion()%></TD>
</TR>
<TR  align="center" height="50">
	<% if(ansA > 0) { %><TD width="200" align="center">No of times answered = <%=ansA%></TD><TD width="200" align="center"><% } else { %><TD width="400" colspan="2" align="center"><% } %>Choice A</TD><TD width="600" align="center"><%=linfo.getCh1()%></TD>
</TR>
<TR  align="center" height="50">
	<% if(ansB > 0) { %><TD width="200" align="center">No of times answered = <%=ansB%></TD><TD width="200" align="center"><% } else { %><TD width="400" colspan="2" align="center"><% } %>Choice B</TD><TD width="600" align="center"><%=linfo.getCh2()%></TD>
</TR>
<TR  align="center" height="50">
	<% if(ansC > 0) { %><TD width="200" align="center">No of times answered = <%=ansC%></TD><TD width="200" align="center"><% } else { %><TD width="400" colspan="2" align="center"><% } %>Choice C</TD><TD width="600" align="center"><%=linfo.getCh3()%></TD>
</TR>	
<TR  align="center" height="50">
	<% if(ansD > 0) { %><TD width="200" align="center">No of times answered = <%=ansD%></TD><TD width="200" align="center"><% } else { %><TD width="400" colspan="2" align="center"><% } %>Choice D</TD><TD width="600" align="center"><%=linfo.getCh4()%></TD>
</TR>
<TR  align="center" height="50">
	<% if(ansE > 0) { %><TD width="200" align="center">No of times answered = <%=ansE%></TD><TD width="200" align="center"><% } else { %><TD width="400" colspan="2" align="center"><% } %>Choice E</TD><TD width="600" align="center"><%=linfo.getCh5()%></TD>
</TR>
<TR  align="center" height="50">
	<TD width="400" colspan="2" align="center">Answer</TD><TD width="600" align="center"><%=linfo.getAnswer()%></TD>
</TR>
<TR  align="center" height="50">
	<TD width="400" colspan="2" align="center">Company</TD><TD width="600" align="center"><%=comname1%></TD>
</TR>
<TR  align="center" height="50">
	<TD width="400" colspan="2" align="center">Test</TD><TD width="600" align="center"><%=testname1%></TD>
</TR>
<TR  align="center" height="50">
	<TD width="400" colspan="2" align="center">Test SubCategory</TD><TD width="600" align="center"><%=testsubcatname1%></TD>
</TR>
<TR  align="center" height="50">
	<TD width="400" colspan="2" align="center">Level</TD><TD width="600" align="center"><%=level1%></TD>
</TR>	
<% if(chkval1.equals("true"))
{ %>
<TR  align="center" height="50">
	<TD width="400" colspan="2" align="center">Edit</TD><td align="center"><a href="EditQuest.jsp?action=Edit&qno=<%=linfo.getQno()%>"><img src="img/edit.png"></a></td>
</TR>
<TR  align="center" height="50">
<TD width="400" colspan="2" align="center">Delete</TD>
<FORM name="delform" onSubmit="return confirmcheck()">
<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteQuestion">
<INPUT TYPE="HIDDEN" NAME="qno" VALUE="<%=qno%>">
<TD width="600" align="center"><INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(img/delete.png); width:25px; height:25px;"/></TD>
</FORM>
</TR>
<% } %>
</tbody>
</table>
</div>    
<%
}
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