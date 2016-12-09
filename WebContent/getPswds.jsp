<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%> 
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="java.util.*" %>
 
<% 
DB dbBean = new DB(); 
int cid = 0;
if(session.getAttribute("SelCompany")!=null)
	cid = Integer.parseInt(session.getAttribute("SelCompany").toString());

String hdrscroll = "Online Quiz";
ArrayList<Company> llist99 = dbBean.getCompanyById(cid);
Iterator iterator99 = llist99.iterator();
if (iterator99.hasNext()) {
while (iterator99.hasNext()) {
	Company linfo = (Company) iterator99.next();
	cid = linfo.getID();
	hdrscroll = linfo.getCompname();
	hdrscroll += " " +  linfo.getCompaddr();
	hdrscroll += " " +  linfo.getContactno();
}
}
String str=request.getParameter("q"); 
%>
<% 

ArrayList<String> idlist = dbBean.getCustPassList(cid);
String smsg = "";
if(idlist.contains(str))
{
	smsg = "Password is already used!";
}
%>
<%=smsg%>
<% 
dbBean.CloseConnection(); 
%>
 