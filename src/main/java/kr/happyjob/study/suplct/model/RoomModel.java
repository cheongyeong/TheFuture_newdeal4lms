package kr.happyjob.study.suplct.model;

public class RoomModel {
	
	/* 20230710 17h 08m 커밋용 주석*/ 
	//주석
	
	private int room_no;
	private int rm_max;
	private String rm_name;
	private String rm_yn;
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public int getRm_max() {
		return rm_max;
	}
	public void setRm_max(int rm_max) {
		this.rm_max = rm_max;
	}
	public String getRm_name() {
		return rm_name;
	}
	public void setRm_name(String rm_name) {
		this.rm_name = rm_name;
	}
	public String getRm_yn() {
		return rm_yn;
	}
	public void setRm_yn(String rm_yn) {
		this.rm_yn = rm_yn;
	}
	@Override
	public String toString() {
		return "RoomModel [room_no=" + room_no + ", rm_max=" + rm_max + ", rm_name=" + rm_name + ", rm_yn=" + rm_yn
				+ "]";
	}
	
	
}
