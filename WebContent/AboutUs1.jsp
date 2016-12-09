<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="java.util.*" %>
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
<link href='css/css1.css' rel='stylesheet' type='text/css'>
<!-- <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'> -->
<!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'> -->
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
String hdrscroll = "Online Quiz";
ArrayList<Company> llist = dbBean.getCompanyById(cid);
Iterator iterator = llist.iterator();
if (iterator.hasNext()) {
while (iterator.hasNext()) {
	Company linfo = (Company) iterator.next();
	compname = linfo.getCompname();
	hdrscroll = compname;
	hdrscroll += " " +  linfo.getCompaddr();
	hdrscroll += " " +  linfo.getContactno();
}
}
String chkval1 = "false";
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString();
/* String slogin = "";
String smenu = "";
if(chkval1.equals("true"))
{ 
	slogin = "AdminLogin.jsp";
	smenu = "AdminMenu.jsp";
	
} else {
	slogin = "Login.jsp";
	smenu = "LoginMenu.jsp";
}*/
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
     
        

       
       
      
    <div class="container" style="margin-bottom:20px; margin-top:40px;">
    
    <div class="col-lg-5 col-lg-offset-3">
          <div class="">
              <header class="page-header">
                 
              </header>
              <div class="box-lg">
                  <div class="row" data-gutter="60">
                   <div class="col-md-12 row">
                   <div style="background:#fff; padding-bottom:15px;">  

						
<table align="center" height="500" width="890" >
<tr align="center" height="500"><td  align="center">
<h3 class="consultant-services">About Us</h3><br>
<table align="center" height="500" width="890" >
<tr align="center" height="140">
	<td>
	<table align="center">
		<tr align="center" height="140">
			<td width="690" align="left">The basic use of this web-site is to conduct tests online.By use of these tests the organizations can assess the potentials skills of their employees, based on which they can offer incentives or promotions to them.Recruitment of right candidates can be done using different sets of tests, which is crucial for the growth and economic development of the organization.<br>
			Tests can be of any sorts like</td>
			<td width="30" align="left">&nbsp;</td>
			<td width="170" align="left"><img src="Images/abtus.jpg" /></td>
		</tr>
	</table>
	</td>
</tr>			
<tr align="center" height="180">
	<td align="center">
		<table align="center" width="450">
			<tr align="center">
				<td align="left" width="30"> 1. </td>
				<td align="left" width="420">Technical test</td>
			</tr>
			<tr align="center">
				<td align="left" width="30"> 2. </td>
				<td align="left" width="420">Aptitude test</td>
			</tr>
			<tr align="center">
				<td align="left" width="30"> 3. </td>
				<td align="left" width="420">Certification test</td>
			</tr>
			<tr align="center">
				<td align="left" width="30"> 4. </td>
				<td align="left" width="420">Entrance test for banks / private / government organizations.</td>
			</tr>
			<tr align="center">
				<td align="left" width="30"> 5. </td>
				<td align="left" width="420">CAT / MBA test</td>
			</tr>	
			<tr align="center">
				<td align="left" width="30"> 6. </td>
				<td align="left" width="420">Maths olympiad tests in schools / colleges</td>
			</tr>	
		</table>	
	</td>
</tr>	
<tr align="center" height="140">
	<td align="center">
	<table align="center">
		<tr align="center" height="140">
			<td width="170" align="left"><img src="Images/aus.jpg" /></td>
			<td width="30" align="left">&nbsp;</td>
			<td width="690" align="left">Schools, colleges and institutions can make use of the web based exams, to sharpen the skills of students, which gives them directions to analyze and select suitable career paths, as per the talent they possess. In short this site offers development of not only the organizations, but also of the country, as a whole.Secondly it reduces the paper work used for tests in IT companies for training and recruitment of their candidates, thus resulting in efficient management with least efforts and reductions in their expenses.</td>	
		</tr>	
	</table>
</td></tr>
	</table>
	</td></tr></table>	
			</div>

	</div>
                      
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
