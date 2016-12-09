<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.CustomerInfo"%>
<%@ page import="com.software.onlexam.CreateStudIds"%>
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
<script type="text/javascript">
var st2 = "0";
function checkEids(str){ 
	var xmlhttp; 
	
	if (window.XMLHttpRequest) 
	{// code for IE7+, Firefox, Chrome, Opera, Safari 
		xmlhttp=new XMLHttpRequest(); 
	} 
	else 
	{// code for IE6, IE5 
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); 
	} 
	xmlhttp.onreadystatechange=function() 
	{ 
	if (xmlhttp.readyState==4 && xmlhttp.status==200) 
	{ 
		document.getElementById("userIdMessage1914").innerHTML=xmlhttp.responseText;
		chkval2();
	} 
	} 
	xmlhttp.open("GET","getEmpid.jsp?q="+str,true); 
	xmlhttp.send();	
}

function chkval2()
{
	var chk = document.getElementById("userIdMessage1914").innerHTML;
	var chk1 = chk.trim();
	if(chk1=="Employee Id does not exits!")
	{
		st2 = "1";
	}
	else 
	{
		st2 = "0";
	}
}
function checkvalidate19711()
{
	var x9=document.forms["regform"]["eid"].value;
	var x10=document.forms["regform"]["fname"].value;
	var x11=document.forms["regform"]["mname"].value;
	var x12=document.forms["regform"]["lname"].value;
	
	
	if (x9==null || x9=="")
	{
		document.getElementById("userIdMessage19714").innerHTML = "Please enter employee id!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage19714").innerHTML = "";
	}
	if(st2=="1")
	{
		document.getElementById("userIdMessage19714").innerHTML="Employee Id does not exits!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage19714").innerHTML = "";
	}
	if (x10==null || x10=="")
	{
		document.getElementById("userIdMessage19715").innerHTML = "Please enter first name!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage19715").innerHTML = "";
	}
	if (x11==null || x11=="")
	{
		document.getElementById("userIdMessage19716").innerHTML = "Please enter middle name!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage19716").innerHTML = "";
	}
	if (x12==null || x12=="")
	{
		document.getElementById("userIdMessage19717").innerHTML = "Please enter last name!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage19717").innerHTML = "";
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
<%!     
    public static ArrayList<String> genStIds(String st1, ArrayList<String> vlist, int send,int noofstud
    		,ArrayList<String> mlist)
    {  
		int aStart = 0;
		int aEnd = send;
		int randomNumber =  0;
		Random aRandom = new Random();
		
		int cnt = 0;
		String gpswd = "";
	    int cntr = 0;
		while(cntr< noofstud)
		{
			//get the range, casting to long to avoid overflow problems
		    long range = (long)aEnd - (long)aStart + 1;
		    // compute a fraction of the range, 0 <= frac < range
		    long fraction = (long)(range * aRandom.nextDouble());
		    randomNumber =  (int)(fraction + aStart);
		        	
	    	if(cnt< 5) 
	    	{
	    		gpswd += "" + st1.charAt(randomNumber);
	    		cnt++;
	    		
	    	} 
	    	else 
	    	{
	    		gpswd += "" + st1.charAt(randomNumber);
	    		cnt++;
	    		//System.out.println("gpswd "+ gpswd);
	    		if(!vlist.contains(gpswd))
	    		{
	    			vlist.add(gpswd);
	    			mlist.add(gpswd);
	    			cntr++;
	    			//System.out.println(randomNumber);		    			    			
	    		}
	    		gpswd = "";
	    		cnt=0;		    		
	    	}
		} 
		return mlist;
    }
%>
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

String compname1 = ""; 
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
String empid="";
String fname="";
String lname="";
String mname="";
ArrayList<CustomerInfo> clist = null;
CreateStudIds tinfo = null;
if(action.equals("CreateId"))
{	
	empid=request.getParameter("eid");
	fname=request.getParameter("fname");
	mname=request.getParameter("mname");
	lname=request.getParameter("lname");
	tinfo = new CreateStudIds();
	tinfo.setFname(fname);
	tinfo.setMname(mname);
	tinfo.setLname(lname);
	tinfo.setEmpid(empid);
	   
	String sstr = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*~";
	String sIds = "0123456789";
	
	ArrayList<String> rlist = dbBean.getCustPassList(cid);
	ArrayList<String> idlist = dbBean.getCustIdList(cid);
	ArrayList<String> mlist = new ArrayList<String>();
	mlist.clear();
	ArrayList<String> mlist1 = new ArrayList<String>();
	mlist1.clear();
	
	String pswd = "";
	
	mlist = genStIds(sstr, rlist, 70, 1, mlist);
	mlist1 = genStIds(sIds, idlist, 9, 1, mlist1);
	
	String mpswd = "";
	String semail = "";
	String mids = "";
	mpswd = mlist.get(0);
	mids = mlist1.get(0);	
	
	if(!dbBean.isStudentExists1(empid, cid))
	{
		 dbBean.AddReg(fname,mname,lname,mpswd,mpswd,mids,empid,"Not Submitted",cid);
	}
	else
	{
		 dbBean.UpdateReg(mpswd,mpswd,mids,empid,"Not Submitted",cid);
	}
	
	tinfo.setSemail(mids);
	tinfo.setPswd(mpswd);
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
<h3 class="consultant-services">Create Student Id</h3>
<form name="regform" onSubmit="return checkvalidate19711()" >
<input type="hidden" name="action" value="CreateId"/>
<table align="center" width="490" height="60">
	<tr><td  width="100">Employee Id</td>
	<td   width="160"><INPUT TYPE="text" NAME="eid" SIZE="25"/></td>
	<td  align="left"><div id="userIdMessage19714"></div></td></tr>
	<tr><td width="100">First Name</td>
	<td width="160"><INPUT TYPE="TEXT" NAME="fname" SIZE="25"/></td>
	<td align="left"><div id="userIdMessage19715"></div></td></tr>
	<tr><td width="100">Middle Name</td>
	<td width="160"><INPUT TYPE="TEXT" NAME="mname" SIZE="25"/></td>
	<td align="left"><div id="userIdMessage19716"></div></td></tr>
	<tr><td width="100">Last name</td>
	<td width="160"><INPUT TYPE="TEXT" NAME="lname" SIZE="25"/></td>
	<td align="left"><div id="userIdMessage19717"></div></td></tr>	
	<tr><td  align="center" colspan="2"><input class="btn btn-cst-primary pull-right"  type="submit" value="Go"></td><td></td></tr>	
</table>
</form>
<% 
if(action.equals("CreateId"))
{
%>
<div style="height: 300px; width: 670px; overflow-y: auto">
<table align="center" width="670" height="300">
<thead>
<tr align="center" ><td  align="center" colspan="6"><h3 class="consultant-services">Generated Student Ids</h3></td></tr>
<tr  align="center" height="30">
<td width="150" align="center" >Employee Id</td>
<td width="150" align="center" >First Name</td>
<td width="150" align="center" >Middle Name</td>
<td width="150" align="center" >Last Name</td>
<td width="150" align="center" >User Id</td>
<td width="150" align="center" >Password</td>
</tr>
</thead>
<tbody>
<tr   height="30" align="center">
<td width="150" align="center"><%=empid%></td>
<td width="150" align="center"><%=tinfo.getFname()%></td>
<td width="150" align="center"><%=tinfo.getMname()%></td>
<td width="150" align="center"><%=tinfo.getLname()%></td>
<td width="150" align="center"><%=tinfo.getSemail()%></td>
<td width="150" align="center"><%=tinfo.getPswd()%></td>
</tr>
</tbody>
</table>    
</div>
<% 	
}
%>
</td></tr>
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

