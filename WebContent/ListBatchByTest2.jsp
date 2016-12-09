<%@ page import="java.util.*" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Batch"%>
<%@ page import="com.software.onlexam.Test"%>
<%@ page import="com.software.onlexam.TestSubCat"%>
<%@ page import="com.software.onlexam.Company"%>
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
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- Bootstrap -->
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
      <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
		
</head>
<body onload="noBack1();">
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
%>


<table align="center" width="1030" height="690">
<tr align="center" height="690" ><td align="center">					
<% 
	int i = 0;
	int ival = 0;
	int locId = 0;
	int slocId = 0;
	int aId = 0;
	boolean flag = false;
	boolean flag1 = false;
	boolean flag2 = false;
	String lname="";
	String slname="";
	%>
<h212>List Batches By Test</h212>	
<table align="center" width="900" >
<tr align="center"><td align="center" width="900">	
<ul id="myTab" class="nav nav-tabs">
<%
if(eflg==false)
{
	ArrayList<Test> clist1 = dbBean.getTestByComp(cid);
	Iterator iterator1 = clist1.iterator();
	boolean iflg=false;	
	if(iterator1.hasNext())
	{
		int m=0;
		while(iterator1.hasNext())
		{
			m++;
			Test sinfo = (Test)iterator1.next();
			slocId = sinfo.getID();
			slname = sinfo.getTestname();
			String s221 = "#h" + m;
			if(iflg==false) {
%>	
	<li class="active">
<% } else { %>
   <li>
   <% } iflg=true; %>
<a href="<%=s221%>" data-toggle="tab"><%=slname%></a></li>   
<% } } }  %> 
</ul>  					
</td></tr>
</table>    

<div id="myTabContent" class="tab-content">
<%
int mcnt = 0;
int ncnt = 0;
if(eflg==false)
{
	ArrayList<Test> clist1 = dbBean.getTestByComp(cid);
	Iterator iterator1 = clist1.iterator();
	
	
	if(iterator1.hasNext())
	{
		while(iterator1.hasNext())
		{
%>
<% 	
			ival=0;
			mcnt++;
			ncnt = 0;
			i=0;
			Test sinfo = (Test)iterator1.next();
			slocId = sinfo.getID();
			flag = true; 
			slname = sinfo.getTestname();
			String s221 = "h"+mcnt;
			String m221 = "";
			if(mcnt==1) {
				m221 = "tab-pane fade in active";
			} else {
				m221 = "tab-pane fade";
			}
%>
<div class="<%=m221%>" id="<%=s221%>">
<div style="height: 580px; overflow-y: auto">
	<table align="center" width="900" height="580">
	<tbody>	
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
			aId = ainfo.getID();
			ncnt++;
			i++;			
%>
<%
if(ncnt==1)
{
	%>
	<tr align="center">
	<%
} else {
if((i%2 == 1))
{
%>
<tr align="center">
<%	
} } %>	
<td align="center">
		<div style="height: 200px; overflow-y: auto">
		<table align="center" width="440" height="200">
		<tbody>
		<tr align="center" bgcolor="#fbefd9" height="20">
			<td align="center"><h212>TestSubCategory</h212></td>
			<td align="center"><h212><%=ainfo.getTestsubcatname()%></h212></td>
		</tr>		
<%
	ArrayList<Batch> clist3 = dbBean.getBatchByComp(cid,slocId,aId) ;
	Iterator iterator3 = clist3.iterator();
	
	if(iterator3.hasNext())
	{		
		while(iterator3.hasNext())
		{
			ival=0;
			Batch hinfo = (Batch)iterator3.next();
			int noofquest = hinfo.getL1() + hinfo.getL2() + hinfo.getL3();
			int ttime = (hinfo.getTimeperquest() * noofquest) / 60;
			int ttime1 = (hinfo.getTimeperquest() * noofquest) % 60;
			String tottime = "";
			if(ttime != 0)
				tottime = String.valueOf(ttime) + " min";
			if(ttime1 != 0)
			{
				tottime += " " + ttime1 + " sec" ;
			}
			int mks = hinfo.getMarksperq();
			int negmks = hinfo.getNegscore();
			String queststat = "Each question has " + mks + " marks";
			if (negmks == 0)
			{
				queststat += ",no negative marks";
			}
			else
			{
				queststat += ",negative marks per question is " +negmks;
			}
	%>
	<%   if(flag2==false)
	{ 
		i++;	
%>
<%
if((i%2 == 1))
{
%>
<tr align="center">
<%	
} 
%>
		<td align="center">
		<div style="height: 200px; overflow-y: auto">
		<table align="center" width="440" height="200">
		<tbody>
			<tr align="center" bgcolor="#fbefd9" height="20">
				<td align="center"><h212>TestSubCategory</h212></td>
				<td align="center"><h212><%=ainfo.getTestsubcatname()%></h212></td>
			</tr>
		
	<% } %>		
		<tr align="center" BGCOLOR="#FFDEAD" height="20">
			<td align="center"><h212>Batch</h212></td>	
			<td align="center"><h212><%=hinfo.getBatchname()%></h212></td>			
		</tr>
		<tr align="center" BGCOLOR="#fbefd9" height="20">
		<td align="center" colspan="2"><h212>No of questions <%=noofquest%> | Time <%=tottime%> </h212></td>
		</tr>
		<tr align="center" BGCOLOR="#FFDEAD" height="20">
		<td align="center" colspan="2"><h212><%=queststat%></h212></td>
		</tr>
		</tbody>		
</table>   
</div> 
</td>
<% 
if(i%2 == 0)
{
%>
</tr>
<%	
}
flag2=false;
		} //while batch
				
		flag=false;
	} //if batch
	else {
		flag2=true;
		flag=false;
%>
<tr  BGCOLOR="#FFDEAD" height="20" align="center"><td align="center" colspan="2"><h212>No Batches</h212></td></tr></tbody></table></div></td>
<% 
if(i%2 == 0)
{
%>
</tr>
<%	
}
} //else no batch
%>
<% 	flag=false;
	} //while test subcategory
	if(i%2 == 1)
	{
	%>
	</tr>
	<%	
	} 
	
	} else {
		flag2=false;
		flag=false;
%>
	<tr  BGCOLOR="#FFDEAD" height="20" align="center"><td align="center" colspan="2"><h212>No Test Sub Category</h212></td></tr>
<% } // else subcat 
	%>
	
</tbody>	
</table>
</div></div>
<% } }  else { 	
	flag1=false;
	%>
	<br><h212>No test!</h212>		
	<%
		}
	} else { 	
		flag1=false;
%>
<br><h212>No company selected!!</h212>		
<%
	}
%>
</div>

</td></tr>
</table>    

<script>
   $(function () {
      $('#myTab li:eq(1) a').tab('show');
   });
</script>	
<% dbBean.CloseConnection(); %>
</body>
</html>	
