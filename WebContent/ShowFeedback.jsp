<%@ page import="java.util.Properties,java.sql.*" %>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="java.util.*,java.io.*,java.util.Random"%>
<%@ page import="com.software.onlexam.FeedBackInfo"%>
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
<script type="text/javascript">
function validatecheck()
{
	var x=document.forms["FeedbackForm"]["From"].value;
	var x2=document.forms["FeedbackForm"]["message"].value;
	
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage16").innerHTML = "Please enter email!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage16").innerHTML = "";
	}
	var atpos=x.indexOf("@");
	var dotpos=x.lastIndexOf(".");
	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
	{
		document.getElementById("userIdMessage16").innerHTML = "Email Id is not valid!";
	   	return false;
	}
	else
	{
		document.getElementById("userIdMessage16").innerHTML = "";
	}
	
	if (x2==null || x2=="")
	{
		document.getElementById("userIdMessage26").innerHTML = "Please enter message!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage26").innerHTML = "";
	}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="mystyle.css" type="text/css" />
<link href='css/css1.css' rel='stylesheet' type='text/css'>
<!-- <link href='https://fonts.googleapis.com/css?family=Lato:400,670' rel='stylesheet' type='text/css'> -->
<!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,670' rel='stylesheet' type='text/css'> -->
<link href='css/css2.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/mystyles.css">

</head>
<body>
<% 
DB dbBean = new DB(); 
%>
<%
int cid = 0;
if(session.getAttribute("SelCompany")!=null)
	cid = Integer.parseInt(session.getAttribute("SelCompany").toString());
String suser = "";
if(session.getAttribute("studentnm")!=null)
	suser = session.getAttribute("studentnm").toString();
String chkval1 = "false";
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString();
String cmpic = "";
if(session.getAttribute("compicon")!=null)
	cmpic = session.getAttribute("compicon").toString();
String chkval = "false";
if(session.getAttribute("loginapp")!=null)
	chkval = session.getAttribute("loginapp").toString();

String slogin = "";
String smenu = "";
if(chkval1.equals("true"))
{ 	
	slogin = "AdminLogin.jsp";
	smenu = "AdminMenu.jsp";
	
} else {
	slogin = "Login.jsp";
	smenu = "LoginMenu.jsp";
}


String compname = "";
boolean eflg = false;
String hdrscroll = "Online Quiz";
ArrayList<Company> llist = dbBean.getCompanyById(cid);
Iterator iterator = llist.iterator();
if (iterator.hasNext()) {
while (iterator.hasNext()) {
	Company linfo = (Company) iterator.next();
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
                       Testimonial
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-12">
                  <% } %>

					
<table align="center" width="630" height="490">
<tr align="center" valign="top"><td align="center">
<% ArrayList<FeedBackInfo> finfo = dbBean.GetAllFeedback(cid);
Iterator iterator52 = finfo.iterator();
if(iterator52.hasNext())
{
	int rCount=0;
%>
<CENTER>
<% if(chkval1.equals("true"))
{ %>
<h3 class="consultant-services">Testimonial</h3><br>
<% } %>
<marquee direction = "up" scrollamount="3" scrollspeed="100">
						<table align="center" height="300"  width="100%" >
							<tr >
							<th width="200" align="left">EmailId</th><th width="200" align="left">Feedback</th><th width="200" align="left">DateSubmitted</th>
							</tr>
<% 
while(iterator52.hasNext())
	{
	FeedBackInfo fb = (FeedBackInfo)iterator52.next();
	
%>
<tr>
				<td width="200" align="left"><%=fb.UserID%></td><td width="200" align="left"><%=fb.Feedback%></td><td width="200" align="left"><%=fb.DateSubmitted%></td>
					</tr>
<% rCount++;
} 
%>
</table>
</marquee>
</CENTER>
<% } else
{
%>
Sorry No records Found
<% } %>
</td></tr></table>							



<% if(chkval1.equals("true"))
{ %> 					
				</div>	
	         </div>
	     </div>
      </div></div>           
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