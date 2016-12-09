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

int ht1=0;
int ht2=0;
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
String suser = "";
if(session.getAttribute("studentnm")!=null)
	suser = session.getAttribute("studentnm").toString();
String chkval1 = "false";
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString();
String slogin = "";
String smenu = "";
String compname1 = "";
if(chkval1.equals("true"))
{ 
	slogin = "AdminLogin.jsp";
	smenu = "AdminMenu.jsp";
	ht1 = 470;
	ht2 = 470;
		
} else {
	slogin = "Login.jsp";
	smenu = "LoginMenu.jsp";
	ht1 = 470;
	ht2 = 470;
}
ArrayList<Company> cm =  dbBean.getCompanyById(cid);
Iterator iterator23 = cm.iterator();
if(iterator23.hasNext())
{
Company cinfo = (Company) iterator23.next();
compname1 = cinfo.getCompname();
}
%>
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
        	<p>RT Road Number 13, MIDC Andheri, Mumbai - 400 093 9155479657456</p>
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
                       List Batch By Test
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-12">
                  <% } %>
	
					<table align="center" width="630"  height="<%=ht1%>">
					<% if(chkval1.equals("true"))
{ %>
<tr bgcolor="#fff" align="center"><td align="center"><h3 class="consultant-services">List Batch By Test</h3></td></tr>
<% } %>	
<tr align="center"><td align="center">
<%
if(eflg==false)
{
	ArrayList<Test> clist1 = dbBean.getTestByComp(cid);
	Iterator iterator1 = clist1.iterator();
	boolean iflg=false;	
	if(iterator1.hasNext())
	{
		int m=1;
		%><ul id="myLab" class="nav nav-tabs" data-tabs="tabs"><%
		while(iterator1.hasNext())
		{			
			Test sinfo = (Test)iterator1.next();
			slocId = sinfo.getID();
			slname = sinfo.getTestname();
			String s221 = "#h" + m;
			if(m==1) {
%><li class="active"><% } else { %><li><% } m++; %><a href="<%=s221%>" data-toggle="tab"><%=slname%></a></li><% } } }  %> 
</ul></td></tr>
<tr align="center"><td align="center">
<div id="myLabContent" class="tab-content">
<%
int mcnt = 0;
int ncnt = 0;
if(eflg==false)
{
	ArrayList<Test> clist1 = dbBean.getTestByComp(cid);
	Iterator iterator1 = clist1.iterator();
	
	
	if(iterator1.hasNext())
	{
		while(iterator1.hasNext())
		{
%>
<% 	
			ival=0;
			mcnt++;
			ncnt = 0;
			i=0;
			Test sinfo = (Test)iterator1.next();
			slocId = sinfo.getID();
			flag = true; 
			slname = sinfo.getTestname();
			String s221 = "h"+mcnt;
			String m221 = "";
			if(mcnt==1) {
				m221 = "tab-pane fade in active";
			} else {
				m221 = "tab-pane fade";
			}
%>
<div class="<%=m221%>" id="<%=s221%>">
<div style="height: 490px; width: 630px; overflow-y: auto">
	<table align="center" width="630" height="490">
	<tbody>	
<% 	
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
			ncnt++;
			i++;			
%>
<%
if(ncnt==1)
{
	%>
	<tr align="center">
	<%
} else {
if((i%2 == 1))
{
%>
<tr align="center">
<%	
} } %>	
<td align="left">
		<div style="height: 250px; width:260px; overflow-y: auto">
		<table align="center" width="260" height="250">
		<tbody>
		<tr align="center"  height="20">
			<td align="center">TestSubCategory</td>
			<td align="center"><%=ainfo.getTestsubcatname()%></td>
		</tr>		
<%
	ArrayList<Batch> clist3 = dbBean.getBatchByComp(cid,slocId,aId) ;
	Iterator iterator3 = clist3.iterator();
	
	if(iterator3.hasNext())
	{		
		while(iterator3.hasNext())
		{
			ival=0;
			Batch hinfo = (Batch)iterator3.next();
			int noofquest = hinfo.getL1() + hinfo.getL2() + hinfo.getL3();
			int ttime = (hinfo.getTimeperquest() * noofquest) / 60;
			int ttime1 = (hinfo.getTimeperquest() * noofquest) % 60;
			String tottime = "";
			if(ttime != 0)
				tottime = String.valueOf(ttime) + " min";
			if(ttime1 != 0)
			{
				tottime += " " + ttime1 + " sec" ;
			}
			int mks = hinfo.getMarksperq();
			int negmks = hinfo.getNegscore();
			String queststat = "Each question has " + mks + " marks";
			if (negmks == 0)
			{
				queststat += ",no negative marks";
			}
			else
			{
				queststat += ",negative marks per question is " +negmks;
			}
	%>
	<%   if(flag2==false)
	{ 
		i++;	
%>
<%
if((i%2 == 1))
{
%>
<tr align="center">
<%	
} 
%>
		<td align="left">
		<div style="height: 250px; width:260px; overflow-y: auto">
		<table align="center" width="260" height="250">
		<tbody>
			<tr align="center"  height="20">
				<td align="center">TestSubCategory</td>
				<td align="center"><%=ainfo.getTestsubcatname()%></td>
			</tr>
		
	<% } %>		
		<tr align="center"  height="20">
			<td align="center">Batch</td>	
			<% if(chkval1.equals("true"))
			{  %>
			<td align="center"><%=hinfo.getBatchname()%></td>
			<% } else { %>
			<td align="center"><a href="StartQuiz.jsp?action=StartQuiz&comid=<%=cid%>&stest=<%=slocId%>&stestscat=<%=aId%>&sbatch=<%=hinfo.getID()%>"><%=hinfo.getBatchname()%></a></td>
			<% } %>			
		</tr>
		<tr align="center"  height="20">
		<td align="center" colspan="2">No of questions <%=noofquest%> | Time <%=tottime%> </td>
		</tr>
		<tr align="center"  height="20">
		<td align="center" colspan="2"><%=queststat%></td>
		</tr>
		</tbody>		
</table>   
</div> 
</td>
<% 
if(i%2 == 0)
{
%>
</tr>
<%	
}
flag2=false;
		} //while batch
				
		flag=false;
	} //if batch
	else {
		flag2=true;
		flag=false;
%>
<tr   height="20" align="center"><td align="center" colspan="2">No Batches</td></tr></tbody></table></div></td>
<% 
if(i%2 == 0)
{
%>
</tr>
<%	
}
} //else no batch
%>
<% 	flag=false;
	} //while test subcategory
	if(i%2 == 1)
	{
	%>
	</tr>
	<%	
	} 
	
	} else {
		flag2=false;
		flag=false;
%>
	<tr   height="20" align="center"><td align="center" colspan="2">No Test Sub Category</td></tr>
<% } // else subcat 
	%>
	
</tbody>	
</table>
</div></div>
<% } }  else { 	
	flag1=false;
	%>
	<br>No test!		
	<%
		}
	} else { 	
		flag1=false;
%>
<br>No company selected!!		
<%
	}
%>
</div></td></tr></table>   						
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
