<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Batch"%>
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.TestSubCat"%>
<% 
DB dbBean = new DB(); 

%>
<%
String action = request.getParameter("action");
String chkval1 = "false";
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString();

String keyword = "";
String keyword11 = "";
int lid = 0;
ArrayList<Company> clist = null;
if (action.equals("Location")) 
{
	clist = dbBean.getCompany();
}
if (action.equals("Search")) 
{
	keyword = request.getParameter("keyword");
	clist = dbBean.getCompanyByKeyword(keyword);
	keyword11 = keyword;
}
if (action.equals("ByOrder")) 
{
	keyword = request.getParameter("keyword");
	clist = dbBean.getCompWithAlph(keyword);
	keyword11 = keyword;
}
if (action != null && action.equals("deleteCompany")) 
{
	keyword11 = request.getParameter("keyword11");
	String action11 = request.getParameter("action11").toString();
	String action12 = action;
	try 
	{
		String[] recdel = request.getParameterValues("chkdel");
		int ilen = recdel.length;
		for(int d=0;d<ilen;d++)
		{
			int Companyno = Integer.parseInt(recdel[d]);
			if(dbBean.DeleteCompany(Companyno)==false)
				out.println("Error deleting Company");
		}
		//action = "Location";
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	action = action11;
	action11 = action12;
	if (action.equals("Location")) 
	{
		clist = dbBean.getCompany();
	}
	else if (action.equals("Search")) 
	{
		keyword = keyword11;
		clist = dbBean.getCompanyByKeyword(keyword);
	}
	else if (action.equals("ByOrder")) 
	{		
		keyword = keyword11;
		clist = dbBean.getCompWithAlph(keyword);		
	}
	
}



%>
<% dbBean.CloseConnection(); %>
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
<SCRIPT type="text/javascript">
        function noBack1() { window.history.forward(); }
</SCRIPT>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link href="css/bootstrap.min.css" rel="stylesheet">
      
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
		<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="css/bootstrap-submenu.min.css">
		<script src="js/bootstrap-submenu.min.js"></script>
<script>
$('#demo3').click(function(){ 
  var $target = $($(this).data('target')); 
  if(!$target.hasClass('in'))
    $('.collapse .in').removeClass('in').height(0);    
});
</script>		
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
function checkvalidate99991()
{
	var x=document.forms["searchform"]["keyword"].value;
	var x1=document.forms["searchform"]["cat"].value;
		
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage9911").innerHTML = "Enter keyword!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage9911").innerHTML = "";
	}
	if (x1=="Select")
	{
		document.getElementById("userIdMessage9912").innerHTML = "Select Category!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage9912").innerHTML = "";
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
		document.getElementById("userIdMessage99145").innerHTML = "Select Operation!";
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
<script type="text/javascript">
function confirmcheck() { 
    var r=confirm("Are You Sure You Want To delete?"); 
    if(r==false) {
    	return false;
    }
}
function validatecheck()
{
	var x=document.forms["searchform"]["loc"].value;
		
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage1").innerHTML = "Location cannot be blank!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage1").innerHTML = "";
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
<body onload="noBack1();">
<% 
DB dbBean1 = new DB(); 

%>
<%
int isr=0;
String chkval2 = "false"; 
if(session.getAttribute("logincadm")!=null)
	chkval2 = session.getAttribute("logincadm").toString();
%>
<div class="global-wrapper clearfix" id="global-wrapper">
        
   
      
    <jsp:include page="QuizHeader.jsp" flush="true"/>
    <jsp:include page="SearchComp.jsp" flush="true"/>
                
    <div class="container" style="margin-bottom:20px; margin-top:50px;">
    
    <div class="col-md-12 " >
	    <div style="background:#fff; padding-bottom:15px;">	             
	            <%
if (action.equals("Location")) 
{
	isr = 0;
}
else if (action.equals("Search")) 
{
	isr=1;
}
else if (action.equals("ByOrder"))
{
	isr=2;
}
if (action.equals("Location") || action.equals("Search") || action.equals("ByOrder")) 
{
	Iterator iterator = clist.iterator();
	if(iterator.hasNext())
	{
%>
<FORM name="delform" onSubmit="return confirmcheck()">
<INPUT TYPE="HIDDEN" NAME="action11" VALUE="<%=action%>">
<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteCompany">
<input type="hidden" name="keyword11" value="<%=keyword11%>"/>
<INPUT TYPE="HIDDEN" NAME="hdflg" VALUE="1">
<div style="height: 360px; overflow-y: auto">
<table align="center"  height="360">
<thead>
<% 
int cspn = 0;
if(chkval2.equals("true")) 
{ 
cspn = 5;
%>
<tr BGCOLOR="#fff" align="center"><td align="center" colspan="5">
<INPUT TYPE="SUBMIT" name="Submit" value="" style="background: url(img/delete.png); width:25px; height:25px;"/></td></tr>
<% } else {
	cspn = 3; 
	} %>
<% if(isr==0) { %>
<tr align="center" height="30"><td bgcolor="#fff" align="center" colspan="<%=cspn%>"><h3 class="consultant-services">Company List</h3></TD></TR>
<% } else if(isr==1) { %>
<tr align="center" height="30"><td bgcolor="#fff" align="center" colspan="<%=cspn%>"><h3 class="consultant-services">Company List by keyword <%=keyword%></h3></TD></TR>
<% } else if(isr==2) { %>
<tr align="center" height="30"><td bgcolor="#fff" align="center" colspan="<%=cspn%>"><h3 class="consultant-services">Company List with first character as <%=keyword%></h3></TD></TR>
<% } %>
<TR align="center" height="30">
<% 
if(chkval2.equals("true")) 
{ %>
<TD width="70" align="center"><input type="checkbox" id="chkdell" onClick="setchkval()" /></TD>
<% } %>
<TD width="300" align="center" >Company</TD>
<TD width="300" align="center" >Address</TD>
<TD width="300" align="center" >Contact No</TD>
<% 
if(chkval2.equals("true")) 
{ %>
<TD width="50" align="center" >Edit</TD>
<% } %>
</TR>
</thead>
<tbody>
<%
int i=1;
while (iterator.hasNext()) {
	Company linfo = (Company) iterator.next();

%>

<TR  height="30" align="center">
<% 
 	String ID1 = String.valueOf(linfo.getID());
%>
<% 
if(chkval2.equals("false")) 
{
 %>
<TD align="center"><a href="Home.jsp?comname=<%=linfo.getID()%>"><%=linfo.getCompname()%></a></TD>
<% 
} else {
%>
<TD width="70"  align="center"><input type="checkbox" name="chkdel" onClick="getchkval()" value="<%=ID1%>"></TD>
<TD width="300" align="center"><%=linfo.getCompname()%></TD>
<% } %>
<TD width="300" align="center"><%=linfo.getCompaddr()%></TD>
<TD width="300" align="center"><%=linfo.getContactno()%></TD>
<% 
if(chkval2.equals("true")) 
{ %>
<TD width="50" align="center"><a href="EditCompany.jsp?action=Edit&Companyno=<%=ID1%>"><img src="img/edit.png"></a></TD>
<% } %>
</TR>
<%

} //while
	%>
</tbody>
</table>    
</div>	
</FORM>
<% } else { %>There are no Company!<% } } %>
  </div>
  </div>
  </div>
           
        <div class="gap"></div>
       
        <jsp:include page="Footer1.jsp" flush="true"/>
      
    
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

<% dbBean1.CloseConnection(); %>
</body>
</html>