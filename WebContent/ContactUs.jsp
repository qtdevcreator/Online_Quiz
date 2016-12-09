<%@page import="javax.mail.*" %> 
<%@page import="javax.activation.*" %> 
<%@page import="java.security.Security" %> 
<%@page import="java.util.Properties" %> 
<%@page import="javax.mail.Message" %> 
<%@page import="javax.mail.Session" %> 
<%@page import="javax.mail.Transport" %> 
<%@page import="javax.mail.internet.InternetAddress"%> 
<%@page import="javax.mail.internet.MimeMessage"%> 
<%@page import="java.util.*" %> 
<%@page import="javax.mail.internet.*"%> 
<%@page import="java.io.*"%> 
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Company"%>
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
function SelFile()
{
	document.forms["scartform"]["myfile"].value=document.forms["scartform"]["dataFile"].value;
}
function validatecheck444()
{
	var x=document.forms["scartform"]["name"].value;
	var x1=document.forms["scartform"]["semail"].value;
	var x2=document.forms["scartform"]["sub"].value;
	var x3=document.forms["scartform"]["message"].value;
	
	if (x==null || x=="")
	{
		document.getElementById("userIdMessage41").innerHTML = "Please enter senders name!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage41").innerHTML = "";
	}
	if (x1==null || x1=="")
	{
		document.getElementById("userIdMessage42").innerHTML = "Please enter senders email!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage42").innerHTML = "";
	}
	var atpos=x1.indexOf("@");
	var dotpos=x1.lastIndexOf(".");
	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x1.length)
	{
		document.getElementById("userIdMessage42").innerHTML = "Senders Email Id is not valid!";
	   return false;
	}
	else
	{
		document.getElementById("userIdMessage42").innerHTML = "";
	}
	if (x2==null || x2=="")
	{
		document.getElementById("userIdMessage43").innerHTML = "Please enter subject!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage43").innerHTML = "";
	}
	if (x3==null || x3=="")
	{
		document.getElementById("userIdMessage44").innerHTML = "Please enter message!";
		return false;
	}
	else
	{
		document.getElementById("userIdMessage44").innerHTML = "";
	}
}
</script>

<link rel="stylesheet" href="mystyle.css" type="text/css" />
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
DB dbBean = new DB();
String contno = "";
String compname = "";
String compaddr = "";
int cid = 0;
if(session.getAttribute("SelCompany")!=null)
	cid = Integer.parseInt(session.getAttribute("SelCompany").toString());
String cmpic = "";
if(session.getAttribute("compicon")!=null)
	cmpic = session.getAttribute("compicon").toString();
String hdrscroll = "Online Quiz";
ArrayList<Company> llist = dbBean.getCompanyById(cid);
Iterator iterator = llist.iterator();
if (iterator.hasNext()) {
while (iterator.hasNext()) {
	Company linfo = (Company) iterator.next();
	cid = linfo.getID();
	compname = linfo.getCompname();
	hdrscroll = compname;
	compaddr = linfo.getCompaddr();
	hdrscroll += " " +  compaddr;
	contno = linfo.getContactno();
	hdrscroll += " " +  contno;
}
}

String action = request.getParameter("action");
String suser = "";
if(session.getAttribute("studentnm")!=null)
	suser = session.getAttribute("studentnm").toString();
String chkval1 = "false"; 
if(session.getAttribute("loginadm")!=null)
	chkval1 = session.getAttribute("loginadm").toString();
String slogin = "";
String smenu = "";
if(chkval1.equals("true"))
{ 
	slogin = "AdminLogin.jsp";
	smenu = "AdminMenu.jsp";
	
} else {
	slogin = "Login.jsp";
	smenu = "LoginMenu.jsp";
}
int stat = 0;
if(action.equals("Send")) 
{
	String pname = request.getParameter("name");
	String semail = request.getParameter("semail");
	String subject = request.getParameter("sub"); 
	String message1 = request.getParameter("message");
	message1 = message1 + " From: " + pname + " Email: "+ semail;
		String SMTP_AUTH_USER = "82d673889a5d6b9630552357d542b733";  
		String SMTP_AUTH_PWD = "55c5612818d37c1223387550eceda3b5";  
		String host ="in-v3.mailjet.com"; //"smtp.gmail.com";
		boolean debug = false;
		
		java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());  
		String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		String user ="82d673889a5d6b9630552357d542b733"; //"YourEmailId@gmail.com" // email id to send the emails
		String to = "pssachin23@gmail.com"; 
		String pass ="55c5612818d37c1223387550eceda3b5"; //Your gmail password
		String recipientsTo[] = {"pssachin23@gmail.com"};  
		String recipientsCC[] = {""};  
		String[] recipientsBCC = {""};  
		String from = "pssachin23@gmail.com";
		
		//Set the host smtp address  
		Properties props = new Properties();  
		props.put("mail.host", host);
		props.put("mail.transport.protocol.", "smtp");
		props.put("mail.smtp.starttls.enable","true"); 
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.", "true");
		props.put("mail.smtp.port", "587"); //465
		props.put("mail.smtp.ssl.enable", "true");  

		javax.mail.Authenticator pa; 
		pa = new javax.mail.Authenticator() 
		{ 
		public javax.mail.PasswordAuthentication getPasswordAuthentication() 
		{ 
		return new javax.mail.PasswordAuthentication("82d673889a5d6b9630552357d542b733","55c5612818d37c1223387550eceda3b5"); 

		} 
		}; 
		Session msession = Session.getInstance(props,pa);
		msession.setDebug(debug);  

	
		try{ 
		    MimeMessage message = new MimeMessage(msession);
		    message.setFrom(new InternetAddress(from)); 
		    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));  
		    //MimeBodyPart messagePart = new MimeBodyPart();  
		    message.setSubject(subject); 
			//messagePart.setText(message1); 
			message.setContent(message1, "text/html");  
		    Transport.send(message);  
		    System.out.println("message successfully sent");
		    dbBean.AddQueries(pname,semail,subject,message1,cid);
		    stat=2;
		 }
		 catch (MessagingException mex) { 
		    mex.printStackTrace(); 
		    System.out.println("message not sent"); 
		}
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
                <jsp:include page="QuizMenu.jsp" flush="true"/>
    					
                <div class="col-md-9">
                
                <h3 class="custome-page-title">Welcome, <%=suser%></h3>
                
                 
                 	
                  <h3 class="custome-page-title" style="text-align:left; font-size:30px;">
                  <img src="<%=cmpic%>"  style="padding-right:150px;"><%=compname%></h3>
                  
                  
                 
                  
				
				<div class="col-lg-6 col-lg-offset-3">
                <div class="">
                    <header class="page-header text-center" style=" color:#2aa3d5; text-transform:uppercase; font-size:18px;">
					Contact Us                       
                    </header>
                    <div class="box-lg">
                        <div class="row" data-gutter="60">
                            <div class="col-md-6">


<table align="center" width="630" height="490">
<tr align="center" valign="top"><td align="center">	

<table align="center" width="550" height="200" >
<tr align="center" height="30" >
<tr align="center" height="30" >
<td align="center">Company Details</td>
<td align="center">Company Address</td>
</tr>
<tr align="center" height="140" >
<td align="center">
	<table align="center" width="315" height="140" >
		<tr align="center" height="140"><td align="center">
			Company Name   : <%=compname%>
			Contact Number : <%=contno%>
		</td></tr>
	</table>
</td>
<td align="center">
	<table align="center" width="315" height="140" >
		<tr align="center" height="140"><td align="center">
			<%=compaddr%>			
		</td></tr>
	</table>
</td></tr>
</table>
<%
if(stat == 2)
{
%>
Message sent successfully!
<% 
} 
%>
For any queries, write message to us and click send
<form name="scartform" method="post" action="ContactUs.jsp?action=Send" onSubmit="return validatecheck444()">
<table CELLSPACING="0" CELLPADDING="5" WIDTH="630" >
<tr>
<td align="right" width="150">Name:</td>
<td ><INPUT TYPE="text" NAME="name"></td>
<td width="300" align="left"><div id="userIdMessage41"></div></td>
</tr>
<tr>
<td align="right" width="150">Email:</td>
<td ><INPUT TYPE="text" NAME="semail"></td>
<td width="300" align="left"><div id="userIdMessage42"></div></td>
</tr>

<tr>
<td align="right" width="150">Subject:</td>
<td ><INPUT TYPE="text" NAME="sub"></td>
<td width="300" align="left"><div id="userIdMessage43"></div></td>
</tr>
<tr>
<td align="right" width="150">Message:</td>
<td ><textarea rows="6" cols="40" name="message"></textarea></td>
<td width="300" align="left"><div id="userIdMessage44"></div></td>
</tr>
<tr>
<td align="center" colspan="2">
<input class="btn btn-cst-primary pull-right"  type="submit" value="Send">&nbsp;</td>
<td width="300"></td>
</tr>
</table>
</form> 
</td></tr></table>
		
		</div>
                    </div>
                </div>
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


<% 
dbBean.CloseConnection();
%>
</body>
</html>
