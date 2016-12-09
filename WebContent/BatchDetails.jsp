<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
if(session.getAttribute("loginapp")!=null)
	chkval1 = session.getAttribute("loginadm").toString();
int Batchno = Integer.parseInt(request.getParameter("Batchno"));
String Batchname1 = "";
String comname1 = "";
String testname1 = "";
String testsubcatname1 = "";
String level = "";
String level1 = "";
if (action != null && action.equals("deleteBatch")) 
{
	try 
	{		
		//int qno1 = Integer.parseInt(request.getParameter("qno1"));
		
		if(dbBean.DeleteBatch(Batchno)==false)
			out.println("Error deleting Batch");
		//action="DisplayBatch";
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
ArrayList<Batch> qlist = dbBean.getBatchById(Batchno); 
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



<%
if (action != null && action.equals("deleteBatch")) 
{
%>
<table align="center" width="590" height="30">
<TR align="center"><TD  align="center">Batch deleted successfully!</TD></TR>
</table>
<% } else {%>
	<%
		Iterator iterator1 = qlist.iterator();
		if (iterator1.hasNext()) {	
			Batch linfo = (Batch) iterator1.next();
			String ID1 = String.valueOf(linfo.getID());
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
			ArrayList<TestSubCat> bm =  dbBean.getTestscatById(linfo.getTestsubcatid());
		 	Iterator iterator4 = bm.iterator();
			if(iterator4.hasNext())
			{
				TestSubCat binfo = (TestSubCat) iterator4.next();
				testsubcatname1 = binfo.getTestsubcatname();
			}			
		%>
<div style="height: 490px; width: 670px; overflow-y: auto">
<table align="center" width="670" height="490">
<tbody>
<tr align="center" height="25" ><td align="center" colspan="2"><h3 class="consultant-services">Batch Details</h3></TD></TR>
<TR  align="center" height="25">
	<TD width="350" align="center">Batch</TD><TD width="350" align="center"><%=linfo.getBatchname()%></TD>
</TR>
<TR  align="center" height="25">
	<TD width="350" align="center">Company</TD><TD width="350" align="center"><%=comname1%></TD>
</TR>
<TR  align="center" height="25">
	<TD width="350" align="center">Test</TD><TD width="350" align="center"><%=testname1%></TD>
</TR>
<TR  align="center" height="25">
	<TD width="350" align="center">Test SubCategory</TD><TD width="350" align="center"><%=testsubcatname1%></TD>
</TR>
<TR  align="center" height="25">
	<TD width="350" align="center">MarksPerQuestion</TD><TD width="350" align="center"><%=linfo.getMarksperq()%></TD>
</TR>
<TR  align="center" height="25">
	<TD width="350" align="center">NegativeScore</TD><TD width="350" align="center"><%=linfo.getNegscore()%></TD>
</TR>
<TR  align="center" height="25">
	<TD width="350" align="center">Passing Marks</TD><TD width="350" align="center"><%=linfo.getPassmarks()%></TD>
</TR>	
<TR  align="center" height="25">
	<TD width="350" align="center">Maximum Score</TD><TD width="350" align="center"><%=linfo.getMaxscore()%></TD>
</TR>
<TR  align="center" height="25">
	<TD width="350" align="center">Time Per Question In Seconds</TD><TD width="350" align="center"><%=linfo.getTimeperquest()%></TD>
</TR>
<TR  align="center" height="25">
	<TD width="350" align="center">No. Of Easy Questions</TD><TD width="350" align="center"><%=linfo.getL1()%></TD>
</TR>
<TR  align="center" height="25">
	<TD width="350" align="center">No. Of Medium Questions</TD><TD width="350" align="center"><%=linfo.getL2()%></TD>
</TR>
<TR  align="center" height="25">
	<TD width="350" align="center">No. Of Difficult Questions</TD><TD width="350" align="center"><%=linfo.getL3()%></TD>
</TR>	
<TR  align="center" height="25">
	<TD width="350" align="center">Edit</TD>
	<td align="center"><a href="EditBatch.jsp?action=Edit&Batchno=<%=ID1%>"><img src="img/edit.png"></a></td>
</TR>
<TR  align="center" height="25">
<TD width="350" align="center">Delete</TD>
<FORM name="delform" onSubmit="return confirmcheck()">
<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteBatch">
<INPUT TYPE="HIDDEN" NAME="Batchno" VALUE="<%=ID1%>">
<TD width="350" align="center"><INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(img/delete.png); width:25px; height:25px;"/></TD>
</FORM>
</TR>
</tbody>
</table>
</div>    
<%
}
}
%>
				</div>	
</div>
	     </div>
      </div>           
           </div>     
        <div class="gap"></div>

        
        <jsp:include page="Footer.jsp" flush="true"/>
        
    </div>
<% dbBean.CloseConnection(); %>	
</body>
</html>