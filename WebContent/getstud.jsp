<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%> 
<%@ page import="com.software.onlexam.TestPaper"%>
<%@ page import="com.software.onlexam.CustomerInfo"%>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="java.util.*" %>
<%! int k; %> 
 
<% 
DB dbBean = new DB(); 
String str=request.getParameter("q");

k=Integer.parseInt(str);
%>
<select name="sstud">
<option value="0">Select</option>
<% 
ArrayList<TestPaper> alist = dbBean.getTestPaperByBid(k);
Iterator iterator2 = alist.iterator();
while (iterator2.hasNext()) {
	TestPaper ainfo = (TestPaper) iterator2.next();
	String sques = ainfo.getExamquest();
	String sans = ainfo.getExamans();
	StringTokenizer st12 = new StringTokenizer(sques,"-");
	String stoken12 = "";
	int idx12 = 0;
	
	if (st12.hasMoreElements())
	{
		while (st12.hasMoreTokens())
		{
			idx12++;
			st12.nextToken();
		}
	}
	
	StringTokenizer st13 = new StringTokenizer(sans,"-");
	String stoken13 = "";
	int idx13 = 0;
	
	if (st13.hasMoreElements())
	{
		while (st13.hasMoreTokens())
		{
			idx13++;
			st13.nextToken();
		}
	}
	
	if(idx12>0 && (idx12 == idx13)) {
	CustomerInfo cinfo = dbBean.getCustInfoById(ainfo.getSid());
	String sname = cinfo.stuname + " " + cinfo.stlname;	
%>
<option value="<%=ainfo.getID()%>"><%=sname%></option>
<% } } %>
</select> 
<% 
dbBean.CloseConnection(); 
%>
 