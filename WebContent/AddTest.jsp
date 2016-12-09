<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Test"%>
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
function checkvalidate4444()
{
	var x1=document.forms["testform"]["testname"].value;
		
	if (x1==null || x1=="")
	{
		document.getElementById("userIdMessage442").innerHTML = "Please enter Test!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage442").innerHTML = "";
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
String compname1 = "";
String action1 = "";
ArrayList<Test> clist = null;
if (action != null && action.equals("AddT")) 
{
	compname1 = request.getParameter("compname1").toString();
	comid = cid;
}
if (action != null && action.equals("addTest")) 
{
	comid = cid;
	String testname = request.getParameter("testname").toString();
	try 
	{		
		//dbBean.initDB();
		boolean val = dbBean.AddTest(testname,comid);
		if(val==false)
		{
			
			action="Fail";
		}
		else
			action="Succ";
		action1 = "addTest";	
		//dbBean.CloseConnection();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
if (action != null && action.equals("addTest1")) 
{
	//comid = Integer.parseInt(request.getParameter("cid1").toString());
	comid = cid;
	String testname = request.getParameter("testname").toString();
	compname1 = request.getParameter("compname1").toString();
	try 
	{		
		//dbBean.initDB();
		boolean val = dbBean.AddTest(testname,comid);
		if(val==false)
		{
			out.println("Error adding Test");
			action="Fail";
		}
		else
			action="Succ";
		action1 = "addTest1";
		//dbBean.CloseConnection();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
ArrayList<Company> cm =  dbBean.getCompanyById(cid);
Iterator iterator2 = cm.iterator();
if(iterator2.hasNext())
{
Company cinfo = (Company) iterator2.next();
compname1 = cinfo.getCompname();
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
<tr align="center">
<td  align="center">
<FORM name="testform" onSubmit="return checkvalidate4444()">
<% if (action.equals("AddT") || action1.equals("addTest1")) 
{ %>
<input type="hidden" name="action" value="addTest1"/>
<input type="hidden" name="cid1" value="<%=comid%>"/>
<input type="hidden" name="compname1" value="<%=compname1%>"/>
<% } else if (action.equals("Add") || action1.equals("addTest")) { %>
<input type="hidden" name="action" value="addTest"/>
<% } %>
<h3 class="consultant-services">Add Test</h3><br>
<div class="form-group">
     <label>Test</label>
     <input class="form-control" type="text" NAME="testname">
     <div id=userIdMessage442></div>
 </div>
 <input class="btn btn-cst-primary pull-right"  type="submit" value="Add">
</FORM>
<br>
	<%
	if (action != null && action.equals("Succ")) 
	{
%>
<table align="center" width="490" height="30">
<TR align="center"><TD  align="center">Test is added successfully!</TD></TR>
</table>
<% } else if (action != null && action.equals("Fail")) 
   { %>
<table align="center" width="490" height="30">
<TR align="center"><TD  align="center">Adding of Test has failed!</TD></TR>
</table>	
<% }%>
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