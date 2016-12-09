<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.software.onlexam.CustQuery" %>
<%@ page import="com.software.onlexam.DB"%>
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
<script type="text/javascript">
function checkvalidate777()
{
	var x=document.forms["searchform"]["name"].value;
	var x1=document.forms["searchform"]["sub"].value;
		
	if ((x==null || x=="") && (x1==null || x1==""))
	{
		document.getElementById("userIdMessage71").innerHTML = "Enter atleast 1 search criteria!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage71").innerHTML = "";
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
int cpsn=0;
int wid1=0;
int ht=0;
String compname1 = "";
ArrayList<Company> cm =  dbBean.getCompanyById(cid);
Iterator iterator2 = cm.iterator();
if(iterator2.hasNext())
{
Company cinfo = (Company) iterator2.next();
compname1 = cinfo.getCompname();
}
String action = request.getParameter("action");
//dbBean.initDB();
ArrayList<CustQuery> students = null;
if (action != null && action.equals("search")) 
{
	String name = request.getParameter("name");
	String sub = request.getParameter("sub");
	students = dbBean.getCQueryListByCriteria(name,sub,cid);
	cpsn=4;
	wid1=180;
	ht=490;
}
if (action.equals("Show")) 
{
	students = dbBean.GetCustQuery(cid);
	cpsn=4;
	wid1=180;
	ht=490;
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
	<FORM name="searchform" onSubmit="return checkvalidate777()">
	<INPUT TYPE="HIDDEN" NAME="action" VALUE="search"/>
	<INPUT TYPE="HIDDEN" NAME="comname" VALUE="<%=cid%>"/>
	<table align="center" width="600" height="90">
		<tr><td>Name</td><td><INPUT TYPE="TEXT" NAME="name" style="width:350px;"/></td>
		<td align="left" width="220"><div id="userIdMessage71"></div></td></tr>
		<tr><td>Subject</td><td><INPUT TYPE="TEXT" NAME="sub" style="width:350px;"/></td>
		<td align="left" width="220"><div id="userIdMessage72"></div></td></tr>
		<tr><td colspan="2"><input class="btn btn-cst-primary pull-right"  type="submit" value="Search"></td></tr>
	</table>
	</FORM>
	<%
	
	int k=0;
	Iterator iterator = students.iterator();
	if (iterator.hasNext()) {
%>
	<div style="height: <%=ht%>px; width:"670px" overflow-y: auto">
	<table align="center" width="670" height="<%=ht%>">
	<thead>
	<tr align="center" height="30"><td  align="center" colspan="<%=cpsn%>"><h3 class="consultant-services">Student Queries</h3></TD></TR>
	<TR  align="center" >
	<TD width="<%=wid1%>" align="center">Name</TD>
	<TD width="<%=wid1%>" align="center">Email</TD>
	<TD width="<%=wid1%>" align="center">Subject</TD>
	<TD width="<%=wid1%>" align="center">Read Message</TD>
	</TR></thead>
	<tbody>
	<% 
	while (iterator.hasNext()) {
		k++;
		CustQuery student = (CustQuery) iterator.next();
		
		if(k%2==0)
		{
		%>
		<TR   align="center">
		<% 
		}
		else
		{
		%>
		<TR   align="center">
		<% 
		}
		%>
	<TD width="<%=wid1%>" align="center"><%=student.getName()%></TD>
	<TD width="<%=wid1%>" align="center"><%=student.getSemail()%></TD>
	<TD width="<%=wid1%>" align="center"><%=student.getSub()%></TD>
	<TD width="<%=wid1%>" align="center"><a href="CustQueryDetails.jsp?id=<%=student.getID()%>&cid=<%=cid%>">Read Message</a></TD>
	</TR>
<%
} //while
%>
	</tbody>
	</table>    
	</div>
<% 
	}
	else 
	{
%>	
<TABLE align="center" width="590" height="30">
<tr align="center"><td align="center">
There are no customer queries.
</td></tr>
</TABLE>
<% } %>
	</td></tr>
	</table>	
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




