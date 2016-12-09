<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
</head>
<body>
<% String action = "CompanyByOrder";

String chkval = "false"; 
if(session.getAttribute("loginapp")!=null)
	chkval = session.getAttribute("loginapp").toString();

String chkval1 = "false"; 
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString();


String sstat = "false";
if(session.getAttribute("Start")!=null)
	sstat = session.getAttribute("Start").toString();

String send = "false";
if(session.getAttribute("End")!=null)
	send = session.getAttribute("End").toString();

%>
<div style="position:relative; left:0px; bottom:0px; width:100%; background:#999;">    
        <footer class="main-footer">
            <div class="container">
<% if(chkval1.equals("true") || (chkval.equals("true") && !sstat.equals("true") && send.equals("false")))
{ %>
<TABLE  align=center  HEIGHT="25" >
   <tr align=center><td align=center colspan="2">
   <ul id="myTab" class="nav nav-tabs" data-tabs="tabs">
		<li class="active"><a href="#r1" data-toggle="tab">Test</a></li>
		<li><a href="#r2" data-toggle="tab">TestSubCategory</a></li>
		<li><a href="#r3" data-toggle="tab">Batch</a></li>		
	</ul></td></tr>
   <tr align=center><td align="center" width="350">List Categories having first character as : </td>
   <td align="left">  
   <div id="myTabContent" class="tab-content">
   <% 
   for(int q=1;q<=4;q++)
	{ 
	   String s221 = "r"+q;
		String m221 = "";
		if(q==1) {
			m221 = "tab-pane fade in active";
		} else {
			m221 = "tab-pane fade";
		}
		if(q==1)
		{
			action = "TestByOrder";
		}
		else if(q==2)
		{
			action = "Test SubCategoryByOrder";
		}
		else if(q==3)
		{
			action = "BatchByOrder";
		}
	%>
   <div class="<%=m221%>" id="<%=s221%>">
   <%
String mprod = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
String alphurl = "";
int ilen = mprod.length();
for(int t=0;t<ilen;t++)
{
	alphurl = "SearchResults.jsp?keyword="+mprod.charAt(t)+"&cat="+action;
%>
	<a href="<%=alphurl%>"><%=mprod.charAt(t)%></a><%=" "%>
<% } %>
</div>
  <%} %>
</div> 
</td>
</tr>
</TABLE>
<%} %>
  			</div>
        </footer>
        <div class="copyright-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <p class="copyright-text"> &copy;Copyright 2016, All Rights Reserved</p>
                    </div>
                    
                </div>
            </div>
        </div>
        
    </div>  
</body>
</html>