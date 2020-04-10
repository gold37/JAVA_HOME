package jdbc.day03.board;

public class MemberDTO { // insert, select, update 다 쓰임
	
	// DTO(Data Transfer Object) 전송되어져야 할 데이터 객체. 쉽게 말하면 행(row)이다.
	
	private int	userseq; // 회원번호
	private String userid; // 회원아이디
	private String pwd; // 회원암호
	private String name; // 회원명
	private String mobile; // 연락처
	private int point; // 포인트
	private String registerday; // 가입일자
	private int status; // status 컬럼의 값이 1이면 정상, 0이면 탈퇴로 보겠음

	
	public int getUserseq() {
		return userseq;
	}
	
	public void setUserseq(int userseq) {
		this.userseq = userseq;
	}
	
	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getPwd() {
		return pwd;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getName() {
		return name;
	} 
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getMobile() {
		return mobile;
	}
	
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public int getPoint() {
		return point;
	}
	
	public void setPoint(int point) {
		this.point = point;
	}
	
	public String getRegisterday() {
		return registerday;
	}
	
	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}
	
	public int getStatus() {
		return status;
	}
	
	public void setStatus(int status) {
		this.status = status;
	}
	
	

}
