<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.*" %> 
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="com.software.onlexam.DB"%>
<%@ page import="com.software.onlexam.Company"%>
<%@ page import="com.software.onlexam.Batch"%>
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
       cellArrayLisstHolder.clear();

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

<%
FileUtil ft = new FileUtil();  
// JSP to handle  uploading
   int companyId=0;
List<String> lst = new ArrayList<String>();
lst.clear();
   // Create a new file upload handler 
   DiskFileUpload upload = new DiskFileUpload();
   String source = "";
   FileItem  file = null;
   // parse request
   List items = upload.parseRequest(request);
   Iterator iter = items.iterator();
   while (iter.hasNext()) {
       FileItem item = (FileItem) iter.next();
   if (!item.isFormField()) {
   // get uploaded file 
   file = (FileItem) items.get(0);
    source = file.getName();
   }
   else
   {
	   lst.add(item.getString());
   	
   }
   }
   //companyId = Integer.parseInt(lst.get(0));
   // get taget filename
   //FileItem  name = (FileItem) items.get(1);
   //String  target = name.getString();
   System.out.println(ft.getWebRootPath());
   String filePath = ft.getWebRootPath() + "upldfiles\\" + source;  
   //String filePath = "/home/gajananj/jvm/apache-tomcat-7.0.59/domains/altasoftware.biz/" + source; 
   File outfile = new File(filePath);
   file.write(outfile);
   
      
%>


<% 
String cmpic = "";
if(session.getAttribute("compicon")!=null)
	cmpic = session.getAttribute("compicon").toString();
String compname1 = "";
DB dbBean = new DB(); 

int cid = 0;
if(session.getAttribute("SelCompany")!=null)
	companyId = Integer.parseInt(session.getAttribute("SelCompany").toString());

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
boolean res=false;
if(session.getAttribute("clkbtn").toString().equals("false"))
{
session.setAttribute("clkbtn", "true");

//String filePath = request.getParameter("UpFile");
String fileName=ft.getWebRootPath() + "upldfiles\\" + source; 
//System.out.println(fileName);
    ArrayList dataHolder=readExcelFile(fileName);
       
    String ques="";
    String ans="";
    String chA="";
    String chB="";
    String chC="";
	String chD="";
	String chE="";
	String subTopic="";
	String Topic="";
	String lvl="";
	String opt1="";
	String opt2="";
	String opt3="";
	String opt4="";
	String opt5="";
	int sbatch=0;int comid=0;int stest=0;int stestscat=0;int lvlid=0;
          int count=0;
          ArrayList cellStoreArrayList=null;
			int isz = dataHolder.size();
			
          for(int i=1;i<isz;i++) {
             cellStoreArrayList=(ArrayList)dataHolder.get(i);
             ques=((HSSFCell)cellStoreArrayList.get(0)).toString();
             lvl=((HSSFCell)cellStoreArrayList.get(1)).toString();
             if(lvl.equalsIgnoreCase("Easy"))
          	   lvlid=1;
             else if(lvl.equalsIgnoreCase("Medium"))
          	   lvlid=2;
             else if(lvl.equalsIgnoreCase("Difficult"))
          	   lvlid=3;
             chA=((HSSFCell)cellStoreArrayList.get(2)).toString();
             opt1=((HSSFCell)cellStoreArrayList.get(3)).toString();
             chB=((HSSFCell)cellStoreArrayList.get(4)).toString();
             opt2=((HSSFCell)cellStoreArrayList.get(5)).toString();
             chC=((HSSFCell)cellStoreArrayList.get(6)).toString();
             opt3=((HSSFCell)cellStoreArrayList.get(7)).toString();
             chD=((HSSFCell)cellStoreArrayList.get(8)).toString();
             opt4=((HSSFCell)cellStoreArrayList.get(9)).toString();
             chE=((HSSFCell)cellStoreArrayList.get(10)).toString();
             opt5=((HSSFCell)cellStoreArrayList.get(11)).toString();
             ans="";            
             if(opt1.equalsIgnoreCase("T"))
          	   ans+="A";
             if(opt2.equalsIgnoreCase("T"))
          	   ans+="B";
             if(opt3.equalsIgnoreCase("T"))
          	   ans+="C";
             if(opt4.equalsIgnoreCase("T"))
          	   ans+="D";
             if(opt5.equalsIgnoreCase("T"))
               ans+="E";
             subTopic=((HSSFCell)cellStoreArrayList.get(12)).toString();
             Topic=((HSSFCell)cellStoreArrayList.get(13)).toString();
             comid=companyId;
             if(Topic.equals("") || subTopic.equals("") || ques.equals("") || 
            		 lvl.equals("") || chA.equals("") || opt1.equals("") ||
            		 chB.equals("") || opt2.equals(""))
             {
            	 ;            	 
             }
             else
             {
	             ArrayList<String> stlist =  dbBean.getTestListByCompId(comid);
	             if(stlist.contains(Topic.toUpperCase()))
	             {
	          	   stest = dbBean.getTestByName(Topic,comid);
	             }
	             else
	             {
	          	   dbBean.AddTest(Topic,comid);
	          	   stest = dbBean.getTestcatMaxByCompId(comid);
	             }
	             ArrayList<String> slist =  dbBean.getTestscatListByCompIdTestId(comid,stest);
	             if(slist.contains(subTopic.toUpperCase()))
	             {
	          	   stestscat = dbBean.getTestscatByName(subTopic,comid,stest);
	             }
	             else
	             {
	          	   dbBean.AddTestSubCat(subTopic,comid,stest);
	          	   stestscat = dbBean.getTestscatMaxByCompIdTestId(comid,stest);
	             }
	             if(!dbBean.isQuesExist(ques.toUpperCase(),comid,stest,stestscat))
	             {
	             	res = dbBean.AddQuestFromExcel(ques,ans,chA,chB,chC,
	             				chD,chE,comid,stest,stestscat,lvlid);
	             	
	             }
	             else
	             {
	            	 res = dbBean.UpdateQuestFromExcel(ans,chA,chB,chC,
	          				chD,chE,comid,stest,stestscat,lvlid,ques);
	            	 
	             }
             }
      	}
          
          ArrayList<Company> cm =  dbBean.getCompanyById(companyId);
          Iterator iterator2 = cm.iterator();
          if(iterator2.hasNext())
          {
          Company cinfo = (Company) iterator2.next();
          compname1 = cinfo.getCompname();
          } 
          if(res)
          {
        	  session.setAttribute("clkbtn", "false");
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

							
<table align="center" width="670" height="690">
							<tr align="center"><td align="center">
							
<%
if(session.getAttribute("clkbtn").toString().equals("false"))
{
if(res == true) { %>							
Question bank uploaded successfully!<br>
<% } else { %>
Question bank uploading failed!<br>
<% } } else { %>
Question bank uploaded successfully!<br>
<% } %>
</td></tr></table>
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


				
</body>
</html>