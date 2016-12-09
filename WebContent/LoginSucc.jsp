<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Company"%>
<%@ page language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
<TITLE>Online E-Hotel</TITLE>
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
<% 
DB db = new DB(); 
%>
<%
int cid = 0;
if(session.getAttribute("SelCompany")!=null)
	cid = Integer.parseInt(session.getAttribute("SelCompany").toString());

String compname1 = ""; 
String hdrscroll = "Online Quiz";
ArrayList<Company> llist99 = db.getCompanyById(cid);
Iterator iterator99 = llist99.iterator();
if (iterator99.hasNext()) {
while (iterator99.hasNext()) {
	Company linfo = (Company) iterator99.next();
	cid = linfo.getID();
	compname1 = linfo.getCompname();
	hdrscroll = compname1;
	hdrscroll += " " +  linfo.getCompaddr();
	hdrscroll += " " +  linfo.getContactno();
}
}
%>
<%
	String name = request.getParameter("Name");
	String password = request.getParameter("Pwd");
	String action =  request.getParameter("action");
	String slink = null;
	
	
	if(!action.equals("Admin"))
	{
		//dbBean.initDB();
		if(db.StudentLogin(name, password,cid))
		{
			session.setAttribute("loginapp", "true");
			session.setAttribute("studentuser",name);
			int sid = db.GetStudentByName(name, password);
			session.setAttribute("studentid",String.valueOf(sid));
			String suser = db.GetUserName(name,cid);
			session.setAttribute("studentnm",suser);
			slink = "Welcome.jsp?action=SucessfullLogin&type=Student";
			session.setAttribute("compicon", db.GetCmpImg(cid));
		}
		else
		{
			slink = "Welcome.jsp?action=FailedLogin&type=Student";
		}		
		//dbBean.CloseConnection();
	}
	else
	{
		if(db.AdmLoginCo(name, password,cid))
		{
			session.setAttribute("loginadm", "true");
			slink = "Welcome.jsp?action=SucessfullLogin&type=Admin";
			session.setAttribute("compicon", db.GetCmpImg(cid));
			System.out.println(db.GetCmpImg(cid));
		}
		else
		{
			slink = "Welcome.jsp?action=FailedLogin&type=Admin";
		}
	}
	response.sendRedirect(slink);
%>
<% db.CloseConnection(); %>
</body>
</html>