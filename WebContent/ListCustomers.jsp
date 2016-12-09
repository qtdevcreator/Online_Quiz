<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.CustomerInfo"%>
<%@ page import="com.software.onlexam.DB"%>
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
function checkvalidate666()
{
	var x=document.forms["searchform"]["keyword"].value;
		
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage61").innerHTML = "Please enter student name!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage61").innerHTML = "";
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
//dbBean.initDB();
ArrayList<CustomerInfo> clist = null;
String keyword = "";
if (action != null && action.equals("deleteCustomer")) 
{
	try 
	{
		String[] recdel = request.getParameterValues("chkdel");
		int ilen = recdel.length;
		for(int d=0;d<ilen;d++)
		{		
			int Id = Integer.parseInt(recdel[d]);
			if(dbBean.DeleteCustomer(Id)==false)
				out.println("Error deleting customer");
		}
		action = "Customer";
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
if (action != null && action.equals("search")) 
{
	keyword = request.getParameter("keyword");	
	clist = dbBean.getCustListByName(keyword, cid);
}
else if (action.equals("Customer")) 
{
	clist = dbBean.getCustList(cid);
}
String compname1 = "";
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


<FORM name="searchform" onSubmit="return checkvalidate666()">
<INPUT TYPE="HIDDEN" NAME="action" VALUE="search"/>
<table align="center" width="600" height="40">
<tr><td>Name</td><td><INPUT TYPE="TEXT" NAME="keyword" style="width:350px;"/></td>
<td align="left" width="250"><div id="userIdMessage61"></div></td></tr>
<tr><td colspan="2"><input class="btn btn-cst-primary pull-right"  type="submit" value="Search"></td></tr>
</table>
</FORM>
<%
if (action.equals("Customer") || action.equals("search")) 
{
	
	Iterator iterator = clist.iterator();
	if (iterator.hasNext()) {
%>
<FORM name="delform" onSubmit="return confirmcheck()">
<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteCustomer">
<INPUT TYPE="HIDDEN" NAME="hdflg" VALUE="1">
<div style="height: 490px; width:"670px" overflow-y: auto">
<table align="center" width="670" height="490">
<thead>
<tr  align="center"><td align="center" colspan="7">
<INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(img/delete.png); width:25px; height:25px;"/></td></tr>
<tr align="center" height="30"><td  align="center" colspan="7">
<% if (action != null && action.equals("search")) 
{ %>
<h3 class="consultant-services">Student List By Keyword <%=keyword%> In Name Field</h3>
<% } else { %>
<h3 class="consultant-services">Student List</h3>
<% } %></TD></TR>
<TR  height="30" align="center">
<TD width="70" align="center"><input type="checkbox" id="chkdell" onClick="setchkval()" /></TD>
<TD width="170" align="center">Name</TD>
<TD width="170" align="center">Email</TD>
<TD width="170" align="center">Gender</TD>
<TD width="170" align="center">Mobile</TD>
<TD width="170" align="center">Age</TD>
<TD width="170" align="center">Address</TD>
</TR>
</thead>
<tbody>
<%
int i=1;
while (iterator.hasNext()) {
	CustomerInfo cust = (CustomerInfo) iterator.next();
	
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
%>
<TD width="70"  align="center"><input type="checkbox" name="chkdel" onClick="getchkval()" onClick="getchkval()" value="<%=cust.id%>"></TD>
<TD width="170"  align="center"><a href="GetStudentDetails.jsp?action=List2&ID=<%=cust.id%>"><%=cust.stuname%> <%=cust.stmname%> <%=cust.stlname%></a></TD>
<TD width="170"  align="center"><%=cust.stemail%></TD>
<TD width="170"  align="center"><%=cust.stgender%></TD>
<TD width="170"  align="center"><%=cust.stmobile%></TD>
<TD width="170"  align="center"><%=cust.stage%></TD>
<TD width="170"  align="center"><%=cust.staddress%></TD>
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
<TR align="center"><TD  align="center">There are no students!</TD></TR>
</table>
<%
}
}
%>

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