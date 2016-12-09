package com.software.onlexam;

public class Team {
	private int ID;
	private int teamname;
	private int marks;
	private int compid;
	private int testid;
	private int testsubcatid;
	private int batchid;
	private String teststatus;
	private int passmarks;
		
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public int getTeamname() {
		return teamname;
	}
	public void setTeamname(int teamname) {
		this.teamname = teamname;
	}
	public int getMarks() {
		return marks;
	}
	public void setMarks(int marks) {
		this.marks = marks;
	}
	public int getCompid() {
		return compid;
	}
	public void setCompid(int compid) {
		this.compid = compid;
	}
	public int getTestid() {
		return testid;
	}
	public void setTestid(int testid) {
		this.testid = testid;
	}
	public int getTestsubcatid() {
		return testsubcatid;
	}
	public void setTestsubcatid(int testsubcatid) {
		this.testsubcatid = testsubcatid;
	}
	public int getBatchid() {
		return batchid;
	}
	public void setBatchid(int batchid) {
		this.batchid = batchid;
	}
	public String getTeststatus() {
		return teststatus;
	}
	public void setTeststatus(String teststatus) {
		this.teststatus = teststatus;
	}
	public int getPassmarks() {
		return passmarks;
	}
	public void setPassmarks(int passmarks) {
		this.passmarks = passmarks;
	}
		
	
}
