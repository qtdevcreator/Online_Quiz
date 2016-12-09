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

String chkval2 = "false"; 
if(session.getAttribute("logincadm")!=null)
	chkval2 = session.getAttribute("logincadm").toString();


%>
<div style="position:relative; left:0px; bottom:0px; width:100%; background:#999;">    
        <footer class="main-footer">
            <div class="container">
                
                <ul class="main-footer-links-list text-center">
                
                	<span>List of company having first character as : <%
String mprod = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
String alphurl = "";
int ilen = mprod.length();
for(int t=0;t<ilen;t++)
{
	alphurl = "ListCompany.jsp?keyword="+mprod.charAt(t)+"&action=ByOrder";
%><a href="<%=alphurl%>"><%=mprod.charAt(t)%></a><%=" "%><% } %>
            </ul>
               
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