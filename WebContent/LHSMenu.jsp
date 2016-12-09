<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
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
		document.getElementById("userIdMessage99101").innerHTML = "Select Category!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage99101").innerHTML = "";
		//document.forms["searchfrm"].submit();
	}	
}
</script>
</head>
<body>
<% String chkval1 = "false";
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString(); %>
<FORM name="searchfrm" Method="post" action="SearchResults.jsp" onsubmit="return checkvalidate999901()">
<input class="col-lg-3" style="width:45%; padding:9px;" type="text" placeholder="Search the Entire Store..." NAME="keyword" />&nbsp;

 <select class="product-page-option-select" style=" opacity:0.8; width:143px; border-radius:0; margin-left:9px;" name="cat" >
                                 <option value="Select" selected>Select</option>
<% if(chkval1.equals("true"))
{ %>                                  
<option value="Question">Question</option>
<% } %>
<option value="Test">Test</option>
<option value="Test SubCategory">Test SubCategory</option>
<option value="Batch">Batch</option>
                 			</select>
                             <input class="btn btn-cst-primary pull-right"  type="submit" value="Go">
 <div id="userIdMessage99101"></div>
 <div id="userIdMessage99102"></div>
 </FORM>
</body>
</html>