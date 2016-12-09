<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Question"%>
<%@ page import="com.software.onlexam.Batch"%>
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.TestSubCat"%>
<%@ page import="com.software.onlexam.Company"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Online Test</title>

<SCRIPT type="text/javascript">
        function noBack1() { window.history.forward(); }
</SCRIPT>
<script type="text/javascript">
function showTest(str){ 
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
		document.getElementById("dtest").innerHTML=xmlhttp.responseText; 
	} 
	} 
	xmlhttp.open("GET","gettest1.jsp?q="+str,true); 
	xmlhttp.send(); 
}
function showTestscat(str,str1){ 
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
		document.getElementById("dtestscat").innerHTML=xmlhttp.responseText; 
	} 
	} 
	xmlhttp.open("GET","gettestscat.jsp?q="+str+"&v="+str1,true); 
	xmlhttp.send(); 
} 
function showBatch(str,str1,str2){ 
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
		document.getElementById("dbatch").innerHTML=xmlhttp.responseText; 
	} 
	} 
	xmlhttp.open("GET","getbatch.jsp?q="+str+"&v="+str1+"&w="+str2,true); 
	xmlhttp.send(); 
} 

function checkvalidate515()
{
	var x=document.forms["quesform"]["ques"].value;
	var x1=document.forms["quesform"]["chA"].value;
	var x2=document.forms["quesform"]["chB"].value;
	var x5=document.forms["quesform"]["ans"].value;
	var x10=document.forms["quesform"]["slevel"].value;
	
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage51").innerHTML = "Please enter question!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage51").innerHTML = "";
	}
	if (x1==null || x1=="")
	{
		document.getElementById("userIdMessage52").innerHTML = "Please enter choice A!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage52").innerHTML = "";
	}
	if (x2==null || x2=="")
	{
		document.getElementById("userIdMessage53").innerHTML = "Please enter choice B!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage53").innerHTML = "";
	}
	if (x5==null || x5=="")
	{
		document.getElementById("userIdMessage56").innerHTML = "Please select answer!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage56").innerHTML = "";
	} 
	if (x10==0)
	{
		document.getElementById("userIdMessage61").innerHTML = "Please select level!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage61").innerHTML = "";
	}
}
function confirmcheck() { 
    var r=confirm("Are You Sure You Want To delete?"); 
    if(r==false) {
    	return false;
    }
}
function checkvalidate555()
{
	var x=document.forms["quesform"]["ques"].value;
	var x1=document.forms["quesform"]["chA"].value;
	var x2=document.forms["quesform"]["chB"].value;
	var x5=document.forms["quesform"]["ans"].value;
	//var x6=document.forms["quesform"]["comid"].value;
	var x7=document.forms["quesform"]["stest"].value;
	var x8=document.forms["quesform"]["stestscat"].value;
	var x10=document.forms["quesform"]["slevel"].value;
	
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage51").innerHTML = "Please enter question!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage51").innerHTML = "";
	}
	if (x1==null || x1=="")
	{
		document.getElementById("userIdMessage52").innerHTML = "Please enter choice A!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage52").innerHTML = "";
	}
	if (x2==null || x2=="")
	{
		document.getElementById("userIdMessage53").innerHTML = "Please enter choice B!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage53").innerHTML = "";
	}
	if (x5==null || x5=="")
	{
		document.getElementById("userIdMessage56").innerHTML = "Please select answer!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage56").innerHTML = "";
	} 
	if (x7==0)
	{
		document.getElementById("userIdMessage58").innerHTML = "Please select test!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage58").innerHTML = "";
	}
	if (x8==0)
	{
		document.getElementById("userIdMessage59").innerHTML = "Please select test sub category!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage59").innerHTML = "";
	}
	/*if (x9==0)
	{
		document.getElementById("userIdMessage60").innerHTML = "Please select batch!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage60").innerHTML = "";
	}*/
	if (x10==0)
	{
		document.getElementById("userIdMessage61").innerHTML = "Please select level!";
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
ArrayList<Question> clist = null;
int comid = 0;
int testid = 0;
int testscatid = 0;
String compname1 = "";
String test1 = "";
String testscat1 = "";
String action1 = "";
String jsc = "";
if (action.equals("AddT") || action1.equals("addQuestion1")) 
{ 
	jsc = "checkvalidate515()";
}
else 
{
	jsc = "checkvalidate555()";
}
if (action != null && action.equals("AddT")) 
{
	compname1 = request.getParameter("compname1").toString();
	comid = cid;
	test1 = request.getParameter("test1").toString();
	testid = Integer.parseInt(request.getParameter("testid").toString());
	testscat1 = request.getParameter("testscat1").toString();
	testscatid = Integer.parseInt(request.getParameter("testscatid").toString());
}
if (action != null && action.equals("addQuestion")) 
{
	String ques = request.getParameter("ques").toString();
	String chA = request.getParameter("chA").toString();
	String chB = request.getParameter("chB").toString();
	String chC = request.getParameter("chC").toString();
	String chD = request.getParameter("chD").toString();
	String chE = request.getParameter("chE").toString();
	String[] ans1 = request.getParameterValues("ans");
	int ilen = ans1.length;
	String ans="";
	for(int d=0;d<ilen;d++)
	{
		ans += ans1[d];		
	}
	comid = cid;
	int stest = Integer.parseInt(request.getParameter("stest").toString());
	int stestscat = Integer.parseInt(request.getParameter("stestscat").toString());
	//int sbatch = Integer.parseInt(request.getParameter("sbatch").toString());
	int slevel = Integer.parseInt(request.getParameter("slevel").toString());
	try 
	{		
		//dbBean.initDB();
		boolean val = dbBean.AddQuest(ques,ans,chA,chB,chC,chD,chE,comid,stest,stestscat,slevel);
		if(val==false)
		{
			out.println("Error adding Question");
			action="Fail";
		}
		else
			action="Succ";
		action1 = "addQuestion";
		//dbBean.CloseConnection();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
if (action != null && action.equals("addQuestion1")) 
{
	String ques = request.getParameter("ques").toString();
	String chA = request.getParameter("chA").toString();
	String chB = request.getParameter("chB").toString();
	String chC = request.getParameter("chC").toString();
	String chD = request.getParameter("chD").toString();
	String chE = request.getParameter("chE").toString();
	String[] ans1 = request.getParameterValues("ans");
	int ilen = ans1.length;
	String ans="";
	for(int d=0;d<ilen;d++)
	{
		ans += ans1[d];		
	}
	comid = cid;
	//int stest = Integer.parseInt(request.getParameter("testid1").toString());
	//int stestscat = Integer.parseInt(request.getParameter("testscatid1").toString());
	//int comid = Integer.parseInt(request.getParameter("comid").toString());
	//int stest = Integer.parseInt(request.getParameter("stest").toString());
	//int stestscat = Integer.parseInt(request.getParameter("stestscat").toString());
	
	int slevel = Integer.parseInt(request.getParameter("slevel").toString());
	testid = Integer.parseInt(request.getParameter("testid1").toString());
	testscatid = Integer.parseInt(request.getParameter("testscatid1").toString());
	compname1 = request.getParameter("compname1").toString();
	test1 = request.getParameter("test1").toString();
	testscat1 = request.getParameter("testscat1").toString();
	try 
	{		
		//dbBean.initDB();
		boolean val = dbBean.AddQuest(ques,ans,chA,chB,chC,chD,chE,comid,testid,testscatid,slevel);
		if(val==false)
		{
			out.println("Error adding Question");
			action="Fail";
		}
		else
			action="Succ";
		action1 = "addQuestion1";
		//dbBean.CloseConnection();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
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

						
<table align="center" height="600" width="670" >
<tr align="center" height="600">
<td  align="center">
<FORM name="quesform" onSubmit="return <%=jsc%>">
<% if (action.equals("AddT") || action1.equals("addQuestion1")) 
{ %>
<input type="hidden" name="action" value="addQuestion1"/>
<input type="hidden" name="testid1" value="<%=testid%>"/>
<input type="hidden" name="testscatid1" value="<%=testscatid%>"/>
<input type="hidden" name="compname1" value="<%=compname1%>"/>
<input type="hidden" name="test1" value="<%=test1%>"/>
<input type="hidden" name="testscat1" value="<%=testscat1%>"/>
<% } else if (action.equals("Add") || action1.equals("addQuestion")) { %>
<input type="hidden" name="action" value="addQuestion"/>
<% } %>
<h3 class="consultant-services">Add Questions</h3>
<div style="height: 600px; width: 670px; overflow-y: auto">
	<table align="center" width="670" height="600">
	<tbody>
	<tr><td  align="center" width="150">Question</td>
	<td  align="left" ><textarea NAME="ques" rows="2" cols="41"></textarea></td>
	<td  align="center" width="150"><div id="userIdMessage51"></div></td></tr>
	<tr><td  align="center" width="150">Choice A</td>
	<td  align="left" ><textarea NAME="chA" rows="2" cols="41"></textarea></td>
	<td  align="center" width="150"><div id="userIdMessage52"></div></td></tr>
	<tr><td  align="center" width="150">Choice B</td>
	<td  align="left" ><textarea NAME="chB" rows="2" cols="41"></textarea></td>
	<td  align="center" width="150"><div id="userIdMessage53"></div></td></tr>
	<tr><td  align="center" width="150">Choice C</td>
	<td  align="left" ><textarea NAME="chC" rows="2" cols="41"></textarea></td>
	<td  align="center" width="150"><div id="userIdMessage54"></div></td></tr>
	<tr><td  align="center" width="150">Choice D</td>
	<td  align="left" ><textarea NAME="chD" rows="2" cols="41"></textarea></td>
	<td  align="center" width="150"><div id="userIdMessage55"></div></td></tr>
	<tr><td  align="center" width="150">Choice E</td>
	<td  align="left" ><textarea NAME="chE" rows="2" cols="41"></textarea></td>
	<td  align="center" width="150"><div id="userIdMessage155"></div></td></tr>
	<tr height="30"><td  align="center" width="150">Answer</td>
	<td  align="left" ><select name="ans"  multiple="multiple">
						<option value="A" Selected>Choice A</option>
						<option value="B">Choice B</option>
						<option value="C">Choice C</option>
						<option value="D">Choice D</option>
						<option value="E">Choice E</option>
						</select></td>
	<td  align="center" width="150"><div id="userIdMessage56"></div></td></tr>
	<tr height="30"><td  align="center" width="150">Company</td>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="comname1" value="<%=compname1%>" readonly style="width:350px;">
	<td  align="center" width="150"><div id="userIdMessage57"></div></td></tr>
	<tr align="center" height="30"><td  align="center" width="150">Test</td>
	<% if (action.equals("Add") || action.equals("addQuestion") || action1.equals("addQuestion")) 
	{ %>
<td  align=left><select name="stest" onchange="showTestscat(<%=cid%>,this.value)">
					<option value="0">Select</option>
					<%
					ArrayList<Test> llist = dbBean.getTestByComp(cid);
					Iterator iterator = llist.iterator();
					if (iterator.hasNext()) {
					while (iterator.hasNext()) {
						Test linfo = (Test) iterator.next();
					%>
							<option value="<%=linfo.getID()%>"><%=linfo.getTestname()%></option>
					<% } } %>
				</select></td>
	<% } if (action.equals("AddT") || action1.equals("addQuestion1")) { %>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="test1" value="<%=test1%>" readonly style="width:350px;">
	<% } %>	
		<td  align="center"><div id="userIdMessage58"></div></td></tr>
<tr height="30"><td  align="center" width="150">TestSubCategory</td>
<% if (action.equals("Add") || action.equals("addQuestion") || action1.equals("addQuestion")) 
	{ %>
	<td   align="left"> 
		<div id="dtestscat">
		<select name="stestscat"> 
		<option value="0">Select</option>
		</select> 
		</div>
		</td>
		<% } if (action.equals("AddT") || action1.equals("addQuestion1")) { %>
	<td  align="left" ><INPUT TYPE="TEXT" NAME="testscat1" value="<%=testscat1%>" readonly style="width:350px;">
	<% } %>
		<td  align="center" width="150"><div id="userIdMessage59"></div></td></tr>

		<tr height="30" align="center"><td  align="center">Level</td>
		<td  align="left"><select name="slevel">
					<option value="0">Select</option>
					<option value="1">Easy</option>
					<option value="2">Medium</option>
					<option value="3">Difficult</option>
					</select>
					</td>
		<td  align="center"><div id="userIdMessage61"></div></td></tr>
	<TR align="center"><TD width="150" align="center"></td><TD ALIGN="left"><input class="btn btn-cst-primary pull-right"  type="submit" value="Add"></td></tr>			
	<tr align="center" height="20"><td  align="center" colspan="3"><% if (action != null && action.equals("Succ")) { %>Question added successfully!<% } else if (action != null && action.equals("Fail")) { %>Adding of Question has failed!<% }%></td></tr>
</tbody>
</table>
</div>
</FORM>
</td></tr></table>
	
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