<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.CustomerInfo"%>
<%@ page import="com.software.onlexam.Company"%>
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
String chkval = "false";
if(session.getAttribute("loginapp")!=null)
	chkval = session.getAttribute("loginapp").toString();

String chkval1 = "false";
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString();
String suser = "";
if(session.getAttribute("studentnm")!=null)
	suser = session.getAttribute("studentnm").toString();
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
<div class="global-wrapper clearfix" id="global-wrapper">
        
   <% if((chkval.equals("true")))
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
                <jsp:include page="QuizMenu.jsp" flush="true"/>
    			
                <div class="col-md-9">
                
                <h3 class="custome-page-title">Welcome, <%=suser%></h3>
                
                 
                 	
                  <h3 class="custome-page-title" style="text-align:left; font-size:30px;">
                  <img src="<%=cmpic%>"  style="padding-right:150px;"><%=compname%></h3>
                  
                  
                 
                  
				
				<div class="col-lg-6 col-lg-offset-3">
                <div class="">
                    <header class="page-header text-center" style=" color:#2aa3d5; text-transform:uppercase; font-size:18px;">
                       
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-12">
    
    <% } else { %>  
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
                	<div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-12">
				<% } %>

<% 
	String stname = request.getParameter("stname");
	String stmname = request.getParameter("stmname");
	String stlname = request.getParameter("stlname");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	String password = request.getParameter("password");
	String password1 = request.getParameter("password1");
	String mobile1 = request.getParameter("mobile1");
	String age = request.getParameter("age");
	String staddress = request.getParameter("staddress");
	String eid = request.getParameter("eid");
	String action = request.getParameter("action");
	String stitle = "";
	
	if(action.equals("Register"))
	{			
		
		if (dbBean.StudentReg(stname,stmname,stlname,email,gender,
				  password,password1,mobile1,age,staddress,eid,"Not Submitted",cid))
		{
			stitle = "Student has successfully registered!";
		}
		else
		{
			stitle = "Student registration failed!";
		}
	}
	else
	{
		CustomerInfo cust = new CustomerInfo();
		cust.stuname = stname;
		cust.stmname = stmname;
		cust.stlname = stlname;
		cust.stemail = email;
		cust.stgender = gender;
		cust.stpass = password;
		cust.stcpass = password1;
		cust.stmobile = mobile1;
		cust.stage = age;
		cust.staddress = staddress;
		cust.empid = eid;
		String name = "";
			
		if (dbBean.updateCustInfo(cust,eid,cid))
		{
			stitle = "Student Information has been successfully updated!";
		}
		else
		{
			stitle = "Error updating Student Information!";
		}
	}
		
			
%>
<%=stitle%>
	<% if(chkval.equals("true"))
{ %>
			</div>
                    </div>
                </div>
            </div>
				
				</div>
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
