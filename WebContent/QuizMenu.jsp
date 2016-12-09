<%
String chkval = "false";
String chkval1 = "false"; 
if(session.getAttribute("loginapp")!=null)
	chkval = session.getAttribute("loginapp").toString();
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString();

String chkval2 = "false";
if(session.getAttribute("SelCompany")!=null)
	chkval2 = session.getAttribute("SelCompany").toString();

String sstat = "false";
if(session.getAttribute("Start")!=null)
	sstat = session.getAttribute("Start").toString();

String send = "false";
if(session.getAttribute("End")!=null)
	send = session.getAttribute("End").toString();

int iheight = 10;
if(chkval.equals("true") && sstat.equals("false") && send.equals("false"))
{
	iheight = 140;
}
if(chkval.equals("true") && sstat.equals("true") && send.equals("false"))
{
	iheight = 240;
}
if(chkval.equals("true") && sstat.equals("false") && send.equals("true"))
{
	iheight = 120;
}
if(chkval.equals("false") && chkval1.equals("false"))
{
	iheight = 270;
}
%>

<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Batch"%>
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.TestSubCat"%>
<%@ page import="com.software.onlexam.Company"%>
<html>
<head>
<style>
h121 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; font-weight:normal; color:4169E1; text-decoration:none
}
h221 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; font-weight:bold; color:4169E1; text-decoration:none
}
h321 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; font-weight:normal; color:4169E1; text-decoration:none
}

</style>
<script type="text/javascript">
    function noBack7() { window.history.forward(); }
    noBack();
    window.onload = noBack7;
    window.onpageshow = function (evt) { if (evt.persisted) noBack7(); }
    window.onunload = function () { void (0); }
</script>
<SCRIPT LANGUAGE="javascript">
function ClearHistory()
{
	 noBack1();
     var backlen = history.length;
     history.go(-backlen);
     window.location.href = "http://localhost:8083/Online_Exam/Logout.jsp";
}
</SCRIPT>	
<script type="text/javascript">
function showBatch99(str,str1,str2){ 
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
		document.getElementById("dbatch99").innerHTML=xmlhttp.responseText; 
	} 
	} 
	xmlhttp.open("GET","getbatch99.jsp?q="+str+"&v="+str1+"&w="+str2,true); 
	xmlhttp.send(); 
} 
function showTest99(str){ 
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
		document.getElementById("dtest99").innerHTML=xmlhttp.responseText; 
	} 
	} 
	xmlhttp.open("GET","gettest199.jsp?q="+str,true); 
	xmlhttp.send(); 
}
function showTestscat99(str,str1){ 
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
		document.getElementById("dtestscat99").innerHTML=xmlhttp.responseText; 
	} 
	} 
	xmlhttp.open("GET","gettestscat199.jsp?q="+str+"&v="+str1,true); 
	xmlhttp.send(); 
}

function showOper(str){ 
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
		document.getElementById("doper").innerHTML=xmlhttp.responseText; 
	} 
	} 
	xmlhttp.open("GET","getoper.jsp?q="+str,true); 
	xmlhttp.send(); 
}
function checkvalidate999901()
{
	var x=document.forms["searchfrm"]["keyword"].value;
	var x1=document.forms["searchfrm"]["cat"].value;
		
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage99101").innerHTML = "Enter keyword!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage99101").innerHTML = "";
	}
	if (x1=="Select")
	{
		document.getElementById("userIdMessage99102").innerHTML = "Select Category!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage99102").innerHTML = "";
	}		
}

function checkvalidate999902()
{	
	var x2=document.forms["searchform2"]["stest"].value;
	var x3=document.forms["searchform2"]["stestscat"].value;
	var x4=document.forms["searchform2"]["sbatch"].value;
	var x5=document.forms["searchform2"]["action"].value;
	var x6=document.forms["searchform2"]["oper1"].value;
		
	
	if (x2==0)
	{
		document.getElementById("userIdMessage99142").innerHTML = "Select Test!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage99142").innerHTML = "";
	}
	if (x3==0)
	{
		document.getElementById("userIdMessage99143").innerHTML = "Select Testsubcat!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage99143").innerHTML = "";
	}	
	if (x4==0)
	{
		document.getElementById("userIdMessage99144").innerHTML = "Select batch!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage99144").innerHTML = "";
	}
	if (x5==0)
	{
		document.getElementById("userIdMessage99145").innerHTML = "Select Search!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage99145").innerHTML = "";
	}	
	if (x6==0)
	{
		document.getElementById("userIdMessage99146").innerHTML = "Select Range!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage99146").innerHTML = "";
	}
}
</script>
<link href='css/css1.css' rel='stylesheet' type='text/css'>
<!-- <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'> -->
<!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'> -->
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
 if(chkval.equals("true") && sstat.equals("false") && send.equals("false"))
{ 
%>
                <div class="col-md-3">
                  <aside class="category-filters">
                        
                        <div class="category-filters-section">
                            <h3 class="widget-title-sm sidebar-list-header">QUIZ MENU</h3>
                           
                        </div>
                        
                        <div class="category-filters-section sidebar-list">
	                        <ul>
								<a href="SelQuiz.jsp"><li>Select Quiz</li></a>
								<a href="ListBatch.jsp?action=List1"><li>List Batch</li></a>
								<a href="ListBatchByTest1.jsp"><li>List Batch By Test</li></a>
								<a href="GetBatchByCat.jsp"><li>Test List</li></a>
								<a href="ListScatByTest.jsp"><li>List Test By Category</li></a>
								<a href="ListTestByOrder.jsp?action=ByOrder"><li>Test By Order</li></a>
								<a href="ListTestScatByOrder.jsp?action=ByOrder"><li>TestSubCatByOrder</li></a>							
							</ul>
						</div>
							                     
						</aside>
												
						<Br>
<% } if(chkval.equals("true") && sstat.equals("false") && send.equals("false"))
{ 

	int i = 0;
	int ival = 0;
	int locId = 0;
	int slocId = 0;
	int aId = 0;
	int bId = 0;
	boolean flag = false;
	boolean flag1 = false;
	boolean flag2 = false;
	String lname="";
	String slname="";
	String sgname="";
	if(eflg==false)
	{	
%>
<table height="20">
<tr height="20"  align="center"><td align="center"></td></tr>
</table>
<div style="height: 455px; overflow-y: auto" class="list-group panel">
<table align="center" width="170" height="455">
<tbody>
<tr align="center" height="20" ><td align="center" width="170"><h3 class="consultant-services">Start Quiz</h3></td></tr>
<tr align="center" height="445"><td align="center" width="170">
<div id="MainMenu">
  <div class="list-group panel">
 <% 
 int hcnt = 1;
  	ArrayList<Test> clist1 = dbBean.getTestByComp(cid);
	Iterator iterator11 = clist1.iterator();
	
	
	if(iterator11.hasNext())
	{
		while(iterator11.hasNext())
		{
%>
<% 	
			ival=0;
			Test sinfo = (Test)iterator11.next();
			slocId = sinfo.getID();
			flag = true; 
			slname = sinfo.getTestname();
			
			String sm1 = "#demo" + hcnt;
			String sm2 = "demo" + hcnt;
			
%>
    <a href="<%=sm1%>" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu"><%=slname%></a>
	<div class="collapse" id="<%=sm2%>">
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
			sgname = ainfo.getTestsubcatname();
			aId = ainfo.getID();
			
			String sm = "SubMenu" + hcnt;
			String smm = "#SubMenu" + hcnt;
			hcnt++;
			
%>    
	  <a href="<%=smm%>" class="list-group-item" data-toggle="collapse" data-parent="<%=sm1%>"><%=sgname%> <i class="fa fa-caret-down"></i></a>
      <div class="collapse list-group-submenu" id="<%=sm%>">
<%
	ArrayList<Batch> clist3 = dbBean.getBatchByComp(cid,slocId,aId) ;
	Iterator iterator3 = clist3.iterator();
	
	if(iterator3.hasNext())
	{		
		while(iterator3.hasNext())
		{
			ival=0;
			Batch hinfo = (Batch)iterator3.next();
			bId = hinfo.getID();
			%>
        <a href="StartQuiz.jsp?action=StartQuiz&comid=<%=cid%>&stest=<%=slocId%>&stestscat=<%=aId%>&sbatch=<%=hinfo.getID()%>"" class="list-group-item" data-parent="<%=smm%>"><%=hinfo.getBatchname()%></a>
        <% } } else { %>
        No Batches!
        <% } %>
        </div>
    <% } } else { %>
    No Test SubCategory!
	<% } %>
    </div>        
  <% hcnt++;
  } } else { %>  
  No Test!
  <% } %>
  </div>
</div>
</td></tr></tbody></table></div>
<% } %>
<% } %>
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