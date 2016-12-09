<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.*" %> 
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.CreateStudIds"%>
<%@ page import="com.software.onlexam.CustomerInfo"%>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.io.*" %>
<%@ page import ="java.io.FileNotFoundException" %>
<%@ page import ="java.io.IOException" %>
<%@ page import ="java.util.Iterator" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="javax.servlet.http.HttpServletRequest"%>
<%@ page import ="org.apache.poi.hssf.usermodel.HSSFCell" %>
<%@ page import ="org.apache.poi.hssf.usermodel.HSSFRow" %>
<%@ page import ="org.apache.poi.hssf.usermodel.HSSFSheet" %>
<%@ page import ="org.apache.poi.hssf.usermodel.HSSFWorkbook" %>
<%@ page import ="org.apache.poi.poifs.filesystem.POIFSFileSystem" %>
<%@page import="com.software.onlexam.FileUtil" %>
<!DOCTYPE HTML>
<html>
<head>
<TITLE>Online Exam</TITLE><title>Online Test</title>
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
<%!     
    public static ArrayList readExcelFile(String fileName)
    {
     /** --Define a ArrayList
        --Holds ArrayList Of Cells
      */
       ArrayList cellArrayLisstHolder = new ArrayList();

      try{
        /** Creating Input Stream**/
            FileInputStream myInput = new FileInputStream(fileName);

       /** Create a POIFSFileSystem object**/
       POIFSFileSystem myFileSystem = new POIFSFileSystem(myInput);

        /** Create a workbook using the File System**/
        HSSFWorkbook myWorkBook = new HSSFWorkbook(myFileSystem);

        /** Get the first sheet from workbook**/
         HSSFSheet mySheet = myWorkBook.getSheetAt(0);

        /** We now need something to iterate through the cells.**/
            Iterator rowIter = mySheet.rowIterator();
          while(rowIter.hasNext()){
            HSSFRow myRow = (HSSFRow) rowIter.next();
              Iterator cellIter = myRow.cellIterator();
            ArrayList cellStoreArrayList=new ArrayList();
               while(cellIter.hasNext()){
                  HSSFCell myCell = (HSSFCell) cellIter.next();
                  cellStoreArrayList.add(myCell);
              }
             cellArrayLisstHolder.add(cellStoreArrayList);
        }
       }catch (Exception e){e.printStackTrace(); }
       return cellArrayLisstHolder;
      }
%>
<%!     
    public static ArrayList<String> genStIds(String st1, ArrayList<String> vlist, int send,int noofstud
    		,ArrayList<String> mlist)
    {  
		int aStart = 0;
		int aEnd = send;
		int randomNumber =  0;
		Random aRandom = new Random();
		
		int cnt = 0;
		String gpswd = "";
	    int cntr = 0;
		while(cntr< noofstud)
		{
			//get the range, casting to long to avoid overflow problems
		    long range = (long)aEnd - (long)aStart + 1;
		    // compute a fraction of the range, 0 <= frac < range
		    long fraction = (long)(range * aRandom.nextDouble());
		    randomNumber =  (int)(fraction + aStart);
		        	
	    	if(cnt< 5) 
	    	{
	    		gpswd += "" + st1.charAt(randomNumber);
	    		cnt++;
	    		
	    	} 
	    	else 
	    	{
	    		gpswd += "" + st1.charAt(randomNumber);
	    		cnt++;
	    		//System.out.println("gpswd "+ gpswd);
	    		if(!vlist.contains(gpswd))
	    		{
	    			vlist.add(gpswd);
	    			mlist.add(gpswd);
	    			cntr++;
	    			//System.out.println(randomNumber);		    			    			
	    		}
	    		gpswd = "";
	    		cnt=0;		    		
	    	}
		} 
		return mlist;
    }
%>

<%
if(session.getAttribute("clkbtn").toString().equals("false"))
{
	session.setAttribute("clkbtn", "true");
   // JSP to handle  uploading
   FileUtil ft = new FileUtil();  
   
   // Create a new file upload handler 
   DiskFileUpload upload = new DiskFileUpload();
   
   // parse request
   List items = upload.parseRequest(request);
   
   // get uploaded file 
   FileItem  file = (FileItem) items.get(0);
   String source = file.getName();
   
   // get taget filename
   //FileItem  name = (FileItem) items.get(1);
   //String  target = name.getString();
   String filePath = ft.getWebRootPath() +"upldfiles/" + source; 
   //String filePath = "/home/gajananj/jvm/apache-tomcat-7.0.59/domains/altasoftware.biz/" + source; 
   File outfile = new File(filePath);
   file.write(outfile);
      
%>
<%
DB dbBean = new DB(); 
%>
<%
String cmpic = "";
if(session.getAttribute("compicon")!=null)
	cmpic = session.getAttribute("compicon").toString();
int cid = 0;
if(session.getAttribute("SelCompany")!=null)
	cid = Integer.parseInt(session.getAttribute("SelCompany").toString());

String compname1 = ""; 
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
String fileName=ft.getWebRootPath() +"upldfiles/" + source;
     //Read an Excel File and Store in a ArrayList
ArrayList dataHolder=readExcelFile(fileName);
   
String fname="";
String mname="";
String lname="";
String empid="";
ArrayList cellStoreArrayList=null;
ArrayList<CreateStudIds> tlist = new ArrayList<CreateStudIds>();
tlist.clear();
ArrayList<String> emplist = new ArrayList<String>();
emplist.clear();
ArrayList<CustomerInfo> clist = null;
//For inserting into database
for(int i=1;i<dataHolder.size();i++) 
{
   cellStoreArrayList=(ArrayList)dataHolder.get(i);
   fname=((HSSFCell)cellStoreArrayList.get(0)).toString();
   mname=((HSSFCell)cellStoreArrayList.get(1)).toString();
   lname=((HSSFCell)cellStoreArrayList.get(2)).toString();
   empid=((HSSFCell)cellStoreArrayList.get(3)).toString();
   String empid1 = "";
   if(empid.contains("."))
   {
	   double epid = Double.parseDouble(empid);
	   int emid = (int)epid;
	   empid = String.valueOf(emid);
	   empid1 = empid;
   }
   //System.out.println("empid1 "+empid1);
   if(!emplist.isEmpty())
   {
	   if(emplist.contains(empid))
	   {
		   empid = "Duplicate Employee Id!";		   
	   }	   	   
   }
   if(!empid.equals(""))
   {
   	   emplist.add(empid);
   }
   if(!empid1.equals(""))
   {
	   clist = dbBean.getIdsInfo(empid1,cid);
	   Iterator iterator1 = clist.iterator();
	   if (iterator1.hasNext()) 
	   {
			 while (iterator1.hasNext()) 
			 {
				CustomerInfo cinfo1 = (CustomerInfo) iterator1.next();
				CreateStudIds cinfo = new CreateStudIds();
					if(!empid.equals("Duplicate Employee Id!"))
					{
						cinfo.setSemail(cinfo1.stemail);
						cinfo.setPswd(cinfo1.stpass);
						cinfo.setFname(cinfo1.stuname);
						cinfo.setMname(cinfo1.stmname);
						cinfo.setLname(cinfo1.stlname);
						cinfo.setEmpid(empid);
					}
					else
				    {
						cinfo.setSemail("Not Generated!");
						cinfo.setPswd("Not Generated!");
						cinfo.setFname(fname);
						cinfo.setMname(mname);
						cinfo.setLname(lname);
						cinfo.setEmpid("Duplicate Employee Id!");
				    }
					tlist.add(cinfo);
				}
			//}
	 	}
   }
}
%>
<% dbBean.CloseConnection(); %>
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


							
<table align="center" width="670" height="490">
							<tr align="center"><td align="center">	
<% 
Iterator iterator2 = tlist.iterator();
	
	if (iterator2.hasNext()) {
%>
<div style="height: 490px; width: 670px overflow-y: auto">
<table align="center" width="670" height="490">
<thead>
<tr align="center" height="30"><td  align="center" colspan="7"><h3 class="consultant-services">List Student Ids</h3></TD></TR>
<TR  align="center" height="30">
<TD width="130" align="center" >Sr. No</TD>
<TD width="130" align="center" >Employee Id</TD>
<TD width="130" align="center" >First Name</TD>
<TD width="130" align="center" >Middle Name</TD>
<TD width="130" align="center" >Last Name</TD>
<TD width="130" align="center" >User Id</TD>
<TD width="130" align="center" >Password</TD>
</TR>
</thead>
<tbody>
<%		int v=0;
		int i=1;
		 while (iterator2.hasNext()) {
			 CreateStudIds winfo = (CreateStudIds) iterator2.next(); 
			 if(winfo != null) 
			 {
			 v++;
			 if(i%2==0)
			 {
			 %>
			 <TR   height="30" align="center">
			 <% 
			 }
			 else
			 {
			 %>
			 <TR   height="30" align="center">
			 <% 
			 }			  	
			 %>
<td align="center"><%=v%></td>
<td align="center"><%=winfo.getEmpid()%></td>
<td align="center"><%=winfo.getFname()%></td>
<td align="center"><%=winfo.getMname()%></td>
<td align="center"><%=winfo.getLname()%></td>
<td align="center"><%=winfo.getSemail()%></td>
<td align="center"><%=winfo.getPswd()%></td>
</TR>
<%
i++;
			 } else {
			if(i%2==0)
			 {
			 %>
			 <TR   height="30" align="center">
			 <% 
			 }
			 else
			 {
			 %>
			 <TR   height="30" align="center">
			 <% 
			 }			  	
			 %>
<td  align="center" colspan="5">Error retrieving Student Ids</TD></TR>
<%						 
			 }
} //while
	%>
</tbody>
</table>    
</div>
<%
session.setAttribute("clkbtn", "false");
} else { %>
<table align="center" width="590" height="30">
<TR align="center"><TD  align="center">You have supplied incorrect student list!</TD></TR>
</table>
<% } %>
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
			
		<% } %>
</body>
</html>




