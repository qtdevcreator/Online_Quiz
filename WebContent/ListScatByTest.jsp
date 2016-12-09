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
String chkval1 = "false";
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString();
String suser = "";
if(session.getAttribute("studentnm")!=null)
	suser = session.getAttribute("studentnm").toString();
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

String compname1 = "";
ArrayList<Company> cm =  dbBean.getCompanyById(cid);
Iterator iterator27 = cm.iterator();
if(iterator27.hasNext())
{
Company cinfo = (Company) iterator27.next();
compname1 = cinfo.getCompname();
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
                       List Sub Category By Test
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-12">
                  <% } %>
                <% 
				int i = 0;
				int ival = 0;
				int locId = 0;
				int slocId = 0;
				int aId = 0;
				boolean flag = false;
				boolean flag1 = false;
				boolean flag2 = false;
				String lname="";
				String slname="";
				
				%>
                  
                           <div style="height: 480px; width: 630px; overflow-y: auto">
<table align="center" width="630" height="480">
<tbody>
<tr align="center" valign="top">
<% 
if(eflg==false)
{
	ArrayList<Test> clist1 = dbBean.getTestByComp(cid);
	Iterator iterator1 = clist1.iterator();
	
	
	if(iterator1.hasNext())
	{
		while(iterator1.hasNext())
		{
%>			
<td align="center">
	  	
	<table align="center" width="260" height="250">
	<thead>
	<% 	
			ival=0;
			Test sinfo = (Test)iterator1.next();
			slocId = sinfo.getID();
			//flag = true; 
			slname = sinfo.getTestname();
			i++;
		
%>	
		<tr bgcolor="#fff" align="center"  height="20">
			<% if(chkval1.equals("true"))
			{ %>
			<td align="center" colspan="3"><h3 class="consultant-services"><%=slname%></h3></td>
			<% } else { %>
			<td align="center" colspan="3"><%=slname%></td>
			<% } %>
		</tr>
		</thead>
		<tbody>
<% 	
	int j=0;
	ArrayList<TestSubCat> clist2 = dbBean.getTscatByComp(cid,slocId);
	Iterator iterator2 = clist2.iterator();
	
		if(iterator2.hasNext())
		{	
			while(iterator2.hasNext())
			{
			ival=0;
			flag2 = true;
			TestSubCat ainfo = (TestSubCat)iterator2.next();
			aId = ainfo.getID();
			j++;
			%>
			<tr   height="20" align="center">
			<% 
			if(chkval.equals("true"))
			{
			%>
			<td align="center" colspan="3"><a href="GetTestScatDetails.jsp?action=StartQuiz&ID=<%=ainfo.getID()%>"><%=ainfo.getTestsubcatname()%></a></td>		
			<% } else { %>
			<td align="center"><%=ainfo.getTestsubcatname()%></td>
			<td align="center"><a href="EditTestscat.jsp?action=Edit&TestSubCatno=<%=aId%>"><img src="img/edit.png"></a></td>
			<FORM name="delform5" method="post" action="GetBatchByCat2.jsp" onSubmit="return confirmcheck()">
			<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteTestSubCat1">
			<INPUT TYPE="HIDDEN" NAME="TestSubCatno" VALUE="<%=aId%>">
			<td align="center"><INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(img/delete.png); width:25px; height:25px;"/></td>
			</FORM>
			<% } %>
		</tr>
<%			
		} //while hotel		
	} //if hotel
	else {
%>
<tr   height="20" align="center"><td align="center" colspan="3">No Test Sub-category</td></tr>
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

	} //while test
	} else {	
%>
	<td align="center">
	<tr align="center"  height="20">
	<td align="center" colspan="3">No Test</td>
	</tr></td>
<%
 	if(i%2 == 0)
	{
	%>
	</tr><tr align="center">
	<%	
	}
	}

	if((i%2 != 0 || i ==0))
	{
%>
	</tr>
<%	
	}
} else {	
%>
<td align="center">No company selected!!</td></tr>
<% } %>
</tbody>
</table>
</div>    
</div>	
<% if(chkval1.equals("true"))
{ %> 
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
