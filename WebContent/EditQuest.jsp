<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Question"%>
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.TestSubCat"%>
<%@ page import="com.software.onlexam.Batch"%>
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
function confirmcheck() { 
    var r=confirm("Are You Sure You Want To delete?"); 
    if(r==false) {
    	return false;
    }
}
function checkvalidate999()
{
	var x=document.forms["quesform"]["ques"].value;
	var x1=document.forms["quesform"]["chA"].value;
	var x2=document.forms["quesform"]["chB"].value;
	//var x3=document.forms["quesform"]["chC"].value;
	//var x4=document.forms["quesform"]["chD"].value;
	var x5=document.forms["quesform"]["ans"].value;
	var x6=document.forms["quesform"]["slevel"].value;
		
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage91").innerHTML = "Please enter question!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage91").innerHTML = "";
	}
	if (x1==null || x1=="")
	{
		document.getElementById("userIdMessage92").innerHTML = "Please enter choice A!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage92").innerHTML = "";
	}
	if (x2==null || x2=="")
	{
		document.getElementById("userIdMessage93").innerHTML = "Please enter choice B!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage93").innerHTML = "";
	}
	/*if (x3==null || x3=="")
	{
		document.getElementById("userIdMessage94").innerHTML = "Please enter choice C!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage94").innerHTML = "";
	}
	if (x4==null || x4=="")
	{
		document.getElementById("userIdMessage95").innerHTML = "Please enter choice D!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage95").innerHTML = "";
	} */
	if (x5==null || x5=="")
	{
		document.getElementById("userIdMessage96").innerHTML = "Please select answer!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage96").innerHTML = "";
	}	
	if (x6==0)
	{
		document.getElementById("userIdMessage101").innerHTML = "Please select level!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage101").innerHTML = "";
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
String action = request.getParameter("action");
int qno = Integer.parseInt(request.getParameter("qno"));
String quest1 = "";
String ch1 = "";
String ch2 = "";
String ch3 = "";
String ch4 = "";
String ch5 = "";
String ans1 = "";
int lvl1 = 0;
String sact = "";
String Batchname1 = "";
String comname1 = "";
String testname1 = "";
String testsubcatname1 = "";
String level = "";

if(action!=null && action.equals("EditQuestion"))
{	
	quest1 = request.getParameter("ques").toString();
	ch1 = request.getParameter("chA").toString();
	ch2 = request.getParameter("chB").toString();
	ch3 = request.getParameter("chC").toString();
	ch4 = request.getParameter("chD").toString();
	ch5 = request.getParameter("chE").toString();
	String[] ans12 = request.getParameterValues("ans");
	int ilen = ans12.length;
	ans1="";
	for(int d=0;d<ilen;d++)
	{
		ans1 += ans12[d];		
	}
	lvl1 = Integer.parseInt(request.getParameter("slevel").toString());
	level = String.valueOf(lvl1);
	try 
	{			
		boolean val=dbBean.UpdateQuestion(quest1,ch1,ch2,ch3,ch4,ch5,ans1,lvl1,qno);
		if(val==false)
		{
			out.println("Error updating Question");
			action="Fail";
		}
		else
			action="Succ";
		sact = "updated";
		
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
}


ArrayList<Question> qlist = dbBean.getQuestionById(qno); 
Iterator iterator1 = qlist.iterator();
if (iterator1.hasNext()) {	
	Question linfo = (Question) iterator1.next();
	quest1 = linfo.getQuestion();
	ch1 = linfo.getCh1();
	ch2 = linfo.getCh2();
	ch3 = linfo.getCh3();
	ch4 = linfo.getCh4();
	ch5 = linfo.getCh5();
	ans1 = linfo.getAnswer();
	level = String.valueOf(linfo.getLevel());
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
	/*ArrayList<Batch> hm =  dbBean.getBatchById(linfo.getBatchid());
 	Iterator iterator5 = hm.iterator();
	if(iterator5.hasNext())
	{
		Batch hinfo = (Batch) iterator5.next();
		Batchname1 = hinfo.getBatchname();
	}*/
}
if (action != null && action.equals("deleteQuestion")) 
{
	try 
	{		
		int qno1 = Integer.parseInt(request.getParameter("qno1"));
		
		if(dbBean.DeleteQuest(qno1)==false)
		{
			out.println("Error deleting Question");
			action="Fail";
		}
		else
			action="Succ";
		sact = "deleted";
		
		
	}
	catch (Exception e) {
		e.printStackTrace();
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


							
<table align="center" width="670" height="610">
							<tr align="center" height="610"><td align="center">	
<%
	if(action!=null && action.equals("Edit") || action.equals("Succ") || action.equals("Fail"))
	{				
%>
	<h3 class="consultant-services">Edit Question</h3>
	<FORM name="quesform" onSubmit="return checkvalidate999()">
	<INPUT TYPE="HIDDEN" NAME="action" VALUE="EditQuestion"/>
	<INPUT TYPE="HIDDEN" NAME="qno" VALUE="<%=qno%>"/>
	<div style="height: 610px; width: 670px; overflow-y: auto">
	<table align="center" width="670" height="610">
	<tbody>	
	<tr><td  align="center" >Question</td>
	<td  align="left" ><textarea NAME="ques" rows="2" cols="41"><%=quest1%></textarea></td>
	<TD width="150" align="left"><div id="userIdMessage91"></div></td></tr>
	<tr><td  align="center" >Choice A</td>
	<td  align="left" ><textarea NAME="chA" rows="2" cols="41"><%=ch1%></textarea></td>
	<TD width="150" align="left"><div id="userIdMessage92"></div></td></tr>
	<tr><td  align="center" >Choice B</td>
	<td  align="left" ><textarea NAME="chB" rows="2" cols="41"><%=ch2%></textarea></td>
	<TD width="150" align="left"><div id="userIdMessage93"></div></td></tr>
	<tr><td  align="center" >Choice C</td>
	<td  align="left" ><textarea NAME="chC" rows="2" cols="41"><%=ch3%></textarea></td>
	<TD width="150" align="left"><div id="userIdMessage94"></div></td></tr>
	<tr><td  align="center" >Choice D</td>
	<td  align="left" ><textarea NAME="chD" rows="2" cols="41"><%=ch4%></textarea></td>
	<TD width="150" align="left"><div id="userIdMessage95"></div></td></tr>
	<tr><td  align="center" >Choice E</td>
	<td  align="left" ><textarea NAME="chE" rows="2" cols="41"><%=ch5%></textarea></td>
	<TD width="150" align="left"><div id="userIdMessage195"></div></td></tr>
	<tr><td  align="center" >Answer</td>
	<td  align="left" ><select name="ans" size="3" multiple="multiple">
						<% if(ans1.contains("A")) {  %>
						<option value="A" Selected>Choice A</option>
						<% } else { %>
						<option value="A">Choice A</option>
						<% } %>
						<% if(ans1.contains("B")) {   %>
						<option value="B" Selected>Choice B</option>
						<% } else { %>
						<option value="B">Choice B</option>
						<% } %>
						<% if(ans1.contains("C")) {   %>
						<option value="C" Selected>Choice C</option>
						<% } else { %>
						<option value="C">Choice C</option>
						<% } %>
						<% if(ans1.contains("D")) {   %>
						<option value="D" Selected>Choice D</option>
						<% } else { %>
						<option value="D">Choice D</option>
						<% } %>
						<% if(ans1.contains("E")) {   %>
						<option value="E" Selected>Choice E</option>
						<% } else { %>
						<option value="E">Choice E</option>
						<% } %>						
						</select></td>
	<TD width="150" align="left"><div id="userIdMessage96"></div></td></tr>
	
	<tr><td  align="center" >Company</td>
	<td  align="left"><INPUT TYPE="TEXT" NAME="comname" value="<%=comname1%>" readonly style="width:350px;"/></td>
	<TD width="150" align="left"><div id="userIdMessage97"></div></td></tr>
	<tr><td  align="center" >Test</td>
	<td  align="left"><INPUT TYPE="TEXT" NAME="testname" value="<%=testname1%>" readonly style="width:350px;"/></td>
	<TD width="150" align="left"><div id="userIdMessage98"></div></td></tr>
	<tr><td  align="center" >TestSubCategory</td>
	<td  align="left"><INPUT TYPE="TEXT" NAME="testsubcatname" value="<%=testsubcatname1%>" readonly style="width:350px;"/></td>
	<TD width="150" align="left"><div id="userIdMessage99"></div></td></tr>
	<tr><td  align="center" >Level</td>
	<td  align="left"><select name="slevel">
					<option value="0">Select</option>
					<% if(level.equals("1")) {  %>
					<option value="1" Selected>Easy</option>
					<% } else  { %>
					<option value="1">Easy</option>
					<% } %>
					<% if(level.equals("2")) {  %>
					<option value="2" Selected>Medium</option>	
					<% } else  { %>				
					<option value="2">Medium</option>
					<% } %>
					<% if(level.equals("3")) {  %>
					<option value="3" Selected>Difficult</option>
					<% } else  { %>			
					<option value="3">Difficult</option>
					<% } %>
					</select></td>
	<TD width="150" align="left"><div id="userIdMessage101"></div></td></tr>
	<tr><td align="center"></td><td  align="left" colspan="2"><input class="btn btn-cst-primary pull-right"  type="submit" value="Update"></td></tr>
	<tr align="center" height="20"><td  align="center" colspan="3"><% if (action != null && action.equals("Succ")) { %>Question is updated successfully!<% } else if (action != null && action.equals("Fail")) { %>Updation of Question has failed!<% } %></td></tr>
	</tbody>
	</table>
	</div>
	</FORM>
	<% } %>
</td></tr></table>
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




