<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.DB"%>
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
String chkval1 = "false";
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString();
String suser = "";
if(session.getAttribute("studentnm")!=null)
	suser = session.getAttribute("studentnm").toString();
String chkval = "false";
if(session.getAttribute("loginapp")!=null)
	chkval = session.getAttribute("loginapp").toString();

int ht = 0;
int isr = 0;
int lid = 0;
int comid = 0;
int comid11 = 0;
int cspn = 0;
int wid = 0;
int wid1 = 0;
String compname1 = "";
String action1 = "";
String keyword = "";
String keyword11 = "";
ArrayList<Test> clist = null;

String slogin = "";
String smenu = "";
if(chkval1.equals("true"))
{ 	
	slogin = "AdminLogin.jsp";
	smenu = "AdminMenu.jsp";
	
} else if(chkval.equals("true")) {
	slogin = "Login.jsp";
	smenu = "LoginMenu.jsp";
}

if (action.equals("addTest")) 
{
	comid = cid;
	clist = dbBean.getTestByComp(comid);
	comid11 = comid;
	cspn = 3;
	wid = 630;
	wid1 = 310;
	ht = 670;
	action1 = "addTest1";
	isr = 0;
}
if (action.equals("lstTest")) 
{
	comid = cid;
	clist = dbBean.getTestByComp(comid);
	comid11 = comid;
	action1 = "addTest1";
	cspn = 3;
	wid = 630;
	wid1 = 310;
	ht = 670;
	isr = 0;
}

if (action.equals("Search")) 
{
	keyword = request.getParameter("keyword");
	clist = dbBean.getTestByKeyword(keyword, cid);
	keyword11 = keyword;
	cspn = 3;
	wid = 630;
	wid1 = 310;
	ht = 680;
	isr = 1;
}
if (action.equals("ByOrder")) 
{
	keyword = request.getParameter("keyword");
	clist = dbBean.getTestWithAlph(keyword,cid);
	keyword11 = keyword;
	cspn = 3;
	wid = 630;
	wid1 = 310;
	ht = 680;
	isr = 2;
}
if (action != null && action.equals("deleteTest")) 
{
	comid11 = cid;
	keyword11 = request.getParameter("keyword11").toString();
	String action11 = request.getParameter("action11").toString();
	String action12 = action;
	try 
	{
		String[] recdel = request.getParameterValues("chkdel");
		int ilen = recdel.length;
		for(int d=0;d<ilen;d++)
		{	
			int Testno = Integer.parseInt(recdel[d]);
			if(dbBean.DeleteTest(Testno)==false)
				out.println("Error deleting Test");
		}
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	action = action11;
	action11 = action12;
	if(action.equals("addTest"))
	{
		comid = cid;
		clist = dbBean.getTestByComp(comid);
		action1 = "addTest1";
		cspn = 3;
		wid = 630;
		wid1 = 310;
		ht = 670;
		isr = 0;
	}
	else if(action.equals("lstTest"))
	{
		comid = cid;
		clist = dbBean.getTestByComp(comid);
		action1 = "addTest1";
		cspn = 3;
		wid = 630;
		wid1 = 310;
		ht = 670;
		isr = 0;
	}
	else if(action.equals("Search"))
	{		
		keyword = keyword11;
		cspn = 3;
		wid = 630;
		wid1 = 310;
		ht = 680;
		clist = dbBean.getTestByKeyword(keyword,cid);
		isr = 1;
	}
	else if(action.equals("ByOrder"))
	{		
		keyword = keyword11;
		clist = dbBean.getTestWithAlph(keyword,cid);
		cspn = 3;
		wid = 630;
		wid1 = 310;
		ht = 680;
		isr = 2;
	}
}
//if (action1.equals("addTest1")) 
//{
	ArrayList<Company> cm7 =  dbBean.getCompanyById(cid);
		Iterator iterator27 = cm7.iterator();
	if(iterator27.hasNext())
	{
		Company cinfo = (Company) iterator27.next();
		compname1 = cinfo.getCompname();
	}
	
//}
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
                       List Test
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-12">
                  <% } %>

<table align="center" width="630" >
<tr align="center"><td  align="center">
<%
if (action.equals("addTest") || action.equals("lstTest") || action.equals("Search") || action.equals("ByOrder")) 
{
	Iterator iterator1 = clist.iterator();
	if(iterator1.hasNext())
	{
%>
<% if (action.equals("addTest") || isr == 0  || isr == 1  || isr == 2) 
{ 
%>

<% } %>
<FORM name="delform" onSubmit="return confirmcheck()">
<INPUT TYPE="HIDDEN" NAME="action11" VALUE="<%=action%>">
<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteTest">
<input type="hidden" name="keyword11" value="<%=keyword11%>"/>
<INPUT TYPE="HIDDEN" NAME="hdflg" VALUE="1">
<div style="height: 490px; width:630px; overflow-y: auto">
<table align="center" width="630" height="490">
<thead>
<% if(chkval1.equals("true"))
{ %>
<tr  align="center">
<td align="center" colspan="<%=cspn%>">
<h211><INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(img/delete.png); width:25px; height:25px;"/></td></tr>
<% } %>
<% if(chkval1.equals("true"))
{ %>
<% if(isr==0) { %>
<tr bgcolor="#fff" align="center" height="30"><td  align="center" colspan="<%=cspn%>"><h3 class="consultant-services">Test Category List</h3></TD></TR>
<% } else if(isr==1) { %>
<tr bgcolor="#fff" align="center" height="30"><td  align="center" colspan="<%=cspn%>"><h3 class="consultant-services">Test Category List by keyword <%=keyword%></h3></TD></TR>
<% } else if(isr==2) { %>
<tr bgcolor="#fff" align="center" height="30"><td  align="center" colspan="<%=cspn%>"><h3 class="consultant-services">Test Category List with first character as <%=keyword%></h3></TD></TR>
<% } %>
<% } %>
<TR  align="center" height="30">
<% if(chkval1.equals("true"))
{ %>
<TD width="<%=wid1%>" align="center" ><input type="checkbox" id="chkdell" onClick="setchkval()" /></TD>
<% } %>
<TD width=""<%=wid1%>"" align="center" >Test Category</TD>
<% if(chkval1.equals("true"))
{ %>
<TD width="<%=wid1%>" align="center" >Edit</TD>
<% } %>
</TR>
</thead>
<tbody>
<%
int i=1;
while (iterator1.hasNext()) {
	Test linfo = (Test) iterator1.next();
if(i%2==0)
{
%>
<TR   height="30" align="center">
<% 
}
else
{
%>
<TR   height="30" align="center">
<% 
}
 	String ID1 = String.valueOf(linfo.getID());
 	String comp = "";
 	ArrayList<Company> cm =  dbBean.getCompanyById(linfo.getCompid());
 	Iterator iterator2 = cm.iterator();
	if(iterator2.hasNext())
	{
		Company cinfo = (Company) iterator2.next();
		comp = cinfo.getCompname();
	}
%>
<% if(chkval1.equals("true"))
{ %>
<TD width="<%=wid1%>" align="center"><input type="checkbox" name="chkdel" onClick="getchkval()" value="<%=ID1%>"></TD>
<% } %>
<% if(chkval.equals("true"))
{ %>
<TD width="<%=wid1%>" align="center"><a href="GetTestDetails.jsp?action=StartQuiz&ID=<%=linfo.getID()%>"><%=linfo.getTestname()%></a></TD>
<% } else { %>
<TD width="<%=wid1%>" align="center"><a href="GetTestDetails.jsp?action=ByOrder&ID=<%=linfo.getID()%>"><%=linfo.getTestname()%></a></TD>
<% } if(chkval1.equals("true"))
{ %>
<TD width="<%=wid1%>" align="center"><a href="EditTest.jsp?action=Edit&Testno=<%=ID1%>"><img src="img/edit.png"></a></TD>
<% } %>
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
<TR align="center"><TD  align="center">There are no Test!</TD></TR>
</table>
<%
}
}
%>
</td></tr></table>
				
			<% if(chkval1.equals("true"))
{ %> 					
		</div>		</div>	
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