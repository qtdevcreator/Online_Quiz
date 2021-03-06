<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.software.onlexam.DB"%>
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
function confirmcheck() { 
    var r=confirm("Are You Sure You Want To delete?"); 
    if(r==false) {
    	return false;
    }
}
function checkvalidate33333()
{
	var x=document.forms["quesform"]["testsubcatname"].value;
		
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage33333").innerHTML = "Please enter Test SubCategory!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage33333").innerHTML = "";
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
String cmpic = "";
if(session.getAttribute("compicon")!=null)
	cmpic = session.getAttribute("compicon").toString();
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
int TestSubCatno = Integer.parseInt(request.getParameter("TestSubCatno"));
String TestSubCatname1 = "";
String comname1 = "";
String testname1 = "";

if(action!=null && action.equals("EditTestSubCat"))
{	
	 TestSubCatname1 = request.getParameter("testsubcatname").toString();
	 	 
	try 
	{			
		boolean val=dbBean.updateTestSubCat(TestSubCatname1,TestSubCatno);
		if(val==false)
		{
			out.println("Error updating Test subcategory");
			action="Fail";
		}
		else
			action="Succ";
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
}


ArrayList<TestSubCat> qlist = dbBean.getTestscatById(TestSubCatno); 
Iterator iterator1 = qlist.iterator();
if (iterator1.hasNext()) {	
	TestSubCat linfo = (TestSubCat) iterator1.next();
	TestSubCatname1 = linfo.getTestsubcatname();
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
							<tr align="center" valign="top"><td align="center">	
	<FORM name="quesform" onSubmit="return checkvalidate33333()">
	<INPUT TYPE="HIDDEN" NAME="action" VALUE="EditTestSubCat"/>
	<INPUT TYPE="HIDDEN" NAME="TestSubCatno" VALUE="<%=TestSubCatno%>"/>
	<h3 class="consultant-services">Edit Test Subcategory</h3><br>
	<div class="form-group">
     <label>Company</label>
     <input class="form-control" type="text" NAME="comname" value="<%=comname1%>" readonly>
     <div id=userIdMessage33331></div>
 </div>
	<div class="form-group">
     <label>Test</label>
     <input class="form-control" type="text" NAME="testname" value="<%=testname1%>" readonly>
     <div id=userIdMessage33332></div>
 </div>
 <div class="form-group">
     <label>TestSubCategory</label>
     <input class="form-control" type="text" NAME="testsubcatname" value="<%=TestSubCatname1%>">
     <div id=userIdMessage33333></div>
 </div>
 <input class="btn btn-cst-primary pull-right"  type="submit" value="Update">
	</FORM>
	
<br>
	<%
	if (action != null && action.equals("Succ")) 
	{
%>
<table align="center" width="590" height="30">
<TR align="center"><TD  align="center">Test SubCategory is updated successfully!</TD></TR>
</table>
<% } else if (action != null && action.equals("Fail")) 
   { %>
<table align="center" width="590" height="30">
<TR align="center"><TD  align="center">Updation of TestSubCategory has failed!</TD></TR>
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




