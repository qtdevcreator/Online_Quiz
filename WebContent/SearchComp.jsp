<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Company"%>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
<HTML>
<head>
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
<SCRIPT LANGUAGE="JavaScript">

function checkvalidate3313()
{
	var x=document.forms["compform"]["keyword"].value;
	
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage129").innerHTML = "Please enter keyword!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage129").innerHTML = "";
		document.forms["compform"].submit();
	}	
}
</SCRIPT>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/mystyles.css">
</head>
<BODY>

<%
String chkval11 = "false";
if(session.getAttribute("logincadm")!=null)
	chkval11 = session.getAttribute("logincadm").toString();
%>
<nav class="navbar navbar-default navbar-main-white yamm">
    <div class="navbar-header">
        <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#main-nav-collapse" area_expanded="false"><span class="sr-only">Main Menu</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
        </button>
    </div>
	<div class="collapse navbar-collapse" id="main-nav-collapse">
	    <div class="container">
	    <ul class="nav navbar-nav navbar-center">
		    <% if(chkval11.equals("true"))
						{ %>	        
		            <li class="dropdown yamm-fw"><a href="AdmLogOut.jsp">Log Out</a></li>
		            <li class="dropdown yamm-fw"><a href="AddCompany.jsp?action=Add">Add Company</a></li>
		            <li class="dropdown yamm-fw"><a href="ListCompany.jsp?action=Location">List Company</a></li>
		    		<li class="dropdown yamm-fw"><a href="ResetAdmin.jsp?action=Display">Reset Login Credentials</a></li>
		    <% } else { %>  
		            <li class="dropdown yamm-fw"><a href="SelCompany.jsp">Home</a></li>
		            <li class="dropdown yamm-fw"><a href="ListCompany.jsp?action=Location">List Company</a></li>
		            <li class="dropdown yamm-fw"><a href="AboutUs.jsp">About Us</a></li>
		    <% } %>
	    </ul>
	      
	    </div>
	</div>
</nav>

		<div class="search-bg">
        <div class="container">
            <FORM name="compform" method="post" action="ListCompany.jsp">
            <input type="hidden" name="action" value="Search"/>
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="main-header-input-center">
	                    <input type="text" NAME="keyword" placeholder="Search the Entire Store..." /><a class="main-header-input-center-btn" onclick="checkvalidate3313()"><i class="fa fa-search"></i></a>	                  	
						<div id="userIdMessage129"></div>
                    </div>
                </div>
            </div>
            </FORM>
        </div>
        </div>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
</BODY>
</HTML>
