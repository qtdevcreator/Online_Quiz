<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.Batch"%>
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.TestSubCat"%>
<% 
DB dbBean = new DB(); 
%>
<%
String action = request.getParameter("action");
int Companyno = Integer.parseInt(request.getParameter("Companyno"));
String comname1 = "";
String addr1 = "";
String cno1 = "";

if(action!=null && action.equals("EditCompany"))
{	
	 comname1 = request.getParameter("comname").toString();
	 addr1 = request.getParameter("caddr").toString();
	 cno1 = request.getParameter("cno").toString();
	 
	try 
	{			
		boolean val=dbBean.updateCompany(comname1,addr1,cno1,Companyno);
		if(val==false)
		{
			out.println("Error updating Company");
			action="Fail";
		}
		else
			action="Succ";
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
}

ArrayList<Company> qlist = dbBean.getCompanyById(Companyno); 
Iterator iterator1 = qlist.iterator();
if (iterator1.hasNext()) {	
	Company linfo = (Company) iterator1.next();
	comname1 = linfo.getCompname();
	addr1 = linfo.getCompaddr();
	cno1 = linfo.getContactno();	
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
	var x1=document.forms["searchform2"]["comname"].value;
	var x2=document.forms["searchform2"]["stest"].value;
	var x3=document.forms["searchform2"]["stestscat"].value;
	var x4=document.forms["searchform2"]["sbatch"].value;
	var x5=document.forms["searchform2"]["action"].value;
	var x6=document.forms["searchform2"]["oper1"].value;
		
	if (x1==0)
	{
		document.getElementById("userIdMessage99141").innerHTML = "Select Company!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage99141").innerHTML = "";
	}
	
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
function checkvalidate11111()
{
	var x=document.forms["quesform"]["comname"].value;
	var x1=document.forms["quesform"]["caddr"].value;
	var x2=document.forms["quesform"]["cno"].value;
		
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage11111").innerHTML = "Please enter Company!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage11111").innerHTML = "";
	}
	if (x1==null || x1=="")
	{
		document.getElementById("userIdMessage11112").innerHTML = "Please enter address!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage11112").innerHTML = "";
	}
	if (x2==null || x2=="")
	{
		document.getElementById("userIdMessage11113").innerHTML = "Please enter contact no!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage11113").innerHTML = "";
	}
	if(isNaN(x2))
	{
		document.getElementById("userIdMessage11113").innerHTML = "Contact no must be numeric!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage11113").innerHTML = "";
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
<div class="global-wrapper clearfix" id="global-wrapper">
        
   
      
    <jsp:include page="QuizHeader.jsp" flush="true"/>
    <jsp:include page="SearchComp.jsp" flush="true"/>
                
    <div class="container" style="margin-bottom:20px; margin-top:50px;">
    
     <!-- div class="col-lg-5 col-lg-offset-3">
                <div class="">
                    <header class="page-header">
                       
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                        <div class="col-md-3 row" align="center"> </div>
                        	<div class="col-md-3 row">
                            <img src="img/company.png" class="col-lg-4 img-responsive"> 
                        	</div>
                            <div class="col-md-5 row">
                                
                                <form name="testform" method="POST" action="Home.jsp" onSubmit="return checkvalidate55555()">
                                    <div class="form-group">
                                        <label>Select Company</label><br>
										
                                        <select class="product-page-option-select">
                                            <option value="0" selected>Name of Company</option>                                            
											<%
											ArrayList<Company> llist = dbBean1.getCompany();
											Iterator iterator = llist.iterator();
											if (iterator.hasNext()) {
											while (iterator.hasNext()) {
												Company linfo = (Company) iterator.next();
											%>
													<option value="<%=linfo.getID()%>"><%=linfo.getCompname()%></option>
											<% } } %>
                            			</select>&nbsp;<input class="btn btn-cst-primary pull-right "  type="submit" value="Go">
                                    </div>
                                 </form>   
                                
                                                            
                              
                            </div>
                            
                        </div>
                    <div class="col-md-1 row" align="center"> </div>
                    </div>
                </div>
            </div -->
            
            
            <div class="col-lg-5 col-lg-offset-3">
                <div class="">
                    <header class="page-header text-center" style=" color:#2aa3d5; text-transform:uppercase; font-size:18px;">
                       Edit Company
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-12">
                                
                                <form name="quesform" onSubmit="return checkvalidate11111()">
                                <INPUT TYPE="HIDDEN" NAME="action" VALUE="EditCompany"/>
								<INPUT TYPE="HIDDEN" NAME="Companyno" VALUE="<%=Companyno%>"/>
                                    <div class="form-group">
                                        <label>Company</label>
                                        <input class="form-control" type="text" NAME="comname" value="<%=comname1%>">
                                        <div id="userIdMessage11111"></div>
                                    </div>
                                    <div class="form-group">
                                        <label>Address</label>
                                        <textarea class="form-control" NAME="caddr" rows="4" cols="41"><%=addr1%></textarea>
                                        <div id="userIdMessage11112"></div>
                                    </div>
                                    <div class="form-group">
                                        <label>Contact No</label>
                                        <input class="form-control" type="text" NAME="cno" value="<%=cno1%>">
                                        <div id="userIdMessage11113"></div>
                                    </div>
                                    <!-- div class="checkbox">
                                        <label>
                                            <div class="i-check"><div class="i-check"><input class="i-check" type="checkbox" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>Remember me</label>
                                    </div -->
                                   
                                <!-- a href="#">Forgot Your Password?</a -->
                                
                                 <input class="btn btn-cst-primary pull-right"  type="submit" value="Edit">
                                </form>
                              	<% 	if (action != null && action.equals("Succ")) { %>Company is updated successfully!<% } else if (action != null && action.equals("Fail")) { %>Updation of company has failed!<% }%>
                            </div>
                            
                        </div>
                    </div>
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




