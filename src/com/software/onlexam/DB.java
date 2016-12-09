package com.software.onlexam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.software.onlexam.CustQuery;
import com.software.onlexam.CustomerInfo;



public class DB {
	public Connection connection;
	public DB()
	{
		Context initContext;
		try {
			initContext = new InitialContext();
		
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/MedicalStoreDB5");
		this.connection = ds.getConnection();
		} catch (NamingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void CloseConnection()
	{
		try {
			if(connection!=null)
			connection.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
	}
	
	public boolean UpdateTeams(int teamno)
	{
		boolean result=false;
		
		try {
			String sql = "update teams set status='no' where teamname=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, teamno);	
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	public ArrayList<Team> getTeam(int teamno) 
	{	
		ArrayList<Team> clist = new ArrayList<Team>();
		try {
			String sql = "select marks from teams where teamname=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, teamno);	
			
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Team cinfo = new Team();
				cinfo.setTeamname(rs.getInt("teamname"));
				cinfo.setMarks(rs.getInt("marks"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<String> getQuestion(int comno,int testno,int testscatno, int lvlid) 
	{	
		ArrayList<String> clist = new ArrayList<String>();
		try {
			String sql = "select * from Question where compid=? and" +
					" testid=? and testsubcatid=? and lvl=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			//s.setInt(1, quesno);
			s.setInt(1, comno);
			s.setInt(2, testno);
			s.setInt(3, testscatno);
			s.setInt(4, lvlid);
			
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				//Question cinfo = new Question();
				/*cinfo.setQno(rs.getInt("qno"));
				cinfo.setQuestion(rs.getString("question"));
				cinfo.setAnswer(rs.getString("answer"));
				cinfo.setCh1(rs.getString("ch1"));
				cinfo.setCh2(rs.getString("ch2"));
				cinfo.setCh3(rs.getString("ch3"));
				cinfo.setCh4(rs.getString("ch4"));*/
				//cinfo.setBatchid(rs.getInt("batchid"));
				/*cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
				cinfo.setLevel(rs.getInt("lvl"));*/
				clist.add(String.valueOf(rs.getInt("qno")));
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public boolean UpdateTeams1(int marks,int teamno)
	{
		boolean result=false;
		
		try {
			String sql = "update teams set marks=?,status='no' where teamname=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, marks);	
			s.setInt(2, teamno);	
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean DeleteAdmin()
	{
		boolean result=false;
		
		try {
			String sql = "delete from admin";
			PreparedStatement s = connection.prepareStatement(sql);
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	public boolean DeleteTeams()
	{
		boolean result=false;
		
		try {
			String sql = "delete from teams";
			PreparedStatement s = connection.prepareStatement(sql);
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	public boolean UpdateTeams2(int teamno)
	{
		boolean result=false;
		
		try {
			String sql = "update teams set status='yes' where teamname=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, teamno);	
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	public boolean UpdateAdmin(int oldmaxscore, int newquizno)
	{
		boolean result=false;
		
		try {
			String sql = "update admin set status='no',maxscore=? where quizno=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, oldmaxscore);
			s.setInt(2, newquizno);
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean AddAdmin(int quiznum,int noteams,int marksperq, int negscore,
			int noques, int passmarks)
	{
		boolean result=false;
		
		try {
			String sql = "insert into admin(quizno,noteams,marksperq,negscore,"+
			"noques,passmarks,maxscore,status) values(?,?,?,?,?,?,0,'yes')";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, quiznum);
			s.setInt(2, noteams);
			s.setInt(3, marksperq);
			s.setInt(4, negscore);
			s.setInt(5, noques);
			s.setInt(6, passmarks);
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	public boolean AddTeam(int n,int marks,int comno,int testno,int testscatno,int batchno,
			String teststatus,int passmarks)
	{
		boolean result=false;
		
		try {
			String sql = "insert into teams(teamname,marks,compid,testid,testsubcatid,batchid,teststatus,passmarks) " +
					"values(?,?,?,?,?,?,?,?)";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, n);
			s.setInt(2, marks);
			s.setInt(3, comno);
			s.setInt(4, testno);
			s.setInt(5, testscatno);
			s.setInt(6, batchno);
			s.setString(7, ReplQuotes(teststatus));
			s.setInt(8, passmarks);
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	public ArrayList<Team> getTeam1(int comno,int testno,int testscatno,int batchno,String teststat1) 
	{	
		ArrayList<Team> clist = new ArrayList<Team>();
		try {
			String sql = "select * from teams where compid=? and testid=? and testsubcatid=?" +
					" and batchid=? and teststatus=? order by marks desc";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, comno);
			s.setInt(2, testno);
			s.setInt(3, testscatno);
			s.setInt(4, batchno);
			s.setString(5, teststat1);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Team cinfo = new Team();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setTeamname(rs.getInt("teamname"));
				cinfo.setMarks(rs.getInt("marks"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
				cinfo.setBatchid(rs.getInt("batchid"));
				cinfo.setTeststatus(rs.getString("teststatus"));
				cinfo.setPassmarks(rs.getInt("passmarks"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public int getMarksMax(int comno,int testno,int testscatno,int batchno,String teststat1) 
	{	
		int m=0;
		try {
			String sql = "select max(marks) from teams where compid=? and testid=? and testsubcatid=?" +
					" and batchid=? and teststatus=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, comno);
			s.setInt(2, testno);
			s.setInt(3, testscatno);
			s.setInt(4, batchno);
			s.setString(5, teststat1);
			
			ResultSet rs = s.executeQuery();
			if(rs.next()) {
				m=rs.getInt(1);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return m;
	}
	public ArrayList<Team> getTeam2(int passmarks) 
	{	
		ArrayList<Team> clist = new ArrayList<Team>();
		try {
			String sql = "select teamname from teams where marks>=? order by marks desc";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, passmarks);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Team cinfo = new Team();
				cinfo.setTeamname(rs.getInt("teamname"));
				cinfo.setMarks(rs.getInt("marks"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public boolean StudentLogin(String uname, String pass, int cid)
	{
		boolean result=false;
		
		try {
			String sql = "SELECT * FROM Reg where stemail=? and stpass=? and status=?" +
					" and compid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, uname);
			s.setString(2, pass);
			s.setString(3, "Not Submitted");
			s.setInt(4, cid);
						
			ResultSet rs = s.executeQuery();
			if (rs.next()) 
			{
				result=true;
			}
			else
			{
				result=false;
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean AddQueries(String name,String semail,String sub,String msg,int cid)
	{
		boolean result=false;
		int val=0;
		try {
		String sql = "insert into CustQuery (name, semail, sub, msg, compid) " +
			"values(?,?,?,?,?)";
		PreparedStatement s = connection.prepareStatement(sql);
		s.setString(1, ReplQuotes(name));
		s.setString(2, ReplQuotes(semail));
		s.setString(3, ReplQuotes(sub));
		s.setString(4, ReplQuotes(msg));
		s.setInt(5, cid);
				
		val = s.executeUpdate();
		
		if (val>01) 
		{
			result=true;
		}
		else
		{
			result=false;
		}
		s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();			
		}
		return result;
	}
	
	public String GetUserName(String uname, int cid)
	{
		String supass=null;
		
		try {
			String sql = "SELECT stuname,stlname FROM Reg where stemail=? and compid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, uname);
			s.setInt(2, cid);
			
			ResultSet rs = s.executeQuery();
			if (rs.next()) 
			{
				supass=rs.getString("stuname") + " " +
				rs.getString("stlname");
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return supass;
	}
	
	public ArrayList<CustQuery> getCQueryListByCriteria(String name,
			String sub,int cid)
	{
		ArrayList<CustQuery> m = new ArrayList<CustQuery>();
		String sql = null;
		if((name!=null && !name.equals("")))
		{
			if((sub!=null && !sub.equals("")))
			{
				sql = "SELECT * FROM CustQuery" +
				" Where name like '%" + name + "%'" +
				" And sub like '%" +sub + "%'" + 
				" And compid="+cid;
			} //co<>null
			else
			{
				sql = "SELECT * FROM CustQuery" +
				" Where name like '%" + name + "%'" +
				" And compid="+cid;
			}
		}
		else
		{
			if((sub!=null && !sub.equals("")))
			{
				sql = "SELECT * FROM CustQuery" +
				" Where sub like '%" + sub + "%'" +
				" And compid="+cid;
			}
		}
		
		try 
		{
			PreparedStatement s = connection.prepareStatement(sql);
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				CustQuery tut = new CustQuery();
				tut.setID(rs.getInt("ID"));
				tut.setName(rs.getString("name"));
				tut.setSemail(rs.getString("semail"));
				tut.setSub(rs.getString("sub"));
				tut.setMsg(rs.getString("msg"));
				tut.setCompid(rs.getInt("compid"));
				m.add(tut);
			}
			rs.close();
			s.close();
			
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return m;
	}
	
	public ArrayList<CustQuery> GetCustQuery(int cid)
	{
		ArrayList<CustQuery> m = new ArrayList<CustQuery>();
		
		try {
			String sql = "SELECT * FROM CustQuery where compid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, cid);
			
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				CustQuery tut = new CustQuery();
				tut.setID(rs.getInt("ID"));
				tut.setName(rs.getString("name"));
				tut.setSemail(rs.getString("semail"));
				tut.setSub(rs.getString("sub"));
				tut.setMsg(rs.getString("msg"));
				tut.setCompid(rs.getInt("compid"));
				m.add(tut);
			}
			
			rs.close();
			s.close();
			
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return m;
	}
	
	public CustQuery GetCustQueryInfo(int Id,int cid)
	{
		CustQuery tut = new CustQuery();
		try {
			String sql = "SELECT * FROM CustQuery where ID=? and compid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, Id);
			s.setInt(2, cid);
			
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				tut.setID(rs.getInt("ID"));
				tut.setName(rs.getString("name"));
				tut.setSemail(rs.getString("semail"));
				tut.setSub(rs.getString("sub"));
				tut.setMsg(rs.getString("msg"));
				tut.setCompid(rs.getInt("compid"));
			}
			
			rs.close();
			s.close();
			
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return tut;
	}
	
	public boolean DeleteCustomer(int Id)
	{
		boolean result=false;
						
		try {
			String sql6 = "delete from TestPaper where sid=?";
			PreparedStatement s6 = connection.prepareStatement(sql6);
			s6.setInt(1, Id);
			
			int rs6 = s6.executeUpdate();
			s6.close();
			}
		catch (SQLException e) {
			e.printStackTrace();
			}
		
		try {
			String sql5 = "delete from teams where teamname=?";
			PreparedStatement s5 = connection.prepareStatement(sql5);
			s5.setInt(1, Id);
			
			int rs5 = s5.executeUpdate();
			s5.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
			}
		
		try {
			String sql = "DELETE from Reg where Id=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, Id);
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;								
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<CustomerInfo> getCustListByName(String name, int cid)
	{
		ArrayList<CustomerInfo> custlist = new ArrayList<CustomerInfo>();
		
		try {
			String sql = "SELECT * FROM Reg" +
					" WHERE compid="+cid+" and ((stuname LIKE '%"+ name.trim()+"%'" +
					" OR stmname LIKE '%"+ name.trim()+"%'" +
					" OR stlname LIKE '%"+ name.trim()+"%'))";
			PreparedStatement s = connection.prepareStatement(sql);
			
			
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				CustomerInfo cust = new CustomerInfo();
				cust.id = rs.getInt("ID");
				cust.stuname = rs.getString("stuname");
				cust.stmname = rs.getString("stmname");
				cust.stlname = rs.getString("stlname");
				cust.stemail = rs.getString("stemail");
				cust.stgender = rs.getString("stgender");
				cust.stpass = rs.getString("stpass");
				cust.stcpass = rs.getString("stcpass");
				cust.stmobile = rs.getString("stmobile");
				cust.stage = rs.getString("stage");
				cust.staddress = rs.getString("staddress");
				cust.empid = rs.getString("empid");
				cust.status = rs.getString("status");
				cust.compid = rs.getInt("compid");
				custlist.add(cust);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return custlist;
	}
	
	public ArrayList<CustomerInfo> getCustList(int cid)
	{
		ArrayList<CustomerInfo> custlist = new ArrayList<CustomerInfo>();
		
		try {
			String sql = "SELECT * FROM Reg where compid="+cid;
			PreparedStatement s = connection.prepareStatement(sql);
			
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				CustomerInfo cust = new CustomerInfo();
				cust.id = rs.getInt("ID");
				cust.stuname = rs.getString("stuname");
				cust.stmname = rs.getString("stmname");
				cust.stlname = rs.getString("stlname");
				cust.stemail = rs.getString("stemail");
				cust.stgender = rs.getString("stgender");
				cust.stpass = rs.getString("stpass");
				cust.stcpass = rs.getString("stcpass");
				cust.stmobile = rs.getString("stmobile");
				cust.stage = rs.getString("stage");
				cust.staddress = rs.getString("staddress");
				cust.empid = rs.getString("empid");
				cust.status = rs.getString("status");
				cust.compid = rs.getInt("compid");
				custlist.add(cust);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return custlist;
	}
	
	public boolean ResetPswd(String uname,String upass,String cpass, int cid)
	{
		boolean result=false;
		
		try {
			String sql = "UPDATE Reg set stpass=?, stcpass=? where stemail=?" +
					" and compid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, ReplQuotes(upass));
			s.setString(2, ReplQuotes(cpass));
			s.setString(3, uname);
			s.setInt(4, cid);
						
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;								
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public CustomerInfo getCustInfo(String uname, int cid)
	{
		CustomerInfo cust = new CustomerInfo();
		
		try {
			String sql = "SELECT * FROM Reg where stemail=? and compid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, uname);
			s.setInt(2, cid);
			
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				cust.id = rs.getInt("ID");
				cust.stuname = rs.getString("stuname");
				cust.stmname = rs.getString("stmname");
				cust.stlname = rs.getString("stlname");
				cust.stemail = rs.getString("stemail");
				cust.stgender = rs.getString("stgender");
				cust.stpass = rs.getString("stpass");
				cust.stcpass = rs.getString("stcpass");
				cust.stmobile = rs.getString("stmobile");
				cust.stage = rs.getString("stage");
				cust.staddress = rs.getString("staddress");
				cust.empid = rs.getString("empid");
				cust.status = rs.getString("status");
				cust.compid = rs.getInt("compid");
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return cust;
	}
	
	public boolean AddQuest(String ques,String ans,String chA,String chB, String chC,
			String chD,String chE,int comid,int stest,int stestscat,int lvlid)
	{
		boolean result=false;
		
		try {
			String sql = "INSERT INTO" +
					" Question (question,answer,ch1,ch2,ch3,ch4,ch5,compid,testid,testsubcatid,lvl)" +
					" VALUES ('"+ReplQuotes(ques)+ "','"+ReplQuotes(ans)+ "','"+
					ReplQuotes(chA)+ "','"+ReplQuotes(chB)+ "','"+ReplQuotes(chC)+
					"','"+ReplQuotes(chD)+"','"+ReplQuotes(chE)+ "',"+comid+","+stest
					+","+stestscat+","+lvlid+")";
			
			
			PreparedStatement s = connection.prepareStatement(sql);
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean DeleteQuest(int qno)
	{
		boolean result=false;
		
		try {
			String sql = "delete from Question where qno=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, qno);
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Question> getQuestionById(int qno) 
	{	
		ArrayList<Question> clist = new ArrayList<Question>();
		try {
			String sql = "select * from Question where qno=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, qno);
			
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Question cinfo = new Question();
				cinfo.setQno(rs.getInt("qno"));
				cinfo.setQuestion(rs.getString("question"));
				cinfo.setAnswer(rs.getString("answer"));
				cinfo.setCh1(rs.getString("ch1"));
				cinfo.setCh2(rs.getString("ch2"));
				cinfo.setCh3(rs.getString("ch3"));
				cinfo.setCh4(rs.getString("ch4"));
				cinfo.setCh5(rs.getString("ch5"));
				//cinfo.setBatchid(rs.getInt("batchid"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
				cinfo.setLevel(rs.getInt("lvl"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public boolean AddQuiz(int marksperq,int negscore,int noques,
			int passmarks,int maxscore,String qname)
	{
		boolean result=false;
		
		try {
			String sql = "insert into Quiz(marksperq,negscore,noques,passmarks,"+
			"maxscore,quizname) values(?,?,?,?,?,?)";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, marksperq);
			s.setInt(2, negscore);
			s.setInt(3, noques);
			s.setInt(4, passmarks);
			s.setInt(5, maxscore);
			s.setString(6, ReplQuotes(qname));
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean DeleteQuiz(int qno)
	{
		boolean result=false;
		
		try {
			String sql = "delete from Quiz where quizno=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, qno);
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Quiz> getAllQuiz() 
	{	
		ArrayList<Quiz> clist = new ArrayList<Quiz>();
		try {
			String sql = "select * from Quiz";
						
			PreparedStatement s = connection.prepareStatement(sql);
				
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Quiz cinfo = new Quiz();
				cinfo.setQuizno(rs.getInt("quizno"));
				cinfo.setMarksperq(rs.getInt("marksperq"));
				cinfo.setNegscore(rs.getInt("negscore"));
				cinfo.setNoques(rs.getInt("noques"));
				cinfo.setPassmarks(rs.getInt("passmarks"));
				cinfo.setMaxscore(rs.getInt("maxscore"));
				cinfo.setQuizname(rs.getString("quizname"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public boolean DeleteTeam1(int ID)
	{
		boolean result=false;
		
		try {
			String sql = "delete from teams where ID=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, ID);
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Quiz> GetQuizById(int quizno) 
	{	
		ArrayList<Quiz> clist = new ArrayList<Quiz>();
		try {
			String sql = "select * from Quiz where quizno=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, quizno);
			
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Quiz cinfo = new Quiz();
				cinfo.setQuizno(rs.getInt("quizno"));
				cinfo.setMarksperq(rs.getInt("marksperq"));
				cinfo.setNegscore(rs.getInt("negscore"));
				cinfo.setNoques(rs.getInt("noques"));
				cinfo.setPassmarks(rs.getInt("passmarks"));
				cinfo.setMaxscore(rs.getInt("maxscore"));
				cinfo.setQuizname(rs.getString("quizname"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public int GetStudentByName(String uname, String pass)
	{
		int result=0;
		
		try {
			String sql = "SELECT * FROM Reg where stemail=? and stpass=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, uname);
			s.setString(2, pass);
						
			ResultSet rs = s.executeQuery();
			if (rs.next()) 
			{
				result=rs.getInt("ID");
			}
			
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean UpdateQuestion(String ques,String chA,String chB,String chC,
			String chD,String chE,String ans,int lvl1,int qno)
	{
		boolean result=false;
		
		try {
			String sql = "update Question set question=?,answer=?,ch1=?,ch2=?,ch3=?,ch4=?," +
					"ch5=?,lvl=? where qno=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, ReplQuotes(ques));
			s.setString(2, ReplQuotes(ans));
			s.setString(3, ReplQuotes(chA));
			s.setString(4, ReplQuotes(chB));
			s.setString(5, ReplQuotes(chC));
			s.setString(6, ReplQuotes(chD));
			s.setString(7, ReplQuotes(chE));
			s.setInt(8, lvl1);	
			s.setInt(9, qno);	
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean UpdateQuiz(String qname,int marksperq,int negscore,int noques,
			int passmarks,int maxscore,int quizno)
	{
		boolean result=false;
		
		try {
			String sql = "update Quiz set marksperq=?,negscore=?,noques=?," +
					"passmarks=?,maxscore=?,quizname=? where quizno=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, marksperq);
			s.setInt(2, negscore);
			s.setInt(3, noques);
			s.setInt(4, passmarks);
			s.setInt(5, maxscore);
			s.setString(6, ReplQuotes(qname));
			s.setInt(7, quizno);	
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public CustomerInfo getCustInfoById(int ID)
	{
		CustomerInfo cust = new CustomerInfo();
		
		try {
			String sql = "SELECT * FROM Reg where ID=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, ID);
			
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				cust.id = rs.getInt("ID");
				cust.stuname = rs.getString("stuname");
				cust.stmname = rs.getString("stmname");
				cust.stlname = rs.getString("stlname");
				cust.stemail = rs.getString("stemail");
				cust.stgender = rs.getString("stgender");
				cust.stpass = rs.getString("stpass");
				cust.stcpass = rs.getString("stcpass");
				cust.stmobile = rs.getString("stmobile");
				cust.stage = rs.getString("stage");
				cust.staddress = rs.getString("staddress");
				cust.empid = rs.getString("empid");
				cust.status = rs.getString("status");
				cust.compid = rs.getInt("compid");
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return cust;
	}
	
	public boolean StudentReg(String stname,String stmname,String stlname,
			  String email,String gender,String password,
			  String cpassword,String mobile,
			  String stage,String staddress,String eid,String status,int cid)
	{
		boolean result=false;
		int val=0;
				
		try {
		String sql = "insert into Reg (stuname, stmname, stlname," +
			"stemail, stgender,stpass, stcpass, stmobile," +
			"stage,staddress,empid,status,compid) values(?,?,?,?,?," +
			"?,?,?,?,?,?,?,?)";
		PreparedStatement s = connection.prepareStatement(sql);
		s.setString(1, ReplQuotes(stname));
		s.setString(2, ReplQuotes(stmname));
		s.setString(3, ReplQuotes(stlname));
		s.setString(4, ReplQuotes(email));
		s.setString(5, ReplQuotes(gender));
		s.setString(6, ReplQuotes(password));
		s.setString(7, ReplQuotes(cpassword));
		s.setString(8, ReplQuotes(mobile));
		s.setString(9, ReplQuotes(stage));
		s.setString(10, ReplQuotes(staddress));
		s.setString(11, ReplQuotes(eid));
		s.setString(12, ReplQuotes(status));
		s.setInt(13,cid);
				
		val = s.executeUpdate();
		if (val>0) 
		{
			result=true;
		}
		else
		{
			result=false;
		}
		s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();			
		}
		return result;
	}
	
	public boolean updateCustInfo(CustomerInfo cust ,String eid, int cid)
	{	
		boolean result = false;
		
		try {
			String sql = "UPDATE Reg set stuname=?,stmname=?,stlname=?,stemail=?,stgender=?,stpass=?,stcpass=?,stmobile=?,stage=?,staddress=? where empid=? and compid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, ReplQuotes(cust.stuname));
			s.setString(2, ReplQuotes(cust.stmname));
			s.setString(3, ReplQuotes(cust.stlname));
			s.setString(4, ReplQuotes(cust.stemail));
			s.setString(5, ReplQuotes(cust.stgender));
			s.setString(6, ReplQuotes(cust.stpass));
			s.setString(7, ReplQuotes(cust.stcpass));
			s.setString(8, ReplQuotes(cust.stmobile));
			s.setString(9, ReplQuotes(cust.stage));
			s.setString(10, ReplQuotes(cust.staddress));
			s.setString(11, eid);
			s.setInt(12, cid);
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
				result=false;
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Team> getCustInfoByMarks(int mk,int comno,int testno,
			int testscatno,int batchno,String teststat1) 
	{	
		ArrayList<Team> clist = new ArrayList<Team>();
		try {
			String sql = "select * from teams where marks=? and compid=? and testid=? and testsubcatid=?" +
					" and batchid=? and teststatus=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, mk);
			s.setInt(2, comno);
			s.setInt(3, testno);
			s.setInt(4, testscatno);
			s.setInt(5, batchno);
			s.setString(6, teststat1);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Team cinfo = new Team();
				cinfo.setTeamname(rs.getInt("teamname"));
				cinfo.setMarks(rs.getInt("marks"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public int getMaxQuest(int comno,int testno,int testscatno) 
	{	
		int m=0;
		try {
			String sql = "select max(qno) from Question where compid=? and testid=? and testsubcatid=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, comno);
			s.setInt(2, testno);
			s.setInt(3, testscatno);
						
			ResultSet rs = s.executeQuery();
			if(rs.next()) {
				m=rs.getInt(1);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return m;
	}
	
	public int getMinQuest(int comno,int testno,int testscatno) 
	{	
		int m=0;
		try {
			String sql = "select min(qno) from Question where compid=? and testid=? and testsubcatid=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, comno);
			s.setInt(2, testno);
			s.setInt(3, testscatno);
						
			ResultSet rs = s.executeQuery();
			if(rs.next()) {
				m=rs.getInt(1);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return m;
	}
	
	public boolean AddCompany(String comname, String caddr, String contactno)
	{
		boolean result=false;
		
		try {
			String sql = "insert into CompanyTable(compname,compaddr,contactno) " +
					"values(?,?,?)";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, ReplQuotes(comname));
			s.setString(2, ReplQuotes(caddr));
			s.setString(3, ReplQuotes(contactno));
						
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Company> getCompany() 
	{	
		ArrayList<Company> clist = new ArrayList<Company>();
		try {
			String sql = "select * from CompanyTable";
						
			PreparedStatement s = connection.prepareStatement(sql);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Company cinfo = new Company();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setCompname(rs.getString("compname"));
				cinfo.setCompaddr(rs.getString("compaddr"));
				cinfo.setContactno(rs.getString("contactno"));
				cinfo.setStatus(rs.getString("status"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public boolean AddTest(String testname,int comid)
	{
		boolean result=false;
		
		try {
			String sql = "insert into Testcat(testname,compid) " +
					"values(?,?)";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, ReplQuotes(testname));
			s.setInt(2, comid);
									
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Test> getTestByComp(int compid) 
	{	
		ArrayList<Test> clist = new ArrayList<Test>();
		try {
			String sql = "select * from Testcat where compid=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, compid);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Test cinfo = new Test();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setTestname(rs.getString("testname"));
				cinfo.setCompid(rs.getInt("compid"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public boolean AddTestSubCat(String TestSubCatname, int comid, int testid)
	{
		boolean result=false;
		
		try {
			String sql = "insert into Testsubcat(testsubcatname,compid,testid) " +
					"values(?,?,?)";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, ReplQuotes(TestSubCatname));
			s.setInt(2, comid);
			s.setInt(3, testid);
									
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<TestSubCat> getTscatByComp(int compid, int testid) 
	{	
		ArrayList<TestSubCat> clist = new ArrayList<TestSubCat>();
		try {
			String sql = "select * from Testsubcat where compid=? and testid=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, compid);
			s.setInt(2, testid);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				TestSubCat cinfo = new TestSubCat();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setTestsubcatname(rs.getString("testsubcatname"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public boolean AddBatch(String Batchname, int comid,int testid,int testscatid, int marksperq,
			int negscore, int passmarks, int maxscore, int timeperquest,
			int lvl1,int lvl2,int lvl3)
	{
		boolean result=false;
		
		try {
			String sql = "insert into Batch(batchname,compid,testid,testsubcatid,marksperq," +
					"negscore,passmarks,maxscore,timeperquest,L1,L2,L3) " +
					"values(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, ReplQuotes(Batchname));
			s.setInt(2, comid);
			s.setInt(3, testid);
			s.setInt(4, testscatid);
			s.setInt(5, marksperq);
			s.setInt(6, negscore);
			s.setInt(7, passmarks);
			s.setInt(8, maxscore);
			s.setInt(9, timeperquest);
			s.setInt(10, lvl1);
			s.setInt(11, lvl2);
			s.setInt(12, lvl3);
			
									
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean DeleteCompany(int Companyno)
	{
		boolean result=true;
		
		ArrayList<String> blist = getBatchIdsByCompId(Companyno);
		int sz = blist.size();
		for(int k=0;k<sz;k++)
		{
			int bid = Integer.parseInt(blist.get(k));
			DeleteTestPaper(bid);
		}
		try {
			String sql5 = "delete from teams where compid=?";
			PreparedStatement s5 = connection.prepareStatement(sql5);
			s5.setInt(1, Companyno);
			
			int rs5 = s5.executeUpdate();
			s5.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
			}
		try {
			String sql4 = "delete from Question where compid=?";
			PreparedStatement s4 = connection.prepareStatement(sql4);
			s4.setInt(1, Companyno);
			
			int rs4 = s4.executeUpdate();
			s4.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		try {
			String sql3 = "delete from Batch where compid=?";
			PreparedStatement s3 = connection.prepareStatement(sql3);
			s3.setInt(1, Companyno);
			
			int rs3 = s3.executeUpdate();
			s3.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		try {
			String sql2 = "delete from Testsubcat where compid=?";
			PreparedStatement s2 = connection.prepareStatement(sql2);
			s2.setInt(1, Companyno);
			
			int rs2 = s2.executeUpdate();
			s2.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		try {
			String sql1 = "delete from Testcat where compid=?";
			PreparedStatement s1 = connection.prepareStatement(sql1);
			s1.setInt(1, Companyno);
			
			int rs1 = s1.executeUpdate();
			s1.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		try {
			String sql = "delete from CompanyTable where ID=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, Companyno);
			
			int rs = s.executeUpdate();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean DeleteTest(int Testno)
	{
		boolean result=true;
		
		ArrayList<String> blist = getBatchIdsByTestId(Testno);
		int sz = blist.size();
		for(int k=0;k<sz;k++)
		{
			int bid = Integer.parseInt(blist.get(k));
			DeleteTestPaper(bid);
		}
		try {
			String sql5 = "delete from teams where testid=?";
			PreparedStatement s5 = connection.prepareStatement(sql5);
			s5.setInt(1, Testno);
			
			int rs5 = s5.executeUpdate();
			s5.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
			}
		try {
			String sql4 = "delete from Question where testid=?";
			PreparedStatement s4 = connection.prepareStatement(sql4);
			s4.setInt(1, Testno);
			
			int rs4 = s4.executeUpdate();
			s4.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		try {
			String sql3 = "delete from Batch where testid=?";
			PreparedStatement s3 = connection.prepareStatement(sql3);
			s3.setInt(1, Testno);
			
			int rs3 = s3.executeUpdate();
			s3.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		try {
			String sql2 = "delete from Testsubcat where testid=?";
			PreparedStatement s2 = connection.prepareStatement(sql2);
			s2.setInt(1, Testno);
			
			int rs2 = s2.executeUpdate();
			s2.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		try {
			String sql = "delete from Testcat where ID=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, Testno);
			
			int rs = s.executeUpdate();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Company> getCompanyById(int comid) 
	{	
		ArrayList<Company> clist = new ArrayList<Company>();
		try {
			String sql = "select * from CompanyTable where ID=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, comid);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Company cinfo = new Company();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setCompname(rs.getString("compname"));
				cinfo.setCompaddr(rs.getString("compaddr"));
				cinfo.setContactno(rs.getString("contactno"));
				cinfo.setStatus(rs.getString("status"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public boolean DeleteTestSubCat(int TestSubCatno)
	{
		boolean result=true;
		
		ArrayList<String> blist = getBatchIdsByTestscatId(TestSubCatno);
		int sz = blist.size();
		for(int k=0;k<sz;k++)
		{
			int bid = Integer.parseInt(blist.get(k));
			DeleteTestPaper(bid);
		}
		try {
			String sql5 = "delete from teams where testsubcatid=?";
			PreparedStatement s5 = connection.prepareStatement(sql5);
			s5.setInt(1, TestSubCatno);
			
			int rs5 = s5.executeUpdate();
			s5.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
			}
		try {
			String sql4 = "delete from Question where testsubcatid=?";
			PreparedStatement s4 = connection.prepareStatement(sql4);
			s4.setInt(1, TestSubCatno);
			
			int rs4 = s4.executeUpdate();
			s4.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		try {
			String sql3 = "delete from Batch where testsubcatid=?";
			PreparedStatement s3 = connection.prepareStatement(sql3);
			s3.setInt(1, TestSubCatno);
			
			int rs3 = s3.executeUpdate();
			s3.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			String sql = "delete from Testsubcat where ID=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, TestSubCatno);
			
			int rs = s.executeUpdate();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Test> getTestById(int Id) 
	{	
		ArrayList<Test> clist = new ArrayList<Test>();
		try {
			String sql = "select * from Testcat where ID=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, Id);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Test cinfo = new Test();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setTestname(rs.getString("testname"));
				cinfo.setCompid(rs.getInt("compid"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public boolean DeleteBatch(int Batchno)
	{
		boolean result=false;
		
		DeleteTestPaper(Batchno);
		
		try {
			String sql5 = "delete from teams where batchid=?";
			PreparedStatement s5 = connection.prepareStatement(sql5);
			s5.setInt(1, Batchno);
			
			int rs5 = s5.executeUpdate();
			s5.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
			}
		try {
			String sql = "delete from Batch where ID=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, Batchno);
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Batch> getBatchByComp(int compid, int testid, int testscatid) 
	{	
		ArrayList<Batch> clist = new ArrayList<Batch>();
		try {
			String sql = "select * from Batch where compid=? and testid=? and testsubcatid=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, compid);
			s.setInt(2, testid);
			s.setInt(3, testscatid);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Batch cinfo = new Batch();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setBatchname(rs.getString("batchname"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
				cinfo.setMarksperq(rs.getInt("marksperq"));
				cinfo.setNegscore(rs.getInt("negscore"));
				cinfo.setPassmarks(rs.getInt("passmarks"));
				cinfo.setMaxscore(rs.getInt("maxscore"));
				cinfo.setTimeperquest(rs.getInt("timeperquest"));
				cinfo.setL1(rs.getInt("L1"));
				cinfo.setL2(rs.getInt("L2"));
				cinfo.setL3(rs.getInt("L3"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<TestSubCat> getTestscatById(int Id) 
	{	
		ArrayList<TestSubCat> clist = new ArrayList<TestSubCat>();
		try {
			String sql = "select * from Testsubcat where ID=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, Id);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				TestSubCat cinfo = new TestSubCat();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setTestsubcatname(rs.getString("testsubcatname"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public boolean updateCompany(String comname1,String addr1,String cno1,int Companyno)
	{	
		boolean result = false;
		
		try {
			String sql = "UPDATE CompanyTable set compname=?,compaddr=?,contactno=? where ID=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, ReplQuotes(comname1));
			s.setString(2, ReplQuotes(addr1));
			s.setString(3, ReplQuotes(cno1));
			s.setInt(4, Companyno);
						
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
				result=false;
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean updateTest(String testname1,int Testno)
	{	
		boolean result = false;
		
		try {
			String sql = "UPDATE Testcat set testname=? where ID=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, ReplQuotes(testname1));
			s.setInt(2, Testno);
									
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
				result=false;
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean updateTestSubCat(String TestSubCatname1,int TestSubCatno)
	{	
		boolean result = false;
		
		try {
			String sql = "UPDATE Testsubcat set testsubcatname=? where ID=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, ReplQuotes(TestSubCatname1));
			s.setInt(2, TestSubCatno);
									
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
				result=false;
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Batch> getBatchById(int Id) 
	{	
		ArrayList<Batch> clist = new ArrayList<Batch>();
		try {
			String sql = "select * from Batch where ID=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, Id);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Batch cinfo = new Batch();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setBatchname(rs.getString("batchname"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
				cinfo.setMarksperq(rs.getInt("marksperq"));
				cinfo.setNegscore(rs.getInt("negscore"));
				cinfo.setPassmarks(rs.getInt("passmarks"));
				cinfo.setMaxscore(rs.getInt("maxscore"));
				cinfo.setTimeperquest(rs.getInt("timeperquest"));
				cinfo.setL1(rs.getInt("L1"));
				cinfo.setL2(rs.getInt("L2"));
				cinfo.setL3(rs.getInt("L3"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public boolean updateBatch(String Batchname1,int marksperq1,int negscore1,int passmarks1,
			int maxscore1,int timeperquest1,int lvl21,int lvl22,int lvl23,int Batchno)
	{	
		boolean result = false;
		
		try {
			String sql = "UPDATE Batch set batchname=?,marksperq=?,negscore=?,passmarks=?," +
					"maxscore=?,timeperquest=?,L1=?,L2=?,L3=? where ID=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, ReplQuotes(Batchname1));
			s.setInt(2, marksperq1);
			s.setInt(3, negscore1);
			s.setInt(4, passmarks1);
			s.setInt(5, maxscore1);
			s.setInt(6, timeperquest1);
			s.setInt(7, lvl21);
			s.setInt(8, lvl22);
			s.setInt(9, lvl23);
			s.setInt(10, Batchno);
									
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
				result=false;
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean setCompStatus()
	{	
		boolean result = false;
		
		try {
			String sql = "UPDATE CompanyTable set status='Not Selected'";
			PreparedStatement s = connection.prepareStatement(sql);
									
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
				result=false;
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean setCompStatusById(int Id)
	{	
		boolean result = false;
		setCompStatus();
		try {
			String sql = "UPDATE CompanyTable set status='Selected' where ID=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, Id);
									
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
				result=false;
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Company> getSelCompany() 
	{	
		ArrayList<Company> clist = new ArrayList<Company>();
		try {
			String sql = "select * from CompanyTable where status='Selected'";
						
			PreparedStatement s = connection.prepareStatement(sql);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Company cinfo = new Company();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setCompname(rs.getString("compname"));
				cinfo.setCompaddr(rs.getString("compaddr"));
				cinfo.setContactno(rs.getString("contactno"));
				cinfo.setStatus(rs.getString("status"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<Question> getQuestionByQno(int quesno) 
	{	
		ArrayList<Question> clist = new ArrayList<Question>();
		try {
			String sql = "select * from Question where qno=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, quesno);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Question cinfo = new Question();
				cinfo.setQno(rs.getInt("qno"));
				cinfo.setQuestion(rs.getString("question"));
				cinfo.setAnswer(rs.getString("answer"));
				cinfo.setCh1(rs.getString("ch1"));
				cinfo.setCh2(rs.getString("ch2"));
				cinfo.setCh3(rs.getString("ch3"));
				cinfo.setCh4(rs.getString("ch4"));
				cinfo.setCh5(rs.getString("ch5"));
				//cinfo.setBatchid(rs.getInt("batchid"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
				cinfo.setLevel(rs.getInt("lvl"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<Question> getQuestionByComp(int comid, int stest, int stestscat) 
	{	
		ArrayList<Question> clist = new ArrayList<Question>();
		try {
			String sql = "select * from Question where compid=? and testid=? and testsubcatid=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, comid);
			s.setInt(2, stest);
			s.setInt(3, stestscat);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Question cinfo = new Question();
				cinfo.setQno(rs.getInt("qno"));
				cinfo.setQuestion(rs.getString("question"));
				cinfo.setAnswer(rs.getString("answer"));
				cinfo.setCh1(rs.getString("ch1"));
				cinfo.setCh2(rs.getString("ch2"));
				cinfo.setCh3(rs.getString("ch3"));
				cinfo.setCh4(rs.getString("ch4"));
				cinfo.setCh5(rs.getString("ch5"));
				//cinfo.setBatchid(rs.getInt("batchid"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
				cinfo.setLevel(rs.getInt("lvl"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public boolean AddTestPaper(int sid, String questlst, int ques, int batchno
			,int marks,int CorAns,int WroAns, String anslst)
	{
		boolean result=false;
		
		try {
			String sql = "insert into TestPaper(sid,examquest,lastansqno,batchid," +
					"marks,corans,wronans,examans)" +
					" values(?,?,?,?,?,?,?,?)";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, sid);
			s.setString(2, ReplQuotes(questlst));
			s.setInt(3, ques);
			s.setInt(4, batchno);
			s.setInt(5, marks);
			s.setInt(6, CorAns);
			s.setInt(7, WroAns);
			s.setString(8, ReplQuotes(anslst));
						
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public int getLastPaper(int sid,int batchno) 
	{	
		int m=0;
		try {
			String sql = "select max(ID) from TestPaper where sid=? and batchid=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, sid);
			s.setInt(2, batchno);
						
			ResultSet rs = s.executeQuery();
			if(rs.next()) {
				m=rs.getInt(1);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return m;
	}
	
	public ArrayList<TestPaper> getTestPaperById(int Id) 
	{	
		ArrayList<TestPaper> clist = new ArrayList<TestPaper>();
		try {
			String sql = "select * from TestPaper where ID=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, Id);
			
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				TestPaper cinfo = new TestPaper();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setSid(rs.getInt("sid"));
				cinfo.setExamquest(rs.getString("examquest"));
				cinfo.setLastansqno(rs.getInt("lastansqno"));
				cinfo.setBatchid(rs.getInt("batchid"));
				cinfo.setMarks(rs.getInt("marks"));
				cinfo.setCorans(rs.getInt("corans"));
				cinfo.setWronans(rs.getInt("wronans"));
				cinfo.setExamans(rs.getString("examans"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public int getCountPaper(int sid,int batchno) 
	{	
		int m=0;
		try {
			String sql = "select count(ID) from TestPaper where sid=? and batchid=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, sid);
			s.setInt(2, batchno);
						
			ResultSet rs = s.executeQuery();
			if(rs.next()) {
				m=rs.getInt(1);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return m;
	}
	
	public boolean updateTestPaper(String questlst, int ques
			,int marks,int CorAns,int WroAns,String anslst, int lasttest)
	{
		boolean result=false;
		
		try {
			String sql = "update TestPaper set examquest=?,lastansqno=?,marks=?,corans=?,wronans=?," +
					"examans=? where ID=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, ReplQuotes(questlst));
			s.setInt(2, ques);
			s.setInt(3, marks);
			s.setInt(4, CorAns);
			s.setInt(5, WroAns);
			s.setString(6, ReplQuotes(anslst));
			s.setInt(7, lasttest);
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}

	public boolean AddReg(String stname,String s1,String stlname,
			  String password,String cpassword,
			  String Id, String empid, String status,int cid)
	{
		boolean result=false;
		int val=0;
		//String s1 = "xxxxx";
		String s2 = "Male";
		String s3 = "9999999999";
		String s4 = "30";
		String s5 = "xxxxx";
		try {
		String sql = "insert into Reg (stuname,stmname, stlname," +
			"stemail,stgender, stpass, stcpass,stmobile,stage,staddress, empid, " +
			"status, compid) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement s = connection.prepareStatement(sql);
		s.setString(1, ReplQuotes(stname));
		s.setString(2, ReplQuotes(s1));
		s.setString(3, ReplQuotes(stlname));
		s.setString(4, ReplQuotes(Id));
		s.setString(5, ReplQuotes(s2));
		s.setString(6, ReplQuotes(password));
		s.setString(7, ReplQuotes(cpassword));
		s.setString(8, ReplQuotes(s3));
		s.setString(9, ReplQuotes(s4));
		s.setString(10, ReplQuotes(s5));
		s.setString(11, ReplQuotes(empid));
		s.setString(12, ReplQuotes(status));
		s.setInt(13, cid);
						
		val = s.executeUpdate();
		if (val>0) 
		{
			result=true;
		}
		else
		{
			result=false;
		}
		s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();			
		}
		return result;
	}
	
	public ArrayList<String> getCustPassList(int cid)
	{
		ArrayList<String> custlist = new ArrayList<String>();
		
		try {
			String sql = "SELECT stpass FROM Reg where compid="+cid;
			PreparedStatement s = connection.prepareStatement(sql);
			
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				String cust = "";
				cust = rs.getString("stpass");
				custlist.add(cust);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return custlist;
	}
	
	public boolean AddQuestFromExcel(String ques,String ans,String chA,String chB, String chC,
			String chD,String chE,int comid,int stest,int stestscat,int lvlid)
	{
		boolean result=false;
		
		try {
			String sql = "INSERT INTO" +
					" Question (question,answer,ch1,ch2,ch3,ch4,ch5,compid,testid,testsubcatid,lvl)" +
					" VALUES ('"+ReplQuotes(ques)+ "','"+ReplQuotes(ans)+ "','"+
					ReplQuotes(chA)+ "','"+ReplQuotes(chB)+ "','"+ReplQuotes(chC)+
					"','"+ReplQuotes(chD)+"','"+ReplQuotes(chE)+ "',"+comid+","+stest+
					","+stestscat+","+lvlid+")";
						
			PreparedStatement s = connection.prepareStatement(sql);
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<String> getTestscatList()
	{
		ArrayList<String> custlist = new ArrayList<String>();
		
		try {
			String sql = "SELECT testsubcatname FROM Testsubcat";
			PreparedStatement s = connection.prepareStatement(sql);
			
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				String cust = "";
				cust = rs.getString("testsubcatname").toUpperCase();
				custlist.add(cust);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return custlist;
	}
	
	public int getTestscatByName(String st,int comid,int stest)
	{
		int m=0;
		
		try {
			String sql = "SELECT ID FROM Testsubcat where testsubcatname=? and compid=? and testid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, st);
			s.setInt(2, comid);
			s.setInt(3, stest);
			
			ResultSet rs = s.executeQuery();
			if (rs.next()) 
			{				
				m = rs.getInt("ID");
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return m;
	}
	
	public int getTestscatMax() 
	{	
		int m=0;
		try {
			String sql = "select max(ID) from Testsubcat";
						
			PreparedStatement s = connection.prepareStatement(sql);
						
			ResultSet rs = s.executeQuery();
			if(rs.next()) {
				m=rs.getInt(1);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return m;
	}
	
	public ArrayList<String> getCustIdList(int cid)
	{
		ArrayList<String> custlist = new ArrayList<String>();
		
		try {
			String sql = "SELECT stemail FROM Reg where compid="+cid;
			PreparedStatement s = connection.prepareStatement(sql);
			
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				String cust = "";
				cust = rs.getString("stemail");
				custlist.add(cust);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return custlist;
	}
	
	public ArrayList<String> getTestList()
	{
		ArrayList<String> custlist = new ArrayList<String>();
		
		try {
			String sql = "SELECT testname FROM Testcat";
			PreparedStatement s = connection.prepareStatement(sql);
			
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				String cust = "";
				cust = rs.getString("testname").toUpperCase();
				custlist.add(cust);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return custlist;
	}
	
	public int getTestByName(String st,int comid)
	{
		int m=0;
		
		try {
			String sql = "SELECT ID FROM Testcat where testname=? and compid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, st);
			s.setInt(2, comid);
			
			
			ResultSet rs = s.executeQuery();
			if (rs.next()) 
			{				
				m = rs.getInt("ID");
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return m;
	}
	
	public int getTestcatMax() 
	{	
		int m=0;
		try {
			String sql = "select max(ID) from Testcat";
						
			PreparedStatement s = connection.prepareStatement(sql);
						
			ResultSet rs = s.executeQuery();
			if(rs.next()) {
				m=rs.getInt(1);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return m;
	}
	
	public ArrayList<CustomerInfo> getStudentWithAlph(String alph, int cid) 
	{	
		ArrayList<CustomerInfo> custlist = new ArrayList<CustomerInfo>();
		try {
			Statement s = connection.createStatement();
			String sql = "SELECT * FROM Reg where compid="+cid;
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				CustomerInfo cust = new CustomerInfo();
				String hname1 = rs.getString("stuname");
				String hname = hname1.toUpperCase();
				
				if(hname.charAt(0)==alph.charAt(0))
				{				
					cust.id = rs.getInt("ID");
					cust.stuname = hname1;
					cust.stmname = rs.getString("stmname");
					cust.stlname = rs.getString("stlname");
					cust.stemail = rs.getString("stemail");
					cust.stgender = rs.getString("stgender");
					cust.stpass = rs.getString("stpass");
					cust.stcpass = rs.getString("stcpass");
					cust.stmobile = rs.getString("stmobile");
					cust.stage = rs.getString("stage");
					cust.staddress = rs.getString("staddress");
					cust.empid = rs.getString("empid");
					cust.status = rs.getString("status");
					cust.compid = rs.getInt("compid");
					custlist.add(cust);
				}
			}
		rs.close();
		s.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return custlist;
	}
	
	public ArrayList<Team> getTeamById(int ID, int cid)
	{
		ArrayList<Team> clist = new ArrayList<Team>();
		try {
			String sql = "select * from teams where compid=? and teamname=?" +
					" order by marks desc";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, cid);
			s.setInt(2, ID);
									
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Team cinfo = new Team();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setTeamname(rs.getInt("teamname"));
				cinfo.setMarks(rs.getInt("marks"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
				cinfo.setBatchid(rs.getInt("batchid"));
				cinfo.setTeststatus(rs.getString("teststatus"));
				cinfo.setPassmarks(rs.getInt("passmarks"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<Company> getCompanyByKeyword(String keyword) 
	{	
		ArrayList<Company> clist = new ArrayList<Company>();
		try {
			String sql = "select * from CompanyTable where compname like '%" + 
			keyword + "%'";
						
			PreparedStatement s = connection.prepareStatement(sql);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Company cinfo = new Company();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setCompname(rs.getString("compname"));
				cinfo.setCompaddr(rs.getString("compaddr"));
				cinfo.setContactno(rs.getString("contactno"));
				cinfo.setStatus(rs.getString("status"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<Question> getQuestionByKeyword(String keyword, int cid) 
	{	
		ArrayList<Question> clist = new ArrayList<Question>();
		try {
			String sql = "select * from Question where compid=" + cid + 
			" and question like '%" + keyword + "%'";
						
			PreparedStatement s = connection.prepareStatement(sql);
									
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Question cinfo = new Question();
				cinfo.setQno(rs.getInt("qno"));
				cinfo.setQuestion(rs.getString("question"));
				cinfo.setAnswer(rs.getString("answer"));
				cinfo.setCh1(rs.getString("ch1"));
				cinfo.setCh2(rs.getString("ch2"));
				cinfo.setCh3(rs.getString("ch3"));
				cinfo.setCh4(rs.getString("ch4"));
				cinfo.setCh5(rs.getString("ch5"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
				cinfo.setLevel(rs.getInt("lvl"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<Test> getTestByKeyword(String keyword, int cid) 
	{	
		ArrayList<Test> clist = new ArrayList<Test>();
		try {
			String sql = "select * from Testcat where compid=" + cid + 
			" and testname like '%" + keyword + "%'";
						
			PreparedStatement s = connection.prepareStatement(sql);
									
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Test cinfo = new Test();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setTestname(rs.getString("testname"));
				cinfo.setCompid(rs.getInt("compid"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<TestSubCat> getTestscatByKeyword(String keyword,int cid) 
	{	
		ArrayList<TestSubCat> clist = new ArrayList<TestSubCat>();
		try {
			String sql = "select * from Testsubcat where compid=" + cid + 
			" and testsubcatname like '%" + keyword + "%'";
						
			PreparedStatement s = connection.prepareStatement(sql);
									
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				TestSubCat cinfo = new TestSubCat();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setTestsubcatname(rs.getString("testsubcatname"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<Batch> getBatchByKeyword(String keyword, int cid) 
	{	
		ArrayList<Batch> clist = new ArrayList<Batch>();
		try {
			String sql = "select * from Batch where compid=" + cid + 
			" and batchname like '%" + keyword + "%'";
						
			PreparedStatement s = connection.prepareStatement(sql);
									
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Batch cinfo = new Batch();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setBatchname(rs.getString("batchname"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
				cinfo.setMarksperq(rs.getInt("marksperq"));
				cinfo.setNegscore(rs.getInt("negscore"));
				cinfo.setPassmarks(rs.getInt("passmarks"));
				cinfo.setMaxscore(rs.getInt("maxscore"));
				cinfo.setTimeperquest(rs.getInt("timeperquest"));
				cinfo.setL1(rs.getInt("L1"));
				cinfo.setL2(rs.getInt("L2"));
				cinfo.setL3(rs.getInt("L3"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<Team> getBatchByMksRange(String mksrange, int bid1, int cid)
	{
		ArrayList<Team> clist = new ArrayList<Team>();
		try {
			String sql = "select * from teams where compid="+cid+
			" and batchid="+bid1+" and marks Between " + 
			mksrange + " order by marks desc";
						
			PreparedStatement s = connection.prepareStatement(sql);
												
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Team cinfo = new Team();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setTeamname(rs.getInt("teamname"));
				cinfo.setMarks(rs.getInt("marks"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
				cinfo.setBatchid(rs.getInt("batchid"));
				cinfo.setTeststatus(rs.getString("teststatus"));
				cinfo.setPassmarks(rs.getInt("passmarks"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<CustomerInfo> getIdsInfo(String empid,int cid)
	{
		ArrayList<CustomerInfo> custlist = new ArrayList<CustomerInfo>();
		
		try {
			String sql = "SELECT * FROM Reg where empid=? and compid=? and status=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, empid);
			s.setInt(2, cid);
			s.setString(3, "Not Submitted");
									
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				CustomerInfo cust = new CustomerInfo();
				cust.id = rs.getInt("ID");
				cust.stuname = rs.getString("stuname");
				cust.stmname = rs.getString("stmname");
				cust.stlname = rs.getString("stlname");
				cust.stemail = rs.getString("stemail");
				cust.stgender = rs.getString("stgender");
				cust.stpass = rs.getString("stpass");
				cust.stcpass = rs.getString("stcpass");
				cust.stmobile = rs.getString("stmobile");
				cust.stage = rs.getString("stage");
				cust.staddress = rs.getString("staddress");
				cust.empid = rs.getString("empid");
				cust.status = rs.getString("status");
				cust.compid = rs.getInt("compid");
				custlist.add(cust);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return custlist;
	}
	
	public boolean isQuesExist(String ques, int comid,int stest,int stestscat)
	{
		boolean res = false;
		
		try {
			String sql = "SELECT * FROM Question where UPPER(question)=? and compid=? and testid=? and testsubcatid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, ques);
			s.setInt(2, comid);
			s.setInt(3, stest);
			s.setInt(4, stestscat);
			
			ResultSet rs = s.executeQuery();
			if (rs.next()) 
			{
				res = true;
			}
			else
				res=false;
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return res;
	}
	
	public boolean UpdateQuestFromExcel(String ans,String chA,String chB, String chC,
			String chD,String chE,int comid,int stest,int stestscat,int lvlid,String ques1)
	{
		boolean result=false;
		
		try {
			String sql = "update Question set answer=?, ch1=?, ch2=?, ch3=?, ch4=?," +
					"ch5=?, lvl=?  where question=? and compid=? and testid=? and testsubcatid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, ReplQuotes(ans));
			s.setString(2, ReplQuotes(chA));
			s.setString(3, ReplQuotes(chB));
			s.setString(4, ReplQuotes(chC));
			s.setString(5, ReplQuotes(chD));
			s.setString(6, ReplQuotes(chE));
			s.setInt(7, lvlid);
			s.setString(8, ques1);
			s.setInt(9, comid);
			s.setInt(10, stest);
			s.setInt(11, stestscat);
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean isStudentExists(String empid, int cid)
	{
		boolean result=false;
		
		try {
			String sql = "SELECT * FROM Reg where compid=? and empid=? and status=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, cid);
			s.setString(2, empid);
			s.setString(3, "Not Submitted");
						
			ResultSet rs = s.executeQuery();
			if (rs.next()) 
			{
				result=true;
			}
			else
			{
				result=false;
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean UpdateReg(String mpswd,String mpswd1,String mids,String empid,
			String status, int cid)
	{
		boolean result=false;
		
		try {
			String sql = "update Reg set stemail=?, stpass=?, stcpass=?, status=?" +
					" where empid=? and compid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, ReplQuotes(mids));
			s.setString(2, ReplQuotes(mpswd));
			s.setString(3, ReplQuotes(mpswd1));
			s.setString(4, ReplQuotes(status));
			s.setString(5, empid);
			s.setInt(6, cid);
				
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Team> getBatchByPerRange(String perrange,int bid1,int cid)
	{
		ArrayList<Team> clist = new ArrayList<Team>();
		try {
			String sql = "select * from teams where batchid=? and compid=? order by marks desc";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, bid1);
			s.setInt(2, cid);
												
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Team cinfo = new Team();
				int mk = rs.getInt("marks");
				int bid = rs.getInt("batchid");
				int maxmks = 0;
				ArrayList<Batch> blist = getBatchById(bid);
				Iterator it = blist.iterator();
				if(it.hasNext())
				{
					Batch bt = (Batch)it.next();
					maxmks = bt.getMaxscore();
				}
				int per = 0;
				float mks1 = (float)mk;
				float maxmks1 = (float)maxmks;
				float per12 = (mk / maxmks1) * 100;
				per = (int)per12;
				int minper = 0;
				int maxper = 0;
				
				if(perrange.equals("1"))
				{
					minper = 0;
					maxper = 39;
				}
				else if(perrange.equals("2"))
				{
					minper = 40;
					maxper = 100;
				}
				else if(perrange.equals("3"))
				{
					minper = 50;
					maxper = 100;
				}
				else if(perrange.equals("4"))
				{
					minper = 60;
					maxper = 100;
				}
				else if(perrange.equals("5"))
				{
					minper = 70;
					maxper = 100;
				}
				else if(perrange.equals("6"))
				{
					minper = 80;
					maxper = 100;
				}
				else if(perrange.equals("7"))
				{
					minper = 90;
					maxper = 100;
				}
				else if(perrange.equals("8"))
				{
					minper = 0;
					maxper = 100;
				}
				if((per>=minper) && (per<=maxper))
				{
					
					cinfo.setID(rs.getInt("ID"));
					cinfo.setTeamname(rs.getInt("teamname"));
					cinfo.setMarks(mk);
					cinfo.setCompid(rs.getInt("compid"));
					cinfo.setTestid(rs.getInt("testid"));
					cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
					cinfo.setBatchid(bid);
					cinfo.setTeststatus(rs.getString("teststatus"));
					cinfo.setPassmarks(rs.getInt("passmarks"));
					clist.add(cinfo);
				}
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<Team> getBatchByPerRangeID(String perrange,int Id, int cid)
	{
		ArrayList<Team> clist = new ArrayList<Team>();
		try {
			String sql = "select * from teams where teamname=? and compid=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, Id);
			s.setInt(2, cid);
												
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Team cinfo = new Team();
				int mk = rs.getInt("marks");
				int bid = rs.getInt("batchid");
				int maxmks = 0;
				ArrayList<Batch> blist = getBatchById(bid);
				Iterator it = blist.iterator();
				if(it.hasNext())
				{
					Batch bt = (Batch)it.next();
					maxmks = bt.getMaxscore();
				}
				int per = 0;
				float mks1 = (float)mk;
				float maxmks1 = (float)maxmks;
				float per12 = (mk / maxmks1) * 100;
				per = (int)per12;
				int minper = 0;
				int maxper = 0;
				
				if(perrange.equals("1"))
				{
					minper = 0;
					maxper = 40;
				}
				else if(perrange.equals("2"))
				{
					minper = 41;
					maxper = 50;
				}
				else if(perrange.equals("3"))
				{
					minper = 51;
					maxper = 60;
				}
				else if(perrange.equals("4"))
				{
					minper = 61;
					maxper = 70;
				}
				else if(perrange.equals("5"))
				{
					minper = 71;
					maxper = 80;
				}
				else if(perrange.equals("6"))
				{
					minper = 81;
					maxper = 90;
				}
				else if(perrange.equals("7"))
				{
					minper = 91;
					maxper = 100;
				}
				System.out.println("Perrange"+perrange);
				System.out.println("Per="+per);
				System.out.println("minPer="+minper);
				if((per>=minper) && (per<=maxper))
				{
					
					cinfo.setID(rs.getInt("ID"));
					cinfo.setTeamname(rs.getInt("teamname"));
					cinfo.setMarks(mk);
					cinfo.setCompid(rs.getInt("compid"));
					cinfo.setTestid(rs.getInt("testid"));
					cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
					cinfo.setBatchid(bid);
					cinfo.setTeststatus(rs.getString("teststatus"));
					cinfo.setPassmarks(rs.getInt("passmarks"));
					clist.add(cinfo);
				}
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<Team> getBatchByMksRangeID(String mksrange,int Id, int cid)
	{
		ArrayList<Team> clist = new ArrayList<Team>();
		try {
			String sql = "select * from teams where compid=" + cid + 
			" and teamname="+Id+" and marks Between " + mksrange;
						
			PreparedStatement s = connection.prepareStatement(sql);
												
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Team cinfo = new Team();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setTeamname(rs.getInt("teamname"));
				cinfo.setMarks(rs.getInt("marks"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
				cinfo.setBatchid(rs.getInt("batchid"));
				cinfo.setTeststatus(rs.getString("teststatus"));
				cinfo.setPassmarks(rs.getInt("passmarks"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	
	public ArrayList<TestPaper> getTestPaperByIdBid(int Id,int bid) 
	{	
		ArrayList<TestPaper> clist = new ArrayList<TestPaper>();
		try {
			String sql = "select * from TestPaper where sid=? and batchid=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, Id);
			s.setInt(2, bid);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				TestPaper cinfo = new TestPaper();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setSid(rs.getInt("sid"));
				cinfo.setExamquest(rs.getString("examquest"));
				cinfo.setLastansqno(rs.getInt("lastansqno"));
				cinfo.setBatchid(rs.getInt("batchid"));
				cinfo.setMarks(rs.getInt("marks"));
				cinfo.setCorans(rs.getInt("corans"));
				cinfo.setWronans(rs.getInt("wronans"));
				cinfo.setExamans(rs.getString("examans"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public boolean SubmitTest(String status, int sid)
	{
		boolean result=false;
		
		try {
			String sql = "update Reg set status=?" +
					" where ID=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, ReplQuotes(status));
			s.setInt(2, sid);
				
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<String> getBatchIdsByCompId(int compid) 
	{	
		ArrayList<String> clist = new ArrayList<String>();
		try {
			String sql = "select ID from Batch where compid=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, compid);
									
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				int bid = rs.getInt("ID");
				clist.add(String.valueOf(bid));
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<String> getBatchIdsByTestId(int testid) 
	{	
		ArrayList<String> clist = new ArrayList<String>();
		try {
			String sql = "select ID from Batch where testid=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, testid);
									
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				int bid = rs.getInt("ID");
				clist.add(String.valueOf(bid));
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<String> getBatchIdsByTestscatId(int testsubcatid) 
	{	
		ArrayList<String> clist = new ArrayList<String>();
		try {
			String sql = "select ID from Batch where testsubcatid=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, testsubcatid);
									
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				int bid = rs.getInt("ID");
				clist.add(String.valueOf(bid));
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public boolean DeleteTestPaper(int batchid)
	{
		boolean result=false;
		
		try {
			String sql = "delete from TestPaper where batchid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, batchid);
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<String> getBatchIdBySidPaper(int sid) 
	{	
		
		ArrayList<String> blist = new ArrayList<String>();
		blist.clear();
		try {
			String sql = "select batchid from TestPaper where sid=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, sid);
									
			ResultSet rs = s.executeQuery();
			if(rs.next()) {
				while(rs.next()) {
					blist.add(String.valueOf(rs.getInt("batchid")));
				}
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return blist;
	}
	
	public String ReplQuotes(String val) 
	{
		val = val.replace("'", "''");
		//val = val.replace(",", "\\,");
		
		val = val.replace("\\", "\\\\");
		val = val.replace('"', '\"');
		return val;
	}
	
	public ArrayList<Company> getCompWithAlph(String alph) 
	{
		ArrayList<Company> clist = new ArrayList<Company>();
		
		try {
			Statement s = connection.createStatement();
			String sql = "SELECT * FROM CompanyTable";
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				Company cinfo = new Company();
				String hname1 = rs.getString("compname");
				String hname = hname1.toUpperCase();
								
				if(hname.charAt(0)==alph.charAt(0))
				{	
					cinfo.setID(rs.getInt("ID"));
					cinfo.setCompname(hname1);
					cinfo.setCompaddr(rs.getString("compaddr"));
					cinfo.setContactno(rs.getString("contactno"));
					cinfo.setStatus(rs.getString("status"));
					clist.add(cinfo);
				}
		}
		rs.close();
		s.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<Test> getTestWithAlph(String alph,int cid) 
	{
		ArrayList<Test> clist = new ArrayList<Test>();
		
		try {
			Statement s = connection.createStatement();
			String sql = "SELECT * FROM Testcat where compid="+cid;
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				Test cinfo = new Test();
				String hname1 = rs.getString("testname");
				String hname = hname1.toUpperCase();
						
				if(hname.charAt(0)==alph.charAt(0))
				{	
					cinfo.setID(rs.getInt("ID"));
					cinfo.setTestname(hname1);
					cinfo.setCompid(rs.getInt("compid"));
					clist.add(cinfo);					
				}
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<TestSubCat> getTestSubCatWithAlph(String alph, int cid) 
	{
		ArrayList<TestSubCat> clist = new ArrayList<TestSubCat>();
		
		try {
			Statement s = connection.createStatement();
			String sql = "SELECT * FROM Testsubcat where compid="+cid;
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				TestSubCat cinfo = new TestSubCat();
				String hname1 = rs.getString("testsubcatname");
				String hname = hname1.toUpperCase();
								
				if(hname.charAt(0)==alph.charAt(0))
				{	
					cinfo.setID(rs.getInt("ID"));
					cinfo.setTestsubcatname(hname1);
					cinfo.setCompid(rs.getInt("compid"));
					cinfo.setTestid(rs.getInt("testid"));
					clist.add(cinfo);
				}
		}
		rs.close();
		s.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<Batch> getBatchWithAlph(String alph, int cid) 
	{
		ArrayList<Batch> clist = new ArrayList<Batch>();
		
		try {
			Statement s = connection.createStatement();
			String sql = "SELECT * FROM Batch where compid="+cid;
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				Batch cinfo = new Batch();
				String hname1 = rs.getString("batchname");
				String hname = hname1.toUpperCase();
								
				if(hname.charAt(0)==alph.charAt(0))
				{	
					cinfo.setID(rs.getInt("ID"));
					cinfo.setBatchname(hname1);
					cinfo.setCompid(rs.getInt("compid"));
					cinfo.setTestid(rs.getInt("testid"));
					cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
					cinfo.setMarksperq(rs.getInt("marksperq"));
					cinfo.setNegscore(rs.getInt("negscore"));
					cinfo.setPassmarks(rs.getInt("passmarks"));
					cinfo.setMaxscore(rs.getInt("maxscore"));
					cinfo.setTimeperquest(rs.getInt("timeperquest"));
					cinfo.setL1(rs.getInt("L1"));
					cinfo.setL2(rs.getInt("L2"));
					cinfo.setL3(rs.getInt("L3"));
					clist.add(cinfo);
				}
		}
		rs.close();
		s.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<Test> getTestListByCriteria(int cid,String sctest)
	{
		ArrayList<Test> clist = new ArrayList<Test>();
		String sql = "select * from Testcat" +
				" where compid="+cid+" and testname like '%" + sctest + "%'";
		
		try 
		{
			PreparedStatement s = connection.prepareStatement(sql);
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				Test cinfo = new Test();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setTestname(rs.getString("testname"));
				cinfo.setCompid(rs.getInt("compid"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
			
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<TestSubCat> getTestSubCatListByCriteria(int cid, String sctestcat)
	{
		ArrayList<TestSubCat> clist = new ArrayList<TestSubCat>();
		String sql = "select * from Testsubcat" +
				" Where compid="+cid+" and testsubcatname like '%" + sctestcat + "%'";
		
		try 
		{
			PreparedStatement s = connection.prepareStatement(sql);
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				TestSubCat cinfo = new TestSubCat();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setTestsubcatname(rs.getString("testsubcatname"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
			
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<TestSubCat> getTestSubCatListByCriteriaTest(int cid, int tid,
			String sctestcat)
	{
		ArrayList<TestSubCat> clist = new ArrayList<TestSubCat>();
		String sql = "select * from Testsubcat" +
				" Where compid="+cid+" and testid="+tid+
				" and testsubcatname like '%" + sctestcat + "%'";
		
		try 
		{
			PreparedStatement s = connection.prepareStatement(sql);
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				TestSubCat cinfo = new TestSubCat();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setTestsubcatname(rs.getString("testsubcatname"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
			
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<Test> getTestWithAlphByCid(int cid, String alph) 
	{
		ArrayList<Test> clist = new ArrayList<Test>();
		
		try {
			String sql = "select * from Testcat where compid="+cid;
			PreparedStatement s = connection.prepareStatement(sql);
						
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				Test cinfo = new Test();
				String hname1 = rs.getString("testname");
				String hname = hname1.toUpperCase();
					
				if(hname.charAt(0)==alph.charAt(0))
				{	
					System.out.println(hname1);
					cinfo.setID(rs.getInt("ID"));
					cinfo.setTestname(hname1);
					cinfo.setCompid(rs.getInt("compid"));
					clist.add(cinfo);					
				}
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<TestSubCat> getTestSubCatWithAlphByCid(int cid, String alph) 
	{
		ArrayList<TestSubCat> clist = new ArrayList<TestSubCat>();
		
		try {
			String sql = "select * from Testsubcat where compid="+cid;
			
			PreparedStatement s = connection.prepareStatement(sql);
			
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				TestSubCat cinfo = new TestSubCat();
				String hname1 = rs.getString("testsubcatname");
				String hname = hname1.toUpperCase();
								
				if(hname.charAt(0)==alph.charAt(0))
				{	
					cinfo.setID(rs.getInt("ID"));
					cinfo.setTestsubcatname(hname1);
					cinfo.setCompid(rs.getInt("compid"));
					cinfo.setTestid(rs.getInt("testid"));
					clist.add(cinfo);
				}
		}
		rs.close();
		s.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<Batch> getBatchWithAlphByCid(int cid, String alph) 
	{
		ArrayList<Batch> clist = new ArrayList<Batch>();
		
		try {
			String sql = "select * from Batch where compid="+cid;
			
			PreparedStatement s = connection.prepareStatement(sql);
						
			ResultSet rs = s.executeQuery(sql);
			
			while (rs.next()) {
				Batch cinfo = new Batch();
				String hname1 = rs.getString("batchname");
				String hname = hname1.toUpperCase();
								
				if(hname.charAt(0)==alph.charAt(0))
				{	
					cinfo.setID(rs.getInt("ID"));
					cinfo.setBatchname(hname1);
					cinfo.setCompid(rs.getInt("compid"));
					cinfo.setTestid(rs.getInt("testid"));
					cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
					cinfo.setMarksperq(rs.getInt("marksperq"));
					cinfo.setNegscore(rs.getInt("negscore"));
					cinfo.setPassmarks(rs.getInt("passmarks"));
					cinfo.setMaxscore(rs.getInt("maxscore"));
					cinfo.setTimeperquest(rs.getInt("timeperquest"));
					cinfo.setL1(rs.getInt("L1"));
					cinfo.setL2(rs.getInt("L2"));
					cinfo.setL3(rs.getInt("L3"));
					clist.add(cinfo);
				}
		}
		rs.close();
		s.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<Question> getQuestionByCompAns(int comid, int stest, 
			int stestscat, String ans) 
	{	
		ArrayList<Question> clist = new ArrayList<Question>();
		try {
			String sql = "select * from Question where compid=? and testid=? " +
					"and testsubcatid=? and answer like '%" + ans + "%'";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, comid);
			s.setInt(2, stest);
			s.setInt(3, stestscat);
									
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Question cinfo = new Question();
				cinfo.setQno(rs.getInt("qno"));
				cinfo.setQuestion(rs.getString("question"));
				cinfo.setAnswer(rs.getString("answer"));
				cinfo.setCh1(rs.getString("ch1"));
				cinfo.setCh2(rs.getString("ch2"));
				cinfo.setCh3(rs.getString("ch3"));
				cinfo.setCh4(rs.getString("ch4"));
				cinfo.setCh5(rs.getString("ch5"));
				//cinfo.setBatchid(rs.getInt("batchid"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
				cinfo.setLevel(rs.getInt("lvl"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<Question> getChByKeyword(String keyword, int cid) 
	{	
		ArrayList<Question> clist = new ArrayList<Question>();
		try {
			String sql = "select * from Question where compid=" + cid + " and (" +
					"(ch1 like '%" + keyword + "%') OR " +
					"(ch2 like '%" + keyword + "%') OR " +
					"(ch3 like '%" + keyword + "%') OR " +
					"(ch4 like '%" + keyword + "%') OR " +
					"(ch5 like '%" + keyword + "%'))";
						
			PreparedStatement s = connection.prepareStatement(sql);
									
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Question cinfo = new Question();
				cinfo.setQno(rs.getInt("qno"));
				cinfo.setQuestion(rs.getString("question"));
				cinfo.setAnswer(rs.getString("answer"));
				cinfo.setCh1(rs.getString("ch1"));
				cinfo.setCh2(rs.getString("ch2"));
				cinfo.setCh3(rs.getString("ch3"));
				cinfo.setCh4(rs.getString("ch4"));
				cinfo.setCh5(rs.getString("ch5"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
				cinfo.setLevel(rs.getInt("lvl"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<Question> getQuestionChByKeyword(String ques, String ch,int cid) 
	{	
		ArrayList<Question> clist = new ArrayList<Question>();
		try {
			String sql = "select * from Question where " +
					"(question like '%" + ques + "%') and compid=" + cid + 
					" and ((ch1 like '%" + ch + "%') OR " +
					"(ch2 like '%" + ch + "%') OR " +
					"(ch3 like '%" + ch + "%') OR " +
					"(ch4 like '%" + ch + "%') OR " +
					"(ch5 like '%" + ch + "%'))";
						
			PreparedStatement s = connection.prepareStatement(sql);
									
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Question cinfo = new Question();
				cinfo.setQno(rs.getInt("qno"));
				cinfo.setQuestion(rs.getString("question"));
				cinfo.setAnswer(rs.getString("answer"));
				cinfo.setCh1(rs.getString("ch1"));
				cinfo.setCh2(rs.getString("ch2"));
				cinfo.setCh3(rs.getString("ch3"));
				cinfo.setCh4(rs.getString("ch4"));
				cinfo.setCh5(rs.getString("ch5"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
				cinfo.setLevel(rs.getInt("lvl"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	public ArrayList<String> getTestListByCompId(int cid)
	{
		ArrayList<String> custlist = new ArrayList<String>();
		
		try {
			String sql = "SELECT testname FROM Testcat where compid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, cid);
			
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				String cust = "";
				cust = rs.getString("testname").toUpperCase();
				custlist.add(cust);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return custlist;
	}
	
	public int getTestcatMaxByCompId(int cid) 
	{	
		int m=0;
		try {
			String sql = "select max(ID) from Testcat where compid=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, cid);
						
			ResultSet rs = s.executeQuery();
			if(rs.next()) {
				m=rs.getInt(1);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return m;
	}
	
	public ArrayList<String> getTestscatListByCompIdTestId(int cid, int tid)
	{
		ArrayList<String> custlist = new ArrayList<String>();
		
		try {
			String sql = "SELECT testsubcatname FROM Testsubcat where compid=?" +
					" and testid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1,cid);
			s.setInt(2,tid);
			
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				String cust = "";
				cust = rs.getString("testsubcatname").toUpperCase();
				custlist.add(cust);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return custlist;
	}
	
	public int getTestscatMaxByCompIdTestId(int cid, int tid) 
	{	
		int m=0;
		try {
			String sql = "select max(ID) from Testsubcat where compid=? and testid=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1,cid);
			s.setInt(2,tid);
			
			ResultSet rs = s.executeQuery();
			if(rs.next()) {
				m=rs.getInt(1);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return m;
	}
	
	public ArrayList<TestPaper> getTestPaperByQno(int qno) 
	{	
		ArrayList<TestPaper> clist = new ArrayList<TestPaper>();
		try {
			String sql = "select * from TestPaper where examquest like '%"+ qno + "%'";
						
			PreparedStatement s = connection.prepareStatement(sql);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				TestPaper cinfo = new TestPaper();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setSid(rs.getInt("sid"));
				cinfo.setExamquest(rs.getString("examquest"));
				cinfo.setLastansqno(rs.getInt("lastansqno"));
				cinfo.setBatchid(rs.getInt("batchid"));
				cinfo.setMarks(rs.getInt("marks"));
				cinfo.setCorans(rs.getInt("corans"));
				cinfo.setWronans(rs.getInt("wronans"));
				cinfo.setExamans(rs.getString("examans"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	
	public ArrayList<TestPaper> getTestPaperByBid(int bid) 
	{	
		ArrayList<TestPaper> clist = new ArrayList<TestPaper>();
		try {
			String sql = "select * from TestPaper where batchid=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1,bid);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				TestPaper cinfo = new TestPaper();
				cinfo.setID(rs.getInt("ID"));
				cinfo.setSid(rs.getInt("sid"));
				cinfo.setExamquest(rs.getString("examquest"));
				cinfo.setLastansqno(rs.getInt("lastansqno"));
				cinfo.setBatchid(rs.getInt("batchid"));
				cinfo.setMarks(rs.getInt("marks"));
				cinfo.setCorans(rs.getInt("corans"));
				cinfo.setWronans(rs.getInt("wronans"));
				cinfo.setExamans(rs.getString("examans"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	
	public ArrayList<Question> getQuestionByCompLvl(int comid, int stest, 
			int stestscat, int lvl) 
	{	
		ArrayList<Question> clist = new ArrayList<Question>();
		try {
			String sql = "select * from Question where compid=? and testid=? " +
					"and testsubcatid=?" +" and lvl=?";
						
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, comid);
			s.setInt(2, stest);
			s.setInt(3, stestscat);
			s.setInt(4, lvl);
						
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				Question cinfo = new Question();
				cinfo.setQno(rs.getInt("qno"));
				cinfo.setQuestion(rs.getString("question"));
				cinfo.setAnswer(rs.getString("answer"));
				cinfo.setCh1(rs.getString("ch1"));
				cinfo.setCh2(rs.getString("ch2"));
				cinfo.setCh3(rs.getString("ch3"));
				cinfo.setCh4(rs.getString("ch4"));
				cinfo.setCh5(rs.getString("ch5"));
				//cinfo.setBatchid(rs.getInt("batchid"));
				cinfo.setCompid(rs.getInt("compid"));
				cinfo.setTestid(rs.getInt("testid"));
				cinfo.setTestsubcatid(rs.getInt("testsubcatid"));
				cinfo.setLevel(rs.getInt("lvl"));
				clist.add(cinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return clist;
	}
	
	
	public boolean AddFeedBack(String From,String msg,String DateSubmitted,int cid)
	{
		boolean result=false;
		int val=0;
				
		try {
		String sql = "Insert into Feedback(UserID,Feedback,DateSubmitted, compid) values (?,?,?,?)";

		PreparedStatement s = connection.prepareStatement(sql);
		s.setString(1, From);
		s.setString(2, msg);
		s.setString(3, DateSubmitted);
		s.setInt(4, cid);
						
		val = s.executeUpdate();
		if (val==1) 
		{
			result=true;
		}
		else
		{
			result=false;
		}
		s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();			
		}
		return result;
	}

	
	public ArrayList<FeedBackInfo> GetAllFeedback(int cid)
	{
		ArrayList<FeedBackInfo> rlist = new ArrayList<FeedBackInfo>();
				
		try {
			String sql = "Select * from Feedback where compid="+cid+" order by ID";
			PreparedStatement s = connection.prepareStatement(sql);
								
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				FeedBackInfo rinfo = new FeedBackInfo();
				rinfo.UserID = rs.getString("UserID");
				rinfo.Feedback = rs.getString("Feedback");
				rinfo.DateSubmitted = rs.getString("DateSubmitted");
				rlist.add(rinfo);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return rlist;
	}
	
	public boolean isStudentExists1(String empid, int cid)
	{
		boolean result=false;
		
		try {
			String sql = "SELECT * FROM Reg where compid=? and empid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, cid);
			s.setString(2, empid);
									
			ResultSet rs = s.executeQuery();
			if (rs.next()) 
			{
				result=true;
			}
			else
			{
				result=false;
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean UpdateAdm(String uid,String pwd)
	{
		boolean result=false;
		
		try {
			String sql = "update adm set UserID=?,Pwd=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, uid);
			s.setString(2, pwd);
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean AdmLogin(String uid, String pwd)
	{
		boolean result=false;
		
		try {
			String sql = "SELECT * FROM adm where UserID=? and Pwd=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, uid);
			s.setString(2, pwd);
												
			ResultSet rs = s.executeQuery();
			if (rs.next()) 
			{
				result=true;
			}
			else
			{
				result=false;
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean UpdateAdmCo(String uid,String pwd, int cid)
	{
		boolean result=false;
		
		try {
			String sql = "update admco set UserID=?,Pwd=? where compid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, uid);
			s.setString(2, pwd);
			s.setInt(3, cid);
			
			int rs = s.executeUpdate();
			if (rs>0) 
			{
				result=true;
			}
			else
			{
				result=false;
			}			
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public boolean AdmLoginCo(String uid, String pwd, int cid)
	{
		boolean result=false;
		
		try {
			String sql = "SELECT * FROM admco where UserID=? and Pwd=? and compid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, uid);
			s.setString(2, pwd);
			s.setInt(3, cid);
												
			ResultSet rs = s.executeQuery();
			if (rs.next()) 
			{
				result=true;
			}
			else
			{
				result=false;
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return result;
	}
	
	public String GetCmpImg(int cid)
	{
		String cig="";
		
		try {
			String sql = "SELECT * FROM admco where compid=?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setInt(1, cid);
												
			ResultSet rs = s.executeQuery();
			if (rs.next()) 
			{
				cig=rs.getString("cmpimg");
			}
			
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return cig;
	}
	
	public ArrayList<String> getCustIdList9(int cid)
	{
		ArrayList<String> custlist = new ArrayList<String>();
		
		try {
			String sql = "SELECT stemail FROM Reg where compid="+cid+ " and status='Not Submitted'";
			PreparedStatement s = connection.prepareStatement(sql);
			
			ResultSet rs = s.executeQuery();
			while (rs.next()) 
			{
				String cust = "";
				cust = rs.getString("stemail");
				custlist.add(cust);
			}
			rs.close();
			s.close();
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		return custlist;
	}

	
}
