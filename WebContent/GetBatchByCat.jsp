<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.DB"%>
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
<script type="text/javascript">
function confirmcheck() { 
    var r=confirm("Are You Sure You Want To delete?"); 
    if(r==false) {
    	return false;
    }
}
</script>
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
else
{
	eflg=true;
}
String cmpic = "";
if(session.getAttribute("compicon")!=null)
	cmpic = session.getAttribute("compicon").toString();
String action = "StartQuiz";
String suser = "";
if(session.getAttribute("studentnm")!=null)
	suser = session.getAttribute("studentnm").toString();
//String action = request.getParameter("action");
String chkval1 = "false";
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString();
String slogin = "";
String smenu = "";
String soper = "";
if(chkval1.equals("true"))
{ 
	slogin = "AdminLogin.jsp";
	smenu = "AdminMenu.jsp";
	soper = "Edit";
	
} else {
	slogin = "Login.jsp";
	smenu = "LoginMenu.jsp";
	soper = "Start";
}
if (action != null && action.equals("deleteCompany")) 
{
	try 
	{
		int Companyno = Integer.parseInt(request.getParameter("Companyno"));
		if(dbBean.DeleteCompany(Companyno)==false)
		{
			out.println("Error deleting company");
		}
		action = "Delete";
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
if (action != null && action.equals("deleteTest")) 
{
	try 
	{
		int Testno = Integer.parseInt(request.getParameter("Testno"));
		if(dbBean.DeleteTest(Testno)==false)
			out.println("Error deleting Test");
		action = "Delete";
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
if (action != null && action.equals("deleteTestSubCat")) 
{
	try 
	{
		int TestSubCatno = Integer.parseInt(request.getParameter("TestSubCatno"));
		if(dbBean.DeleteTestSubCat(TestSubCatno)==false)
			out.println("Error deleting TestSubCat");
		action = "Delete";
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
if (action != null && action.equals("deleteBatch")) 
{
	try 
	{
		int Batchno = Integer.parseInt(request.getParameter("Batchno"));
		if(dbBean.DeleteBatch(Batchno)==false)
			out.println("Error deleting Batch");
		action = "Delete";
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
int col = 0;
if(action.equals("StartQuiz")) 
{ 
	col=3;
}
else
{
	if(action.equals("Add")) 
	{
		col=2;
	} 
	else
		col=3;
}
int col1 = 0;
if(action.equals("StartQuiz")) 
{ 
	col1=3;
}
else
{
	col1=4;
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
                       Test List
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-12">
                  <% } %>


<table align="center" width="630" height="490">
<tr align="center" height="490" ><td align="center" width="630">

<% 
	int i = 0;
	int ival = 0;
	int locId = 0;
	int slocId = 0;
	int aId = 0;
	int bId = 0;
	boolean flag = false;
	boolean flag1 = false;
	boolean flag2 = false;
	String lname="";
	String slname="";
	String sgname="";
	%>
<ul id="myLab" class="nav nav-tabs" data-tabs="tabs">
<%
if(eflg==false)
{
	ArrayList<Test> clist1 = dbBean.getTestByComp(cid);
	Iterator iterator1 = clist1.iterator();
		
	if(iterator1.hasNext())
	{
		int m=0;
		while(iterator1.hasNext())
		{
			m++;
			Test sinfo = (Test)iterator1.next();
			slocId = sinfo.getID();
			slname = sinfo.getTestname();
			String s221 = "#h" + m;
			if(m==1) {
%>	
	<li class="active">
<% } else { %>
   <li>
   <% } %>
<a href="<%=s221%>" data-toggle="tab"><%=slname%></a></li>   
<% } } }  %> 
</ul> 						

<div id="myLabContent" class="tab-content">
<%
int mcnt = 0;
if(eflg==false)
{
	ArrayList<Test> clist1 = dbBean.getTestByComp(cid);
	Iterator iterator1 = clist1.iterator();
	
	
	if(iterator1.hasNext())
	{
		while(iterator1.hasNext())
		{
%>
<% 	
			ival=0;
			i=0;
			mcnt++;
			Test sinfo = (Test)iterator1.next();
			slocId = sinfo.getID();
			flag = true; 
			slname = sinfo.getTestname();
			String s221 = "h"+mcnt;
			String m221 = "";
			if(mcnt==1) {
				m221 = "tab-pane fade in active";
			} else {
				m221 = "tab-pane fade";
			}
			
%>
<div class="<%=m221%>" id="<%=s221%>">
<div style="height: 490px; width: 630px; overflow-y: auto">
<table align="center" width="560" height="490">
<tbody>
<% if(chkval1.equals("true"))
{ %>
<tr  align="center" height="20" ><td align="center" colspan="<%=col%>"><h3 class="consultant-services"><%=soper%> Test Listed By Test Categories</h3></td></tr>
<% } %>
<tr align="center">
<% 	
			flag1=true;
			i++;			
%>
<td align="center">
	<div style="height: 260px; width: 260px; overflow-y: auto">
	<table align="center" width="260" height="250">
	<thead>
	<tr  align="center">
			<td align="center">Test</td>
			<% if(action.equals("AddQuest") || action.equals("ListQuest")) 
			{ %>
			<td align="center" colspan="2"><%=slname%></td>
			<% } else { %>
			<td align="center" colspan="2"><%=slname%></td>
			<% } %>
			
			<% if(!action.equals("StartQuiz")) 
			{ %>
			<% if(action.equals("List")) 
			{ %>
			<td align="center"><a href="ListTest.jsp?action=lstTest&comname=<%=cid%>">List</a></td>
			<% } %>
			<% if(action.equals("Edit")) 
			{ %>
			<td align="center"><a href="EditTest.jsp?action=Edit&Testno=<%=slocId%>"><img src="img/edit.png"></a></td>
			<% } %>
			<% if(action.equals("Delete")) 
			{ %>
			<FORM name="delform2" onSubmit="return confirmcheck()">
			<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteTest">
			<INPUT TYPE="HIDDEN" NAME="Testno" VALUE="<%=slocId%>">
			<td align="center"><INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(img/delete.png); width:25px; height:25px;"/></td>
			</FORM>
			<% } %>
			<% if(action.equals("Add")) 
			{ %>
			<td align="center"><a href="AddTest.jsp?action=AddT&compname1=<%=compname%>&comname=<%=cid%>">Add</a></td>
			<% } %>
			<% } %>
		</tr>
<% 	
	ArrayList<TestSubCat> clist2 = dbBean.getTscatByComp(cid,slocId);
	Iterator iterator2 = clist2.iterator();
	
		if(iterator2.hasNext())
		{	
			while(iterator2.hasNext())
			{
			ival=0;
			flag2 = true;
			TestSubCat ainfo = (TestSubCat)iterator2.next();
			sgname = ainfo.getTestsubcatname();
			aId = ainfo.getID();
%>	
<%   if(flag==false)
	{ 
	i++;
%>
		<td align="center">
		<div style="height: 260px; width: 260px; overflow-y: auto">
		<table align="center" width="260" height="250">
		<thead>
		<tr align="center"  height="20">
			<td align="center">Test</td>
			<% if(action.equals("AddQuest") || action.equals("ListQuest")) 
			{ %>
			<td align="center" colspan="2"><%=slname%></td>
			<% } else { %>
			<td align="center" colspan="2"><%=slname%></td>
			<% } %>
			<% if(!action.equals("StartQuiz")) 
			{ %>
			<% if(action.equals("List")) 
			{ %>
			<td align="center"><a href="ListTest.jsp?action=lstTest&comname=<%=cid%>">List</a></td>
			<% } %>
			<% if(action.equals("Edit")) 
			{ %>
			<td align="center"><a href="EditTest.jsp?action=Edit&Testno=<%=slocId%>"><img src="img/edit.png"></a></td>
			<% } %>
			<% if(action.equals("Delete")) 
			{ %>
			<FORM name="delform4" onSubmit="return confirmcheck()">
			<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteTest">
			<INPUT TYPE="HIDDEN" NAME="Testno" VALUE="<%=slocId%>">
			<td align="center"><INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(img/delete.png); width:25px; height:25px;"/></td>
			</FORM>
			<% } %>
			<% if(action.equals("Add")) 
			{ %>
			<td align="center"><a href="AddTest.jsp?action=AddT&compname1=<%=compname%>&comname=<%=cid%>">Add</a></td>
			<% } %>
			
			<% } %>
		</tr>
	<% } %>		
		<tr align="center"  height="20">
			<td align="center">TestSubCategory</td>
			<td align="center" colspan="2"><%=ainfo.getTestsubcatname()%></td>
				
			<% if(!action.equals("StartQuiz")) 
			{ %>
			<% if(action.equals("List")) 
			{ %>
			<td align="center"><a href="ListTestscat.jsp?action=lstTestscat&comname=<%=cid%>&stest=<%=slocId%>">List</a></td>
			<% } %>
			<% if(action.equals("Edit")) 
			{ %>
			<td align="center"><a href="EditTestscat.jsp?action=Edit&TestSubCatno=<%=aId%>"><img src="img/edit.png"></a></td>
			<% } %>
			<% if(action.equals("Delete")) 
			{ %>
			<FORM name="delform5" onSubmit="return confirmcheck()">
			<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteTestSubCat">
			<INPUT TYPE="HIDDEN" NAME="TestSubCatno" VALUE="<%=aId%>">
			<td align="center"><INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(img/delete.png); width:25px; height:25px;"/></td>
			</FORM>
			<% } %>
			<% if(action.equals("Add")) 
			{ %>
			<td align="center"><a href="AddTestSubCat.jsp?action=AddT&compname1=<%=compname%>&comname=<%=cid%>&test1=<%=slname%>&testid=<%=slocId%>">Add</a></td>
			<% } %>
			<% if(action.equals("AddQuest")) 
			{ %>
			<td align="center"><a href="AddQuestion.jsp?action=AddT&compname1=<%=compname%>&comname=<%=cid%>&test1=<%=slname%>&testid=<%=slocId%>&testscat1=<%=sgname%>&testscatid=<%=aId%>">Add Question</a></td>
			<% } %>
			<% if(action.equals("ListQuest")) 
			{ %>
			<td align="center"><a href="ListQuestion.jsp?action=listquestion1&compname1=<%=compname%>&comid=<%=cid%>&test1=<%=slname%>&stest=<%=slocId%>&testscat1=<%=sgname%>&stestscat=<%=aId%>">List Question</a></td>
			<% } %>
			<% } %>
		</tr>
		<tr align="center"  height="20">
		<% if(action.equals("Add")) 
			{ %>
			<td align="center">Batch</td>
			<td align="center" colspan="2"><a href="AddBatch.jsp?action=AddT&compname1=<%=compname%>&comname=<%=cid%>&test1=<%=slname%>&testid=<%=slocId%>&testscat1=<%=sgname%>&testscatid=<%=aId%>">Add</a></td>
			<% } else if(action.equals("List")) 
			{ %>
			<td align="center">Batch</td>
			<td align="center" colspan="2"><a href="ListBatch.jsp?action=lstBatch&comname=<%=cid%>&stest=<%=slocId%>&stestscat=<%=aId%>">List</a></td>
			<% } else { %>
			<td align="center" colspan="<%=col%>">Batch</td>						
			<% } %>
		</tr>	
		</thead>	
	<tbody>
<%
	int j=0;
	ArrayList<Batch> clist3 = dbBean.getBatchByComp(cid,slocId,aId) ;
	Iterator iterator3 = clist3.iterator();
	
	if(iterator3.hasNext())
	{		
		while(iterator3.hasNext())
		{
			ival=0;
			Batch hinfo = (Batch)iterator3.next();
			bId = hinfo.getID();
			j++;
			if(j%2==1)
			{
			%>
			<tr   height="20" align="center">
			<% 
			}
			else
			{
			%>
			<tr   height="20" align="center">
			<% 
			}
			%>
			<% if(action.equals("StartQuiz")) 
			{ if(chkval1.equals("true"))
			{
			%>
			<td align="center"><%=hinfo.getBatchname()%></td>
			<td align="center"><a href="EditBatch.jsp?action=Edit&Batchno=<%=hinfo.getID()%>"><img src="img/edit.png"></a></td>
			<FORM name="delform6" method="post" action="GetBatchByCat2.jsp" onSubmit="return confirmcheck()">
			<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteBatch1">
			<INPUT TYPE="HIDDEN" NAME="Batchno" VALUE="<%=bId%>">
			<td align="center"><INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(img/delete.png); width:25px; height:25px;"/></td>
			</FORM>
			<% } else { %>
			<td align="center" colspan="<%=col%>"><a href="StartQuiz.jsp?action=StartQuiz&comid=<%=cid%>&stest=<%=slocId%>&stestscat=<%=aId%>&sbatch=<%=hinfo.getID()%>"><%=hinfo.getBatchname()%></a></td>			
			<% } } else { %>
			<% if(action.equals("Add")) 
			{ %>
				<td align="center" colspan="3"><%=hinfo.getBatchname()%></td>
			<% }  %>
			<% if(action.equals("List")) 
			{ %>
			<td align="center"><%=hinfo.getBatchname()%></td>
			<td align="center" colspan="2"><a href="BatchDetails.jsp?Batchno=<%=bId%>">List</a></td>
			<% } %>
			<% if(action.equals("Edit")) 
			{ %>
			<td align="center"><%=hinfo.getBatchname()%></td>
			<td align="center" colspan="2"><a href="EditBatch.jsp?action=Edit&Batchno=<%=bId%>"><img src="img/edit.png"></a></td>
			<% } %>
			<% if(action.equals("Delete")) 
			{ %>
			<FORM name="delform6" onSubmit="return confirmcheck()">
			<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteBatch">
			<INPUT TYPE="HIDDEN" NAME="Batchno" VALUE="<%=bId%>">
			<td align="center"><%=hinfo.getBatchname()%></td>
			<td align="center" colspan="2"><INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(img/delete.png); width:25px; height:25px;"/></td>
			</FORM>
			<% } %>			
			<% if(action.equals("ListScore")) 
			{ %>
			<td align="center"><%=hinfo.getBatchname()%></td>
			<td align="center" colspan="2"><a href="ListScore.jsp?action=SelTest&sbatch=<%=bId%>&comname=<%=cid%>&stest=<%=slocId%>&stestscat=<%=aId%>&steststat=1">ListScore</a></td>
			<% } %>
			<% if(action.equals("AddQuest") || action.equals("ListQuest")) 
			{ %>
				<td align="center" colspan="3"><%=hinfo.getBatchname()%></td>
			<% } %>
				
			<% } %>
		</tr>
<%			
		} //while hotel		
	} //if hotel
	else {
%>
<tr   height="20" align="center"><td align="center" colspan="<%=col1%>">No Batches</td></tr>
<% } 
%>
</tbody>
</table>    
</div>
</td>
<% 
	if(i%2 == 0)
	{
%>
	</tr><tr align="center">
<%	
	}
		flag=false;
			} //while area
			flag2=false;
		} //if area
		else { 
%>
</thead><tbody><tr align="center"  height="20">
			<td align="center" colspan="<%=col%>">No TestSubCategory</td>
			<% if(action.equals("Add")) 
			{ %>
			<td align="center"><a href="AddTestSubCat.jsp?action=AddT&compname1=<%=compname%>&comname=<%=cid%>&test1=<%=slname%>&testid=<%=slocId%>">Add</a></td>
			<% } %></tr>
			</tbody></table></div></td>
			<% 
	if(i%2 == 0)
	{
%>
	</tr><tr align="center">
<%	
	}
%>
<%			
		}
		%>
</tbody>
</table>    
</div>
</div>
<%
	flag1=false;
	} //while subloc
	flag=false;	
	%>
<%
} else {	
%>
	<table height="30">
		<tr height="30"  align="center"><td align="center" colspan="2">No Test</td></tr>
	</table>
<%	
	}
	flag1=false;	

	} else { 	
		flag1=false;
%>
<br>No company selected!		
<%
	}
%>
</div>
</td></tr>
</table>    

<% if(chkval1.equals("true"))
{ %> 
		</div></div>			
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
