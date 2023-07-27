package kr.happyjob.study.exmrex.model;

import java.sql.Date;

public class GradeModel {
	
	public int getLec_no() {
		return lec_no;
	}
	public void setLec_no(int lec_no) {
		this.lec_no = lec_no;
	}
	public String getLec_name() {
		return lec_name;
	}
	public void setLec_name(String lec_name) {
		this.lec_name = lec_name;
	}
	public int getTest_no() {
		return test_no;
	}
	public void setTest_no(int test_no) {
		this.test_no = test_no;
	}
	public String getTest_name() {
		return test_name;
	}
	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}
	public Date getTest_start() {
		return test_start;
	}
	public void setTest_start(Date test_start) {
		this.test_start = test_start;
	}
	public Date getTest_end() {
		return test_end;
	}
	public void setTest_end(Date test_end) {
		this.test_end = test_end;
	}
	public int getTot_score() {
		return tot_score;
	}
	public void setTot_score(int tot_score) {
		this.tot_score = tot_score;
	}
	public String getDrop_yn() {
		return drop_yn;
	}
	public void setDrop_yn(String drop_yn) {
		this.drop_yn = drop_yn;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReg_status() {
		return reg_status;
	}
	public void setReg_status(String reg_status) {
		this.reg_status = reg_status;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	private int lec_no;
	private String lec_name;
	private int test_no;
	private String test_name;
	private Date test_start;
	private Date test_end;
	private int tot_score;
	private String drop_yn;
	
	private String loginID;
	private String name;

	private String  user_id;
	private String reg_status;
	private String reg_date;

}
